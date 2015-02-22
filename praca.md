---
title: Ponuka práce
layout: page
permalink: /praca/
---

{% if site.data.jobs %}

Aktuálne pracovné ponuky

{% for job in site.data.jobs %}
<div class="job">
    <h3>{{ job.title }} <span class="label label-date">{{ job.date | date: "%d.%m.%Y" }}</span></h3>
    <p>
        {{ job.description }}
        {% if job.twitter %}<a href="">@{{ job.twitter }}</a>{% endif %}
    </p>
</div>
{% endfor %}

{% else %}

Momentálne nemáme žiadne pracovné ponuky. Ak máš záujem nejakú pridať, napíš nám.

{% endif %}