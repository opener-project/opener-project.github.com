---
layout: page
title: "Disambiguation Index for DBpedia Spotlight"
tagline: DBpedia Spotlight for your language
description: "Creating Lucene-based Disambiguation Index for DBpedia Spotlight"
tags: [Named Entity Disambiguation, DBpedia Spotlight, Lucene, Internationalization]
---
{% include JB/setup %}

OpeNER Internationalization of DBpedia Spotlight
================================================

.... or how to create a disambiguation index to be used by DBpedia Spotlight for your language.

This page describes the necessary steps to create a Lucene-based disambiguation index
as used by DBpedia Spotlight. This procedure has been successfully applied within the OpeNER 7th
Framework European project (http://opener-project.org) to create Named Entity Disambiguation tools
for six languages based on DBpedia Spotlight: Dutch, French, German, Italian, English and Spanish.

This procedure described is a modification of the DBpedia Spotlight Internationalization instructions
[here](https://github.com/dbpedia-spotlight/dbpedia-spotlight/wiki/Internationalization).


Summary:
--------

1. Environment preparation
2. Downloading and setting the required data
3. Setting up the config and server files
4. Building indexes
5. Preparing and running the server
6. Testing the system
7. Setting-up and running the web-based interface

Whereas most of DBpedia Spotlight works with Java 1.6, the submodule index requires Java 1.7.
We have used JDK1.7 for the entire process.

*Important*: Please, check that the encoding is always UTF-8.

### 1. Environment preparation
--------------------------

If you already have installed in your machine JDK6 and MAVEN 3, please go to step 3
directly. Otherwise, follow these steps:

## 1.1 Install JDK 1.7
-------------------

If you do not install JDK 1.7 in a default location, you will probably need to configure the PATH in .bashrc or .bash_profile:

````shell
export JAVA_HOME=/yourpath/local/java17
export PATH=${JAVA_HOME}/bin:${PATH}
````

If you use tcsh you will need to specify it in your .login as follows:

````shell
setenv JAVA_HOME /usr/java/java17
setenv PATH ${JAVA_HOME}/bin:${PATH}
````

If you re-login into your shell and run the command

````shell
java -version
````

You should now see that your jdk is 1.7

1.2 Install MAVEN 3
------------------

Download MAVEN 3 from

````shell
wget http://ftp.udc.es/apache/maven/maven-3/3.0.4/binaries/apache-maven-3.0.4-bin.tar.gz
````

Now you need to configure the PATH. For Bash Shell:

````shell
export MAVEN_HOME=/home/ragerri/local/apache-maven-3.0.4
export PATH=${MAVEN_HOME}/bin:${PATH}
````

For tcsh shell:

````shell
setenv MAVEN3_HOME ~/local/apache-maven-3.0.4
setenv PATH ${MAVEN3}/bin:{PATH}
````

If you re-login into your shell and run the command

````shell
mvn -version
````

You should see reference to the MAVEN version you have just installed plus the JDK 7 that is using.

1.3 Download and Install DBpedia Spotlight
------------------------------------------

````shell
git clone https://github.com/dbpedia-spotlight/dbpedia-spotlight.git
cd dbpedia-spotlight/
mvn install
````

2. Download Required Data
-------------------------

Rename the download file to match your language. Replace $lang with one of these
languages: de,en,es,fr,it,nl. In principle these instructions should work for all six languages
althought we will be using English as an example if we need to be specific.

````shell
mv `./dbpedia-spotlight/bin/download.sh ./dbpedia-spotlight/bin/download-$lang.sh`
````

Edit the file `download-$lang.sh` by changing the following lines:

````shell
export lang_i18n=en
export language=english
export dbpedia_workspace=../data/spotlight
export dbpedia_version=3.8
````

Where `../data/spotlight` is the place where you want to install (e.g., create indexes and other files)
the DBpedia Spotlight.

Create the DBpedia workspace directory, namely, the place where the required dumps of DBpedia and Wikipedia will be stored.
We do this inside the dbpedia-spotlight project itself:

````shell
mkdir -p ./data/spotlight
`./dbpedia-spotlight/bin/download-$lang.sh`
````

Get a stopword file from [here](http://snowball.tartarus.org/index.php): You will need to choose the stemmer for
your language and download the stopword list. For example, the English and Spanish stopword lists are here:

````shell
wget http://snowball.tartarus.org/algorithms/spanish/stop.txt
wget http://snowball.tartarus.org/algorithms/english/stop.txt
````

Copy your stop.txt list for your language to `dbpedia-spotlight/data/spotlight/dbpedia_data/data`. For example, for English:

````shell
cp stop.txt dbpedia-spotlight/data/spotlight/dbpedia_data/data/stopwords.en.list
````

Create a new file called `blackListedURIPattens.$lang.list` to put instructions (one regex pattern per line) that
will guide DBpedia Spotlight to remove pages and articles that should not be considered valid resources for annotation. For example
for English:

````shell
    ^List_of_
    .+([Dd]isambiguation)$
    ^[0-9]+$
````

Then copy the file to `dbpedia-spotlight/data/spotlight/dbpedia_data/data`:

````shell
cp blacklistedURIPatterns.en.list ../data/spotlight/dbpedia_data/data
````

*English Disclaimer*: The latest Wikipedia version does not work for creating the English disambiguation index.
 The index has been created with a Wikipedia dump from March 7, 2012.
Downloaded from: http://dumps.wikimedia.org/enwiki/20120307/ .
To keep in sync with the DBpedia Spotlight installation scripts, the downloaded page has been renamed
to enwiki-lates-pages-articles.xml

3. Modify Configuration Files
-----------------------------

First, we modify the dbpedia-spotlight/conf/indexing.properties file. Lucene information has been
taken from [here](http://lucene.apache.org/core/3_6_2/index.html).

3.1 Modify indexing.properties
------------------------------

These are the variables changed assuming English
as the running example:

````shell
org.dbpedia.spotlight.data.wikipediaDump = ../data/spotlight/dbpedia_data/original/wikipedia/en/enwiki-latest-pages-articles.xml
org.dbpedia.spotlight.index.dir =../data/spotlight/dbpedia_data/data/output/index
org.dbpedia.spotlight.data.labels =../data/spotlight/dbpedia_data/original/dbpedia/en/labels_en.nt.bz2
org.dbpedia.spotlight.data.redirects = ../data/spotlight/dbpedia_data/original/dbpedia/en/redirects_en.nt.bz2
org.dbpedia.spotlight.data.disambiguations = ../data/spotlight/dbpedia_data/original/dbpedia/en/disambiguations_en.nt.bz2
org.dbpedia.spotlight.data.instanceTypes = ../data/spotlight/dbpedia_data/original/dbpedia/en/instance_types_en.nt.bz2
org.dbpedia.spotlight.data.conceptURIs = ../data/spotlight/dbpedia_data/data/output/conceptURIs.list
org.dbpedia.spotlight.data.redirectsTC = ../data/spotlight/dbpedia_data/data/output/redirects_tc.tsv
org.dbpedia.spotlight.data.surfaceForms = ../data/spotlight/dbpedia_data/data/output/surfaceForms.tsv
org.dbpedia.spotlight.language = English
org.dbpedia.spotlight.language_i18n_code = en
org.dbpedia.spotlight.lucene.analyzer = org.apache.lucene.analysis.en.EnglishAnalyzer
org.dbpedia.spotlight.default_namespace = http://dbpedia.org/resource/
org.dbpedia.spotlight.default_ontology= http://dbpedia.org/ontology/
org.dbpedia.spotlight.data.stopWords.english = ../data/spotlight/dbpedia_data/data/stopwords.en.list
org.dbpedia.spotlight.data.badURIs.english= ../data/spotlight/dbpedia_data/data/blacklistedURIPatterns.en.list
org.dbpedia.spotlight.yahoo.language = en
org.dbpedia.spotlight.yahoo.region = en
````

3.2 Modify index.sh
-------------------

You need to provide the path to the dbpedia_data directory in the dbpedia-spotlight/bin/index.sh file.

````shell
cp ./dbpedia-spotlight/bin/index.sh ./dbpedia-spotlight/bin/index-$lang.sh
````

Edit the new file and set the following parameter:

````shell
    export DBPEDIA_WORKSPACE=../data/spotlight/dbpedia_data
````

and set the variable according to the available memory in your system (e.g. 4GB). Note that for the English
version the original 14GB value has been kept:

````shell
    JAVA_XMX=4g
````

When running the indexing of the English version, the system sometimes goes into a infinite loop.
This is due to the getEndChainUri function in the ExtractCandidateMap.scala source file.
If this happens, change the getEndChainUri function from the one contained in
index/src/main/scala/org/dbpedia/spotlight/util/ExtractCandidateMap.scala so that it looks like this:

````shell
 private def getEndOfChainUri(m : Map[String,String], k : String, c: Int) : String = {
        // get end of chain but check for redirects to itself
	// NEW
	if (c == 1000){
            return k
	}
        m.get(k) match {
            case Some(s : String) => if (s equals k) k else getEndOfChainUri(m, s, c+1)
            case None => k
        }
    }
````

As it can be seen, the function has a new variable to control the number of loops that has been done.
It has been set at 1000. This is useful when the given uri contains '. The problem is that although the values
of s and k are equal, if there is a ', the system doesn't recognise it as equal and a new recursive loop is done.

Then unzip the file `dbpedia-spotlight/data/spotlight/dbpedia_data/original/wikipedia/en/enwiki-latest-pages-articles.xml.bz2`.
Alternatively, you can specify in the `index-en.sh` and it will unzip it everytime you run the script.

If the one retrieved from March 7, 2012 has not this name, unzip it and change the name accordingly.
Next, execute the index script:

````shell
./bin/index-en.sh
````

*Note*: If you need to re-run this script, make sure to delete everything *but* the `index`
folder in `../data/spotlight/dbpedia_data/data/output/`


Contact information
===================

````shell
Rodrigo Agerri and Itziar Aldabe
{rodrigo.agerri,itziar.aldabe}@ehu.es
IXA NLP Group
University of the Basque Country (UPV/EHU)
E-20018 Donostia-San Sebastián
````
