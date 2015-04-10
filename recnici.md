---
title: Rečníci
desc: Ľudia, ktorí boli prednášať na WebElemente
layout: page
permalink: /recnici/
class: speakers
---

Vďaka patrí všetkým, ktorí boli prednášať! Info o rečníkoch je stiahnuté z ich Twitteru.

{% for speaker in site.data.speakers %}
<div class="speaker">

{% if speaker.image %}
    <img src="{{ speaker.image | prepend: site.baseurl }}" alt="{{ speaker.name }}" class="img-circle">
{% endif %}

<h2 id="{{ speaker._id }}">{{ speaker.name }}</h2>

{% if speaker.twitter %}
    <p>
        <a href="https://twitter.com/{{ speaker.twitter }}" title="{{ speaker.name }} - Twitter">@{{ speaker.twitter }}</a>
    </p>
{% endif %}

{% if speaker.about and speaker.about != '' %}
    <blockquote class="text-muted">{{ speaker.about }}</blockquote>
{% endif %}

<ul>
{% for event in speaker.events %}
    {% assign postUrl = event | split: 'webelement' | last | prepend: "/event/webelement" | append: "/" %}
    {% for post in site.posts %}
        {% if post.url == postUrl %}
            {% include event-list-item.html post=post %}
        {% endif %}
    {% endfor %}
{% endfor %}
</ul>

</div>
{% endfor %}