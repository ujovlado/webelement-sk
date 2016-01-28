---
title: Prednášky
desc: Zoznam prednášok, ktoré boli na WebElemente
permalink: /event/
layout: page
redirect_from:
  - /archive/
---

<div class="section page">
<div class="container">

<h1>Prednášky</h1>
<p>
Zoznam všetkých prednášok, ktoré odzneli na WebElemente od novembra 2011.
</p>

{% assign year = site.posts[0].date | date: "%Y" %}

<h2>{{ year }}</h2>
<ul class="posts">
{% for post in site.posts %}
{% assign eventYear = post.date | date: "%Y" %}
{% if year != eventYear %}
{% assign year = eventYear %}
</ul>
<hr>
<h2>{{ year }}</h2>
<ul class="posts">
{% endif %}
{% include event-list-item.html post=post %}
{% endfor %}
</ul>


</div>
</div>