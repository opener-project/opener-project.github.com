---
layout: page
title: VUA tools
description: Description of the VUA tools
---
{% include JB/setup %}

This is the description of the two main tools developed by the VUA.

## Polarity tagging

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


## Opinion detection

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





