---
layout: page
class: index
title: WebElement - stretnutie web developerov
desc: Stretnutie web developerov v Bratislave a Prešove, prednášky, prezentácie
---

WebElement je pravidelné stretnutie ľudí zaujímajúcich sa o weby a technológie s webmi spojené.

<table>
    <tr>
        <td class="about-icon">
            <i class="fa icon-calendar fa-2x"></i><br>
            Kedy?
        </td>
        <td>
            WebElement sa zvyčajne koná <strong>prvý alebo druhý týždeň v&nbsp;mesiaci</strong>.
            Býva <strong>vo štvrtok</strong>, pretože vtedy ešte ľudia chodia normálne do práce a nejako
            im to nenaruší plány na víkend.
            Začína <strong>o&nbsp;19:00</strong>.
        </td>
    </tr>
    <tr>
        <td class="about-icon">
            <i class="fa icon-location fa-2x"></i><br>
            Kde?
        </td>
        <td>
            Ak sa nedeje niečo špeciálne
            (<a href="{% post_url 2013-06-06-webelement-20-sygic-andrej-had-ondrej-svitek-git %}" title="WebElement #20 @ Sygic">#20</a>,
            <a href="{% post_url 2013-09-05-webelement-23-marek-lichtner-hackovanie-dani-a-odvodov-pre-web-developerov %}" title="WebElement #23 @ Progressbar">#23</a>), tak WebElement býva v
            <a href="https://maps.google.com/maps?q=Zámocká 30, Bratislava" title="Kafe Nervosa, Zámocká 30, Bratislava">Kafe Nervosa</a>, na Zámockej ulici <strong>v Bratislave</strong>. Na event sa dá zvyčajne prihlásiť cez {{ site.links.facebook }} alebo {{ site.links.meetup }}.
        </td>
    </tr>
    <tr>
        <td class="about-icon">
            <i class="fa icon-users fa-2x"></i><br>
            Kto?
        </td>
        <td>
            Na WebElement chodia prednášať ľudia z rôznych sfér - či už robia backend, frontend alebo administráciu.
            Primárne sú to však ľudia motajúci sa okolo webov, programovania, databáz a serverov.
        </td>
    </tr>
</table>

Okrem toho sa koná **aj v Prešove**, kde sa komunitu snaží budovať [Martin Rázus]({{ "/recnici/#martin-razus" | prepend: site.baseurl }}).

{% assign presentationsCount = 0 %}
{% for speaker in site.data.speakers %}
{% assign events = speaker.events | size %}
{% assign presentationsCount = presentationsCount | plus: events %}
{% endfor %}

Už <strong>{{ site.data.speakers | size }}</strong>&nbsp;rečníkov odprezentovalo
<strong>{{ presentationsCount }}</strong>&nbsp;tém na
<strong>{{ site.posts | size }}</strong>&nbsp;stretnutiach.
{: .counters}

## Minulé stretnutia

<ul class="posts">
    {% for post in site.posts | limit: 15 %}
        {% include event-list-item.html post=post %}
    {% endfor %}
</ul>

[Zobraziť všetky &rarr;]({{ "/event" | prepend: site.baseurl }})
{: .text-right}
