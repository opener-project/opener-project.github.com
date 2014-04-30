---
layout: default
title: NED
sidebar: documentation

---



<div id='readme'></div>

# NED

This repository contains a Named Entity Disambiguation tool that queries a
DBpedia spotlight server. The client takes KAF as input (containing
`<entities>` nodes).

## Requirements

* Ruby 1.9.2 or newer
* Java 1.7 or newer

## Installation

Installing as a regular Gem:

    gem install opener-ned

Using Bundler:

    gem 'opener-ned',
      :git    => 'git@github.com:opener-project/constituent-parser-base.git',
      :branch => 'master'

Using specific install:

    gem install specific_install
    gem specific_install opener-ned \
       -l https://github.com/opener-project/constituent-parser-base.git

## Usage

The NED client requires a working DBpedia Spotlight server to be available. By
default it tries to connect to http://localhost:2020 (English language) but you
can change this using the `--host` and `--port` options in the CLI.

A simple example:

    cat some_input_file.kaf | ned --host=http://example.com/ --port=1234

## Contributing

First make sure all the required dependencies are installed:

    bundle install

Then compile the required Java code:

    bundle exec rake compile

For this you'll need to have Java 1.7 and Maven installed. These requirements
are verified for you before the Rake task calls Maven.

## Structure

This repository comes in two parts: a collection of Java source files and Ruby
source files. The Java code can be found in the `core/` directory, everything
else will be Ruby source code.
