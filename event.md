---
title: Prednášky
permalink: /event/
layout: page
redirect_from:
  - /archive/
---

Zoznam všetkých prednášok, ktoré odzneli na WebElemente od novembra 2011.

{% assign year = site.posts[0].date | date: "%Y" %}

<h2>{{ year }}</h2>
<ul>
{% for post in site.posts %}
{% assign eventYear = post.date | date: "%Y" %}
{% if year != eventYear %}
{% assign year = eventYear %}
</ul>
<h2>{{ year }}</h2>
<ul>
{% endif %}
{% include event-list-item.html post=post %}
{% endfor %}
</ul>