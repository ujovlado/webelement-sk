---
title: Práca
desc: Pracovné ponuky
layout: page
permalink: /praca/
---

<div class="section page jobs">
<div class="container">

<h1>Práca</h1>

{% if site.data.jobs %}

<p>Aktuálne pracovné ponuky</p>

{% for job in site.data.jobs %}
<div class="job">
    <h2>{{ job.title }} <span class="label label-date">{{ job.date | date: "%d.%m.%Y" }}</span></h2>
    <p>
        {{ job.description }}
        {% if job.twitter %}<a href="">@{{ job.twitter }}</a>{% endif %}
        &rarr; <a href="{{ job.link }}">{{ job.link }}</a>
    </p>
</div>
{% endfor %}

{% else %}

<p>Momentálne nemáme žiadne pracovné ponuky. Ak máš záujem nejakú pridať, napíš nám.</p>

{% endif %}

</div>
</div>
