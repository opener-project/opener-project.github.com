---
layout: default
title: Full pipeline
sidebar: getting_started
---

# Using the Full OpeNER pipeline

Checkout the [Quick Start Guide](/getting-started/how-to/quick-start.html) for a
general overview of the technology.

The folowing components are available:

| Service                | Endpoint                                       | Languages              |
| -------                | --------                                       | ---------              |
| language-identifier    | http://opener.olery.com/language-identifier    | a lot                  |
| tokenizer              | http://opener.olery.com/tokenizer              | en, nl, de, es, it, fr |
| pos-tagger             | http://opener.olery.com/pos-tagger             | en, nl, de, es, it, fr |
| tree-tagger            | http://opener.olery.com/tree-tagger            | en, nl, de, es, it, fr |
| constituent-parser     | http://opener.olery.com/constituent-parser     | en, es, fr, it         |
| ner                    | http://opener.olery.com/ner                    | en, nl, de, es, it, fr |
| ned                    | http://opener.olery.com/ned                    | en, nl, de, es, it, fr |
| coreference            | http://opener.olery.com/coreference            | de, en, es, fr, it, nl |
| polarity-tagger        | http://opener.olery.com/polarity-tagger        | en, nl, de, es, it, fr |
| property-tagger        | http://opener.olery.com/property-tagger        | en, nl, de, es, it, fr |
| opinion-detector       | http://opener.olery.com/opinion-detector       | en, nl, de, es, it, fr |
| opinion-detector-basic | http://opener.olery.com/opinion-detector-basic | en, nl, de, es, it, fr |
| kaf2json               | http://opener.olery.com/kaf2json               | n.a.                   |

## An example using curl

Store the following text into a text file calles ```some_file.txt```.

```
I loved this hotel! It was very clean and public transportation was
close enough to walk to. The restaurant had delicious food. The room was bright.
The bathroom was modern. 100x better than staying in a hostel! The only issue
I had was the breakfast was a little pricey for me... but other than
that, everything was perfect and I would definitely stay here again!
```

Then execute the following command:

```shell
cat some_file.txt | \
curl -F 'input=<-' "http://opener.olery.com/language-identifier" | \
curl -F 'input=<-' "http://opener.olery.com/tokenizer" | \
curl -F 'input=<-' "http://opener.olery.com/pos-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/constituent-parser" | \
curl -F 'input=<-' "http://opener.olery.com/ner" | \
curl -F 'input=<-' "http://opener.olery.com/ned" | \
curl -F 'input=<-' "http://opener.olery.com/property-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/polarity-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/opinion-detector"
```

This will give you the following output:

