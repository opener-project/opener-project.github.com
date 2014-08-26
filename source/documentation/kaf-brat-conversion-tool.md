---
layout: default
title: KAF/BRAT conversion tool
sidebar: documentation
webservice: 
repository: https://github.com/opener-project/brat-kaf-conversion-tools

---



<div id='readme'></div>

## Reference

This repository contains the code employed to convert OpeNER KAF files to a Brat annotation tool collection files. More details about the role this toolkit has played in the OpeNER annotation campaign can be found in the OpeNER deliverable D3.52.

Brat collections require two files per document:
  * A .txt file containing the plain text to annotate
  * A .ann file, which is a metadata file holding the annotation information generated when an annotation is added

The format of these documents is specified in the Brat annotation tool website.
Please, visit http://brat.nlplab.org/ for more information about Brat.

In OpeNER we have used the Brat version 1.3, with a minor tweak to force Brat to tag full tokens (using white spaces as the boundaries) instead of the default per-character basis.


### Command Line Interface

The code has received a CLI wrapping in order to be able of calling it from the command line.
The are two possible operations:
* convert a set of KAF documents to a Brat collection
* dump a Brat collection annotations back to enriched KAF files (i.e. the original KAF files plus the annotation information)

You need Apache Maven in your computer in order to package the code.
To execute the tool first go to the directory containing the source code and the pom.xml issue a:

```
mvn clean package
```

This will package the code into a runnable jar using maven.
Then issue the following

```
java -jar [NAME-OF-THE-JAR] KAF2BRAT -kaf DIR_WITH_KAF_FILES -brat DIR_TO_OUTPUT_BRAT_COLLECTION
```

This will read the directory indicated in the -kaf parameter and generate the corresponding Brat collection in the directory indicated with the -brat parameter.

On the other hand you can issue:

```
java -jar [NAME-OF-THE-JAR] BRAT2KAF -brat DIR_WITH_BRAT_COLLECTION -kaf DIR_WITH_ORIGINAL_KAF_FILES -output DIR_TO_WRITE_ENRICHED_KAFS
```

This command will read the Brat collection in the specified directory, together with the original kaf files in the corresponding directory (NOTE: the KAF files must be the ones used to generate the Brat collection, or at least agree in the token and term layers with them). The Brat annotation will be parsed and new enriched KAF files, including the information coming from the Brat annotation written into the corresponding layers, will be printed to the specified output location.


