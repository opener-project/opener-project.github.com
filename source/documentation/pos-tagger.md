---
layout: default
title: POS Tagger
sidebar: documentation
webservice: http://opener.olery.com/pos-tagger
repository: https://github.com/opener-project/pos-tagger

---



<div id='readme'></div>

POS-tagger
------------

Component that wraps the different existing POS Taggers.

### Confused by some terminology?

This software is part of a larger collection of natural language processing
tools known as "the OpeNER project". You can find more information about the
project at [the OpeNER portal](http://opener-project.github.io). There you can
also find references to terms like KAF (an XML standard to represent linguistic
annotations in texts), component, cores, scenario's and pipelines.

Quick Use Example
-----------------

Installing the pos-tagger can be done by executing:

    gem install opener-pos-tagger

Please bare in mind that all components in OpeNER take KAF as an input and
output KAF by default.

### Command line interface

You should now be able to call the POS tagger as a regular shell
command: by its name. Once installed the gem normalyl sits in your path so you can call it directly from anywhere.

This aplication reads a text from standard input in order to identify the language.

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

### Webservices

You can launch a language identification webservice by executing:

    pos-tagger-server

This will launch a mini webserver with the webservice. It defaults to port 9292,
so you can access it at <http://localhost:9292>.

To launch it on a different port provide the `-p [port-number]` option like
this:

    pos-tagger-server -p 1234

It then launches at <http://localhost:1234>

Documentation on the Webservice is provided by surfing to the urls provided
above. For more information on how to launch a webservice run the command with
the ```-h``` option.


### Daemon

Last but not least the POS tagger comes shipped with a daemon that
can read jobs (and write) jobs to and from Amazon SQS queues. For more
information type:

    pos-tagger-daemon -h

Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER
components. You can find an installation guide and helper tools in the [OpeNER installer](https://github.com/opener-project/opener-installer) and an [installation guide on the Opener Website](http://opener-project.github.io/getting-started/how-to/local-installation.html)

At least you need the following system setup:

### Depenencies for normal use:

* JRuby (1.7.9+)
* Java 1.7 or newer (There are problems with encoding in older versions).

### Dependencies if you want to modify the component:

* Maven (for building the Gem)

Language Extension
------------------

  TODO

The Core
--------

The component is a fat wrapper around the actual language technology core. You
can find the core technolies in the following repositories: 
<https://github.com/opener-project/?query=pos>
<https://github.com/opener-project/?query=pos>

Where to go from here
---------------------

* [Check the project websitere](http://opener-project.github.io)
* [Checkout the webservice](http://opener.olery.com/pos-tagger)

Report problem/Get help
-----------------------

If you encounter problems, please email <support@opener-project.eu> or leave an
issue in the [issue tracker](https://github.com/opener-project/pos-tagger/issues).


Contributing
------------

1. Fork it <http://github.com/opener-project/pos-tagger/fork>
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


<div id='reference'></div>

## Reference

### Command Line Interface

#### Examples:

##### Provide subexamples

```
cat english.kaf | pos-tagger
```

Will result in:


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


### Webservice

You can launch a webservice by executing:

```
pos-tagger-server
```

After launching the server, you can reach the webservice at
<http://localhost:9292>.

The webservice takes several options that get passed along to [Puma](http://puma.io), the
webserver used by the component. The options are:


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

    Usage: pos-tagger-daemon <start|stop|restart> [options]

When calling pos-tagger without <start|stop|restart> the daemon will start as a foreground process

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

These daemons make use of Amazon SQS queues and other Amazon services.
The access to these services and other environment variables can be configured
using a .opener-daemons-env file in the home directory of the current user.

It is also possible to provide the environment variables directly to the deamon.

For example:

```
AWS_REGION='eu-west-1' pos-tagger start [other options]
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



