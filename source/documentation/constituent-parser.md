---
layout: default
title: Constituent Parser
sidebar: documentation
webservice: http://opener.olery.com/constituent-parser
repository: https://github.com/opener-project/constituent-parser

---



<div id='readme'></div>

Constituent-Parser
------------------

The constituent parser wraps several other constituent parsers into a component that parses the 6 main opener languages. Each language uses it's own parser and core. For more information on the specific languages, please check the individual cores.

* [English, Spanish and French](https://github.com/opener-project/constituent-parser-base) - OpeNER
* [German](https://github.com/opener-project/constituent-parser-de) - Stanford Based
* [Dutch](https://github.com/opener-project/constituent-parser-nl-) - Alpino Based


### Confused by some terminology?

This software is part of a larger collection of natural language processing tools known as "the OpeNER project". You can find more information about the project at [the OpeNER portal](http://opener-project.github.io). There you can also find references to terms like KAF (an XML standard to represent linguistic annotations in texts), component, cores, scenario's and pipelines.

Quick Use Example
-----------------

Installing the constituent-parser can be done by executing:

    gem install opener-constituent-parser

Please bare in mind that all components in OpeNER take KAF as an input and output KAF by default.

### Command line interface

You should now be able to call the constituent parser as a regular shell command: by its name. Once installed the gem normaly sits in your path so you can call it directly from anywhere.

This aplication reads a text from standard input in order to identify the language.

    cat some_kind_of_kaf_file.kaf | constituent-parser


This is an excerpt of an example output:

```
<!--he-->
      <t id="ter761">
        <span>
          <target id="t761" />
        </span>
      </t>
      <!--added-->
      <t id="ter762">
        <span>
          <target id="t762" />
        </span>
      </t>
      <!--.-->
      <t id="ter763">
        <span>
          <target id="t763" />
        </span>
      </t>
      <!--Tree edges-->
      <edge id="tre2051" from="nter1328" to="nter1327" />
      <edge id="tre2052" from="nter1329" to="nter1328" />
      <edge id="tre2053" from="nter1330" to="nter1329" />
      <edge id="tre2054" from="nter1331" to="nter1330" head="yes" />
      <edge id="tre2055" from="nter1332" to="nter1331" head="yes" />
      <edge id="tre2056" from="nter1333" to="nter1332" />

```

### Webservices

You can launch a language identification webservice by executing:

    constituent-parser-server

This will launch a mini webserver with the webservice. It defaults to port 9292, so you can access it at <http://localhost:9292>.

To launch it on a different port provide the `-p [port-number]` option like this:

    constituent-parser-server -p 1234

It then launches at <http://localhost:1234>

Documentation on the Webservice is provided by surfing to the urls provided above. For more information on how to launch a webservice run the command with the ```-h``` option.

### Daemon

Last but not least the constituent parser comes shipped with a daemon that can read jobs (and write) jobs to and from Amazon SQS queues. For more information type:

    constituent-parser-daemon -h


Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER components. You can find an installation guide and helper tools in the [OpeNER installer](https://github.com/opener-project/opener-installer) and an
[installation guide on the Opener Website](http://opener-project.github.io/getting-started/how-to/local-installation.html)

At least you need the following system setup:

### Depenencies for normal use:

* Jruby (1.7.9 or newer)
* Java 1.7 or newer (There are problems with encoding in older versions).
* Python 2.6

If you want to use the Dutch constituent parser you need to have:

* Alpino <http://www.let.rug.nl/vannoord/alp/Alpino/AlpinoUserGuide.html>

Language Extension
------------------

  TODO


Where to go from here
---------------------

* [Check the project websitere](http://opener-project.github.io)
* [Checkout the webservice](http://opener.olery.com/constituent-parser)

Report problem/Get help
-----------------------

If you encounter problems, please email support@opener-project.eu or leave an issue in the 
[issue tracker](https://github.com/opener-project/constituent-parser/issues).


Contributing
------------

1. Fork it <http://github.com/opener-project/constituent-parser/fork>
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request




<div id='reference'></div>

## Reference

### Command Line Interface

```
cat some_kind_of_kaf_file.kaf | constituent-parser
```

This is an excerpt of an example output:

```
<!--he-->
      <t id="ter761">
        <span>
          <target id="t761" />
        </span>
      </t>
      <!--added-->
      <t id="ter762">
        <span>
          <target id="t762" />
        </span>
      </t>
      <!--.-->
      <t id="ter763">
        <span>
          <target id="t763" />
        </span>
      </t>
      <!--Tree edges-->
      <edge id="tre2051" from="nter1328" to="nter1327" />
      <edge id="tre2052" from="nter1329" to="nter1328" />
      <edge id="tre2053" from="nter1330" to="nter1329" />
      <edge id="tre2054" from="nter1331" to="nter1330" head="yes" />
      <edge id="tre2055" from="nter1332" to="nter1331" head="yes" />
      <edge id="tre2056" from="nter1333" to="nter1332" />

```

### Webservice

You can launch a webservice by executing:

```
constituent-parser-server
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
Usage: constituent-parser-daemon <start|stop|restart> [options]

When calling constituent-parser without <start|stop|restart> the daemon will start as a foreground process

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
AWS_REGION='eu-west-1' constituent-parser start [other options]
```

We advise to have the following environment variables available:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

### Languages

* Dutch (nl) (If you have Alpino installed)
* English (en)
* French (fr)
* German (de)
* Italian (it)
* Spanish (es)

