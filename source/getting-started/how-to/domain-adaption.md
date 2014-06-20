---
layout: default
title: Domain Adaption
sidebar: getting_started
---

# How to: Domain Adaption

## Aim: Adding a new Domain (DELUXE)

Fine-tuning the tools and pipeline in order to able to perform a opinion mining and named entity analysis on a new domain using trained modules. The following steps need to be done:

+ Collect texts from the domain
+ Send the text through the OpeNER pipeline 
+ Create an annotated corpus
+ Train the model for opinion detection
+	Train the model for named entity detection
+ Choose or generate sentiment lexicons
+ Run ... HOW??RUBEN??

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


### collect texts (cf. x for corpus composition)
+ domain adaptation starts with the collection of domain-specific texts
+ these texts can scraped from internet or collected from any other source
+ facebook texts can scraped using .... REF????

### create an annotated corpus
+ Select a small and representative part of the domain texts. The OpeNER  deliverable D5.42 describes how this is done for the touristic domain (hotel reviews and attraction reviews) and the domain of political news.
+ Annotate the corpus following guidelines for the annotation of opinions (cf. OpeNER deliverable D5.42 Annex I and II) adaptation starts with the collection of domain-specific texts
+ these texts can scraped from internet or collected from any other source
+ facebook texts can scraped using .... REF????

###general language lexicons
a generic sentiment lexicons for the OpeNER languages can be found here (REF)
tools to generate generic sentiment lexicons can be found here (REF)

###toolkit to train the domain model for opinion mining
with the annotatated corpus the domain model can be trained (http://www.opener-project.eu/documentation/domain-adaptation-toolkit.html)
Please elaborate...
###toolkit to train  a model for NER

Please elaborate...

###webservices / pipeline components

Please elaborate...

## Preparations

Please elaborate...

### make annotated corpus

Please elaborate...

### collect texts (cf. x for corpus composition)

Please elaborate...

### use the annotation guideline

Please elaborate...

## Generate a domain-specific lexicon

Please elaborate...


### Collect texts

Please elaborate...

### Use toolkit for generation of domain lexicons

Please elaborate...


## Train a model 

Please elaborate...


###Convert annotations to KAF/NAF

Please elaborate...


## Procedures

e.g. see scenario I or II or III

## Notes/Tips/Variations

e.g. item x, y, z are optional
