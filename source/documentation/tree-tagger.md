---
layout: default
title: Tree Tagger
sidebar: documentation
webservice: http://opener.olery.com/tree-tagger

---



<div id='readme'></div>

[![Build Status](https://drone.io/github.com/opener-project/VU-tree-tagger_kernel/status.png)](https://drone.io/github.com/opener-project/VU-tree-tagger_kernel/latest)

Introduction
------------

This module implements a wrapper to process text with the PoS tagger TreeTagger. TreeTagger is a tool that assigns the lemmas and part-of-speech information to an input text.
This module takes KAF as input, with the token layer created (for instance by one of our tokenizer modules) and outputs KAF with a new term layer. It is important to note
that the token layer in the input is not modified in the output, so the program takes care of performing the correct matching between the term and the token layer.

By default this module works for text in English, Dutch and German, but can be easily extended to other languages. The language of the input KAF text has to be specified through
the attribute xml:lang in the main KAF element.

### Confused by some terminology?

This software is part of a larger collection of natural language processing
tools known as "the OpeNER project". You can find more information about the
project at (the OpeNER portal)[http://opener-project.github.io]. There you can
also find references to terms like KAF (an XML standard to represent linguistic
annotations in texts), component, cores, scenario's and pipelines.

Quick Use Example
-----------------

Installing the tree-tagger can be done by executing:

    gem install opener-tree-tagger

Also make sure you have tree-tagger and the proper language files installed AND
that you set the path to the tree-tagger in the TREE_TAGGER_PATH environment
variable.

Besides that, make sure you install lxml. You can probably achieve this by
typing 

    pip install lxml

If that doesn't work, please check the (installation guide on the OpeNER
portal)[http://opener-project.github.io/getting-started/how-to/local-installation.html].

Please bare in mind that all components in OpeNER take KAF as an input and
output KAF by default.

### Command line interface

You should now be able to call the tree-tagger as a regular shell
command: by its name. Once installed the gem normalyl sits in your path so you can call it directly from anywhere.

This aplication reads a text from standard input in order to identify the language.

    cat some_kind_of_kaf_file.kaf | tree-tagger


This will output KAF xml.

### Webservices

You can launch a language identification webservice by executing:

    tree-tagger-server

This will launch a mini webserver with the webservice. It defaults to port 9292,
so you can access it at <http://localhost:9292>.

To launch it on a different port provide the `-p [port-number]` option like
this:

    tree-tagger-server -p 1234

It then launches at <http://localhost:1234>

Documentation on the Webservice is provided by surfing to the urls provided
above. For more information on how to launch a webservice run the command with
the ```-h``` option.


### Daemon

Last but not least the tree-tagger comes shipped with a daemon that
can read jobs (and write) jobs to and from Amazon SQS queues. For more
information type:

    tree-tagger-daemon -h


Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER
components. You can find an installation guide and helper tools in the (OpeNER
installer)[https://github.com/opener-project/opener-installer] and (an
installation guide on the Opener
Website)[http://opener-project.github.io/getting-started/how-to/local-installation.html]

At least you need the following system setup:

### Depenencies for normal use:

* Ruby (Tested on MRI and JRuby) 1.9.3 
* Python 2.6
* LXML installed
* This module has a dependency on the following external module: TreeTagger (http://www.ims.uni-stuttgart.de/projekte/corplex/TreeTagger/) More information is further down in this document.
* Tree tagger installed and it's path know in TREE_TAGGER_PATH environment
  variable.

If TreeTagger is not installed in your machine
you can download it from http://www.ims.uni-stuttgart.de/projekte/corplex/TreeTagger/ and follow the installation instructions. To indicate to our scripts where
TreeTagger is located, you have to set an environment variable with the
location:

```shell
export TREE_TAGGER_PATH=/usr/local/TreeTagger/
```

It is advised you add the path to the tree tagger in your bash or zsh profile by
adding it to ```~/.bash_profile``` or ```~/.zshrc```

Language Extension
------------------

The tree-tagger depends on the availability of Tree Tagger models. Check
out the tree tagger website for more languages. Also you'll have to update the
py files in the core directory.

The Core
--------

The component is a fat wrapper around the actual language technology core. You
can find the core technolies in the core directory of this repository.

Where to go from here
---------------------

* Check (the project websitere)[http://opener-project.github.io]
* (Checkout the webservice)[http://opener.olery.com/tree-tagger]

Report problem/Get help
-----------------------

If you encounter problems, please email support@opener-project.eu or leave an
issue in the (issue tracker)[https://github.com/opener-project/tree-tagger/issues].


Contributing
------------

1. Fork it ( http://github.com/opener-project/tree-tagger/fork )
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
Usage: tree-tagger [options]
  -l, --log                        Enable logging to STDERR

Examples:

  cat example.kaf | tree-tagger    # Basic usage
  cat example.kaf | tree-tagger -l # Logs information to STDERR
```

### Webservice

You can launch a webservice by executing:

```
tree-tagger-server
```

After launching the server, you can reach the webservice at
<http://localhost:9292>.

The webservice takes several options that get passed along to (Puma)[http://puma.io], the
webserver used by the component. The options are:

```
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
```


### Daemon

The daemon has the default OpeNER daemon options. Being:

```
Usage: tree-tagger-daemon <start|stop|restart> [options]

When calling tree-tagger without <start|stop|restart> the daemon will start as a foreground process

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
```

#### Environment Variables

These daemons make use of Amazon SQS queues and other Amazon services.
The access to these services and other environment variables can be configured
using a .opener-daemons-env file in the home directory of the current user.

It is also possible to provide the environment variables directly to the deamon.

For example:

```
AWS_REGION='eu-west-1' tree-tagger start [other options]
```

We advise to have the following environment variables available: 

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

### Others

Languages supported out of the box:

* Dutch
* English
* French
* Spanish
* Italian
* German


