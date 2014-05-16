---
layout: default
title: Property Tagger
sidebar: documentation
webservice: http://opener.olery.com/property-tagger

---



<div id='readme'></div>

#property-tagger#

#Introduction#

This module implements a tagger for hotel properties for Dutch, English, French, Italian, Spanish and German. It detects aspect words,
for instance words related with "room", "cleanliness", "staff" or "breakfast" and links them with the correct aspect class.
The input for this module has to be a valid KAF file with at lest the term layer, as the lemmas will be used for detecting the hotel properties. The output is also
a KAF valid file extended with the property layer. This module works for all the languages within the OpeNER project (en,de,nl,fr,es,it) and the language is read from
the input KAF file, from the lang attribute of the KAF element  (make suresure your preprocessors set properly this value or you might use the resources for a wrong language)
````shell
<KAF xml:lang="( en | nl | fr | it | de | es)">
````

#Requirements#
* VUKafParserPy: parser in python for KAF files (https://github.com/opener-project/VU-kaf-parser)
* lxml: library for processing xml in python



#How to run the module with Python#
You can run this module from the command line using Python. The main script is core/hotel_property_tagger_nl_en.py. This reads
and writes the output to the standard output, generating some log information in the standard error output. To process the file
"input.kaf" just type:
````shell
cat input.kaf | core/hotel_property_tagger_nl_en.py > output.kaf
````

This will read the KAF file in "input.kaf" and will store the constituent trees in "input.tree".

The options of the program can be obtained calling to the program with the parameter -h:
````shell
core/hotel_property_tagger_nl_en.py -h
usage: hotel_property_tagger_nl_en.py [-h] [--no-time] [--lexicon LEXICON]

Tags a text with polarities at lemma level

optional arguments:
  -h, --help         show this help message and exit
  --no-time          For not including timestamp in header
  --lexicon LEXICON  Force to use this lexicon
````

The most important option is the --lexicon, which allows you to use your own lexicon with the program. The lexicon must be stored in a file and follow this format:
````shell
surf	verb	facilities
surfer	noun	facilities
surfing	verb	facilities
```

So, one aspect per line, with 3 fields separated by a tabulator, the first one is the word or span of words (in this case use whitespaces), then the part
of speech (which actually it is not use, you can  include a dummy label) and finally the aspect class associated with the word. If you have created your lexicon
in one file you could call to the program in this fashion:
````shell
$ cat my_input.kaf | python core/hotel_property_tagger_nl_en.py --lexicon path/to/your/lexicon/my_lexicon.txt > my_output.kaf
````

Contact
------
* Ruben Izquierdo
* Vrije University of Amsterdam
* ruben.izquierdobevia@vu.nl

