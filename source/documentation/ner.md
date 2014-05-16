---
layout: default
title: NER
sidebar: documentation
webservice: http://opener.olery.com/ner

---



<div id='readme'></div>

# NER

This repository contains the source code for the primary NER component of the
OpeNER project. This component provides a CLI interface for the various kernels
as well as providing a Sinatra based web service.

## Requirements

* Ruby 1.9.2 or newer
* Bundler

## Installation

As a regular Ruby Gem:

    gem install opener-ner


Using Bundler:

    gem 'opener-ner',
      :git    => 'git@github.com:opener-project/ner.git',
      :branch => 'master'

Using specific install:

    gem install specific_install
    gem specific_install opener-ner \
        -l https://github.com/opener-project/ner.git
