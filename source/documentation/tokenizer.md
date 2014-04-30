---
layout: default
title: Tokenizer
sidebar: documentation

---



<div id='readme'></div>

# Tokenizer

Component that wraps the different existing tokenizers.

## Requirements

* Perl 5
* Ruby 1.9.2 or newer
* Make

## Developers

See how to edit / change / compile this gem at the bottom of this file.

## Installation

### As part of a Gemfile in a Ruby application

Add this line to your application's Gemfile:

    gem 'opener-tokenizer',
        :git=>"git@github.com:opener-project/tokenizer.git"

And then execute:

    $ bundle install

### As a standalone GEM:

Make sure you have the ```specific_install``` gem installed first by running

    $ gem install specific_install

After that you can install the gem from the git repository like this:

    $ gem specific_install opener-tokenizer \
        -l https://github.com/opener-project/tokenizer.git

Once the gem is installed you have access to the following command from
anywhere on your computer:

    $ echo "this is an english text" | tokenizer -l en

or you can launch a webservice with

    $ tokenizer-server

Enjoy!

## Usage

Tokenizing some text:

    echo "This is English text" | tokenizer -l en
    

Will result in

    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <KAF version="v1.opener" xml:lang="en">
      <kafHeader>
        <linguisticProcessors layer="text">
          <lp name="opener-sentence-splitter-en" timestamp="2013-05-31T11:39:31Z" version="0.0.1"/>
          <lp name="opener-tokenizer-en" timestamp="2013-05-31T11:39:32Z" version="1.0.1"/>
        </linguisticProcessors>
      </kafHeader>
      <text>
        <wf length="4" offset="0" para="1" sent="1" wid="w1">This</wf>
        <wf length="2" offset="5" para="1" sent="1" wid="w2">is</wf>
        <wf length="7" offset="8" para="1" sent="1" wid="w3">English</wf>
        <wf length="4" offset="16" para="1" sent="1" wid="w4">text</wf>
      </text>
    </KAF>

  The available languages for tokenization are: English (en), German (de), Dutch (nl), French (fr), Spanish (es), Italian (it)
  
### KAF input format

The tokenizer is capable of taking KAF as input. You can do so like this:

    echo "<?xml version='1.0' encoding='UTF-8' standalone='no'?><KAF version='v1.opener' xml:lang='en'><raw>This is what I call, a test!</raw></KAF>" | tokenizer -k

Will result in

    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <KAF version="v1.opener" xml:lang="en">
      <kafHeader>
        <linguisticProcessors layer="text">
          <lp name="opener-sentence-splitter-en" timestamp="2013-05-31T11:39:31Z" version="0.0.1"/>
          <lp name="opener-tokenizer-en" timestamp="2013-05-31T11:39:32Z" version="1.0.1"/>
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

If the argument -k (--kaf) is passed, then the argument -l (--language) is ignored.

## Server

The tokenizer comes equipped with a simple webservice. To start the
webservice type:

    tokenizer-server

This will launch a mini webserver with the webservice. It defaults to port 9292,
so you can access it at:

    http://localhost:9292

To launch it on a different port provide the ```-p [port-number]``` option like
this:

    tokenizer-server -p 1234

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

If you're interested in the tokenizer, you also might want to check
out opener-project/tokenizer.
