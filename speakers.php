#!/usr/bin/env php
<?php

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/twitter-secrets.php';

use Symfony\Component\Yaml\Yaml;

function replaceShortUrls($text, $urls = [])
{
	foreach ($urls as $url) {
		$link = '<a href="' . $url->expanded_url . '" target="_blank">' . $url->display_url . '</a>';
		$text = str_replace($url->url, $link, $text);
	}
	return $text;
}

$twitter = new Twitter($consumerKey, $consumerSecret, $accessToken, $accessTokenSecret);

$speakersFile = __DIR__ . '/app/_data/speakers.yml';
$speakers = Yaml::parse(file_get_contents($speakersFile));

foreach ($speakers as $key => $speaker) {
	if (isset($speaker['twitter'])) {
		$username = $speaker['twitter'];
		echo 'Updating ' . $username . "'s profile ...\n";
		$info = $twitter->loadUserInfo($username);
		$profileImage = file_get_contents($info->profile_image_url);
		$pathinfo = pathinfo($info->profile_image_url);
		$newProfileImageName = '/images/speakers/' . $username . '-' . $pathinfo['basename'];
		file_put_contents('./app' . $newProfileImageName, $profileImage);
		$speakers[$key]['image'] = $newProfileImageName;
		if (isset($info->description)) {
			$speakers[$key]['about'] = replaceShortUrls($info->description, $info->entities->description->urls);
		}
		if (isset($info->url)) {
			$speakers[$key]['url'] = replaceShortUrls($info->url, $info->entities->url->urls);
		}
	}
}

usort($speakers, function ($a, $b) {
	return strcmp($a['_id'], $b['_id']);
});

file_put_contents($speakersFile, Yaml::dump($speakers));
