---
layout: default
title: kaf2json
sidebar: documentation
webservice: http://opener.olery.com/kaf2json
repository: https://github.com/opener-project/kaf2json

---



<div id='readme'></div>

kaf2json
------------

Even if KAF is the true OpeNER data representation format, it is not very friendly for humans. It is also difficult to parse and work with it, specially for new users that are not familiarized with KAF. This is part of the feedback we got from the OpeNER hackathon held in Amsterdam during first days of July. To ease the post-processing of the results by any potential user, we are designing an alternative JSON format to output translate KAF, and turn its complexity into a much more usable format. Although, the specification for this JSON is currently work in progress, we have already a version that covers the most relevant parts from the KAF representation.

### Confused by some terminology?

This software is part of a larger collection of natural language processing tools known as "the OpeNER project". You can find more information about the project at [the OpeNER portal](http://opener-project.github.io). There you can also find references to terms like KAF (an XML standard to represent linguistic annotations in texts), component, cores, scenario's and pipelines.


Quick Use Example
-----------------

Installing the kaf2json can be done by executing:

    gem install opener-kaf2json

Please bare in mind that all components in OpeNER take KAF as an input and output KAF by default.

### Command line interface

You should now be able to call the kaf2json as a regular shell command: by its name. Once installed the gem normally sits in your path so you can call it directly from anywhere.

This aplication reads a text from standard input in order to convert it to JSON.

    cat some_kind_of_kaf_file.kaf | kaf2json


This will output (JSON Format):

```
{
	"text"      : "Beatrix Wilhelmina Armgard van Oranje -Nassau (Baarn , 31 januari 1938 ) is sinds 30 april 1980 koningin van het Koninkrijk der Nederlandén ",
	"language"  : "nl",
	"terms"     : {},
	"sentiments": [],
	"entities"  : {},
	"opinions"  : {}
}
```

### Webservices

You can launch a webservice by executing:

    kaf2json-server

This will launch a mini webserver with the webservice. It defaults to port 9292, so you can access it at <http://localhost:9292>.

To launch it on a different port provide the `-p [port-number]` option like this:

    kaf2json-server -p 1234

It then launches at <http://localhost:1234>

Documentation on the Webservice is provided by surfing to the urls provided above. For more information on how to launch a webservice run the command with the ```-h``` option.


### Daemon

Last but not least the kaf2json comes shipped with a daemon that can read jobs (and write) jobs to and from Amazon SQS queues. For more information type:

    kaf2json-daemon -h


Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER components. You can find an installation guide and helper tools in the [OpeNER installer](https://github.com/opener-project/opener-installer) and an
[installation guide on the Opener Website](http://opener-project.github.io/getting-started/how-to/local-installation.html)

At least you need the following system setup:

### Depenencies for normal use:

* JRuby 1.7.9 or newer

Domain Adaption
---------------

  TODO

Language Extension
------------------

  TODO

The Core
--------

The component is a fat wrapper around the actual language technology core. You can find the core technolies in the following repositories:

* (link to) Related Core readmes

Where to go from here
---------------------

* [Check the project websitere](http://opener-project.github.io)
* [Checkout the webservice](http://opener.olery.com/kaf2json)

Report problem/Get help
-----------------------

If you encounter problems, please email support@opener-project.eu or leave an
[issue tracker](https://github.com/opener-project/kaf2json/issues).


Contributing
------------

1. Fork it <http://github.com/opener-project/kaf2json/fork>
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


<div id='reference'></div>

## Reference

### Command Line Interface

#### Examples:

##### Provide subexamples

This aplication reads a text from standard input in order to convert it to JSON.

    cat some_kind_of_kaf_file.kaf | kaf2json


This will output (JSON Format):

```
{
	"text"      : "Beatrix Wilhelmina Armgard van Oranje -Nassau (Baarn , 31 januari 1938 ) is sinds 30 april 1980 koningin van het Koninkrijk der Nederlandén ",
	"language"  : "nl",
	"terms"     : {},
	"sentiments": [],
	"entities"  : {},
	"opinions"  : {}
}
```

### Webservice

You can launch a webservice by executing:

```
kaf2json-server
```

After launching the server, you can reach the webservice at
<http://localhost:9292>.

The webservice takes several options that get passed along to [Puma](http://puma.io), the webserver used by the component. The options are:

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
Usage: kaf2json-daemon <start|stop|restart> [options]

When calling kaf2json without <start|stop|restart> the daemon will start as a foreground process

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

These daemons make use of Amazon SQS queues and other Amazon services. The access to these services and other environment variables can be configured using a .opener-daemons-env file in the home directory of the current user.

It is also possible to provide the environment variables directly to the deamon.

For example:

```
AWS_REGION='eu-west-1' kaf2json start [other options]
```

We advise to have the following environment variables available: 

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION
