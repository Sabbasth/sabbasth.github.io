---
layout: default
title:  "Develop on your Github Pages website"
date:   2016-04-25 17:50:00
categories: main
---

Introduction
============
Github provides in my opinion a very powerfull way to easily express yourself nicely on the Internet.
But as I'm a lazy person being able to write a page in the simple markdown form wasn't enough.
I'd also need an easy way to test my pages without having to commit each change.

Docker !
========
I created a docker image that emulates the github-pages behavior.
Actually Github provides the "application", I just had to build the minimal env around it.
This image strictly uses what is provided by github-pages.

At the time I write this, github-pages uses Jekyll 3.0.4 which simply ignores jekyll-watch. In other words you can't use the powerfull auto-regeneration feature of Jekyll.
I provide a fix in the Issue section, but it is at the cost of derivating from github-pages and upgrading Jekyll.

To launch a container, move to your folder and type:
```$docker run --rm --name jekyll --volume=$(pwd):/srv/jekyll -it -p 127.0.0.1:4000:4000 sabbasth/github-pages```

Then just go to `http://localhost:4000` on your favorite browser!

Issue
=====
To fix the _auto-regeneration issue_, I had to upgrade Jekyll to the current release (3.1.3 as of now). I did an image to simplify this hard work !
just pull `sabbasth/github-pages:watch` instead of `sabbasth/github-pages`