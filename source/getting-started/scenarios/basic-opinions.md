---
layout: default
title: Basic Opinions
sidebar: getting_started
---

# Getting started with basic opinion detection

Checkout the [Quick Start Guide](/getting-started/how-to/quick-start.html) for a
general overview of the technology.

## Basic Opinions

Using Curl as an example you can get basic opinion detection using the following
command. This assumes you have your text in a text file called
```some_file.txt```.

```shell
cat some_file.txt | \
curl -F 'input=<-' "http://opener.olery.com/language-identifier" | \
curl -F 'input=<-' "http://opener.olery.com/tokenizer" | \
curl -F 'input=<-' "http://opener.olery.com/pos-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/polarity-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/opinion-detector-basic"
```

## More detailed opinions

By using the full pipeline the opinion detection should become better. In this
case you will need the NER and NED and their support endpoints. Like this:

```shell
cat some_file.txt | \
curl -F 'input=<-' "http://opener.olery.com/language-identifier" | \
curl -F 'input=<-' "http://opener.olery.com/tokenizer" | \
curl -F 'input=<-' "http://opener.olery.com/pos-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/constituent-parser" | \
curl -F 'input=<-' "http://opener.olery.com/ner" | \
curl -F 'input=<-' "http://opener.olery.com/ned" | \
curl -F 'input=<-' "http://opener.olery.com/property-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/polarity-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/opinion-detector"
```
