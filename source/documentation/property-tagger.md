---
layout: default
title: Property Tagger
sidebar: documentation

---



<div id='readme'></div>

property-tagger
=====================================

Introduction
------------
This module implements a tagger for hotel properties for Dutch, English, French, Italian, Spanish and German, like words related with "room", "cleanliness", "staff" or "breakfast" for instance.
The input for this module has to be a valid KAF file with at lest the term layer, as the lemmas will be used for detecting the hotel properties. The output is also
a KAF valid file extended with the property layer. This module works for English and Dutch, and the language is read from the input KAF file, from the lang attribute
of the KAF element, so be sure your preprocessors set properly this value or you will get an error.
````shell
<KAF xml:lang="( en | nl | fr | it | de | es)">
````

Requirements
-----------
* VUKafParserPy: parser in python for KAF files (https://github.com/opener-project/VU-kaf-parser)
* lxml: library for processing xml in python


Installation
-----------
The installation of this module is very easy, just clone the repository to your local machine.
````shell
git clone git@github.com:opener-project/VU-hotel-property-tagger_NL_EN_kernel.git
````

How to run the module with Python
---------------------------------
You can run this module from the command line using Python. The main script is core/hotel_property_tagger_nl_en.py. This reads
and writes the output to the standard output, generating some log information in the standard error output. To process the file
"input.kaf" just type:
````shell
cat input.kaf | core/hotel_property_tagger_nl_en.py > output.kaf
````

This will read the KAF file in "input.kaf" and will store the constituent trees in "input.tree".


Contact
------
* Ruben Izquierdo
* Vrije University of Amsterdam
* ruben.izquierdobevia@vu.nl

