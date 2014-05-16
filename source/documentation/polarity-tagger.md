---
layout: default
title: Polarity Tagger
sidebar: documentation
webservice: http://opener.olery.com/polarity-tagger

---



<div id='readme'></div>

#Polarity tagger#

##Introduction##
This repository contains the code for the OpeNER polarity tagger. This tool tags words in a KAF file with polarity information, which basically is:

* Polarity information, which represents positive or negative facts in a certain domain. Good, cheap and clean can be positive words in a hotel domain, while
bad, expensive and dirty could be negative ones.
* Sentiment modifiers, which modify the polarity of a surrounding polarity word. For instance very or no are sentiment modifiers

The polarity tagger supports the following languages:

* Dutch
* German
* English
* French
* Italian
* Spanish

The most simple way to call to the tagger is:
````shell
cat my_input.nl.kaf | core/poltagger-basic-multi.py
````


##How-to##

The main script of this tool is a python file, which accepts a set of parameters to determine which features
or options we want to use. The language is read from the KAF file, so it doesn't need to be specified as a parameter.
The program reads a KAF file from the standard input and writes the resulting KAf in the standard output.
To see the options you can call to the main script with the -h or --help option
````shell
$ python core/poltagger-basic-multi.py -h
usage: poltagger-basic-multi.py [-h] [--no-time] [--ignore-pos]
                                [--show-lexicons {nl,en,de,es,it,fr}]
                                [--lexicon LEXICON] [--silent] [--version]

Tags a text with polarities at lemma level

optional arguments:
  -h, --help            show this help message and exit
  --no-time             For not including timestamp in header
  --ignore-pos          Ignore the pos labels
  --show-lexicons {nl,en,de,es,it,fr}
                        Show lexicons for the given language and exit
  --lexicon LEXICON     Lexicon identifier, check with --show-lexicons LANG
                        for options
  --silent              Turn off debug info
  --version             show program's version number and exit
````

The `--ignore-pos` parameter must be used when want to ignore the part-of-speech information assigned to the lemmas, and we want to assign polarities
just to the lemmas, not considering the POS tag. This could be useful when the information provided by the pos-tagger is not accurate or the pos-tagging
has not been processed.

The main options are those concerning with the usage of different lexicons. The lexicons are provided by the
VU-sentiment-lexicon library (https://github.com/opener-project/VU-sentiment-lexicon), which needs to be installed.
You can see what the lexicons available for a given language are by calling to the program with the option --show-lexicons LANG,
for instance:
````shell
core/poltagger-basic-multi.py --show-lexicons nl

##############################
Available lexicons for nl
  Identifier: "hotel" (Default)
    Desc: Hotel domain lexicon for Dutch
     Res: VUA_olery_lexicon_nl_lmf
    File: /Users/ruben/python_envs/python2.7/lib/python2.7/VUSentimentLexicon/NL-lexicon/Sentiment-Dutch-HotelDomain.xml

  Identifier:"general"
    Desc: General lexicon for Dutch
     Res: VUA_olery_lexicon_nl_lmf
    File: /Users/ruben/python_envs/python2.7/lib/python2.7/VUSentimentLexicon/NL-lexicon/Sentiment-Dutch-general.xml

##############################
````

Then you can use the lexicon identifiers to select the proper lexicon, with the option --lexicon
````shell
cat my_input.nl.kaf | core/poltagger-basic-multi.py --lexicon general
````

This command will call to the polarity tagger using the general lexicon for Dutch. The lexicon identifiers are unique only per language.
If the lexicon id is not specified(you skip the --lexicon option), or you provide a wrong identifier, the default lexicon will be loaded.
If there is no lexicon marked as default in the --show-lexicon options, the first one in the list will be used. Check the VU-sentiment-lexicon
for further information about how to manage lexicons and add new ones

##Requirements##

* Python 2.7.0 or newer
* Ruby 1.9.2 or newer
* pip
* libxml2

##Installation##

Using Bundler:

    gem 'opener-polarity-tagger',
      :git    => 'git@github.com:opener-project/polarity-tagger.git',
      :branch => 'master'

Using `specific_install`:

    gem install specific_install
    gem specific_install opener-polarity-tagger \
        -l https://github.com/opener-project/polarity-tagger.git

Using regular RubyGems (once the Gem is available):

    gem install opener-polarity-tagger

##Contributing##

First make sure all the required dependencies are installed:

    bundle install

Then download the required Python code:

    bundle exec rake compile

Once this is done continue reading the sections below to get a better
understanding about the repository structure.

##Structure##

This repository comes in two parts: a collection of Python source files and
Ruby source code. The Python code can be found in `core/`, the Ruby code can be
found in the other directories (e.g. `lib/`).

Required Python packages are installed locally in to `core/site-packages/X`
where X is one of the following two:

* `pre_build`: contains packages that are installed before building the Gem,
  these packages are shipped with the Gem

There are also two requirements files for pip:

* `pre_build_requirements.txt`: installs the requirements for the `pre_build`
  directory.

To easily install all the required dependencies (required for running the tests
for example) run the following:

    bundle exec rake compile

This will take care of verifying the requirements and downloading and
installing the Python packages.

##Testing##

To run the tests (which are powered by Cucumber), simply run the following:

    bundle exec rake

This will take care of verifying the requirements, installing the Python code
and running the tests.

For more information on the available Rake tasks run the following:

    bundle exec rake -T
    
##Contact##
* Ruben Izquierdo
* Vrije University of Amsterdam
* ruben.izquierdobevia@vu.nl


