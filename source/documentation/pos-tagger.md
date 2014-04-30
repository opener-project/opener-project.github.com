---
layout: default
title: POS Tagger
sidebar: documentation

---



<div id='readme'></div>

# POSTagger

Component that wraps the different existing POS Taggers.

## Requirements

* Perl 5
* Ruby 1.9.2 or newer
* Make

## Developers

See how to edit / change / compile this gem at the bottom of this file.

## Installation

### As part of a Gemfile in a Ruby application

Add this line to your application's Gemfile:

    gem 'opener-pos-tagger',
        :git=>"git@github.com:opener-project/pos-tagger.git"

And then execute:

    $ bundle install

### As a standalone GEM:

Make sure you have the ```specific_install``` gem installed first by running

    $ gem install specific_install

After that you can install the gem from the git repository like this:

    $ gem specific_install opener-pos-tagger \
        -l https://github.com/opener-project/pos-tagger.git

Once the gem is installed you have access to the following command from
anywhere on your computer:

    $ cat englist.kaf | pos-tagger

or you can launch a webservice with

    $ pos-tagger-server

Sample KAF file text:

    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <KAF version="v1.opener" xml:lang="en">
      <kafHeader>
        <linguisticProcessors layer="text">
          <lp name="opennlp-en-tok" timestamp="2013-06-11T13:41:37Z" version="1.0"/>
          <lp name="opennlp-en-sent" timestamp="2013-06-11T13:41:37Z" version="1.0"/>
        </linguisticProcessors>
      </kafHeader>
      <text>
        <wf length="4" offset="0" para="1" sent="1" wid="w1">this</wf>
        <wf length="2" offset="5" para="1" sent="1" wid="w2">is</wf>
        <wf length="2" offset="8" para="1" sent="1" wid="w3">an</wf>
        <wf length="7" offset="11" para="1" sent="1" wid="w4">english</wf>
        <wf length="4" offset="19" para="1" sent="1" wid="w5">text</wf>
      </text>
    </KAF>

Enjoy!

## Usage

POS Tagging some text (assuming that the above text is in a file called *english.kaf*):

    cat english.kaf | pos-tagger
    

Will result in

    <?xml version='1.0' encoding='UTF-8'?>
    <KAF version="v1.opener" xml:lang="en">
      <kafHeader>
        <linguisticProcessors layer="text">
          <lp name="opennlp-en-tok" timestamp="2013-06-11T13:41:37Z" version="1.0"/>
          <lp name="opennlp-en-sent" timestamp="2013-06-11T13:41:37Z" version="1.0"/>
        </linguisticProcessors>
        <linguisticProcessor layer="term">
          <lp timestamp="2013-06-12T15:18:03CEST" version="1.0" name="Open nlp pos tagger"/>
        </linguisticProcessor>
      </kafHeader>
      <text>
        <wf length="4" offset="0" para="1" sent="1" wid="w1">this</wf>
        <wf length="2" offset="5" para="1" sent="1" wid="w2">is</wf>
        <wf length="2" offset="8" para="1" sent="1" wid="w3">an</wf>
        <wf length="7" offset="11" para="1" sent="1" wid="w4">english</wf>
        <wf length="4" offset="19" para="1" sent="1" wid="w5">text</wf>
      </text>
      <terms>
        <term lemma="this" morphofeat="FM" pos="O" tid="t_1" type="open">
          <span>
            <target id="w1"/>
          </span>
        </term>
        <term lemma="is" morphofeat="FM" pos="O" tid="t_2" type="open">
          <span>
            <target id="w2"/>
          </span>
        </term>
        <term lemma="an" morphofeat="APPR" pos="P" tid="t_3" type="close">
          <span>
            <target id="w3"/>
          </span>
        </term>
        <term lemma="english" morphofeat="FM" pos="O" tid="t_4" type="open">
          <span>
            <target id="w4"/>
          </span>
        </term>
        <term lemma="text" morphofeat="FM" pos="O" tid="t_5" type="open">
          <span>
            <target id="w5"/>
          </span>
        </term>
      </terms>
    </KAF>
  
## Server

The POS Tagger comes equipped with a simple webservice. To start the
webservice type:

    pos-tagger-server

This will launch a mini webserver with the webservice. It defaults to port 9292,
so you can access it at:

    http://localhost:9292

To launch it on a different port provide the ```-p [port-number]``` option like
this:

    pos-tagger-server -p 1234

It then launches at ```http://localhost:1234```

Documentation on the Webservice is provided by surfing to the urls provided
above. 


## Contributing

### Procedure

1. Pull it
2. Create your feature branch (`git checkout -b features/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin features/my-new-feature`)
5. If you're confident, merge your changes into master.

# What's next? 

If you're interested in the pos_tagger, you also might want to check
out opener-project/pos-tagger.
