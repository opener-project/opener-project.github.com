---
layout: default
title: NED
sidebar: documentation
webservice: http://opener.olery.com/ned
repository: https://github.com/opener-project/ned

---



<div id='readme'></div>

Introduction
------------

This repository contains a Named Entity Disambiguation tool that queries a
DBpedia spotlight server. The client takes KAF as input (containing
`<entities>` nodes).

### Confused by some terminology?

This software is part of a larger collection of natural language processing
tools known as "the OpeNER project". You can find more information about the
project at [the OpeNER portal](http://opener-project.github.io). There you can
also find references to terms like KAF (an XML standard to represent linguistic
annotations in texts), component, cores, scenario's and pipelines.

Quick Use Example
-----------------

Installing the ned can be done by executing:

    gem install opener-ned

Please bare in mind that all components in OpeNER take KAF as an input and
output KAF by default.


### Command line interface

The NED client connects to the [DBPedia spotlight demo servers](http://dbpedia-spotlight.github.io/demo/).

A simple example:

    cat some_input_file.kaf | ned

An example output (excerpt) could look like this:

```xml
<entity eid="e3" type="organization">
  <references>
    <!--North Yorkshire Police-->
    <span>
      <target id="t17" />
      <target id="t18" />
      <target id="t19" />
    </span>
  </references>
  <externalReferences>
    <externalRef resource="spotlight_v1" reference="http://dbpedia.org/resource/North_Yorkshire_Police" />
  </externalReferences>
</entity>
```

### Webservices

You can launch a language identification webservice by executing:

    ned-server

This will launch a mini webserver with the webservice. It defaults to port 9292,
so you can access it at <http://localhost:9292>.

To launch it on a different port provide the `-p [port-number]` option like
this:

    ned-server -p 1234

It then launches at <http://localhost:1234>

Documentation on the Webservice is provided by surfing to the urls provided
above. For more information on how to launch a webservice run the command with
the ```-h``` option.


### Daemon

Last but not least the NED comes shipped with a daemon that
can read jobs (and write) jobs to and from Amazon SQS queues. For more
information type:

    ned-daemon -h


Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER
components. You can find an installation guide and helper tools in the [OpeNER installer](ttps://github.com/opener-project/opener-installer) and an
[installation guide on the Opener Website](http://opener-project.github.io/getting-started/how-to/local-installation.html)

At least you need the following system setup:

### Depenencies for normal use:

* Jruby (1.7.9 or newer)
* Java 1.7 or newer (There are problems with encoding in older versions).

### Dependencies if you want to modify the component:

* Maven (for building the Gem)

### Structure

This repository comes in two parts: a collection of Java source files and Ruby
source files. The Java code can be found in the `core/` directory, everything
else will be Ruby source code.

Language Extension
------------------

  TODO

Where to go from here
---------------------

* [Check the project websitere](http://opener-project.github.io)
* [Checkout the webservice](http://opener.olery.com/ned)

Report problem/Get help
-----------------------

If you encounter problems, please email <support@opener-project.eu> or leave an
issue in the [issue tracker](https://github.com/opener-project/ned/issue).


Contributing
------------

1. Fork it <http://github.com/opener-project/ned/fork>
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



<div id='reference'></div>

## Reference

### Command Line Interface

#### Examples:

### Command line interface

A simple example:

    cat some_input_file.kaf | ned

An example output (excerpt) could look like this:

```xml
<entity eid="e3" type="organization">
  <references>
    <!--North Yorkshire Police-->
    <span>
      <target id="t17" />
      <target id="t18" />
      <target id="t19" />
    </span>
  </references>
  <externalReferences>
    <externalRef resource="spotlight_v1" reference="http://dbpedia.org/resource/North_Yorkshire_Police" />
  </externalReferences>
</entity>
```

### Webservice

You can launch a webservice by executing:

```
ner-server
```

After launching the server, you can reach the webservice at
<http://localhost:9292>.

The webservice takes several options that get passed along to [Puma](http://puma.io), the
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
Usage: ner-daemon <start|stop|restart> [options]

When calling ner without <start|stop|restart> the daemon will start as a foreground process

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
AWS_REGION='eu-west-1' ner start [other options]
```

We advise to have the following environment variables available: 

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

### Languages

* English (en)
* Dutch (nl)
* French (fr)
* German (de)
* Spanish (es)
* Italian (it)
* Russian (ru)
* Portuguese (pt)
* Hungarian (hu)
* Turkish (tr)
