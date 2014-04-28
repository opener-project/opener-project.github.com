---
layout: default
title: Language Identifier
sidebar: documentation

---



<div id='readme'></div>
[![Build Status](https://drone.io/github.com/opener-project/language-identifier/status.png)](https://drone.io/github.com/opener-project/language-identifier/latest)

# Language Identifier

The language identifier takes raw text and tries to figure out what language it
was written in. The output can either be a plain-text language code or a basic
KAF document containing the language and raw input text.

## Quick Use Overview

Install the Gem using Specific Install

    gem specific_install opener-language-identifier \
        -l https://github.com/opener-project/language-identifier.git

If you dont have specific\_install already, install it first:

    gem intall specific_install

You should now be able to call the language indentifier as a regular shell
command, by its name. Once installed as a gem you can access the gem from
anywhere. This aplication reads a text from standard input in order to
tokenize.

    echo "This is an English text." | language-identifier

Or you can launch a webservice with

    $ language-identifier-server

For more information about the available CLI options run the following:

    language-identifier --help

## Requirements

* Java 1.7 or newer (There are problems with encoding in older versions).
* Ruby 1.9.3 or newer
* Maven (for building the Gem)

## Installation

To set up the project run the following commands:

    bundle install
    bundle exec rake compile

This will install all the dependencies and generate the Java files. To run all
the tests (including the process of building the files first) you can run the
following:

    bundle exec rake

or:

    bundle exec rake test

Building a new Gem can be done as following:

    bundle exec rake build

For more information invoke `rake -T` or take a look at the Rakefile.

## Usage

Detecting a language:

    echo "This is English text" | language-identifier

For more information about the usage and available options run the following:

    language-identifier --help

### Outputting KAF

The language detector is capable of outputting a KAF file include the original
text. You can do so like this:

    echo "This is an english text" | language-identifier --KAF

Will result in

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <KAF xml:lang="en">
      <raw>This is an english text</raw>
    </KAF>

## Server

The language identifier comes equipped with a simple webservice. To start the
webservice type:

    language-identifier-server

This will launch a mini webserver with the webservice. It defaults to port 9292,
so you can access it at:

    http://localhost:9292

To launch it on a different port provide the ```-p [port-number]``` option like
this:

    language-identifier-server -p 1234

It then launches at ```http://localhost:1234```

Documentation on the Webservice is provided by surfing to the urls provided
above.

## Editing Java Code

Editing the Java code can be done as following:

    $ cd core
    $ mvn eclipse:eclipse

Then you can import the Java project to Eclipse (don't check the "Copy project
content" checkbox to edit the actual code). Once you finish editing the code
(and hopefully after some testing) you can commit your changes to git directly
(no more copy-paste)
