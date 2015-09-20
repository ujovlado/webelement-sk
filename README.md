[WebElement](http://webelement.sk) - web developers meetup
==========

WebElement is regular meetup for web developers. It takes place in Bratislava and Prešov.

Interested in meetup itself? Join group on [Meetup](http://meetup.com/webelement/) or [Facebook](https://facebook.com/groups/webelement).

Also, feel free to [join the chat at Gitter](https://gitter.im/webelement/chat).

## Code

If you find any issue, please report it.

As you noticed, site is coded mostly in Jekyll. There are also used some Node modules and Composer packages.

**Note: Don't load Google Analytics and Disqus codes while running locally.**

To run it locally, just clone it, install dependencies and run commands:

    $ composer install
    $ npm install
    $ gulp clean
    $ gulp

If you don't want to install Ruby and related stuff, see attached `Dockerfile` and run:

    $ docker build -t webelement/website .
    $ docker run -i -t --rm -v "$PWD:/jekyll" -w /jekyll -p 4000:4000 webelement/website:latest sh -c 'composer install && npm install && gulp clean && gulp'

There are also shortcut scripts:

    $ ./docker-build.sh
    $ ./docker-run.sh

## License

- code is licenced under MIT licence - see `LICENSE` file
- slides content and descriptions are owned by speakers (or their creators)
