# Opener Webservices Quick Start with CURL

You can try the webservices using the popular command line tool CURL.
For the best result, put your text in a textfile, for the example called
```some_file.txt``` and then pass it through the webservices like this:


```shell
cat some_file.txt | \
curl -F 'input=<-' "http://opener.olery.com/language-identifier" | \
curl -F 'input=<-' "http://opener.olery.com/tokenizer" | \
curl -F 'input=<-' "http://opener.olery.com/pos-tagger"
```

The trick here is to use curls ```-F``` option with ```input=<-``` as argument.
The ```<-``` in this case means it reads from STDIN and posts it to the
webservices.

An alternative way is to use ```-F 'input=<some_file.txt'```. Both options read
the textfile and put them through the webservices.


Examples
---------

### A Full Pipeline

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

### Rule based opinion detection

The opinion-detector endpoint is based on machine learning. The
opinion-detector-basic however is rule base. Feel free to swap the one for the
other.

to do so use:

```
curl -F 'input=<-' "http://opener.olery.com/opinion-detector-basic"
```

instead of

```
curl -F 'input=<-' "http://opener.olery.com/opinion-detector"
```


### Use the tree tagger instead of the pos-tagger

```
curl -F 'input=<-' "http://opener.olery.com/tree-tagger"
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


