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
cat some_file.txt | curl -F 'input=<-' \
"http://opener.olery.com/language-identifier\
?callbacks\[\]=http://opener.olery.com/tokenizer\
&callbacks\[\]=http://opener.olery.com/pos-tagger\
&callbacks\[\]=http://opener.olery.com/polarity-tagger\
&callbacks\[\]=http://opener.olery.com/opinion-detector-basic\
&callbacks\[\]=http://opener.olery.com/outlet"
```

You will get a return that looks like this:


```json
{
  "output_url": "http://opener.olery.com/outlet/68f6f338-1058-40d0-99da-b6a4d226bb99",
  "request_id": "68f6f338-1058-40d0-99da-b6a4d226bb99"
}
```

If you then append ```.json``` to the output url and do a request like this:

```shell
curl http://opener.olery.com/outlet/68f6f338-1058-40d0-99da-b6a4d226bb99.json
```

You will get a JSON representation of the KAF file. Generating the JSON does
take a little longer though.

## More detailed opinions

By using the full pipeline the opinion detection should become better. In this
case you will need the NER and NED and their support endpoints. Like this:

```shell
cat some_file.txt | curl -F 'input=<-' \
"http://opener.olery.com/language-identifier\
?callbacks\[\]=http://opener.olery.com/tokenizer\
&callbacks\[\]=http://opener.olery.com/pos-tagger\
&callbacks\[\]=http://opener.olery.com/ner\
&callbacks\[\]=http://opener.olery.com/ned\
&callbacks\[\]=http://opener.olery.com/coreference\
&callbacks\[\]=http://opener.olery.com/property-tagger\
&callbacks\[\]=http://opener.olery.com/polarity-tagger\
&callbacks\[\]=http://opener.olery.com/opinion-detector\
&callbacks\[\]=http://opener.olery.com/outlet"
```

## Aggregating Sentiment Scores

In order to do so, make sure your pipeline includes:

* the property tagger
* the polarity-tagger
* an opinion-detector (the standard one or the basic one)

Then at the end put the scorer instead of the outlet. Resulting in this request:

```shell
cat some_file.txt | curl -F 'input=<-' \
"http://opener.olery.com/language-identifier\
?callbacks\[\]=http://opener.olery.com/tokenizer\
&callbacks\[\]=http://opener.olery.com/pos-tagger\
&callbacks\[\]=http://opener.olery.com/polarity-tagger\
&callbacks\[\]=http://opener.olery.com/property-tagger\
&callbacks\[\]=http://opener.olery.com/opinion-detector-basic\
&callbacks\[\]=http://opener.olery.com/scorer"
```

This will also provide you with an output_url. However, this url will give you
back a JSON object with sentiment values between -1 and 1 on the detected
topics. Like this:

```json
{
  "scores": {
    "breakfast": -1,
    "location": -1,
    "cleanliness": 1,
    "restaurant": 1,
    "room": 1,
    "bathroom": 1,
    "value_for_money": -1,
    "overall": 0.5
  },
  "uuid": "74c63ace-4402-4352-a94f-32ecf3bdc433"
}
```
