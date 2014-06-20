---
layout: default
title: Domain Adaption
sidebar: getting_started
---

# How to: Domain Adaption

## Aim: Adding a new Domain 

###The machine-learning approach

Fine-tuning the tools and pipeline in order to able to perform a opinion mining and named entity analysis on a new domain using trained modules. The following steps need to be done:

+ Collect texts from the domain
+ Send the text through the OpeNER pipeline 
+ Create an annotated corpus
+ Prepare the domain specific resources required. For the opinion miner, domain specific lexicons can be automatically built using our toolkit (https://github.com/opener-project/domain-adaptation-tool)
+ Train the model for opinion detection. Instructions about how to train your own models and select the features can be found at https://github.com/opener-project/opinion_miner_deluxe
+	Train the model for named entity detection

## Needed components

+ Domain texts 
+ Annotation guidelines
+ Tools to train the opinion identification model
+ Tools to train the named entity recognition model
+ General sentiment lexicon or tools to generate one
+ Domain-specific lexicon or tools to generate one 


## Collect texts from the domain
+ Domain texts are texts
  + about a specific topic such a product, a person, a company,  a political issue, etc. 
  + within a specific domain such as such as tourism, sports, politics, etc.
  + such as customer reviews, blog posts, news articles, facebook messages, etc. 
+ These texts can scraped from internet or collected from any other source. 

## Send the texts through the OpeNER pipeline
The texts must be automatically enriched with linguistic annotations such as lemma, part-of-speech, parse tree, etc. This can be done by sending the text through the OpeNER pipeline either using the webservices (http://www.opener-project.eu/webservices/) or by using a local installation (http://www.opener-project.eu/getting-started/how-to/local-installation.html). 
The following components should be included: 
+ Language detection (http://www.opener-project.eu/getting-started/#language-detection)
+ Tokenisation
+ Part-of-speech tagger
+ Polarity tagger
+ Property tagger
+ Constituency parser

Information about all these tools can be found at http://www.opener-project.eu/getting-started

## Create an annotated corpus
A corpus, i.e a representative selection of the domain texts,  must be annotated for the training of the models. The corpus consists of opinion annotations for the training of the model for the identification of opinions and of named entity annotations for the training of the model for the identification of named entities. 
+ Compose a corpus by selecting a small and representative part of the domain texts for annotations. The OpeNER deliverable D5.42 describes how this is done for the touristic domain (hotel reviews and attraction reviews) and the domain of political news.
+ Annotate the corpus with opinion annotations. D5.42  provides guidelines for such annotations in the tourist domain and in the domain of political news. These guidelines can be adapted for the annotations of other domains. 
+ Annotate the corpus with named entities annotations.  D3.52 provides guidelines for such annotations in the tourist domain. These guidelines can be adapted for the annotations of other domains.

## Train the model for opinion detection
+ The model for opinion detection must be trained with the data from the annotated corpus (see detailed instructions at https://github.com/opener-project/opinion_miner_deluxe)

## Train the model for named entity detection
+ The model for named entity detection must be trained with the data from the annotated corpus (cf. http://www.opener-project.eu/documentation/domain-adaptation-toolkit.html) 

## Choose or generate Sentiment Lexicons
The opinion identification tools make use of a general sentiment and domain-specific sentiment lexicons. The first one covers opinionated words used across all domains, the second one covers the domain-specific items.  
### General sentiment lexicons
+ General sentiment lexicons are available for the 6 OpeNER languages (cf. https://github.com/opener-project/sentiment-lexicons/tree/master/propagation_lexicons). General sentiment lexicons for new languages can be built using the propagation toolkit (cf. https://github.com/opener-project/VU-lexicon-propagation_kernel)

### Domain-specific sentiment lexicons
+ To generate a domain lexicon from domain texts, use https://github.com/opener-project/opinion-domain-lexicon-acquisition#unsupervised-acquisition). 
+ The following tools can be used when texts with customer ratings are available (cf.  https://github.com/opener-project/opinion-domain-lexicon-acquisition#unsupervised-acquisition-from-reviews-with-star-ratings). 

