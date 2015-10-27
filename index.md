---
layout: page
class: index
title: WebElement - stretnutie web developerov
desc: Stretnutie web developerov v Bratislave a Prešove, prednášky, prezentácie
redirect_from:
  - /post/46660576306/welcome/
---

<div class="section headline">
    <div class="container">
      <div class="row">
          <div class="col-sm-8 col-sm-offset-2">
            <p>
            <strong>WebElement</strong> je pravidelné stretnutie <strong>web developerov</strong>
            a&nbsp;ľudí zaujímajúcich sa o&nbsp;technológie súvisiace s <strong>web/dev/ops</strong>.
            </p>
          </div>
        </div>
    </div>
</div>

<div class="section where-when-who">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="item">
                    <i class="fa icon-calendar fa-2x"></i><br>
                    <h3>Kedy?</h3>
                    <p>
                        WebElement sa zvyčajne koná <strong>prvý alebo druhý týždeň v&nbsp;mesiaci</strong>.
                        Býva <strong>vo štvrtok</strong>, pretože vtedy ešte ľudia chodia normálne do práce a&nbsp;nijako
                        im to nenaruší plány na víkend.
                        Začína <strong>o&nbsp;19:00</strong>.
                    </p>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="item">
                    <i class="fa icon-location fa-2x"></i><br>
                    <h3>Kde?</h3>
                    <p>
                        Ak sa nedeje niečo špeciálne, ako napr.
                        <a href="{% post_url 2013-06-06-webelement-20-sygic-andrej-had-ondrej-svitek-git %}" title="WebElement #20 @ Sygic">WebElement #20 v Sygicu</a>, tak akcia býva v
                        <a href="https://maps.google.com/maps?q=Zámocká 30, Bratislava" title="Kafe Nervosa, Zámocká 30, Bratislava" target="_blank">Kafe Nervosa</a>, na Zámockej ulici <strong>v Bratislave</strong>.
                        Na event sa dá zvyčajne prihlásiť cez {{ site.anchors.facebook }} alebo {{ site.anchors.meetup }}.
                    </p>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="item">
                    <i class="fa icon-users fa-2x"></i><br>
                    <h3>Kto?</h3>
                    <p>
                        Na WebElement chodia prednášať rečníci z rôznych sfér &ndash; či už robia backend, frontend alebo správu serverov.
                        Primárne sú to však ľudia motajúci sa okolo webov, databáz a programovania.
                    </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p class="presov">
                    Okrem toho sa koná <strong>aj v Prešove</strong>,
                    kde sa komunitu snaží budovať <a href="{{ "/recnici/#martin-razus" | prepend: site.baseurl }}">Martin Rázus</a>.
                </p>
            </div>
        </div>
    </div>
</div>

{% assign presentationsCount = 0 %}
{% for speaker in site.data.speakers %}
{% assign events = speaker.events | size %}
{% assign presentationsCount = presentationsCount | plus: events %}
{% endfor %}

<div class="section counters">
    <div class="container">
        <p>
        Už <strong>{{ site.data.speakers | size }}&nbsp;rečníkov</strong> odprezentovalo
        <strong>{{ presentationsCount }}&nbsp;tém</strong> na
        <strong>{{ site.posts | size }}&nbsp;stretnutiach.</strong>
        </p>
    </div>
</div>

<div class="section index-past-meetups">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Minulé stretnutia</h2>
                <ul class="posts">
                    {% for post in site.posts | limit: 15 %}
                        {% include event-list-item.html post=post %}
                    {% endfor %}
                </ul>
                <p class="text-right">
                    <a href="{{ "/event" | prepend: site.baseurl }}">Zobraziť všetky &rarr;</a>
                </p>
            </div>
        </div>
    </div>
</div>