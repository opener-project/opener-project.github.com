---
layout: default
title: kaf-naf parser
sidebar: documentation
webservice: http://opener.olery.com/kaf-naf-parser
repository: https://github.com/opener-project/kaf-naf-parser

---



<div id='readme'></div>

Introduction
------------

This library converts KAF to NAF and NAF to KAF. It also contains a webservice for doing exactly this.

It uses slightly altered distributions of the VUA_pylib and KafNafParserPy but it keeps the external libraries contained, so that shouldn't influence anything on your system.

### Confused by some terminology?

This software is part of a larger collection of natural language processing tools known as "the OpeNER project". You can find more information about the project at [the OpeNER portal](http://opener-project.github.io). There you can also find references to terms like KAF (an XML standard to represent linguistic annotations in texts), component, cores, scenario's and pipelines.


Quick Use Example
-----------------

Installing the kaf-naf-parser can be done by executing:

    gem install opener-kaf-naf-parser

Please bare in mind that all components in OpeNER take KAF as an input and output KAF by default.

It ships with 3 command line tools and a webservice:

```
kaf-to-naf
naf-to-kaf
kaf-naf-parser
kaf-naf-parser-server
```

It works like this:

```
cat some_kaf.kaf | kaf-to-naf > output.naf
cat some_naf.naf | naf-to-kaf > output.kaf

cat some_kaf.kaf | kaf-naf-parser --tonaf > output.naf
```

The webservice can be started like this:

```
naf-to-kaf-parser-server
```
And can then be accessed at: <http://localhost:9292>

Easiest way to install the gem:

### Daemon

Last but not least the kaf-naf-parser comes shipped with a daemon that can read jobs (and write) jobs to and from Amazon SQS queues. For more information type:

    kaf-naf-parser-daemon -h


Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER components. You can find an installation guide and helper tools in the [OpeNER installer](https://github.com/opener-project/opener-installer) and an [installation guide on the Opener Website](http://opener-project.github.io/getting-started/how-to/local-installation.html)

At least you need the following system setup:

### Dependencies for normal use:

* Ruby 1.9.3 or newer
* Python 2.6

Where to go from here
---------------------

* [Check the project website](http://opener-project.github.io)
* [Checkout the webservice](http://opener.olery.com/kaf-naf-parser)

Report problem/Get help
-----------------------

If you encounter problems, please email support@opener-project.eu or leave an issue in the 
[issue tracker](https://github.com/opener-project/kaf-naf-parser/issues).


Contributing
------------

1. Fork it <http://github.com/opener-project/kaf-naf-parser/fork>
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
cat some_kaf.kaf | kaf-to-naf > output.naf
cat some_naf.naf | naf-to-kaf > output.kaf

cat some_kaf.kaf | kaf-naf-parser --tonaf > output.naf
```

### Webservice

You can launch a webservice by executing:

```
kaf-naf-parser-server
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
Usage: kaf-naf-parser-daemon <start|stop|restart> [options]

When calling kaf-naf-parser without <start|stop|restart> the daemon will start as a foreground process

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
AWS_REGION='eu-west-1' kaf-naf-parser start [other options]
```

We advise to have the following environment variables available:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION
