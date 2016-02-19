---
layout: default
title: Named Entitiy Disambiguation
sidebar: getting_started
---

# Named Entity Disambiguation

Checkout the [Quick Start Guide](/getting-started/how-to/quick-start.html) for a
general overview of the technology.

In order to use the NED and NED you can take a look at this example:

```shell
cat some_file.txt | \
curl -F 'input=<-' "http://opener.olery.com/language-identifier" | \
curl -F 'input=<-' "http://opener.olery.com/tokenizer" | \
curl -F 'input=<-' "http://opener.olery.com/pos-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/constituent-parser" | \
curl -F 'input=<-' "http://opener.olery.com/ner" | \
curl -F 'input=<-' "http://opener.olery.com/ned" | \
curl -F 'input=<-' "http://opener.olery.com/property-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/polarity-tagger"
```

