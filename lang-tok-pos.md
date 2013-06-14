---
layout: page
title: "Basic preprocessing steps"
tagline: Basic preprocessing steps
description: "Creating Lucene-based Disambiguation Index for DBpedia Spotlight"
tags: [Language Identification, Tokenization, Part of Speech tagging]
---
{% include JB/setup %}


This page describes the first steps to prepare a corpus to do an advanced NLP processing. Concretely, this first steps are necessary are important in order to pre-process any raw text normalized in UTF-8 and serve it to a more advanced Natural Language Processing Tasks selecting them by the language, with good tokenization and part-of-speech tags.

## Summary:

    1. Language Detection
    2. Tokenization   
    3. Part of Speech Tagging


## Language Detection

This component is the responsible of detecting the language of an input document and delivers it to the correct language pipeline. If the language detector detects that a text is in English the input text should send the text flow to the English pipeline and so forth.

### Technical characteristics
This language identification is based on the Mike Schilli's perl Text::Language::Guess language guessing CPAN library. Its implementation is simple: Using Text::ExtractWords and Lingua::StopWords from CPAN, it determines how many of the known stopwords the document contains for each language supported are supported in Lingua::StopWords. The choose of this method is a choice between different existing components but prioritizing the response time.
This component has these requisites:

    input: text file
    output: language detected
    programing language: perl
    prerequisites: Perl: Text/ExtractWords.pm, please refer to 
        
    https://github.com/gitpan/Text-ExtractWords and read the readme there so see how to install there.


The installation and usage of this component follows the common installation instructions explained in the Github component README.md file which can be found here [https://github.com/opener-project/language-identifier]

An example of the expected input and output is as follows:

       
    $ echo "this is an english text" | language-identifier
    
    and the response is 
    
    en
    
There is also the posibility of obtaining KAF as an output or an extended version of the language-identifier covering more languages than the ones in OpeNER. Finally, there is also the posibility of creating a server out of the language identification.
    

## Tokenization

This component is the responsible of tokenizing the text in two levels, in sentence level and in word level. This component is crucial to the correct working of the rest of NLP components.  This components is the first one of each language processing chain.

###Technical characteristics

These components are the majority, except for French, based on Apache OpeNLP component and contain two modules for sentence and token segmentation respectively. The components based on Apache OpeNLP are identically the same except for the models which depend on the languages and are trained according to the linguistic features of each language.
For the French, the component is based on a statistic method with a rules data file that helps the tokenization of tokens and sentences.
This component has these requisites:

    input: text file 
    output: KAF file with the text layer filled with the tokens appearing in the document and the sentence they belong to.
    language: java /perl (French)
    prerequisites:  Java 6, Apache Maven3, Ruby, RubyGems and of course git itself, Apache OpenNLP, specific language model, perl


The installation and usage of this component follows the common installation instructions explained in the Github component README.md file which can be found here [https://github.com/opener-project/tokenizer]


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
 



## Part of Speech Tagging

This component is the responsible of assigning each token its morphological label. This component is crucial to the correct working of the rest of NLP components. This component also includes the lemmatization of the words.

### Technical characteristics

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



The installation and usage of this component follows the common installation instructions explained in the Github component README.md file which can be found here: [https://github.com/opener-project/pos-tagger]


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



In the following schema, there is the main schema of the work flow in OpeNER. This work flow could be seen as a processing chain for each language in OpeNER. The input regarding this schema is prepared to be raw text and the output of all the modules will be KAF.

![altTitle](opeNERschema.png)


#### Contact information

    Aitor García Pablos and Andoni Azpeitia and Montse Cuadros
    {agarciap, aazpeitia,mcuadros}@ehu.es
    Vicomtech-IK4
    Paseo Mikeltegi, 57
    E-20018 Donostia-San Sebastián

