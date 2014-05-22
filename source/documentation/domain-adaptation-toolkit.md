---
layout: default
title: Domain adaptation toolkit
sidebar: documentation
webservice: http://opener.olery.com/domain-adaptation-toolkit
repository: https://github.com/opener-project/domain-adaptation-tool

---



<div id='readme'></div>


# DOMAIN ADAPTATOR

This repository contains the source code used for performing Domanin Adaptation for the following languages:

* Dutch
* English
* German
* Italian
* Spanish
* French

We implemented a custom version of the method presented by <a href="http://delivery.acm.org/10.1145/1860000/1858710/p275-huang.pdf?ip=150.241.253.10&id=1858710&acc=OPEN&key=4D4702B0C3E38B35.4D4702B0C3E38B35.4D4702B0C3E38B35.6D218144511F3437&CFID=314915979&CFTOKEN=99523175&__acm__=1396886139_82f995a50474f2117a0cc7a7e6302132">Huang, R and & Riloff, E. (2010, July)</a>.

## Requirements

* Java 1.7 or newer

Development requirements:

* Maven

## Installation

Execute the *./INSTALL.sh* file:

        ./INSTALL.sh
        
This will install both the required custom <a href="http://www.csie.ntu.edu.tw/~cjlin/libsvm/">libSVM library</a> and the
domain adatation tool.

## Configure

In the *config* folder, there are some configuration files:

* language.conf: this file configures the languages supported by the Domain Adaptation Tool. Each line must be formatted like this:
```
        LANGUAGE=ISO_639-1_Code
```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For example:
```
        ENGLISH=en
```
* ner.conf: This file configures location ner model paths for each language. Location ner model paths are used for gazetteer feature extraction. Each line must be formatted like this:
```
        LANGUAGE=model_path
```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For example:
```
        ENGLISH=./ner_models/en-ner.bin
```
            
* np_rules.conf: This file configures NP rule paths for each language. It is not required if all features are not needed. Each line must be formatted like this:
```
        LANGUAGE=np_rule_path
```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For example:
```
        ENGLISH=./np_rules/en_np.rules
```

### NP rules
            
As previouly said, NP rules are not required if all features are not needed. For the NP rules files, NP rules are sets of PoS tags. The rules are processed in descending order, and first matching rule is choosen. For the head of each rule, put a '*' character after the PoS tag. The PoS tags are the following:

```
    N: Common noun    V: Verb
    R: Proper noun    P: Preposition
    Q: Pronoun        A: Adverb
    D: Determiner     C: Conjunction
    G: Adjective      O: Other
```

If there is more than one option for a PoS tag, put a '/' char between each PoS tag.

For example:
```
    D D N/R*
```

### Named Entity rules

At *src/main/resources/entity.rules* file, there are several rules to detect entities compound by several terms. These rules are sets of PoS rules. You can change them as you wish.

For example:
```
    R R
```
            
## Usage

To execute the Domain Adaptation Tool execute this command:

```
    java -jar target/Bootstrapping-0.0.1.jar [OPTIONS]
```
The *-h* or *--help* option will display the help information.

To classify instances there are 3 steps: parse corpus to vectors, train classifiers, and process KAF files.

### Parse corpus to vectors

Before training the classifiers, we need to parse the input corpus to vertors. For that purpose, the corpus must be at Conll format with these columns:
```
    index   word_form   lemma       pos head    ne(optional)
    
    1       El          el          D	2
    2       chico       chico       N	4
    3       fue         ser         V	4
    4       entregado   entregar    V	0
    5       al          al          P	4
    6       TAS         TAS         R	5	    ne=organization
    7       .           .           O	4
```
The ne column is only used to evaluate models at training step.

You will also need a seed file for the bootstrapping process. The seed file is a raw text file with these columns:
```
    seed    category
    
    Alaska  location
    Detroit location
    Gore    person
    McCain  person
    BMW     organization
    CDC     organization
```

Below you can see the options for the parsing step:

```
    Parse corpus in order to use SVMs
      -parse -l language -name corpusName -trainC trainCorpus
                -seeds seedFile [OPTIONS...]
      ARGUMENTS:
        -name      corpusName,       Corpus output name.
        -trainC    trainCorpus,      Train corpus, can be a file or a directory.
        -seeds     seedFile,         File with the seed-list.
      OPTIONS:
        -devC      devCorpus,        Dev corpus, can be a file or a directory.
        -testC     testCorpus,       Test corpus, can be a file or a directory.
        -window    windowSize,       Token window size for each entity,
                                     default value is '3'.
        -modSize   modifierSize,     How much modifiers will be used for NPs    
                                     default value is '5'.
        -balanced                    Uses balanced classifier training files.
                                     Without this flag each instance of each classifier
                                     is added as negative instance to the other
                                     classifiers, but with the '-balanced' flag,
                                     each instance is added only to one other classifier.
        -tfidf                       Creates tf-idf features.
        [-all | -all_no_chunk]       -all:          all features are extracted,
                                     -all_no_chunk: all features except chunking are extracted
                                     Default option is '-all' .
```
**Important**. Note that at parsing and processing steps you have to use same *window*, *modSize*, *tfidf* and *all* or *all_no_chunk* options.

This step will create the vectors files explained below:

* *name.category.train*: labelled data for each category.
* *name.train*: unlabelled data.

Dictionary files *.dic* and *.dbin* are also created. The *.dic* file, is a raw text dictionary, and the *.dbin* file the binarized dictionary file.

