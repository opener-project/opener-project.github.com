---
layout: default
title: Getting started with OpeNER
sidebar: getting_started
---

# Opener Webservices Quick Start with CURL

You can try the webservices using the popular command line tool CURL.
For the best result, put your text in a textfile, for the example called
```some_file.txt``` and then pass it through the webservices like this:


```shell
cat some_file.txt | curl -F 'input=<-' \
"http://opener.olery.com/language-identifier\
?callbacks\[\]=http://opener.olery.com/tokenizer\
&callbacks\[\]=http://opener.olery.com/pos-tagger\
&callbacks\[\]=http://opener.olery.com/outlet"
```

The trick here is to use curls ```-F``` option with ```input=<-``` as argument.
The ```<-``` in this case means it reads from STDIN and posts it to the
webservices.

An alternative way is to use ```-F 'input=<some_file.txt'```. Both options read
the textfile and put them through the webservices.

## Chaining Webservices

You can chain multiple webservices together by adding ```callbacks[]=``` to the
current request. The more callbacks you add the longer your pipeline will be.

Beware that when you use curl from bash, you need to escape the ```[]``` and they
become ```\[\]```. Also put your url in between double quotes.

So the structure of the curl request looks like this:

```shell
cat some_file.txt | curl -F 'input=<-' \
"http://opener.olery.com/language-identifier\
?callbacks\[\]=http://opener.olery.com/tokenizer\
&callbacks\[\]=http://opener.olery.com/extra_callback1\
&callbacks\[\]=http://opener.olery.com/extra_callback2\
&callbacks\[\]=http://opener.olery.com/outlet"
```

**ALWAYS end your callbacks with the outlet. Else there is no spot to "catch" your
results**

After you do this request you'll get a response containing a URL which you can
poll to catch your result. Don't worry if it's not immediately there. It might
take a couple of seconds. If the document is not done processing yet, you will
get a message stating ```no document found```.

## Returning JSON

If you prefer to receive JSON instead of KAF at the end of the pipline. Append
".json" to the outlet URL. For example:

If you do the following request:

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


Examples
---------

### A Full Pipeline

```shell
cat some_file.txt | curl -F 'input=<-' \
"http://opener.olery.com/language-identifier\
?callbacks\[\]=http://opener.olery.com/tokenizer\
&callbacks\[\]=http://opener.olery.com/pos-tagger\
&callbacks\[\]=http://opener.olery.com/constituent-parser\
&callbacks\[\]=http://opener.olery.com/ner\
&callbacks\[\]=http://opener.olery.com/ned\
&callbacks\[\]=http://opener.olery.com/coreference\
&callbacks\[\]=http://opener.olery.com/property-tagger\
&callbacks\[\]=http://opener.olery.com/polarity-tagger\
&callbacks\[\]=http://opener.olery.com/opinion-detector\
&callbacks\[\]=http://opener.olery.com/outlet"
```

### Rule based opinion detection

The opinion-detector endpoint is based on machine learning. The
opinion-detector-basic however is rule base. Feel free to swap the one for the
other.

to do so use:

```
&callbacks\[\]=http://opener.olery.com/opinion-detector-basic\
```

instead of

```
&callbacks\[\]=http://opener.olery.com/opinion-detector\
```

### You can aggregate sentiment scores using the scorer

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

### Use the tree tagger instead of the pos-tagger

```
&callbacks\[\]=http://opener.olery.com/tree-tagger\
```

Beware: the tree tagger is considerably slower and less stable than the standard
pos-tagger. If after ± 10 seconds your document is not ready yet, it probably
failed.

## List of services with their endpoints

| Service                | Endpoint                                       | Languages              |
| -------                | --------                                       | ---------              |
| language-identifier    | http://opener.olery.com/language-identifier    | a lot                  |
| tokenizer              | http://opener.olery.com/tokenizer              | en, nl, de, es, it, fr |
| pos-tagger             | http://opener.olery.com/pos-tagger             | en, nl, de, es, it, fr |
| tree-tagger            | http://opener.olery.com/tree-tagger            | en, nl, de, es, it, fr |
| constituent-parser     | http://opener.olery.com/constituent-parser     | en, es, fr, it         |
| ner                    | http://opener.olery.com/ner                    | en, nl, de, es, it, fr |
| ned                    | http://opener.olery.com/ned                    | en, nl, de, es, it, fr |
| coreference            | http://opener.olery.com/coreference            | de, en, es, fr, it, nl |
| polarity-tagger        | http://opener.olery.com/polarity-tagger        | en, nl, de, es, it, fr |
| property-tagger        | http://opener.olery.com/property-tagger        | en, nl, de, es, it, fr |
| opinion-detector       | http://opener.olery.com/opinion-detector       | en, nl, de, es, it, fr |
| opinion-detector-basic | http://opener.olery.com/opinion-detector-basic | en, nl, de, es, it, fr |
| kaf2json               | http://opener.olery.com/kaf2json               | n.a.                   |
| outlet                 | http://opener.olery.com/outlet                 | n.a.                   |
| scorer                 | http://opener.olery.com/scorer                 | n.a.                   |


