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
cat some_file.txt | curl -F 'input=<-' \
"http://opener.olery.com/language-identifier\
?callbacks\[\]=http://opener.olery.com/tokenizer\
&callbacks\[\]=http://opener.olery.com/pos-tagger\
&callbacks\[\]=http://opener.olery.com/constituent-parser\
&callbacks\[\]=http://opener.olery.com/ner\
&callbacks\[\]=http://opener.olery.com/ned\
&callbacks\[\]=http://opener.olery.com/coreference\
&callbacks\[\]=http://opener.olery.com/outlet"
```

