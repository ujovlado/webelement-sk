# WebElement

[![Build Status](https://travis-ci.com/ujovlado/webelement-sk.svg?branch=master)](https://travis-ci.com/ujovlado/webelement-sk)

[WebElement](https://webelement.sk) is regular web developers meetup. It takes place in Bratislava and Prešov.

Interested in meetup itself? Join group on [Meetup](https://www.meetup.com/webelement/)
or [Facebook](https://facebook.com/groups/webelement).

If you find any issue, please report it.

## Development

Site is built using Jekyll.

Install Docker and Docker Compose and then run:

```console
docker-compose run --rm node sh -c 'yarn && yarn build'
docker-compose run --rm --service-ports ruby sh -c 'bundle install && jekyll serve -s ./app --watch -H 0.0.0.0'
```