```xml
<?xml version='1.0' encoding='UTF-8'?>
<KAF xml:lang="en" version="2.0">
  <kafHeader>
    <fileDesc/>
    <linguisticProcessors layer="text">
      <lp name="opener-sentence-splitter-en" timestamp="2014-05-25T10:52:08Z" version="0.0.1"/>
      <lp name="opener-tokenizer-en" timestamp="2014-05-25T10:52:08Z" version="1.0.1"/>
    </linguisticProcessors>
    <linguisticProcessors layer="terms">
      <lp name="ehu-pos-en" timestamp="now" version="1.0"/>
      <lp timestamp="2014-05-25T10:52:16UTC" version="21may2014_1.2" name="VUA polarity tagger multilanguage"/>
    </linguisticProcessors>
    <linguisticProcessors layer="constituents">
      <lp name="ehu-parse-en" timestamp="now" version="1.0"/>
    </linguisticProcessors>
    <linguisticProcessors layer="entities">
      <lp name="ehu-nerc-en" timestamp="now" version="1.0"/>
    </linguisticProcessors>
    <linguisticProcessors layer="ehu-ned">
      <lp name="ehu-dbpedia-spotlight" version="1.0"/>
    </linguisticProcessors>
    <linguisticProcessors layer="coreference">
      <lp name="corefgraph-en" timestamp="2014-05-25T10:52:15" version="0.8"/>
    </linguisticProcessors>
    <linguisticProcessors layer="features">
      <lp timestamp="2014-05-25T10:52:15UTC" version="20may2014_1.0" name="VUA property tagger"/>
    </linguisticProcessors>
    <linguisticProcessors layer="opinions">
      <lp name="Deluxe opinion miner (CRF+SVM)" version="10jan2014_2.0" timestamp="2014-05-25T10:52:16UTC"/>
    </linguisticProcessors>
  </kafHeader>
  <text>
    <wf wid="w1" sent="1" para="1" offset="0" length="1">I</wf>
    <wf wid="w2" sent="1" para="1" offset="2" length="5">loved</wf>
    <wf wid="w3" sent="1" para="1" offset="8" length="4">this</wf>
    <wf wid="w4" sent="1" para="1" offset="13" length="5">hotel</wf>
    <wf wid="w5" sent="1" para="1" offset="18" length="1">!</wf>
    <wf wid="w6" sent="2" para="1" offset="20" length="2">It</wf>
    <wf wid="w7" sent="2" para="1" offset="23" length="3">was</wf>
    <wf wid="w8" sent="2" para="1" offset="27" length="4">very</wf>
    <wf wid="w9" sent="2" para="1" offset="32" length="5">clean</wf>
    <wf wid="w10" sent="2" para="1" offset="38" length="3">and</wf>
    <wf wid="w11" sent="2" para="1" offset="42" length="6">public</wf>
    <wf wid="w12" sent="2" para="1" offset="49" length="14">transportation</wf>
    <wf wid="w13" sent="2" para="1" offset="64" length="3">was</wf>
    <wf wid="w14" sent="2" para="1" offset="68" length="5">close</wf>
    <wf wid="w15" sent="2" para="1" offset="74" length="6">enough</wf>
    <wf wid="w16" sent="2" para="1" offset="81" length="2">to</wf>
    <wf wid="w17" sent="2" para="1" offset="84" length="4">walk</wf>
    <wf wid="w18" sent="2" para="1" offset="89" length="2">to</wf>
    <wf wid="w19" sent="2" para="1" offset="91" length="1">.</wf>
    <wf wid="w20" sent="3" para="1" offset="93" length="3">The</wf>
    <wf wid="w21" sent="3" para="1" offset="97" length="10">restaurant</wf>
    <wf wid="w22" sent="3" para="1" offset="108" length="3">had</wf>
    <wf wid="w23" sent="3" para="1" offset="112" length="9">delicious</wf>
    <wf wid="w24" sent="3" para="1" offset="122" length="4">food</wf>
    <wf wid="w25" sent="3" para="1" offset="126" length="1">.</wf>
    <wf wid="w26" sent="4" para="1" offset="128" length="3">The</wf>
    <wf wid="w27" sent="4" para="1" offset="132" length="4">room</wf>
    <wf wid="w28" sent="4" para="1" offset="137" length="3">was</wf>
    <wf wid="w29" sent="4" para="1" offset="141" length="6">bright</wf>
    <wf wid="w30" sent="4" para="1" offset="147" length="1">.</wf>
    <wf wid="w31" sent="5" para="1" offset="149" length="3">The</wf>
    <wf wid="w32" sent="5" para="1" offset="153" length="8">bathroom</wf>
    <wf wid="w33" sent="5" para="1" offset="162" length="3">was</wf>
    <wf wid="w34" sent="5" para="1" offset="166" length="6">modern</wf>
    <wf wid="w35" sent="5" para="1" offset="172" length="1">.</wf>
    <wf wid="w36" sent="6" para="1" offset="174" length="4">100x</wf>
    <wf wid="w37" sent="6" para="1" offset="179" length="6">better</wf>
    <wf wid="w38" sent="6" para="1" offset="186" length="4">than</wf>
    <wf wid="w39" sent="6" para="1" offset="191" length="7">staying</wf>
    <wf wid="w40" sent="6" para="1" offset="199" length="2">in</wf>
    <wf wid="w41" sent="6" para="1" offset="202" length="1">a</wf>
    <wf wid="w42" sent="6" para="1" offset="204" length="6">hostel</wf>
    <wf wid="w43" sent="6" para="1" offset="210" length="1">!</wf>
    <wf wid="w44" sent="7" para="1" offset="212" length="3">The</wf>
    <wf wid="w45" sent="7" para="1" offset="216" length="4">only</wf>
    <wf wid="w46" sent="7" para="1" offset="221" length="5">issue</wf>
    <wf wid="w47" sent="7" para="1" offset="227" length="1">I</wf>
    <wf wid="w48" sent="7" para="1" offset="229" length="3">had</wf>
    <wf wid="w49" sent="7" para="1" offset="233" length="3">was</wf>
    <wf wid="w50" sent="7" para="1" offset="237" length="3">the</wf>
    <wf wid="w51" sent="7" para="1" offset="241" length="9">breakfast</wf>
    <wf wid="w52" sent="7" para="1" offset="251" length="3">was</wf>
    <wf wid="w53" sent="7" para="1" offset="255" length="1">a</wf>
    <wf wid="w54" sent="7" para="1" offset="257" length="6">little</wf>
    <wf wid="w55" sent="7" para="1" offset="264" length="6">pricey</wf>
    <wf wid="w56" sent="7" para="1" offset="271" length="3">for</wf>
    <wf wid="w57" sent="7" para="1" offset="275" length="2">me</wf>
    <wf wid="w58" sent="7" para="1" offset="277" length="3">...</wf>
    <wf wid="w59" sent="7" para="1" offset="281" length="3">but</wf>
    <wf wid="w60" sent="7" para="1" offset="285" length="5">other</wf>
    <wf wid="w61" sent="7" para="1" offset="291" length="4">than</wf>
    <wf wid="w62" sent="7" para="1" offset="296" length="4">that</wf>
    <wf wid="w63" sent="7" para="1" offset="300" length="1">,</wf>
    <wf wid="w64" sent="7" para="1" offset="302" length="10">everything</wf>
    <wf wid="w65" sent="7" para="1" offset="313" length="3">was</wf>
    <wf wid="w66" sent="7" para="1" offset="317" length="7">perfect</wf>
    <wf wid="w67" sent="7" para="1" offset="325" length="3">and</wf>
    <wf wid="w68" sent="7" para="1" offset="329" length="1">I</wf>
    <wf wid="w69" sent="7" para="1" offset="331" length="5">would</wf>
    <wf wid="w70" sent="7" para="1" offset="337" length="10">definitely</wf>
    <wf wid="w71" sent="7" para="1" offset="348" length="4">stay</wf>
    <wf wid="w72" sent="7" para="1" offset="353" length="4">here</wf>
    <wf wid="w73" sent="7" para="1" offset="358" length="5">again</wf>
    <wf wid="w74" sent="7" para="1" offset="363" length="1">!</wf>
  </text>
  <terms>
    <!--I-->
    <term tid="t1" type="close" lemma="i" pos="Q" morphofeat="PRP">
      <span>
        <target id="w1"/>
      </span>
    </term>
    <!--loved-->
    <term tid="t2" type="open" lemma="love" pos="V" morphofeat="VBD">
      <span>
        <target id="w2"/>
      </span>
      <sentiment polarity="positive" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--this-->
    <term tid="t3" type="close" lemma="this" pos="D" morphofeat="DT">
      <span>
        <target id="w3"/>
      </span>
    </term>
    <!--hotel-->
    <term tid="t4" type="open" lemma="hotel" pos="N" morphofeat="NN">
      <span>
        <target id="w4"/>
      </span>
    </term>
    <!--!-->
    <term tid="t5" type="close" lemma="!" pos="O" morphofeat=".">
      <span>
        <target id="w5"/>
      </span>
    </term>
    <!--It-->
    <term tid="t6" type="close" lemma="it" pos="Q" morphofeat="PRP">
      <span>
        <target id="w6"/>
      </span>
    </term>
    <!--was-->
    <term tid="t7" type="open" lemma="be" pos="V" morphofeat="VBD">
      <span>
        <target id="w7"/>
      </span>
    </term>
    <!--very-->
    <term tid="t8" type="open" lemma="very" pos="A" morphofeat="RB">
      <span>
        <target id="w8"/>
      </span>
    </term>
    <!--clean-->
    <term tid="t9" type="open" lemma="clean" pos="G" morphofeat="JJ">
      <span>
        <target id="w9"/>
      </span>
      <sentiment polarity="positive" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--and-->
    <term tid="t10" type="close" lemma="and" pos="C" morphofeat="CC">
      <span>
        <target id="w10"/>
      </span>
    </term>
    <!--public-->
    <term tid="t11" type="open" lemma="public" pos="G" morphofeat="JJ">
      <span>
        <target id="w11"/>
      </span>
    </term>
    <!--transportation-->
    <term tid="t12" type="open" lemma="transportation" pos="N" morphofeat="NN">
      <span>
        <target id="w12"/>
      </span>
    </term>
    <!--was-->
    <term tid="t13" type="open" lemma="be" pos="V" morphofeat="VBD">
      <span>
        <target id="w13"/>
      </span>
    </term>
    <!--close-->
    <term tid="t14" type="open" lemma="close" pos="G" morphofeat="JJ">
      <span>
        <target id="w14"/>
      </span>
      <sentiment polarity="negative" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--enough-->
    <term tid="t15" type="open" lemma="enough" pos="A" morphofeat="RB">
      <span>
        <target id="w15"/>
      </span>
    </term>
    <!--to-->
    <term tid="t16" type="close" lemma="to" pos="P" morphofeat="TO">
      <span>
        <target id="w16"/>
      </span>
    </term>
    <!--walk-->
    <term tid="t17" type="open" lemma="walk" pos="V" morphofeat="VB">
      <span>
        <target id="w17"/>
      </span>
    </term>
    <!--to-->
    <term tid="t18" type="close" lemma="to" pos="P" morphofeat="TO">
      <span>
        <target id="w18"/>
      </span>
    </term>
    <!--.-->
    <term tid="t19" type="close" lemma="." pos="O" morphofeat=".">
      <span>
        <target id="w19"/>
      </span>
    </term>
    <!--The-->
    <term tid="t20" type="close" lemma="the" pos="D" morphofeat="DT">
      <span>
        <target id="w20"/>
      </span>
    </term>
    <!--restaurant-->
    <term tid="t21" type="open" lemma="restaurant" pos="N" morphofeat="NN">
      <span>
        <target id="w21"/>
      </span>
    </term>
    <!--had-->
    <term tid="t22" type="open" lemma="have" pos="V" morphofeat="VBD">
      <span>
        <target id="w22"/>
      </span>
    </term>
    <!--delicious-->
    <term tid="t23" type="open" lemma="delicious" pos="G" morphofeat="JJ">
      <span>
        <target id="w23"/>
      </span>
      <sentiment polarity="positive" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--food-->
    <term tid="t24" type="open" lemma="food" pos="N" morphofeat="NN">
      <span>
        <target id="w24"/>
      </span>
    </term>
    <!--.-->
    <term tid="t25" type="close" lemma="." pos="O" morphofeat=".">
      <span>
        <target id="w25"/>
      </span>
    </term>
    <!--The-->
    <term tid="t26" type="close" lemma="the" pos="D" morphofeat="DT">
      <span>
        <target id="w26"/>
      </span>
    </term>
    <!--room-->
    <term tid="t27" type="open" lemma="room" pos="N" morphofeat="NN">
      <span>
        <target id="w27"/>
      </span>
    </term>
    <!--was-->
    <term tid="t28" type="open" lemma="be" pos="V" morphofeat="VBD">
      <span>
        <target id="w28"/>
      </span>
    </term>
    <!--bright-->
    <term tid="t29" type="open" lemma="bright" pos="G" morphofeat="JJ">
      <span>
        <target id="w29"/>
      </span>
      <sentiment polarity="positive" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--.-->
    <term tid="t30" type="close" lemma="." pos="O" morphofeat=".">
      <span>
        <target id="w30"/>
      </span>
    </term>
    <!--The-->
    <term tid="t31" type="close" lemma="the" pos="D" morphofeat="DT">
      <span>
        <target id="w31"/>
      </span>
    </term>
    <!--bathroom-->
    <term tid="t32" type="open" lemma="bathroom" pos="N" morphofeat="NN">
      <span>
        <target id="w32"/>
      </span>
    </term>
    <!--was-->
    <term tid="t33" type="open" lemma="be" pos="V" morphofeat="VBD">
      <span>
        <target id="w33"/>
      </span>
    </term>
    <!--modern-->
    <term tid="t34" type="open" lemma="modern" pos="G" morphofeat="JJ">
      <span>
        <target id="w34"/>
      </span>
      <sentiment polarity="positive" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--.-->
    <term tid="t35" type="close" lemma="." pos="O" morphofeat=".">
      <span>
        <target id="w35"/>
      </span>
    </term>
    <!--100x-->
    <term tid="t36" type="close" lemma="100x" pos="O" morphofeat="CD">
      <span>
        <target id="w36"/>
      </span>
    </term>
    <!--better-->
    <term tid="t37" type="open" lemma="good" pos="G" morphofeat="JJR">
      <span>
        <target id="w37"/>
      </span>
    </term>
    <!--than-->
    <term tid="t38" type="close" lemma="than" pos="P" morphofeat="IN">
      <span>
        <target id="w38"/>
      </span>
    </term>
    <!--staying-->
    <term tid="t39" type="open" lemma="stay" pos="V" morphofeat="VBG">
      <span>
        <target id="w39"/>
      </span>
    </term>
    <!--in-->
    <term tid="t40" type="close" lemma="in" pos="P" morphofeat="IN">
      <span>
        <target id="w40"/>
      </span>
    </term>
    <!--a-->
    <term tid="t41" type="close" lemma="a" pos="D" morphofeat="DT">
      <span>
        <target id="w41"/>
      </span>
    </term>
    <!--hostel-->
    <term tid="t42" type="open" lemma="hostel" pos="N" morphofeat="NN">
      <span>
        <target id="w42"/>
      </span>
    </term>
    <!--!-->
    <term tid="t43" type="close" lemma="!" pos="O" morphofeat=".">
      <span>
        <target id="w43"/>
      </span>
    </term>
    <!--The-->
    <term tid="t44" type="close" lemma="the" pos="D" morphofeat="DT">
      <span>
        <target id="w44"/>
      </span>
    </term>
    <!--only-->
    <term tid="t45" type="open" lemma="only" pos="G" morphofeat="JJ">
      <span>
        <target id="w45"/>
      </span>
    </term>
    <!--issue-->
    <term tid="t46" type="open" lemma="issue" pos="N" morphofeat="NN">
      <span>
        <target id="w46"/>
      </span>
    </term>
    <!--I-->
    <term tid="t47" type="close" lemma="i" pos="Q" morphofeat="PRP">
      <span>
        <target id="w47"/>
      </span>
    </term>
    <!--had-->
    <term tid="t48" type="open" lemma="have" pos="V" morphofeat="VBD">
      <span>
        <target id="w48"/>
      </span>
    </term>
    <!--was-->
    <term tid="t49" type="open" lemma="be" pos="V" morphofeat="VBD">
      <span>
        <target id="w49"/>
      </span>
    </term>
    <!--the-->
    <term tid="t50" type="close" lemma="the" pos="D" morphofeat="DT">
      <span>
        <target id="w50"/>
      </span>
    </term>
    <!--breakfast-->
    <term tid="t51" type="open" lemma="breakfast" pos="N" morphofeat="NN">
      <span>
        <target id="w51"/>
      </span>
    </term>
    <!--was-->
    <term tid="t52" type="open" lemma="be" pos="V" morphofeat="VBD">
      <span>
        <target id="w52"/>
      </span>
    </term>
    <!--a-->
    <term tid="t53" type="close" lemma="a" pos="D" morphofeat="DT">
      <span>
        <target id="w53"/>
      </span>
    </term>
    <!--little-->
    <term tid="t54" type="open" lemma="little" pos="G" morphofeat="JJ">
      <span>
        <target id="w54"/>
      </span>
      <sentiment polarity="negative" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--pricey-->
    <term tid="t55" type="open" lemma="pricey" pos="G" morphofeat="JJ">
      <span>
        <target id="w55"/>
      </span>
      <sentiment polarity="negative" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--for-->
    <term tid="t56" type="close" lemma="for" pos="P" morphofeat="IN">
      <span>
        <target id="w56"/>
      </span>
    </term>
    <!--me-->
    <term tid="t57" type="close" lemma="me" pos="Q" morphofeat="PRP">
      <span>
        <target id="w57"/>
      </span>
    </term>
    <!--...-->
    <term tid="t58" type="close" lemma="..." pos="O" morphofeat=":">
      <span>
        <target id="w58"/>
      </span>
    </term>
    <!--but-->
    <term tid="t59" type="close" lemma="but" pos="C" morphofeat="CC">
      <span>
        <target id="w59"/>
      </span>
    </term>
    <!--other-->
    <term tid="t60" type="open" lemma="other" pos="G" morphofeat="JJ">
      <span>
        <target id="w60"/>
      </span>
    </term>
    <!--than-->
    <term tid="t61" type="close" lemma="than" pos="P" morphofeat="IN">
      <span>
        <target id="w61"/>
      </span>
    </term>
    <!--that-->
    <term tid="t62" type="close" lemma="that" pos="D" morphofeat="DT">
      <span>
        <target id="w62"/>
      </span>
    </term>
    <!--,-->
    <term tid="t63" type="close" lemma="," pos="O" morphofeat=",">
      <span>
        <target id="w63"/>
      </span>
    </term>
    <!--everything-->
    <term tid="t64" type="open" lemma="everything" pos="N" morphofeat="NN">
      <span>
        <target id="w64"/>
      </span>
    </term>
    <!--was-->
    <term tid="t65" type="open" lemma="be" pos="V" morphofeat="VBD">
      <span>
        <target id="w65"/>
      </span>
    </term>
    <!--perfect-->
    <term tid="t66" type="open" lemma="perfect" pos="G" morphofeat="JJ">
      <span>
        <target id="w66"/>
      </span>
      <sentiment polarity="positive" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--and-->
    <term tid="t67" type="close" lemma="and" pos="C" morphofeat="CC">
      <span>
        <target id="w67"/>
      </span>
    </term>
    <!--I-->
    <term tid="t68" type="close" lemma="i" pos="Q" morphofeat="PRP">
      <span>
        <target id="w68"/>
      </span>
    </term>
    <!--would-->
    <term tid="t69" type="close" lemma="would" pos="O" morphofeat="MD">
      <span>
        <target id="w69"/>
      </span>
      <sentiment polarity="neutral" resource="General lexicon for English . VUA_olery_lexicon_EN_lmf"/>
    </term>
    <!--definitely-->
    <term tid="t70" type="open" lemma="definitely" pos="A" morphofeat="RB">
      <span>
        <target id="w70"/>
      </span>
    </term>
    <!--stay-->
    <term tid="t71" type="open" lemma="stay" pos="V" morphofeat="VB">
      <span>
        <target id="w71"/>
      </span>
    </term>
    <!--here-->
    <term tid="t72" type="open" lemma="here" pos="A" morphofeat="RB">
      <span>
        <target id="w72"/>
      </span>
    </term>
    <!--again-->
    <term tid="t73" type="open" lemma="again" pos="A" morphofeat="RB">
      <span>
        <target id="w73"/>
      </span>
    </term>
    <!--!-->
    <term tid="t74" type="close" lemma="!" pos="O" morphofeat=".">
      <span>
        <target id="w74"/>
      </span>
    </term>
  </terms>
  <constituency>
    <tree>
      <!--Non-terminals-->
      <nt id="nter1" label="TOP"/>
      <nt id="nter2" label="S"/>
      <nt id="nter3" label="NP"/>
      <nt id="nter4" label="PRP"/>
      <nt id="nter5" label="VP"/>
      <nt id="nter6" label="VBD"/>
      <nt id="nter7" label="NP"/>
      <nt id="nter8" label="DT"/>
      <nt id="nter9" label="NN"/>
      <nt id="nter10" label="."/>
      <!--Terminals-->
      <!--I-->
      <t id="ter1">
        <span>
          <target id="t1"/>
        </span>
      </t>
      <!--loved-->
      <t id="ter2">
        <span>
          <target id="t2"/>
        </span>
      </t>
      <!--this-->
      <t id="ter3">
        <span>
          <target id="t3"/>
        </span>
      </t>
      <!--hotel-->
      <t id="ter4">
        <span>
          <target id="t4"/>
        </span>
      </t>
      <!--!-->
      <t id="ter5">
        <span>
          <target id="t5"/>
        </span>
      </t>
      <!--Tree edges-->
      <edge id="tre2" from="nter2" to="nter1"/>
      <edge id="tre3" from="nter3" to="nter2"/>
      <edge id="tre4" from="nter4" to="nter3" head="yes"/>
      <edge id="tre5" from="ter1" to="nter4"/>
      <edge id="tre6" from="nter5" to="nter2" head="yes"/>
      <edge id="tre7" from="nter6" to="nter5" head="yes"/>
      <edge id="tre8" from="ter2" to="nter6"/>
      <edge id="tre9" from="nter7" to="nter5"/>
      <edge id="tre10" from="nter8" to="nter7"/>
      <edge id="tre11" from="ter3" to="nter8"/>
      <edge id="tre12" from="nter9" to="nter7" head="yes"/>
      <edge id="tre13" from="ter4" to="nter9"/>
      <edge id="tre14" from="nter10" to="nter2"/>
      <edge id="tre15" from="ter5" to="nter10"/>
    </tree>
    <tree>
      <!--Non-terminals-->
      <nt id="nter11" label="TOP"/>
      <nt id="nter12" label="S"/>
      <nt id="nter13" label="S"/>
      <nt id="nter14" label="NP"/>
      <nt id="nter15" label="PRP"/>
      <nt id="nter16" label="VP"/>
      <nt id="nter17" label="VBD"/>
      <nt id="nter18" label="ADJP"/>
      <nt id="nter19" label="RB"/>
      <nt id="nter20" label="JJ"/>
      <nt id="nter21" label="CC"/>
      <nt id="nter22" label="S"/>
      <nt id="nter23" label="NP"/>
      <nt id="nter24" label="JJ"/>
      <nt id="nter25" label="NN"/>
      <nt id="nter26" label="VP"/>
      <nt id="nter27" label="VBD"/>
      <nt id="nter28" label="ADJP"/>
      <nt id="nter29" label="JJ"/>
      <nt id="nter30" label="RB"/>
      <nt id="nter31" label="S"/>
      <nt id="nter32" label="VP"/>
      <nt id="nter33" label="TO"/>
      <nt id="nter34" label="VP"/>
      <nt id="nter35" label="VB"/>
      <nt id="nter36" label="S"/>
      <nt id="nter37" label="VP"/>
      <nt id="nter38" label="TO"/>
      <nt id="nter39" label="."/>
      <!--Terminals-->
      <!--It-->
      <t id="ter6">
        <span>
          <target id="t6"/>
        </span>
      </t>
      <!--was-->
      <t id="ter7">
        <span>
          <target id="t7"/>
        </span>
      </t>
      <!--very-->
      <t id="ter8">
        <span>
          <target id="t8"/>
        </span>
      </t>
      <!--clean-->
      <t id="ter9">
        <span>
          <target id="t9"/>
        </span>
      </t>
      <!--and-->
      <t id="ter10">
        <span>
          <target id="t10"/>
        </span>
      </t>
      <!--public-->
      <t id="ter11">
        <span>
          <target id="t11"/>
        </span>
      </t>
      <!--transportation-->
      <t id="ter12">
        <span>
          <target id="t12"/>
        </span>
      </t>
      <!--was-->
      <t id="ter13">
        <span>
          <target id="t13"/>
        </span>
      </t>
      <!--close-->
      <t id="ter14">
        <span>
          <target id="t14"/>
        </span>
      </t>
      <!--enough-->
      <t id="ter15">
        <span>
          <target id="t15"/>
        </span>
      </t>
      <!--to-->
      <t id="ter16">
        <span>
          <target id="t16"/>
        </span>
      </t>
      <!--walk-->
      <t id="ter17">
        <span>
          <target id="t17"/>
        </span>
      </t>
      <!--to-->
      <t id="ter18">
        <span>
          <target id="t18"/>
        </span>
      </t>
      <!--.-->
      <t id="ter19">
        <span>
          <target id="t19"/>
        </span>
      </t>
      <!--Tree edges-->
      <edge id="tre17" from="nter12" to="nter11"/>
      <edge id="tre18" from="nter13" to="nter12"/>
      <edge id="tre19" from="nter14" to="nter13"/>
      <edge id="tre20" from="nter15" to="nter14" head="yes"/>
      <edge id="tre21" from="ter6" to="nter15"/>
      <edge id="tre22" from="nter16" to="nter13" head="yes"/>
      <edge id="tre23" from="nter17" to="nter16" head="yes"/>
      <edge id="tre24" from="ter7" to="nter17"/>
      <edge id="tre25" from="nter18" to="nter16"/>
      <edge id="tre26" from="nter19" to="nter18"/>
      <edge id="tre27" from="ter8" to="nter19"/>
      <edge id="tre28" from="nter20" to="nter18" head="yes"/>
      <edge id="tre29" from="ter9" to="nter20"/>
      <edge id="tre30" from="nter21" to="nter12"/>
      <edge id="tre31" from="ter10" to="nter21"/>
      <edge id="tre32" from="nter22" to="nter12" head="yes"/>
      <edge id="tre33" from="nter23" to="nter22"/>
      <edge id="tre34" from="nter24" to="nter23"/>
      <edge id="tre35" from="ter11" to="nter24"/>
      <edge id="tre36" from="nter25" to="nter23" head="yes"/>
      <edge id="tre37" from="ter12" to="nter25"/>
      <edge id="tre38" from="nter26" to="nter22" head="yes"/>
      <edge id="tre39" from="nter27" to="nter26" head="yes"/>
      <edge id="tre40" from="ter13" to="nter27"/>
      <edge id="tre41" from="nter28" to="nter26"/>
      <edge id="tre42" from="nter29" to="nter28" head="yes"/>
      <edge id="tre43" from="ter14" to="nter29"/>
      <edge id="tre44" from="nter30" to="nter28"/>
      <edge id="tre45" from="ter15" to="nter30"/>
      <edge id="tre46" from="nter31" to="nter28"/>
      <edge id="tre47" from="nter32" to="nter31" head="yes"/>
      <edge id="tre48" from="nter33" to="nter32" head="yes"/>
      <edge id="tre49" from="ter16" to="nter33"/>
      <edge id="tre50" from="nter34" to="nter32"/>
      <edge id="tre51" from="nter35" to="nter34" head="yes"/>
      <edge id="tre52" from="ter17" to="nter35"/>
      <edge id="tre53" from="nter36" to="nter34"/>
      <edge id="tre54" from="nter37" to="nter36" head="yes"/>
      <edge id="tre55" from="nter38" to="nter37" head="yes"/>
      <edge id="tre56" from="ter18" to="nter38"/>
      <edge id="tre57" from="nter39" to="nter12"/>
      <edge id="tre58" from="ter19" to="nter39"/>
    </tree>
    <tree>
      <!--Non-terminals-->
      <nt id="nter40" label="TOP"/>
      <nt id="nter41" label="S"/>
      <nt id="nter42" label="NP"/>
      <nt id="nter43" label="DT"/>
      <nt id="nter44" label="NN"/>
      <nt id="nter45" label="VP"/>
      <nt id="nter46" label="VBD"/>
      <nt id="nter47" label="NP"/>
      <nt id="nter48" label="JJ"/>
      <nt id="nter49" label="NN"/>
      <nt id="nter50" label="."/>
      <!--Terminals-->
      <!--The-->
      <t id="ter20">
        <span>
          <target id="t20"/>
        </span>
      </t>
      <!--restaurant-->
      <t id="ter21">
        <span>
          <target id="t21"/>
        </span>
      </t>
      <!--had-->
      <t id="ter22">
        <span>
          <target id="t22"/>
        </span>
      </t>
      <!--delicious-->
      <t id="ter23">
        <span>
          <target id="t23"/>
        </span>
      </t>
      <!--food-->
      <t id="ter24">
        <span>
          <target id="t24"/>
        </span>
      </t>
      <!--.-->
      <t id="ter25">
        <span>
          <target id="t25"/>
        </span>
      </t>
      <!--Tree edges-->
      <edge id="tre60" from="nter41" to="nter40"/>
      <edge id="tre61" from="nter42" to="nter41"/>
      <edge id="tre62" from="nter43" to="nter42"/>
      <edge id="tre63" from="ter20" to="nter43"/>
      <edge id="tre64" from="nter44" to="nter42" head="yes"/>
      <edge id="tre65" from="ter21" to="nter44"/>
      <edge id="tre66" from="nter45" to="nter41" head="yes"/>
      <edge id="tre67" from="nter46" to="nter45" head="yes"/>
      <edge id="tre68" from="ter22" to="nter46"/>
      <edge id="tre69" from="nter47" to="nter45"/>
      <edge id="tre70" from="nter48" to="nter47"/>
      <edge id="tre71" from="ter23" to="nter48"/>
      <edge id="tre72" from="nter49" to="nter47" head="yes"/>
      <edge id="tre73" from="ter24" to="nter49"/>
      <edge id="tre74" from="nter50" to="nter41"/>
      <edge id="tre75" from="ter25" to="nter50"/>
    </tree>
    <tree>
      <!--Non-terminals-->
      <nt id="nter51" label="TOP"/>
      <nt id="nter52" label="S"/>
      <nt id="nter53" label="NP"/>
      <nt id="nter54" label="DT"/>
      <nt id="nter55" label="NN"/>
      <nt id="nter56" label="VP"/>
      <nt id="nter57" label="VBD"/>
      <nt id="nter58" label="ADJP"/>
      <nt id="nter59" label="JJ"/>
      <nt id="nter60" label="."/>
      <!--Terminals-->
      <!--The-->
      <t id="ter26">
        <span>
          <target id="t26"/>
        </span>
      </t>
      <!--room-->
      <t id="ter27">
        <span>
          <target id="t27"/>
        </span>
      </t>
      <!--was-->
      <t id="ter28">
        <span>
          <target id="t28"/>
        </span>
      </t>
      <!--bright-->
      <t id="ter29">
        <span>
          <target id="t29"/>
        </span>
      </t>
      <!--.-->
      <t id="ter30">
        <span>
          <target id="t30"/>
        </span>
      </t>
      <!--Tree edges-->
      <edge id="tre77" from="nter52" to="nter51"/>
      <edge id="tre78" from="nter53" to="nter52"/>
      <edge id="tre79" from="nter54" to="nter53"/>
      <edge id="tre80" from="ter26" to="nter54"/>
      <edge id="tre81" from="nter55" to="nter53" head="yes"/>
      <edge id="tre82" from="ter27" to="nter55"/>
      <edge id="tre83" from="nter56" to="nter52" head="yes"/>
      <edge id="tre84" from="nter57" to="nter56" head="yes"/>
      <edge id="tre85" from="ter28" to="nter57"/>
      <edge id="tre86" from="nter58" to="nter56"/>
      <edge id="tre87" from="nter59" to="nter58" head="yes"/>
      <edge id="tre88" from="ter29" to="nter59"/>
      <edge id="tre89" from="nter60" to="nter52"/>
      <edge id="tre90" from="ter30" to="nter60"/>
    </tree>
    <tree>
      <!--Non-terminals-->
      <nt id="nter61" label="TOP"/>
      <nt id="nter62" label="S"/>
      <nt id="nter63" label="NP"/>
      <nt id="nter64" label="DT"/>
      <nt id="nter65" label="NN"/>
      <nt id="nter66" label="VP"/>
      <nt id="nter67" label="VBD"/>
      <nt id="nter68" label="ADJP"/>
      <nt id="nter69" label="JJ"/>
      <nt id="nter70" label="."/>
      <!--Terminals-->
      <!--The-->
      <t id="ter31">
        <span>
          <target id="t31"/>
        </span>
      </t>
      <!--bathroom-->
      <t id="ter32">
        <span>
          <target id="t32"/>
        </span>
      </t>
      <!--was-->
      <t id="ter33">
        <span>
          <target id="t33"/>
        </span>
      </t>
      <!--modern-->
      <t id="ter34">
        <span>
          <target id="t34"/>
        </span>
      </t>
      <!--.-->
      <t id="ter35">
        <span>
          <target id="t35"/>
        </span>
      </t>
      <!--Tree edges-->
      <edge id="tre92" from="nter62" to="nter61"/>
      <edge id="tre93" from="nter63" to="nter62"/>
      <edge id="tre94" from="nter64" to="nter63"/>
      <edge id="tre95" from="ter31" to="nter64"/>
      <edge id="tre96" from="nter65" to="nter63" head="yes"/>
      <edge id="tre97" from="ter32" to="nter65"/>
      <edge id="tre98" from="nter66" to="nter62" head="yes"/>
      <edge id="tre99" from="nter67" to="nter66" head="yes"/>
      <edge id="tre100" from="ter33" to="nter67"/>
      <edge id="tre101" from="nter68" to="nter66"/>
      <edge id="tre102" from="nter69" to="nter68" head="yes"/>
      <edge id="tre103" from="ter34" to="nter69"/>
      <edge id="tre104" from="nter70" to="nter62"/>
      <edge id="tre105" from="ter35" to="nter70"/>
    </tree>
    <tree>
      <!--Non-terminals-->
      <nt id="nter71" label="TOP"/>
      <nt id="nter72" label="NP"/>
      <nt id="nter73" label="NP"/>
      <nt id="nter74" label="CD"/>
      <nt id="nter75" label="ADJP"/>
      <nt id="nter76" label="JJR"/>
      <nt id="nter77" label="PP"/>
      <nt id="nter78" label="IN"/>
      <nt id="nter79" label="S"/>
      <nt id="nter80" label="VP"/>
      <nt id="nter81" label="VBG"/>
      <nt id="nter82" label="PP"/>
      <nt id="nter83" label="IN"/>
      <nt id="nter84" label="NP"/>
      <nt id="nter85" label="DT"/>
      <nt id="nter86" label="NN"/>
      <nt id="nter87" label="."/>
      <!--Terminals-->
      <!--100x-->
      <t id="ter36">
        <span>
          <target id="t36"/>
        </span>
      </t>
      <!--better-->
      <t id="ter37">
        <span>
          <target id="t37"/>
        </span>
      </t>
      <!--than-->
      <t id="ter38">
        <span>
          <target id="t38"/>
        </span>
      </t>
      <!--staying-->
      <t id="ter39">
        <span>
          <target id="t39"/>
        </span>
      </t>
      <!--in-->
      <t id="ter40">
        <span>
          <target id="t40"/>
        </span>
      </t>
      <!--a-->
      <t id="ter41">
        <span>
          <target id="t41"/>
        </span>
      </t>
      <!--hostel-->
      <t id="ter42">
        <span>
          <target id="t42"/>
        </span>
      </t>
      <!--!-->
      <t id="ter43">
        <span>
          <target id="t43"/>
        </span>
      </t>
      <!--Tree edges-->
      <edge id="tre107" from="nter72" to="nter71"/>
      <edge id="tre108" from="nter73" to="nter72" head="yes"/>
      <edge id="tre109" from="nter74" to="nter73" head="yes"/>
      <edge id="tre110" from="ter36" to="nter74"/>
      <edge id="tre111" from="nter75" to="nter72"/>
      <edge id="tre112" from="nter76" to="nter75" head="yes"/>
      <edge id="tre113" from="ter37" to="nter76"/>
      <edge id="tre114" from="nter77" to="nter75"/>
      <edge id="tre115" from="nter78" to="nter77" head="yes"/>
      <edge id="tre116" from="ter38" to="nter78"/>
      <edge id="tre117" from="nter79" to="nter77"/>
      <edge id="tre118" from="nter80" to="nter79" head="yes"/>
      <edge id="tre119" from="nter81" to="nter80" head="yes"/>
      <edge id="tre120" from="ter39" to="nter81"/>
      <edge id="tre121" from="nter82" to="nter80"/>
      <edge id="tre122" from="nter83" to="nter82" head="yes"/>
      <edge id="tre123" from="ter40" to="nter83"/>
      <edge id="tre124" from="nter84" to="nter82"/>
      <edge id="tre125" from="nter85" to="nter84"/>
      <edge id="tre126" from="ter41" to="nter85"/>
      <edge id="tre127" from="nter86" to="nter84" head="yes"/>
      <edge id="tre128" from="ter42" to="nter86"/>
      <edge id="tre129" from="nter87" to="nter72"/>
      <edge id="tre130" from="ter43" to="nter87"/>
    </tree>
    <tree>
      <!--Non-terminals-->
      <nt id="nter88" label="TOP"/>
      <nt id="nter89" label="S"/>
      <nt id="nter90" label="S"/>
      <nt id="nter91" label="NP"/>
      <nt id="nter92" label="NP"/>
      <nt id="nter93" label="DT"/>
      <nt id="nter94" label="JJ"/>
      <nt id="nter95" label="NN"/>
      <nt id="nter96" label="SBAR"/>
      <nt id="nter97" label="S"/>
      <nt id="nter98" label="NP"/>
      <nt id="nter99" label="PRP"/>
      <nt id="nter100" label="VP"/>
      <nt id="nter101" label="VBD"/>
      <nt id="nter102" label="VP"/>
      <nt id="nter103" label="VBD"/>
      <nt id="nter104" label="NP"/>
      <nt id="nter105" label="DT"/>
      <nt id="nter106" label="NN"/>
      <nt id="nter107" label="VP"/>
      <nt id="nter108" label="VBD"/>
      <nt id="nter109" label="NP"/>
      <nt id="nter110" label="NP"/>
      <nt id="nter111" label="DT"/>
      <nt id="nter112" label="JJ"/>
      <nt id="nter113" label="NN"/>
      <nt id="nter114" label="PP"/>
      <nt id="nter115" label="IN"/>
      <nt id="nter116" label="NP"/>
      <nt id="nter117" label="PRP"/>
      <nt id="nter118" label=":"/>
      <nt id="nter119" label="CC"/>
      <nt id="nter120" label="S"/>
      <nt id="nter121" label="S"/>
      <nt id="nter122" label="ADVP"/>
      <nt id="nter123" label="JJ"/>
      <nt id="nter124" label="PP"/>
      <nt id="nter125" label="IN"/>
      <nt id="nter126" label="NP"/>
      <nt id="nter127" label="IN"/>
      <nt id="nter128" label=","/>
      <nt id="nter129" label="NP"/>
      <nt id="nter130" label="NN"/>
      <nt id="nter131" label="VP"/>
      <nt id="nter132" label="VBD"/>
      <nt id="nter133" label="ADJP"/>
      <nt id="nter134" label="JJ"/>
      <nt id="nter135" label="CC"/>
      <nt id="nter136" label="S"/>
      <nt id="nter137" label="NP"/>
      <nt id="nter138" label="PRP"/>
      <nt id="nter139" label="VP"/>
      <nt id="nter140" label="MD"/>
      <nt id="nter141" label="ADVP"/>
      <nt id="nter142" label="RB"/>
      <nt id="nter143" label="VP"/>
      <nt id="nter144" label="VB"/>
      <nt id="nter145" label="ADVP"/>
      <nt id="nter146" label="RB"/>
      <nt id="nter147" label="ADVP"/>
      <nt id="nter148" label="RB"/>
      <nt id="nter149" label="."/>
      <!--Terminals-->
      <!--The-->
      <t id="ter44">
        <span>
          <target id="t44"/>
        </span>
      </t>
      <!--only-->
      <t id="ter45">
        <span>
          <target id="t45"/>
        </span>
      </t>
      <!--issue-->
      <t id="ter46">
        <span>
          <target id="t46"/>
        </span>
      </t>
      <!--I-->
      <t id="ter47">
        <span>
          <target id="t47"/>
        </span>
      </t>
      <!--had-->
      <t id="ter48">
        <span>
          <target id="t48"/>
        </span>
      </t>
      <!--was-->
      <t id="ter49">
        <span>
          <target id="t49"/>
        </span>
      </t>
      <!--the-->
      <t id="ter50">
        <span>
          <target id="t50"/>
        </span>
      </t>
      <!--breakfast-->
      <t id="ter51">
        <span>
          <target id="t51"/>
        </span>
      </t>
      <!--was-->
      <t id="ter52">
        <span>
          <target id="t52"/>
        </span>
      </t>
      <!--a-->
      <t id="ter53">
        <span>
          <target id="t53"/>
        </span>
      </t>
      <!--little-->
      <t id="ter54">
        <span>
          <target id="t54"/>
        </span>
      </t>
      <!--pricey-->
      <t id="ter55">
        <span>
          <target id="t55"/>
        </span>
      </t>
      <!--for-->
      <t id="ter56">
        <span>
          <target id="t56"/>
        </span>
      </t>
      <!--me-->
      <t id="ter57">
        <span>
          <target id="t57"/>
        </span>
      </t>
      <!--...-->
      <t id="ter58">
        <span>
          <target id="t58"/>
        </span>
      </t>
      <!--but-->
      <t id="ter59">
        <span>
          <target id="t59"/>
        </span>
      </t>
      <!--other-->
      <t id="ter60">
        <span>
          <target id="t60"/>
        </span>
      </t>
      <!--than-->
      <t id="ter61">
        <span>
          <target id="t61"/>
        </span>
      </t>
      <!--that-->
      <t id="ter62">
        <span>
          <target id="t62"/>
        </span>
      </t>
      <!--,-->
      <t id="ter63">
        <span>
          <target id="t63"/>
        </span>
      </t>
      <!--everything-->
      <t id="ter64">
        <span>
          <target id="t64"/>
        </span>
      </t>
      <!--was-->
      <t id="ter65">
        <span>
          <target id="t65"/>
        </span>
      </t>
      <!--perfect-->
      <t id="ter66">
        <span>
          <target id="t66"/>
        </span>
      </t>
      <!--and-->
      <t id="ter67">
        <span>
          <target id="t67"/>
        </span>
      </t>
      <!--I-->
      <t id="ter68">
        <span>
          <target id="t68"/>
        </span>
      </t>
      <!--would-->
      <t id="ter69">
        <span>
          <target id="t69"/>
        </span>
      </t>
      <!--definitely-->
      <t id="ter70">
        <span>
          <target id="t70"/>
        </span>
      </t>
      <!--stay-->
      <t id="ter71">
        <span>
          <target id="t71"/>
        </span>
      </t>
      <!--here-->
      <t id="ter72">
        <span>
          <target id="t72"/>
        </span>
      </t>
      <!--again-->
      <t id="ter73">
        <span>
          <target id="t73"/>
        </span>
      </t>
      <!--!-->
      <t id="ter74">
        <span>
          <target id="t74"/>
        </span>
      </t>
      <!--Tree edges-->
      <edge id="tre132" from="nter89" to="nter88"/>
      <edge id="tre133" from="nter90" to="nter89"/>
      <edge id="tre134" from="nter91" to="nter90"/>
      <edge id="tre135" from="nter92" to="nter91" head="yes"/>
      <edge id="tre136" from="nter93" to="nter92"/>
      <edge id="tre137" from="ter44" to="nter93"/>
      <edge id="tre138" from="nter94" to="nter92"/>
      <edge id="tre139" from="ter45" to="nter94"/>
      <edge id="tre140" from="nter95" to="nter92" head="yes"/>
      <edge id="tre141" from="ter46" to="nter95"/>
      <edge id="tre142" from="nter96" to="nter91"/>
      <edge id="tre143" from="nter97" to="nter96" head="yes"/>
      <edge id="tre144" from="nter98" to="nter97"/>
      <edge id="tre145" from="nter99" to="nter98" head="yes"/>
      <edge id="tre146" from="ter47" to="nter99"/>
      <edge id="tre147" from="nter100" to="nter97" head="yes"/>
      <edge id="tre148" from="nter101" to="nter100" head="yes"/>
      <edge id="tre149" from="ter48" to="nter101"/>
      <edge id="tre150" from="nter102" to="nter100"/>
      <edge id="tre151" from="nter103" to="nter102" head="yes"/>
      <edge id="tre152" from="ter49" to="nter103"/>
      <edge id="tre153" from="nter104" to="nter102"/>
      <edge id="tre154" from="nter105" to="nter104"/>
      <edge id="tre155" from="ter50" to="nter105"/>
      <edge id="tre156" from="nter106" to="nter104" head="yes"/>
      <edge id="tre157" from="ter51" to="nter106"/>
      <edge id="tre158" from="nter107" to="nter90" head="yes"/>
      <edge id="tre159" from="nter108" to="nter107" head="yes"/>
      <edge id="tre160" from="ter52" to="nter108"/>
      <edge id="tre161" from="nter109" to="nter107"/>
      <edge id="tre162" from="nter110" to="nter109" head="yes"/>
      <edge id="tre163" from="nter111" to="nter110"/>
      <edge id="tre164" from="ter53" to="nter111"/>
      <edge id="tre165" from="nter112" to="nter110"/>
      <edge id="tre166" from="ter54" to="nter112"/>
      <edge id="tre167" from="nter113" to="nter110" head="yes"/>
      <edge id="tre168" from="ter55" to="nter113"/>
      <edge id="tre169" from="nter114" to="nter109"/>
      <edge id="tre170" from="nter115" to="nter114" head="yes"/>
      <edge id="tre171" from="ter56" to="nter115"/>
      <edge id="tre172" from="nter116" to="nter114"/>
      <edge id="tre173" from="nter117" to="nter116" head="yes"/>
      <edge id="tre174" from="ter57" to="nter117"/>
      <edge id="tre175" from="nter118" to="nter89"/>
      <edge id="tre176" from="ter58" to="nter118"/>
      <edge id="tre177" from="nter119" to="nter89"/>
      <edge id="tre178" from="ter59" to="nter119"/>
      <edge id="tre179" from="nter120" to="nter89" head="yes"/>
      <edge id="tre180" from="nter121" to="nter120"/>
      <edge id="tre181" from="nter122" to="nter121"/>
      <edge id="tre182" from="nter123" to="nter122" head="yes"/>
      <edge id="tre183" from="ter60" to="nter123"/>
      <edge id="tre184" from="nter124" to="nter122"/>
      <edge id="tre185" from="nter125" to="nter124" head="yes"/>
      <edge id="tre186" from="ter61" to="nter125"/>
      <edge id="tre187" from="nter126" to="nter124"/>
      <edge id="tre188" from="nter127" to="nter126" head="yes"/>
      <edge id="tre189" from="ter62" to="nter127"/>
      <edge id="tre190" from="nter128" to="nter121"/>
      <edge id="tre191" from="ter63" to="nter128"/>
      <edge id="tre192" from="nter129" to="nter121"/>
      <edge id="tre193" from="nter130" to="nter129" head="yes"/>
      <edge id="tre194" from="ter64" to="nter130"/>
      <edge id="tre195" from="nter131" to="nter121" head="yes"/>
      <edge id="tre196" from="nter132" to="nter131" head="yes"/>
      <edge id="tre197" from="ter65" to="nter132"/>
      <edge id="tre198" from="nter133" to="nter131"/>
      <edge id="tre199" from="nter134" to="nter133" head="yes"/>
      <edge id="tre200" from="ter66" to="nter134"/>
      <edge id="tre201" from="nter135" to="nter120"/>
      <edge id="tre202" from="ter67" to="nter135"/>
      <edge id="tre203" from="nter136" to="nter120" head="yes"/>
      <edge id="tre204" from="nter137" to="nter136"/>
      <edge id="tre205" from="nter138" to="nter137" head="yes"/>
      <edge id="tre206" from="ter68" to="nter138"/>
      <edge id="tre207" from="nter139" to="nter136" head="yes"/>
      <edge id="tre208" from="nter140" to="nter139" head="yes"/>
      <edge id="tre209" from="ter69" to="nter140"/>
      <edge id="tre210" from="nter141" to="nter139"/>
      <edge id="tre211" from="nter142" to="nter141" head="yes"/>
      <edge id="tre212" from="ter70" to="nter142"/>
      <edge id="tre213" from="nter143" to="nter139"/>
      <edge id="tre214" from="nter144" to="nter143" head="yes"/>
      <edge id="tre215" from="ter71" to="nter144"/>
      <edge id="tre216" from="nter145" to="nter143"/>
      <edge id="tre217" from="nter146" to="nter145" head="yes"/>
      <edge id="tre218" from="ter72" to="nter146"/>
      <edge id="tre219" from="nter147" to="nter143"/>
      <edge id="tre220" from="nter148" to="nter147" head="yes"/>
      <edge id="tre221" from="ter73" to="nter148"/>
      <edge id="tre222" from="nter149" to="nter89"/>
      <edge id="tre223" from="ter74" to="nter149"/>
    </tree>
  </constituency>
  <coreferences>
    <coref coid="co1">
      <!--I-->
      <span>
        <target id="t47"/>
      </span>
      <!--I-->
      <span>
        <target id="t1"/>
      </span>
      <!--I-->
      <span>
        <target id="t68"/>
      </span>
      <!--me-->
      <span>
        <target id="t57"/>
      </span>
    </coref>
    <coref coid="co2">
      <!--It-->
      <span>
        <target id="t6"/>
      </span>
      <!--this hotel-->
      <span>
        <target id="t3"/>
        <target id="t4"/>
      </span>
    </coref>
  </coreferences>
  <features>
    <properties>
      <property pid="p1" lemma="value_for_money">
        <references>
          <!--pricey-->
          <span>
            <target id="t55"/>
          </span>
        </references>
      </property>
      <property pid="p2" lemma="bathroom">
        <references>
          <!--bathroom-->
          <span>
            <target id="t32"/>
          </span>
        </references>
      </property>
      <property pid="p3" lemma="room">
        <references>
          <!--room-->
          <span>
            <target id="t27"/>
          </span>
        </references>
      </property>
      <property pid="p4" lemma="restaurant">
        <references>
          <!--restaurant-->
          <span>
            <target id="t21"/>
          </span>
          <!--food-->
          <span>
            <target id="t24"/>
          </span>
        </references>
      </property>
      <property pid="p5" lemma="cleanliness">
        <references>
          <!--clean-->
          <span>
            <target id="t9"/>
          </span>
        </references>
      </property>
      <property pid="p6" lemma="location">
        <references>
          <!--close-->
          <span>
            <target id="t14"/>
          </span>
        </references>
      </property>
      <property pid="p7" lemma="breakfast">
        <references>
          <!--breakfast-->
          <span>
            <target id="t51"/>
          </span>
        </references>
      </property>
    </properties>
  </features>
  <opinions>
    <opinion oid="o1">
      <opinion_holder>
        <!--I-->
        <span>
          <target id="t1"/>
        </span>
      </opinion_holder>
      <opinion_expression polarity="positive" strength="1">
        <!--loved-->
        <span>
          <target id="t2"/>
        </span>
      </opinion_expression>
    </opinion>
    <opinion oid="o2">
      <opinion_expression polarity="positive" strength="1">
        <!--very clean-->
        <span>
          <target id="t8"/>
          <target id="t9"/>
        </span>
      </opinion_expression>
    </opinion>
    <opinion oid="o3">
      <opinion_expression polarity="positive" strength="1">
        <!--close enough to walk to-->
        <span>
          <target id="t14"/>
          <target id="t15"/>
          <target id="t16"/>
          <target id="t17"/>
          <target id="t18"/>
        </span>
      </opinion_expression>
    </opinion>
    <opinion oid="o4">
      <opinion_expression polarity="positive" strength="1">
        <!--delicious-->
        <span>
          <target id="t23"/>
        </span>
      </opinion_expression>
    </opinion>
    <opinion oid="o5">
      <opinion_expression polarity="positive" strength="1">
        <!--bright-->
        <span>
          <target id="t29"/>
        </span>
      </opinion_expression>
    </opinion>
    <opinion oid="o6">
      <opinion_expression polarity="positive" strength="1">
        <!--modern-->
        <span>
          <target id="t34"/>
        </span>
      </opinion_expression>
    </opinion>
    <opinion oid="o7">
      <opinion_expression polarity="negative" strength="1">
        <!--100x better than staying in a hostel !-->
        <span>
          <target id="t36"/>
          <target id="t37"/>
          <target id="t38"/>
          <target id="t39"/>
          <target id="t40"/>
          <target id="t41"/>
          <target id="t42"/>
          <target id="t43"/>
        </span>
      </opinion_expression>
    </opinion>
    <opinion oid="o8">
      <opinion_holder>
        <!--I-->
        <span>
          <target id="t68"/>
        </span>
      </opinion_holder>
      <opinion_target>
        <!--here-->
        <span>
          <target id="t72"/>
        </span>
      </opinion_target>
      <opinion_expression polarity="positive" strength="1">
        <!--perfect-->
        <span>
          <target id="t66"/>
        </span>
      </opinion_expression>
    </opinion>
  </opinions>
</KAF>
```
