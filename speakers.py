#/usr/bin/env python

import yaml
import twitter
import urllib

config = yaml.safe_load(file('twitter-secrets.yml', 'r'))

twitterApi = twitter.Api(consumer_key=config['consumer_key'],
                         consumer_secret=config['consumer_secret'],
                         access_token_key=config['access_token_key'],
                         access_token_secret=config['access_token_secret'])

data = yaml.safe_load(file('_data/speakers.yml', 'r'))

for speaker in data:
    if speaker['twitter']:
        screen_name = speaker['twitter']
        print 'Fetching data for "%s"' % screen_name
        user = twitterApi.GetUser(screen_name=screen_name)
        url = user.GetProfileImageUrl()
        filename = 'images/speakers/' + screen_name + '-' + url.split('/')[-1]
        urllib.urlretrieve(url, filename)

        speaker['image'] = '/' + filename
        speaker['about'] = user.GetDescription()

output = file('_data/speakers.yml', 'w')
yaml.safe_dump(data, output, encoding='utf-8', indent=2, allow_unicode=True)