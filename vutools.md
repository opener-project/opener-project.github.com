---
layout: page
title: VUA tools
description: Description of the VUA tools
---
{% include JB/setup %}

This is the description of the two main tools developed by the VUA.

## Polarity tagger

The polarity tagging is a task by means terms in a text are tagged with their correct polarity and sentiment modifier label.

Words with polarity are words that express a negative or positive opinion, belief, attitude, etc. towards a certain topic. In our case polarity refers to out of context or “prior” polarity (Wilson et al. 2005),
i.e. to words which  evoke something positive or negative independent from the context in which they are found.  Polarity words can be nouns, verbs, adjectives and adverbs. The following examples contain negative polarity lemma's like ruin, debt,
problem and complaint and positive polarity lemma's like pleasant, enjoy
and delicious:

+ Look, it seriously *ruined* our trip to Athens … 
+ In 2004 the president said that he felt that the *debt* was an enormous *problem*
+ The stay was very **pleasant** and I have no *complaint* whatsoever
+ We really **enjoyed** the **delicious** food

Sentiment modifiers are words that change or modify in certain way the polarity of a word or expression. We differenciate three subtypes of sentiment modifiers: intensifiers, weakeners and polarity shifters.
Intensifiers (enormous, seriouly) and weakeners (relatively) are words that
intensify or weaken the strength of an expression or polarity word. Polarity shifters (not, no, never) are negations which shift the polarity of an opinion word from positive to negative or vice versa. Here some examples are shown in italics:
+ In 2004 the president said that he felt that the debt was an *enormous* problem 
+ Look, it *seriously* ruined our trip to Athen… 
+ The standard room was *relatively* large
+ The hotel's location was *not* a very interesting part of town
+ The stay was very pleasant and I have *no* complaint whatsoever
+ Will *never* return.


## Opinion detector

Opinion detection...



