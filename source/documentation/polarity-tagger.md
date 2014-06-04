---
layout: default
title: Polarity Tagger
sidebar: documentation
webservice: http://opener.olery.com/polarity-tagger
repository: https://github.com/opener-project/polarity-tagger

---



<div id='readme'></div>

Introduction
------------

This repository contains the code for the OpeNER polarity tagger. This tool tags words in a KAF file with polarity information, which basically is:

* Polarity information, which represents positive or negative facts in a certain domain. Good, cheap and clean can be positive words in a hotel domain, while bad, expensive and dirty could be negative ones.
* Sentiment modifiers, which modify the polarity of a surrounding polarity word. For instance very or no are sentiment modifiers

The polarity tagger supports the following languages:

* Dutch
* German
* English
* French
* Italian
* Spanish

##How-to##

The main script of this tool is a python file, which accepts a set of parameters to determine which features
or options we want to use. The language is read from the KAF file, so it doesn't need to be specified as a parameter
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
  --lexicon-path LEXICON The path of the lexicons
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

### Confused by some terminology?

This software is part of a larger collection of natural language processing tools known as "the OpeNER project". You can find more information about the project at [the OpeNER portal](http://opener-project.github.io). There you can also find references to terms like KAF (an XML standard to represent linguistic annotations in texts), component, cores, scenario's and pipelines.

Quick Use Example
-----------------

Installing the polarity-tagger can be done by executing:

    gem install opener-polarity-tagger

The polarity tagger uses python. So it is advised to run a virtualenv before installing the gem.

Please bare in mind that all components in OpeNER take KAF as an input and output KAF by default.

### Command line interface

You should now be able to call the polarity tagger as a regular shell command: by its name. Once installed the gem normally sits in your path so you can call it directly from anywhere.

This aplication reads a text from standard input in order process it.

    cat some_kind_of_kaf_file.kaf | polarity-tagger


This will output:

```
<term lemma="donner" morphofeat="VP3s" pos="V" tid="t119" type="open">
  <span>
    <!--donne-->
    <target id="w119"/>
  </span>
  <sentiment polarity="neutral" resource="General domain lexicon for French . Vicomtech_general_lexicon_french"/>
</term>
```

##Requirements##

* Python 2.7.0 or newer
* Ruby 1.9.2 or newer
* pip
* libxml2

### Webservices

You can launch a webservice by executing:

    polarity-tagger-server

This will launch a mini webserver with the webservice. It defaults to port 9292, so you can access it at <http://localhost:9292>.

To launch it on a different port provide the `-p [port-number]` option like this:

    polarity-tagger-server -p 1234

It then launches at <http://localhost:1234>

Documentation on the Webservice is provided by surfing to the urls provided above. For more information on how to launch a webservice run the command with the ```-h``` option.


### Daemon

Last but not least the polarity tagger comes shipped with a daemon that can read jobs (and write) jobs to and from Amazon SQS queues. For more information type:

    polarity-tagger-daemon -h


Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER components. You can find an installation guide and helper tools in the [OpeNER installer](https://github.com/opener-project/opener-installer) and an [installation guide on the Opener Website](http://opener-project.github.io/getting-started/how-to/local-installation.html)

At least you need the following system setup:

### Depenencies for normal use:

* Ruby 1.9.3 or newer
* Python 2.6 or newer
* Lxml installed

Domain Adaption
---------------

  TODO

Language Extension
------------------

  TODO

The Core
--------

The component is a fat wrapper around the actual language technology core. You can find the core technolies in the ``\`core/``` folder.

Where to go from here
---------------------

* [Check the project website](http://opener-project.github.io)
* [Checkout the webservice](http://opener.olery.com/polarity-tagger)

Report problem/Get help
-----------------------

If you encounter problems, please email <support@opener-project.eu> or leave an issue in the 
[issue tracker](https://github.com/opener-project/polarity-tagger/issues).


Contributing
------------

1. Fork it <http://github.com/opener-project/polarity-tagger/fork>
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



<div id='reference'></div>

## Reference

#### Examples:

##### Simple polarity tagging

```
cat some-kaf-file.kaf | polarity-tagger
```

Partial output
~~~~
<term lemma="donner" morphofeat="VP3s" pos="V" tid="t119" type="open">
  <span>
    <!--donne-->
    <target id="w119"/>
  </span>
  <sentiment polarity="neutral" resource="General domain lexicon for French . Vicomtech_general_lexicon_french"/>
</term>
~~~~

#### Switching to another lexicon

```
cat some-kaf-file.kaf | polarity-tagger --resource-path path/to/lexicon
```

#### Downloading and switching to lexicon

```
cat some-kaf-file.kaf | polarity-tagger --resource_path path/to/extract/lexicon \
  --resource-url http://some.kind.of/zip-file.zip
```

#### Disabling pos matching

To push options to the python core use a double dash (--)

```
cat some-kaf.kaf | polarity-tagger -- --no-pos
```

#### Getting to the core

The main script of this tool is a python file, which accepts a set of parameters to determine which features or options we want to use. The language is read from the KAF file, so it doesn't need to be specified as a parameter. The program reads a KAF file from the standard input and writes the resulting KAf in the standard output.To see the options you can call to the main script with the -h or --help option

    shell
    polarity-tagger -- -h
    usage: poltagger-basic-multi.py [-h] [--no-time] [--ignore-pos]
                                [--show-lexicons {nl,en,de,es,it,fr}]
                                [--lexicon LEXICON] [--silent] [--version]

Tags a text with polarities at lemma level

optional arguments:
~~~~
  -h, --help            show this help message and exit
  --no-time             For not including timestamp in header
  --ignore-pos          Ignore the pos labels
  --show-lexicons {nl,en,de,es,it,fr}
                        Show lexicons for the given language and exit
  --lexicon LEXICON     Lexicon identifier, check with --show-lexicons LANG
                        for options
  --silent              Turn off debug info
  --version             show program's version number and exit
~~~~

The `--ignore-pos` parameter must be used when want to ignore the part-of-speech information assigned to the lemmas, and we want to assign polarities just to the lemmas, not considering the POS tag. This could be useful when the information provided by the pos-tagger is not accurate or the pos-tagging has not been processed.

The main options are those concerning with the usage of different lexicons. The lexicons are provided by the VU-sentiment-lexicon library (https://github.com/opener-project/VU-sentiment-lexicon), which needs to be installed. You can see what the lexicons available for a given language are by calling to the program with the option --show-lexicons LANG, for instance:

    shell
    polarity-tagger -- --show-lexicons nl


Available lexicons for nl
  Identifier: "hotel" (Default)
    Desc: Hotel domain lexicon for Dutch
     Res: VUA_olery_lexicon_nl_lmf
    File: /Users/ruben/python_envs/python2.7/lib/python2.7/VUSentimentLexicon/NL-lexicon/Sentiment-Dutch-HotelDomain.xml

  Identifier:"general"
    Desc: General lexicon for Dutch
     Res: VUA_olery_lexicon_nl_lmf
    File: /Users/ruben/python_envs/python2.7/lib/python2.7/VUSentimentLexicon/NL-lexicon/Sentiment-Dutch-general.xml



Then you can use the lexicon identifiers to select the proper lexicon, with the option --lexicon

    shell
    cat my_input.nl.kaf | polarity-tagger -- --lexicon general


This command will call to the polarity tagger using the general lexicon for Dutch. The lexicon identifiers are unique only per language. If the lexicon id is not specified (you skip the --lexicon option), or you provide a wrong identifier, the default lexicon will be loaded. If there is no lexicon marked as default in the --show-lexicon options, the first one in the list will be used. Check the VU-sentiment-lexicon for further information about how to manage lexicons and add new ones.

### Webservice

You can launch a webservice by executing:

```
component-name-server
```

After launching the server, you can reach the webservice at
<http://localhost:9292>.

The webservice takes several options that get passed along to [Puma](http://puma.io), the webserver used by the component. The options are:


    -b, --bind URI                   URI to bind to (tcp://, unix://, ssl://)
    -C, --config PATH                Load PATH as a config file
        --control URL                The bind url to use for the control server
                                     Use 'auto' to use temp unix server
        --control-token TOKEN        The token to use as authentication for the control server
    -d, --daemon                     Daemonize the server into the background
        --debug                      Log lowlevel debugging information
        --dir DIR                    Change to DIR before starting
    -e, --environment ENVIRONMENT    The environment to run the Rack app on (default development)
    -I, --include PATH               Specify $LOAD_PATH directories
    -p, --port PORT                  Define the TCP port to bind to
                                     Use -b for more advanced options
        --pidfile PATH               Use PATH as a pidfile
        --preload                    Preload the app. Cluster mode only
        --prune-bundler              Prune out the bundler env if possible
    -q, --quiet                      Quiet down the output
    -R, --restart-cmd CMD            The puma command to run during a hot restart
                                     Default: inferred
    -S, --state PATH                 Where to store the state details
    -t, --threads INT                min:max threads to use (default 0:16)
        --tcp-mode                   Run the app in raw TCP mode instead of HTTP mode
    -V, --version                    Print the version information
    -w, --workers COUNT              Activate cluster mode: How many worker processes to create
        --tag NAME                   Additional text to display in process listing
    -h, --help                       Show help



### Daemon

The daemon has the default OpeNER daemon options. Being:

    Usage: component-name-daemon <start|stop|restart> [options]

When calling component-name without <start|stop|restart> the daemon will start as a foreground process

~~~~
Daemon options:
    -i, --input QUEUE_NAME           Input queue name
    -o, --output QUEUE_NAME          Output queue name
        --batch-size COUNT           Request x messages at once where x is between 1 and 10
        --buffer-size COUNT          Size of input and output buffer. Defaults to 4 * batch-size
        --sleep-interval SECONDS     The interval to sleep when the queue is empty (seconds)
    -r, --readers COUNT              number of reader threads
    -w, --workers COUNT              number of worker thread
    -p, --writers COUNT              number of writer / pusher threads
    -l, --logfile, --log FILENAME    Filename and path of logfile. Defaults to STDOUT
    -P, --pidfile, --pid FILENAME    Filename and path of pidfile. Defaults to /var/run/tokenizer.pid
        --pidpath DIRNAME            Directory where to put the PID file. Is Overwritten by --pid if that option is present
        --debug                      Turn on debug log level
        --relentless                 Be relentless, fail fast, fail hard, do not continue processing when encountering component errors
~~~~

#### Environment Variables

These daemons make use of Amazon SQS queues and other Amazon services. The access to these services and other environment variables can be configured using a .opener-daemons-env file in the home directory of the current user.

It is also possible to provide the environment variables directly to the deamon.

For example:

```
AWS_REGION='eu-west-1' component-name start [other options]
```

We advise to have the following environment variables available:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

### Languages

* Dutch (nl)
* English (en)
* French (fr)
* German (de)
* Italian (it)
* Spanish (es)

