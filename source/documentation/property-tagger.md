---
layout: default
title: Property Tagger
sidebar: documentation
webservice: http://opener.olery.com/property-tagger
repository: https://github.com/opener-project/property-tagger

---



<div id='readme'></div>

Property Tagger
---------------

This module implements a tagger for hotel properties for Dutch, English, French, Italian, Spanish and German. It detects aspect words, for instance words related with "room", "cleanliness", "staff" or "breakfast" and links them with the correct aspect class. The input for this module has to be a valid KAF file with at lest the term layer, as the lemmas will be used for detecting the hotel properties. The output is also a KAF valid file extended with the property layer. This module works for all the languages within the OpeNER project (en,de,nl,fr,es,it) and the language is read from the input KAF file, from the lang attribute of the KAF element  (make sure your preprocessors set properly this value or you might use the resources for a wrong language)

### Confused by some terminology?

This software is part of a larger collection of natural language processing tools known as "the OpeNER project". You can find more information about the project at the [OpeNER portal](http://opener-project.github.io). There you can also find references to terms like KAF (an XML standard to represent linguistic annotations in texts), component, cores, scenario's and pipelines.

Quick Use Example
-----------------

Keep in mind that this component uses PYTHON so it's advised to make sure you have a virtualenv activated before installing.

Installing the property-tagger can be done by executing:

    gem install opener-property-tagger

Please keep in mind that all components in OpeNER take KAF as an input and output KAF by default.


### Command line interface

You should now be able to call the property tagger as a regular shell command: by its name. Once installed the gem normally sits in your path so you can call it directly from anywhere.

This application reads a text from standard input in order process it.

    cat some_kind_of_kaf_file.kaf | property-tagger --resource-path /path/to/lexicons/

The property tagger will search in the resource-path for files named ```{language_code}.txt```, for example ```en.txt```.

An excerpt of a potential output would than be:

```
  <features>
    <properties>
      <property pid="p1" lemma="cleanliness">
        <references>
          <!--dirty-->
          <span>
            <target id="t_12"/>
          </span>
        </references>
      </property>
      <property pid="p2" lemma="sleeping_comfort">
        <references>
          <!--bed-->
          <span>
            <target id="t_10"/>
          </span>
        </references>
      </property>
      <property pid="p3" lemma="staff">
        <references>
          <!--staff-->
          <span>
            <target id="t_16"/>
          </span>
          <!--friendly-->
          <span>
            <target id="t_20"/>
          </span>
        </references>
      </property>
    </properties>
  </features>
```

### Webservices

You can launch a webservice by executing:

    property-tagger-server --resource-path /path/to/resources

This will launch a mini webserver with the webservice. It defaults to port 9292, so you can access it at <http://localhost:9292>.

To launch it on a different port provide the `-p [port-number]` option like this:

    property-tagger-server -p 1234

It then launches at <http://localhost:1234>

Documentation on the Webservice is provided by surfing to the urls provided above. For more information on how to launch a webservice run the command with the ```-h``` option.


### Daemon

Last but not least the property tagger comes shipped with a daemon that can read jobs (and write) jobs to and from Amazon SQS queues. For more information type:

    property-tagger-daemon -h


Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER components. You can find an installation guide and helper tools in the [OpeNER installer](https://github.com/opener-project/opener-installer) and an[installation guide on the Opener Website](http://opener-project.github.io/getting-started/how-to/local-installation.html)

At least you need the following system setup:

### Depenencies for normal use:

* Ruby 1.9.3 or newer
* Python 2.6
* lxml installed

### Dependencies if you want to modify the component:

* Maven (for building the Gem)


Domain Adaption and Language Extension
--------------------------------------

The lexicons in the resource path must be stored in a file and follow this format:

    shell
    surf	verb	facilities
    surfer	noun	facilities
    surfing	verb	facilities


So, one aspect per line, with 3 fields separated by a tabulator, the first one is the word or span of words (in this case use whitespaces), then the part of speech (which actually it is not use, you can  include a dummy label) and finally the aspect class associated with the word.

The Core
--------

The component is a fat wrapper around the actual language technology core. You can find the core technolies (python) in the ```/core``` directory.

Where to go from here
---------------------

* [Check the project websitere](http://opener-project.github.io)
* [Checkout the webservice](http://opener.olery.com/property-tagger)

Report problem/Get help
-----------------------

If you encounter problems, please email <support@opener-project.eu> or leave an issue in the 
[issue tracker](https://github.com/opener-project/property-tagger/issues).

Contributing
------------

1. Fork it <http://github.com/opener-project/property-tagger/fork>
2. 2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


<div id='reference'></div>

## Reference

### Command Line Interface

#### Examples:

##### Tagging a Text

This application reads a text from standard input in order process it.

    cat some_kind_of_kaf_file.kaf | property-tagger --resource-path /path/to/lexicons/

The property tagger will search in the resource-path for files named ```{language_code}.txt```, for example ```en.txt```.

An excerpt of a potential output would than be:

```
  <features>
    <properties>
      <property pid="p1" lemma="cleanliness">
        <references>
          <!--dirty-->
          <span>
            <target id="t_12"/>
          </span>
        </references>
      </property>
      <property pid="p2" lemma="sleeping_comfort">
        <references>
          <!--bed-->
          <span>
            <target id="t_10"/>
          </span>
        </references>
      </property>
      <property pid="p3" lemma="staff">
        <references>
          <!--staff-->
          <span>
            <target id="t_16"/>
          </span>
          <!--friendly-->
          <span>
            <target id="t_20"/>
          </span>
        </references>
      </property>
    </properties>
  </features>
```

#### Downloading resources on the fly

You can also download resources on the fly at boot time. This is particularly interesting when launching a daemon or webservice, but it might also be useful from the command line.

When given the ```--resource-url``` option the software will download the file given (.zip or .tar.gz) into the /tmp folder and extract it into the ```resource-path``` folder. Subsequently it will use that resource-path to do its work.

If the resource has been downloaded before, and it is detected that the downloaded file is the same as the file on the url location, it will not download the file again, but will simply re-extract the file.

```
cat some-kind-of-kaf.kaf | property-tagger \
  --resource-path ~/resources/property-tagger \
  --resource-url http://some.location.com/property-lexicons.zip
```

### Webservice

You can launch a webservice by executing:

```
property-tagger-server --resource-path /path/to/resources
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

```
Usage: property-tagger-daemon <start|stop|restart> [options]

When calling property-tagger without <start|stop|restart> the daemon will start as a foreground process

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
AWS_REGION='eu-west-1' property-tagger start [other options]
```

We advise to have the following environment variables available:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

### Languages

That depends on your lexicons. The project will soon open up News lexicons for the following languages:

* Dutch (nl)
* English (en)
* French (fr)
* German (de)
* Italian (it)
* Spanish (es)

