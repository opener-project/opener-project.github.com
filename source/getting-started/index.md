---
layout: default
title: Getting Started
sidebar: getting_started
---

<div id="introduction"></div>

# Getting Started

- [What is OpeNER](#what-is-opener)
- [Quick Start Guide](#quick-start-guide)
- [OpeNER NLP chain schema](#opener-nlp-chain-schema)
- [What technology is used](#what-technology-is-used)
- [Main functionality](#core-components)
    - [Language Detection](#language-detection)
    - [Tokenization](#tokenization)
    - [Part of Speech Tagging](#part-of-speech-tagging)
    - [Named Entity Resolution](#named-entity-resolution)
    - [Polarity Tagging](#polarity-tagging)
    - [Opinion Detection](#opinion-detection)

<div id="what-is-opener"></div>

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

<div id="quick-start-guide"></div>

## Quick Start Guide

Checkout the [Quick start guide](/getting-started/how-to/quick-start.html) to get going right away.

<div id="opener-nlp-chain-schema"></div>

## OpeNER NLP Schema

In the following schema, there is the main schema of the work flow in OpeNER. This work flow could be seen as a processing chain for each language in OpeNER. The input regarding this schema is prepared to be raw text and the output of all the modules will be KAF.

![altTitle](/images/opeNERschema.png)

<div id="what-technology-is-used"></div>

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

For example, checkout the usage and installation instructions of the [Dutch
Polarity tagger](/documentation/pol-tagger.html).

<div id="core-technology"></div>

## Main Functionality

<div id="language-detection"></div>

### Language Detection

This component is the responsible of detecting the language of an input document and delivers it to the correct language pipeline. If the language detector detects that a text is in English the input text should send the text flow to the English pipeline and so forth.

#### Technical characteristics
This language identification is based on the Mike Schilli's perl Text::Language::Guess language guessing CPAN library. Its implementation is simple: Using Text::ExtractWords and Lingua::StopWords from CPAN, it determines how many of the known stopwords the document contains for each language supported are supported in Lingua::StopWords. The choose of this method is a choice between different existing components but prioritizing the response time.
This component has these requisites:

    input: text file
    output: language detected
    programing language: perl
    prerequisites: Perl: Text/ExtractWords.pm, please refer to

    https://github.com/gitpan/Text-ExtractWords and read the readme there so see how to install there.


The installation and usage of this component follows the common installation instructions explained in the Github component README.md file which can be found **[here]** (https://github.com/opener-project/language-identifier)

An example of the expected input and output is as follows:


    $ echo "this is an english text" | language-identifier

    and the response is

    en

There is also the posibility of obtaining KAF as an output or an extended version of the language-identifier covering more languages than the ones in OpeNER. Finally, there is also the posibility of creating a server out of the language identification.

<div id="tokenization"></div>

### Tokenization

This component is the responsible of tokenizing the text in two levels, in sentence level and in word level. This component is crucial to the correct working of the rest of NLP components.  This components is the first one of each language processing chain.

####Technical characteristics

These components are the majority, except for French, based on Apache OpeNLP component and contain two modules for sentence and token segmentation respectively. The components based on Apache OpeNLP are identically the same except for the models which depend on the languages and are trained according to the linguistic features of each language.
For the French, the component is based on a statistic method with a rules data file that helps the tokenization of tokens and sentences.
This component has these requisites:

    input: text file
    output: KAF file with the text layer filled with the tokens appearing in the document and the sentence they belong to.
    language: java /perl (French)
    prerequisites:  Java 6, Apache Maven3, Ruby, RubyGems and of course git itself, Apache OpenNLP, specific language model, perl


The installation and usage of this component follows the common installation instructions explained in the Github component README.md file which can be found **[here]** (https://github.com/opener-project/tokenizer)


An example of the expected input and output is as follows:

    $ echo "this is an english text" | tokenizer -l en

    and the response is

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <KAF xml:lang="fr" version="v1.opener">
      <kafHeader>
       <fileDesc />
       <linguisticProcessors layer="text">
         <lp name="openlp-fr-tok" version="1.0" timestamp="2013-06-14T10:41:08Z"/>
       </linguisticProcessors>
      </kafHeader>
      <text>
        <wf wid="w1" sent="1" para="1" offset="0">This</wf>
        <wf wid="w2" sent="1" para="1" offset="5">is</wf>
        <wf wid="w3" sent="1" para="1" offset="8">just</wf>
        <wf wid="w4" sent="1" para="1" offset="13">an</wf>
        <wf wid="w5" sent="1" para="1" offset="16">example</wf>
        <wf wid="w6" sent="1" para="1" offset="23">,</wf>
        <wf wid="w7" sent="1" para="1" offset="25">of</wf>
        <wf wid="w8" sent="1" para="1" offset="28">how</wf>
        <wf wid="w9" sent="1" para="1" offset="32">we</wf>
        <wf wid="w10" sent="1" para="1" offset="35">tokenize</wf>
        <wf wid="w11" sent="1" para="1" offset="43">.</wf>
        <wf wid="w12" sent="2" para="1" offset="45">Bye</wf>
        <wf wid="w13" sent="2" para="1" offset="48">,</wf>
        <wf wid="w14" sent="2" para="1" offset="50">bye</wf>
      </text>
    </KAF>




<div id="part-of-speech-tagging"></div>

### Part of Speech Tagging

This component is the responsible of assigning each token its morphological label. This component is crucial to the correct working of the rest of NLP components. This component also includes the lemmatization of the words.

#### Technical characteristics

This component is based on Apache OpeNLP component and contains one module that relates a word with its part of speech given a context. The component is the same for all the languages in the consortium, the only differences are the models which depend on the languages (are trained according to the linguistic features of each language) and the lemmatizers. Lemmatization is dictionary-based. To perform English lemmatization the module uses three different methods for English and two for Spanish:


English has two possible lemmatizers. One is based on WordNet-3.0 and the other is based on pain text dictionary (en-lemmas.dict is a "Word POStag lemma" dictionary in plain text to perform lemmatization).
Also, there is Morfologik-stemming: english.dict is the same as en-lemmas.dict but binarized as a finite state automata using the morfologik-stemming project (see NOTICE file for details) This method uses 10% of RAM with
respect to the plain text dictionary and works 2x faster.

Spanish has a plain text dictionary: es-lemmas.dict and it uses the Morfologik stemming: spanish.dict.
For the rest of the languages they also include a file inside the repository which lemmatizes the output and maps a form to a lemma.


This component has these requisites:

    input: KAF file with the text layer filled with the tokens appearing in the document and the sentence they belong to.
    output: The input KAF file with the  terms layer coded with the part-of-speech and its relative lemma.
    language: java
    prerequisites: Java 6, Apache Maven3, Ruby, RubyGems and of course git itself, Apache OpenNLP, specific language models



The installation and usage of this component follows the common installation instructions explained in the Github component README.md file which can be found **[here]** (https://github.com/opener-project/pos-tagger)


An example of the expected input and output is as follows:

    $ echo
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <KAF xml:lang="fr" version="v1.opener">
      <kafHeader>
       <fileDesc />
       <linguisticProcessors layer="text">
         <lp name="openlp-fr-tok" version="1.0" timestamp="2013-06-14T10:41:08Z"/>
       </linguisticProcessors>
      </kafHeader>
      <text>
        <wf wid="w1" sent="1" para="1" offset="0">This</wf>
        <wf wid="w2" sent="1" para="1" offset="5">is</wf>
        <wf wid="w3" sent="1" para="1" offset="8">just</wf>
        <wf wid="w4" sent="1" para="1" offset="13">an</wf>
        <wf wid="w5" sent="1" para="1" offset="16">example</wf>
        <wf wid="w6" sent="1" para="1" offset="23">,</wf>
        <wf wid="w7" sent="1" para="1" offset="25">of</wf>
        <wf wid="w8" sent="1" para="1" offset="28">how</wf>
        <wf wid="w9" sent="1" para="1" offset="32">we</wf>
        <wf wid="w10" sent="1" para="1" offset="35">tokenize</wf>
        <wf wid="w11" sent="1" para="1" offset="43">.</wf>
        <wf wid="w12" sent="2" para="1" offset="45">Bye</wf>
        <wf wid="w13" sent="2" para="1" offset="48">,</wf>
        <wf wid="w14" sent="2" para="1" offset="50">bye</wf>
      </text>
    </KAF>

     | pos-tagger -l en

    and the response is
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <KAF xml:lang="fr" version="v1.opener">
      <kafHeader>
      <fileDesc />
      <linguisticProcessors layer="text">
         <lp name="openlp-fr-tok" version="1.0" timestamp="2013-06-14T10:41:08Z"/>
      </linguisticProcessors>
      <linguisticProcessors layer="terms">
         <lp name="ehu-pos-en" timestamp="2013-06-165T13:13:30+0200" version="1.0" />
      </linguisticProcessors>
      </kafHeader>
      <text>
        <wf wid="w1" sent="1" para="1" offset="0">This</wf>
        <wf wid="w2" sent="1" para="1" offset="5">is</wf>
        <wf wid="w3" sent="1" para="1" offset="8">just</wf>
        <wf wid="w4" sent="1" para="1" offset="13">an</wf>
        <wf wid="w5" sent="1" para="1" offset="16">example</wf>
        <wf wid="w6" sent="1" para="1" offset="23">,</wf>
        <wf wid="w7" sent="1" para="1" offset="25">of</wf>
        <wf wid="w8" sent="1" para="1" offset="28">how</wf>
        <wf wid="w9" sent="1" para="1" offset="32">we</wf>
        <wf wid="w10" sent="1" para="1" offset="35">tokenize</wf>
        <wf wid="w11" sent="1" para="1" offset="43">.</wf>
        <wf wid="w12" sent="2" para="1" offset="45">Bye</wf>
        <wf wid="w13" sent="2" para="1" offset="48">,</wf>
        <wf wid="w14" sent="2" para="1" offset="50">bye</wf>
      </text>
    <terms>
    <term tid="t1" pos="D" morphofeat="DT" lemma="this" type="close">
      <span>
        <!--This-->
        <target id="w1" />
      </span>
    </term>
    <term tid="t2" pos="V" morphofeat="VBZ" lemma="be" type="open">
      <span>
        <!--is-->
        <target id="w2" />
      </span>
    </term>
    <term tid="t3" pos="A" morphofeat="RB" lemma="just" type="open">
      <span>
        <!--just-->
        <target id="w3" />
      </span>
    </term>
    <term tid="t4" pos="D" morphofeat="DT" lemma="a" type="close">
      <span>
        <!--an-->
        <target id="w4" />
      </span>
    </term>
    <term tid="t5" pos="N" morphofeat="NN" lemma="example" type="open">
      <span>
        <!--example-->
        <target id="w5" />
      </span>
    </term>
    <term tid="t6" pos="O" morphofeat="," lemma="," type="close">
      <span>
        <!--,-->
        <target id="w6" />
      </span>
    </term>
    <term tid="t7" pos="P" morphofeat="IN" lemma="of" type="close">
      <span>
        <!--of-->
        <target id="w7" />
      </span>
    </term>
    <term tid="t8" pos="O" morphofeat="WRB" lemma="how" type="close">
      <span>
        <!--how-->
        <target id="w8" />
      </span>
    </term>
    <term tid="t9" pos="Q" morphofeat="PRP" lemma="we" type="close">
      <span>
        <!--we-->
        <target id="w9" />
      </span>
    </term>
    <term tid="t10" pos="V" morphofeat="VBP" lemma="tokenize" type="open">
      <span>
        <!--tokenize-->
        <target id="w10" />
      </span>
    </term>
    <term tid="t11" pos="O" morphofeat="." lemma="." type="close">
      <span>
        <!--.-->
        <target id="w11" />
      </span>
    </term>
    <term tid="t12" pos="R" morphofeat="NNP" lemma="Bye" type="close">
      <span>
        <!--Bye-->
        <target id="w12" />
      </span>
    </term>
    <term tid="t13" pos="O" morphofeat="," lemma="," type="close">
      <span>
        <!--,-->
        <target id="w13" />
      </span>
    </term>
    <term tid="t14" pos="N" morphofeat="NN" lemma="bye" type="open">
      <span>
        <!--bye-->
        <target id="w14" />
      </span>
    </term>
    </terms>
    <entities />
    </KAF>



<div id="named-entity-resolution"></div>

### Named Entity Resolution

Named Entity Resolution consists of processing named entities in text. The overall objective is
to be able to **recognize, classify and link every mention of a specific named entity** in a text.
By Named Entity we usually mean a proper name of a person, a place, an organization, etc.

A named entity can be mentioned using a great variety of surface forms (Barack Obama,
President Obama, Mr. Obama, B. Obama, etc.) and the same surface form can refer to a variety of
named entities which make them ambiguous. For example, the form 'san juan' can be used to
ambiguously refer to dozens of toponyms, persons, a saint, etc. (e.g, see http://en.wikipedia.org/wiki/San_Juan).

Furthermore, it is possible to refer to a named-entity by means of anaphoric pronouns and
co-referent expressions such as 'he', 'her', 'their', 'I', 'the 35 year old', etc.
Therefore, in order to provide an adequate an comprehensive account of named-entities entities in text
it is needed to recognize the mention of a named-entity, to classify it as a type (e.g, person, location, etc.),
to disambiguate it to a specific entity, and to resolve every form of mentioning or co-referring to the same
entity in a text. In summary, to perform **Named Entity Resolution**.  With the aim of making this problem more manageable,
several Natural Language Processing tasks have been distinguished:
Named Entity Recognition and Classification (NERC), Coreference resolution and Named Entity  Disambiguation (NED).


#### Named Entity Recognition and Classification (NERC):

Generally, since MUC and CONLL (http://www.cnts.ua.ac.be/conll2003/ner/) shared tasks, NERC uses manually
annotated data which serves to train machine learning models in a supervised manner. More recent trends aim
at building automatic silver-standard and gold-standard datasets from existing large knowledge resources
such as Wikipedia (Mika et al. 2008; Nothman et al. 2012) to avoid the reliance on hand-generated data for training.

NER taggers recognized a variety of Named Entity types, namely, references to PERSON, LOCATION, ORGANIZATION
and MISCELLANEOUS, although in principle, given the appropriated annotated data, any type of Named Entity can be
recognized. In this sense, OpeNER will, during its second year of development, be looking at recognizing and
classifying Named Entity types releated with the Tourist domain such as restaurants, hotels, and perhaps monuments,
theatres, etc.

The NERC components included in OpeNER for the first year take an input text (from KAF word forms) and recognizes and
classifies Named Entities according to the 4 entity types of CoNLL, namely, location, organization, person and miscellaneous,
creating new KAF element for each entity in this manner:

    <entity eid="e9" type="organization">
      <references>
        <span>
          <!--UN Office -->
          <target id="t276" />
          <target id="t277" />
        </span>
      </references>
    </entity>
    <entity eid="e13" type="location">
      <references>
        <!--Herat-->
        <span>
          <target id="t349" />
        </span>
      </references>
    </entity>


#### Named Entity Disambiguation (NED):

Named Entity Recognition and Classification (NERC) deals with the detection and identification of specific
entities in running text. Once the named entities are recognised they can be identified or disambiguated with
respect to an existing catalogue. This is required because the "surface form" of a Named Entity can actually refer
to several real things in the world. Wikipedia has become the de facto standard as such a named entity catalogue. Thus,
if the form 'San Juan' appears in a given document, the NED task consist of deciding to which of the "San Juan" things
listed in Wikipedia is actually the "San Juan" source form in that document referring to
(e.g, see http://en.wikipedia.org/wiki/San_Juan).

In OpeNER the NED component is based on the DBpedia Spotlight (http://https://github.com/dbpedia-spotlight/dbpedia-spotlight/wiki)
which uses the DBpedia (http://dbpedia.org) as the catalogue to perform the disambiguation. Within the OpeNER project new NED tools
have been developed for each of the languages based on the English DBpedia Spotlight.

The NED component will take every entity recognized by the NERC component and try to decide to
which actual thing is referring to. For example, it will take a entity such as

    <entity eid="e13" type="location">
      <references>
        <!--Herat-->
        <span>
          <target id="t349" />
        </span>
      </references>
      <externalReferences>
        <externalRef resource="spotlight_v1" reference="http://dbpedia.org/resource/Herat_Province" />
      </externalReferences>
    </entity>


and produce a new external reference to (hopefully) point out to the actual thing in the DBpedia to which the "Herat" entity
is actually referring to:

    <entity eid="e13" type="location">
      <references>
        <!--Herat-->
        <span>
          <target id="t349" />
        </span>
      </references>
      <externalReferences>
        <externalRef resource="spotlight_v1" reference="http://dbpedia.org/resource/Herat_Province" />
      </externalReferences>
    </entity>


The NED components in OpeNER are currently running on default paramenters as set by the DBpedia Spotlight, so improvement
is definitely needed. Furthermore, during the second year of the project a catalogue containing articles about Tourist related
Named Entities is needed in order to perform disambiguation for names of hotels, restaurants, etc.

#### Coreference Resolution:

Coreference resolution aims at grouping together all the mentions in the text to a Named Entity. For example, a person can
be referred to by using her proper name, Claudia Lawrence, or by other types of expressions, such as "her", "she", "the 35-year-old",
"Peter Lawrence's daughter", "the university chef", etc. Coreference resolution will aim at linking together or "clustering"
every mention to a given Named Entity. This is useful, for example, if we really want to know who is talking about what. In the
Tourist Domain, it is hoped that the coreference resolution will help to clarify who says an opinion about which hotel, for example.

The Coreference component developed for OpeNER is an implementation of the Multi-Sieve Pass system for
originally proposed by the Stanford NLP Group (Raghunathan et al., 2010; Lee et al., 2011) and (Lee et al., 2013).
This system proposes a number of deterministic passes, ranging from high precision to higher recall,
each dealing with a different manner in which coreference manifests itself in running text.

In order to facilitate the integration of the coreference system for the 6 languages of OpeNER we have included here 4 sieves:
Exact String Matching, Precise Constructs, Strict Head Match and Pronoun Match (the sieve nomenclature follows Lee et al (2013)).

The coreference component requires two main requisites, external to the component itself, to work:

    1. A constituent parsing tree with head words marked. This is a syntactic tree with a mark for the head word for each of
       the nodes of the tree.
    2. A number of dictionaries and static lists which provide genre, number and animacy information which is used to assign
       attributes to the mentions to be clustered.

Constituent parser are usually probabilistic: they used hand-annotated built datasets (called treebanks) to train machine learning
models in a supervised manner. The OpeNER pipeline provides such a constituent parser for each of the languages of the project.

The Coreference component reads text from KAF (including words, part of speech information, named entities recognized) and the
syntactic tree and provides "clusters" or "groups" of mentions that the system guesses actually refer to a given entity. For example,
take the following text:

    "John is a musician. He played a new song. A girl was listening to the song. "It is my favorite," John said to her."

The OpeNER coreference component creates three clusters: the first groups the John-related mentions, the second one the "the song"
mentions and the third one the "a girl" mentions.

    <coreferences>
    <coref coid="co1">
      <!--John-->
      <span>
        <target id="t1"/>
      </span>
      <!--John-->
      <span>
        <target id="t27"/>
      </span>
      <!--a musician-->
      <span>
        <target id="t3"/>
        <target id="t4"/>
      </span>
      <!--He-->
      <span>
        <target id="t6"/>
      </span>
    </coref>
    <coref coid="co2">
      <!--a new song-->
      <span>
        <target id="t8"/>
        <target id="t9"/>
        <target id="t10"/>
      </span>
      <!--the song-->
      <span>
        <target id="t17"/>
        <target id="t18"/>
      </span>
      <!--It-->
      <span>
        <target id="t21"/>
      </span>
      <!--my favorite-->
      <span>
        <target id="t23"/>
        <target id="t24"/>
      </span>
    </coref>
    <coref coid="co3">
      <!--A girl-->
      <span>
        <target id="t12"/>
        <target id="t13"/>
      </span>
      <!--my-->
      <span>
        <target id="t23"/>
      </span>
      <!--her-->
      <span>
        <target id="t30"/>
      </span>
    </coref>
    </coreferences>

The OpeNER coreference component is rule-based so this means that its adaptation for using it in the Tourist Domain
will most likely consist of adding new specific sieves to that domain.

<div id="polarity-tagging"></div>

### Polarity tagging

The polarity tagging is a task by means which terms in a text are tagged with their correct polarity and sentiment modifier label.

Words with polarity are words that express a negative or positive opinion, belief, attitude, etc. towards a certain topic. In our case polarity refers to out of context or "prior" polarity,
i.e. to words which  evoke something positive or negative independent from the context in which they are found.  Polarity words can be nouns, verbs, adjectives and adverbs. The following examples contain negative polarity lemma's like ruin, debt,
problem and complaint and positive polarity lemma's like pleasant, enjoy
and delicious:

+ Look, it seriously *ruined* our trip to Athens ...
+ In 2004 the president said that he felt that the *debt* was an enormous *problem*
+ The stay was very **pleasant** and I have no *complaint* whatsoever
+ We really **enjoyed** the **delicious** food

Sentiment modifiers are words that change or modify in certain way the polarity of a word or expression. We differenciate three subtypes of sentiment modifiers: intensifiers, weakeners and polarity shifters.
Intensifiers (enormous, seriouly) and weakeners (relatively) are words that
intensify or weaken the strength of an expression or polarity word. Polarity shifters (not, no, never) are negations which shift the polarity of an opinion word from positive to negative or vice versa. Here some examples are shown in italics:
+ In 2004 the president said that he felt that the debt was an *enormous* problem
+ Look, it *seriously* ruined our trip to Athens ...
+ The standard room was *relatively* large
+ The hotel's location was *not* a very interesting part of town
+ The stay was very pleasant and I have *no* complaint whatsoever
+ Will *never* return.

<div id="opinion-detection"></div>

### Opinion detection

The opinion detection is concerned with the identification of opinions in a text at the expression level. This task has received a lot of interesest in last period because of the explosion of the social networks. More and more companies
use social networks to promote and offer their products, and they receive a lot of feedback from their customers as well. Considering the thousands of reactions that the people generates every on Social Networks, automatic analysis techniques
become more and more interesting for extracting automatically opinions from this data.

In our case, we deal with fine-grained opinion extraction. This is not only about deciding if a text is in general expressing a positive or negative opinion, but detecting and extracting single opinions and the entities that build these opinions:
+ Opinion expression: expressions that indicate emotions, sentiments, opinions or other private states
+ Opinion holder: mentions of whom is the opinion from
+ Opinion target: expressions that indicate what the opinion is about

For instance consider the sentence "I like the design of Ipod video". These are the elements of the opinion extracted from it:
+ Opinion expression: like
+ Opinion holder: I
+ Opinion target: the design of Ipod video

<div id="where-to-go-from-here"></div>

## Where to go from here?

We prepared several example scenarios that explain how and for which
applications you can use OpeNER technology. You can find them listed under the
[scenarios section](/getting-started/secenarios) on the left.

Besided the usage scenarios there are also a set of how-to guides available,
check those out in the [how to section](/getting-started/how-to/).

