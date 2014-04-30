---
layout: default
title: Quick Start
sidebar: getting_started
---

# Install OpeNER requirements

In order to work with OpeNER you need to:

1. Install the overall OpeNER requirements
2. [Get the example application](#get-the-example-application)
3. [Run the example](#run-the-example)
4. [Find other components](/documentation/)

The OpeNER toolchain consists of a broad mix of technologies glued together
using Ruby. Most of these requirements are already present on up-to-date unix like
installations (including Mac OSX) or can be easily upgraded.

Every part of the OpeNER toolchain has individual dependencies. Most of which
are included in the components themselves. Check out the individual manual pages
of the components to for the specifics.

The prerequisits of running an OpeNER toolchain consists of:

* A mac / linux / unix kind of operating system
* Ruby 1.9.3+ ([installation instructions](http://www.ruby-lang.org/en/downloads/))
* Python 2.7+ ([installation instructions](http://www.python.org/getit/))
* Java 1.7+ ([installation instructions](http://www.oracle.com/technetwork/java/javase/downloads/java-se-jre-7-download-432155.html))
* Perl 5+([installation instructions](http://www.perl.org/get.html))

After you installed Ruby 1.9.3 you also need to install Rubygems and Bundler.

You can find the installation instructions of Rubygems here:
[RubyGems installation instructions](http://rubygems.org/pages/download)

After you installed Rubygems install the bundler gem with the following command:

````gem install bundler````


<a name="get-the-example-application"></a>
# Get the example application
Once you've got the basics set up, including the installation of bundler

```gem install opener-basic```


<a name="run-the-example"></a>
# Run the example

See if things are setup propery by trying to run the following line of code:

```echo "This is absolutelty great" | language-identifier ```

You can also try and put your own text into the opener-example chain. For
example by piping in the contents of a textfile:

``` cat my_text_file.txt | opener-sentiments```