It is recomended to use both all and the **balanced** options. TF-IDF feature could be usefull with seeds that share some word forms like *Londres **Hotel**, Grand Plaza **Hotel**, National **Bank**, British **Bank***...

#### Test

If your want to try parsing ancora corpus to vectors, you can download the <a href="http://clic.ub.edu/corpus/en">AnCora Spanish Dependencies corpus</a> and parse to conll with the provided *scripts/ancora2conll.pl* script. This is the usage:
```
    Usage: perl ancora2conll.pl corpus_input_dir corpus_output_dir -ne 0|1
                -ne 0: does not parse named entites
                    1: parses named entites for test purposes
```
The seed list is at *test/seeds* folder with *person, location and organization* categories.

To parse the corpus to vectors, use this command:

```
    java -jar target/Bootstrapping-0.0.1.jar -parse \
                                             -trainC ancora/train \
                                             -seeds test/seeds/seed-list.data \
                                             -name ancora -all -balanced -l es
```

### Train classifiers

Vector files created at the previous step are processed to create the classifiers. Below you can see the options for the parsing step:

```
    Train SVM classifiers
      -train -labelled labelledData -unlabelled unlabelledData [OPTIONS...]
      ARGUMENTS:
        -labelled    labelledData,      A list of data files used to train the classifier.
                                        A classifier will be learned for each labelled
                                        data file.
        -unlabelled  unlabelledData,    The data file used to boostrapping.
      OPTIONS:
        -ratio       negativeInstances, Negative:Positive instance ratio for labelled data,
                                        the ratio is 'negativeInstances':1.
                                        Default value is '2'.
        -testC       testCorpus,        Test corpus to output Precision, Recall and
                                        F1-score during the boostrapping.
        -th          threshold,         Beginning threshold to add instances from the    
                                        unlabelled data. Default value is '0.95'.
        -tfidf       threshold,         Changes tf-idf threshold, default value is '0.55'.
```
Labelled data files are the *name.category.train* files, and the unlabelled data is the *name.train* file.

Note that the TF-IDF threshold is only use in case of you choose TF-IDF option at parsing step. If *-tfidf* option is used, a *.tfidf.dic* and *.tfidf.dbin* file will be created. The *.tfidf.dic* file is the TF-IDF dictionary, and the *.tfidf.dbin* file is the binarized TF-IDF dictionary.

#### Test

If you want to try training classifiers, there are vector files and dictionaries at *test/vectors* folder. To use them execute this command:

```
    java -jar target/Bootstrapping-0.0.1.jar -train \
                                             -labelled test/vectors/ancora.person.train \
                                                       test/vectors/ancora.location.train \
                                                       test/vectors/ancora.organization.train \
                                             -unlabelled test/vectors/ancora.train
```

### Process KAF files

Input KAF files are processed, and the detected named entities are written at output KAF file. Below you can see the options for the processing step:

```
    Classify SVM instances
      -classify -in input.kaf -out output.kaf -classifier [classifier...] [OPTIONS...] -dic dictionary
      ARGUMENTS:
        -in         input.kaf,         Input KAF file with terms
        -out        output.kaf,        Output KAF file
        -models     [model...],        Model list to classify instances.
        -dic        dictionary,        Binarized dictionary file (.dbin extension).
      OPTIONS:
        -window     windowSize,        Token window size for each entity used when training,
                                       default value is '3'.
        -modSize    modifierSize,      How much modifiers had for NPs when training.
                                       default value is '5'.
        -tfidf      dictionary,        Binarized tf-idf dictionary file (.tfidf.dbin extension).
        [-all | -all_no_chunk]         -all:          all features are extracted,
                                       -all_no_chunk: all features except chunking are extracted
                                       Default option is '-all' .
```
**Important**. Note that at parsing and processing steps you have to use same *window*, *modSize*, *tfidf* and *all* or *all_no_chunk* options.

If TF-IDF option was especified at parsing step, the TF-IDF dictionary is required. You need also use same features at parsing and processing steps.

#### Test

You can try with provided models in *test/models* folder and the dictionaries in *test/dictionaries* folder. There is a test file at *test/files* folder. To use them execute this command:

```
    java -jar target/Bootstrapping-0.0.1.jar -classify \
                                             -in test/files/sample.kaf \
                                             -out test/files/sample.out.kaf \
                                             -dic test/dictionaries/ancora.dbin \
                                             -models test/models/ancora.person.bin \
                                                     test/models/ancora.location.bin \
                                                     test/models/ancora.organization.bin \
                                             -tfidf test/dictionaries/ancora.tfidf.dbin \
                                             -all
```

### Log files

With each execution, a log file is created and saved at *log* folder. Log filenames start with the executed step followed by the timestamp (e.g. *train.2014-04-03.18:08.log*).

## Scripts

There are two scripts within *scripts* directory:

1. **ancora2conll.pl**

    It parses the <a href="http://clic.ub.edu/corpus/en">AnCora Dependencies corpus</a> to conll. This is the usage:
```
        Usage: perl ancora2conll.pl corpus_input_dir corpus_output_dir -ne 0|1
                    -ne 0: does not parse named entites
                        1: parses named entites for test purposes
```

2. **kaf-conll-0.0.1-SNAPSHOT.jar**

    It parses KAF files to conll. This is the usage:
```
        Usage: java -jar kaf-conll-0.0.1-SNAPSHOT.jar [OPTIONS...]
        Reads text from standard input and writes result at standard output.
    
          OPTIONS:
            -h, --help       shows this help
```

## Contributing

1. Pull it
2. Create your feature branch (`git checkout -b features/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin features/my-new-feature`)
5. If you're confident, merge your changes into master.

