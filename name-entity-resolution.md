---
layout: page
title: "Named Entity Resolution Tools"
tagline: Who and about What
description: "Named Entity Recognition, Coreference and Disambiguation"
tags: [Named Entity Recognition, Coreference Resolution, Named Entity Disambiguation]
---
{% include JB/setup %}

This page describes the necessary the components developed in OpeNER for Named Entity Resolution
within the OpeNER 7th Framework European project (http://opener-project.org) for the six languages
of the project: Dutch, French, German, Italian, English and Spanish.

## Named Entity Resolution

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


### Named Entity Recognition and Classification (NERC):

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


### Named Entity Disambiguation (NED):

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

### Coreference Resolution:

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

#### Contact information

    Rodrigo Agerri
    rodrigo.agerri@ehu.es
    IXA NLP Group
    University of the Basque Country (UPV/EHU)
    E-20018 Donostia-San Sebastián

