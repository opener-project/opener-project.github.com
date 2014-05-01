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
* Python 2.7+ ([installation instructions](http://www.python.org/getit/))
* Java 1.7+ ([installation instructions](http://www.oracle.com/technetwork/java/javase/downloads/java-se-jre-7-download-432155.html))
* Perl 5+([installation instructions](http://www.perl.org/get.html))

### Ruby Setup

After you installed JRuby you also need to install Rubygems and Bundler.

You can find the installation instructions of Rubygems here:
[RubyGems installation instructions](http://rubygems.org/pages/download)

After you installed Rubygems install the bundler gem with the following command:

````gem install bundler````

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

Once you've got the basics set up, including the installation of rubygems,
bundler, a Python virtual environment and lxml run the following command:

```gem install opener-basic```

The installation might take a while and you might get asked several questions.
But if all goes well, you'll be up and running in about 15 minutes, give or
take.

<div id="run-the-example"></div>

# Run the example

See if things are setup propery by trying to run the following line of code:

```echo "This is absolutelty great" | language-identifier ```

You can also try and put your own text into the opener-example chain. For
example by piping in the contents of a textfile:

``` cat my_text_file.txt | language-identifier | tokenizer | pos-tagger ```

