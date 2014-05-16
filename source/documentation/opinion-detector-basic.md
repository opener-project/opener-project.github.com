---
layout: default
title: Opinion Detector Basic
sidebar: documentation
webservice: http://opener.olery.com/opinion-detector-basic

---



<div id='readme'></div>

Opinion Detector Basic
======================

This module implements a opinion detector for English (also works for Dutch and
German). The language is determined by the "xml:lang" attribut in the input KAF
file. Depending on the value of this attribute, the corresponding lexicon will
be loaded. This module detects three elements of the opinions:

* Expression: the actual opinion expression
* Target: about what is the previous expression
* Holder: who is stating that expression

Requirements
-----------
* VUKafParserPy: parser in python for KAF files
* lxml: library for processing xml in python

Usage
----

The input KAF file has to be annotated with at least the term layer, with
polarity information.  Correct input files for this module are the output KAF
files from the polarity tagger module

To tag an input KAF file example.kaf with opinions you can run:

    $ cat example.with.polaritieskaf | core/opinion_detector_basic_multi.py > output.with.opinions.kaf

The output will the input KAF file extended with the opinion layer.

