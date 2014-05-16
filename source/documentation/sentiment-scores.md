---
layout: default
title: Sentiment Scores
sidebar: documentation
webservice: http://opener.olery.com/sentiment-scores

---



<div id='readme'></div>

# Scorer

Component that stores results from the Opener Web Services chain into a MySQL 
Database and shows them into your browser.

It can be used instead of Opener Outlet, to calculate overall sentiment score
and sentiment score per topic.


## Installation

### As part of a Gemfile in a Ruby application

Add this line to your application's Gemfile:

    gem 'opener-scorer',
        :git=>"git@github.com:opener-project/scorer.git"

And then execute:

    $ bundle install

## Usage

The Opener Scorer comes equipped with a simple webservice. To start the
webservice type:

    scorer-server

This will launch a mini webserver with the webservice. It defaults to port 9292,
so you can access it at:

    http://localhost:9292

To launch it on a different port provide the ```-p [port-number]``` option like
this:

    scorer-server -p 1234

It then launches at ```http://localhost:1234```

When you run a chain of web services using callbacks, the last URL should be the
one that points to the Scorer Web Service. A unique id is generated and once the
chain has finished processing the text, you can view the result in the URL that
you get.

## Contributing

### Procedure

1. Pull it
2. Create your feature branch (`git checkout -b features/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin features/my-new-feature`)
5. If you're confident, merge your changes into master.

# What's next? 

If you're interested in the opener-scorer, you also might want to check
out opener-project/scorer.
