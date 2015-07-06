---
layout: default
title: Quick Start
sidebar: getting_started
---

# Install OpeNER requirements

In order to work with OpeNER you need to:

1. Install the overall OpeNER requirements
2. Install OpeNER
3. Try some examples

The OpeNER toolchain consists of a broad mix of technologies glued together
using Ruby. Most of these requirements are already present on up-to-date unix like
installations (including Mac OSX) or can be easily upgraded.

Every part of the OpeNER toolchain has individual dependencies. Most of which
are included in the components themselves. Check out the individual manual pages
of the components to for the specifics.

## OpeNER requirements

### General Environment

The prerequisits of running an OpeNER toolchain consists of:

* A mac / linux / unix kind of operating system
* JRuby 1.7.9+ ([installation instructions](http://jruby.org))
* Python 2.6+ ([installation instructions](http://www.python.org/getit/))
* Java 1.7+ ([installation instructions](http://www.oracle.com/technetwork/java/javase/downloads/java-se-jre-7-download-432155.html))
* Perl 5+([installation instructions](http://www.perl.org/get.html))
* [libarchive](http://www.libarchive.org/) development headers, best installed
  via your operating system's package manager

### Ruby Setup

After you installed JRuby you also need to install Rubygems and Bundler.

You can find the installation instructions of Rubygems here:
[RubyGems installation instructions](http://rubygems.org/pages/download)

After you installed Rubygems install the bundler gem with the following command:

    gem install bundler

If you happen to install JRuby via your operating system's package manager it's
likely that just using the `ruby` command will result in the system Ruby version
being used instead of JRuby. You can confirm this by running:

    ruby --version

This should output something along the lines of:

    jruby 1.7.18 (1.9.3p551) 2014-12-22 625381c on OpenJDK 64-Bit Server VM 1.7.0_79-b14 +jit [linux-amd64]

If this is not the case you'll need to run the various components using
`jruby -S`. For example:

    echo 'Hello world, this is a text' | jruby -S language-identifier

You'll also have to use this when installing Gems:

    jruby -S gem install opener-language-identifier

As an alternative you can use [chruby](https://github.com/postmodern/chruby) and
[ruby-install](https://github.com/postmodern/ruby-install) to install JRuby
in an isolated environment. Once this is set up you can install/use JRuby as
following:

    ruby-install jruby

    # restart your terminal or reload your Bash profile (e.g. source ~/.bashrc)

    chruby jruby

For more information see the READMEs of chruby and ruby-install.

### Python Setup

#### Virtual environment

We highly recommend using a python virtualenv environment. A convenient way to
get that working is by visiting the [virtualenv-burrito
project](https://github.com/brainsik/virtualenv-burrito) over at Github.

Once you have the virtualenv-burrito installed you can for example create an
OpeNER environment using:

```
mkvirtualenv opener
```

and then activate is using

```
workon opener
```

If you make sure that you activate your ```opener``` enviroment before
installing any OpeNER components. We can more or less guarantee you a smooth
Python ride. If you forget to ```workon opener``` the road might be quite bumpy.

#### Lxml

Most OpeNER components ship with all batteries included. However lxml is used
so often that that wouldn't make sense. So please, after you activated your
virtualenv. please install lxml. There is a [manual available at the lxml
website](http://lxml.de/installation.html).


<div id="get-the-example-application"></div>

# Install OpeNER



The components that are currently available are:

    opener-language-identifier
    opener-tokenizer
    opener-pos-tagger
    opener-tree-tagger
    opener-polarity-tagger
    opener-property-tagger
    opener-constituent-parser
    opener-ner
    opener-coreference
    opener-ned
    opener-opinion-detector
    opener-opinion-detector-basic
    opener-kaf2json
    opener-outlet
    opener-scorer

Once you've got the basics set up, including the installation of rubygems,
bundler, a Python virtual environment and lxml run the following command for the
components you want to install (replace `component-name` with one of the above
components):

```gem install component-name```

For more information for each component you can visit the documentation in
[RubyGems](https://rubygems.org). Simply search for the component and
click on the Documentation page.

<div id="run-the-example"></div>

# Run the example

See if things are setup propery by trying to run the following line of code:

```echo "This is absolutelty great" | language-identifier ```

You can also try and put your own text into the opener-example chain. For
example by piping in the contents of a textfile:

``` cat my_text_file.txt | language-identifier | tokenizer | pos-tagger ```

You can also run the component as a web-service like that:

```language-identifier-server```

And you can visit the web service in your browser at ```http://localhost:9292```

# Support

Visit the [Support Page](/support.html) if you need further help or instructions
on how to install the OpeNER components.



