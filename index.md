---
layout: page
title: Introduction to OpeNER
tagline: Language Analysis for the rest of us
---
{% include JB/setup %}

Read [Opener Quick Start](quick-start.html)

## What is OpeNER?

OpeNER is a language analysis toolchain helping (academic) researchers and
companies make sense out of "natural language analysis". It consist of easy to
install, improve and configure components to:

* Detect the language of a text
* Tokenize texts
* Determine polarisation of texts (sentiment analysis) and detect what topics
  are included in the text.
* Detect entities named in the texts and link them together. (e.g. President
  Obama or The Hilton Hotel)

The supported language set currently consists of: English, Spanish, Italian,
German and Dutch.

Besides the individual components, guidelines exists on how to add languages and
how to adjust components for specific situations and topics.

## What technology is used?

The OpeNER toolchain consists of a broad mix of technologies glued together
using Ruby. The prerequisits of running an OpeNER toolchain consists of:

* A mac / linux / unix kind of operating system
* Ruby 1.9.3+
* Python 2.7+
* Java 1.7+
* Perl 5+

Most of these requirements are already present on up-to-date unix like
installations (including Mac OSX) or can be easily upgraded. 

Every part of the OpeNER toolchain has individual dependencies. Most of which
are included in the components themselves. Check out the [individual manual pages
of the components](component-list.html) to for the specifics. 

## Introduction to the OpeNER architecture

The OpeNER architecture consists of several buidling blocks called COMPONENTS,
with which you build a language analysis toolchain called a CONFIGURATION.

An overview of how COMPONENTS might be chained into a CONFIGRATION is displayed
in the picture below. ![Example
CONFIGURATION](assets/images/opener-chain.png "Example CONFIGURATION")

Please read the [Architecture and Lingo Overview](architecture.html) to get an
overview of the terms used in the rest of the documentation.

## Quick Start Guide

Checkout the [Quick start guide](quick-start.html) to get going right away.

## Recent tech-updates

Keep up to date with the latest developments by reading this posts.

Here's a sample "posts list".

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo;
    <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
