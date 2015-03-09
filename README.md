WebElement
==========

This is source of site for [WebElement](http://webelement.sk) - web developers meetup in Bratislava and Prešov.

If you find any issue, feel free to fix - pull requests are welcome.

Interested in meetup itself? Join group on:

- [Meetup](http://meetup.com/webelement/)
- or [Facebook](https://facebook.com/groups/webelement)

## Code

As you noticed, site is coded in Jekyll.

Note: Don't load Google Analytics and Disqus codes while running locally.

To run it locally, just clone it and run `jekyll` command:

    $ jekyll serve --watch

If you don't want to install Ruby and related stuff, see attached `Dockerfile` and run:

    $ sudo docker build -t YOUR_NAME/webelement .
    $ sudo docker run -i -t --rm -v "$PWD:/jekyll" -w /jekyll -p 4000:4000 YOUR_NAME/webelement:latest jekyll serve --watch -H 0.0.0.0

Alternatively, you can use existing Jekyll container [grahamc / jekyll](https://registry.hub.docker.com/u/grahamc/jekyll/).

## License

- code is licenced under MIT licence - see `LICENSE` file
- slides content and descriptions are owned by speakers (or their creators)