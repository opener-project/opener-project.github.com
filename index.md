---
layout: page
title: Opener Project
tagline: Language Analysis for the rest of us
---
{% include JB/setup %}

Read [Opener Quick Start]()

## Introduction

Customer reviews and ratings on the Internet are increasing importance in the evaluation of products and services by potential customers. In certain sectors, it is even becoming a fundamental variable in the purchase decision. A recent Forrester study showed more than 30% of Internet users have evaluated products online, and that 70% of those studied end user generated reviews.

This trend will continue with the growth of Social Media and access to Information andCommunication Technologies (ICT). Consumers tend to trust the opinion of other consumers, especially those with prior experience of a product or service, rather than company marketing. The role of user comments is of particular importance when there is little differentiation between the product offers.

Sentiment Analysis and Opinion Mining are established, although nascent, fields of research, development and innovation. The goal is always broadly the same; to know “Who” is speaking about “What”, “When” and in “What sense”.

These factors have led to a burgeoning industry with a plethora of companies offering Sentiment Analysis services in Social Media. While most offer a generic service, in typically just one language, several companies have specialised offering services specific to tourism due to its bounded domain, demonstrable value, and the high level of adoption of Internet technologies by both suppliers and consumers.

## Hospitality Domain

It is also an application domain with limited scope and variation, and a high dependency on multilingual sentiment analysis and detection and classification of a wide range of common Named Entities.

## Named Entity Recognition

Named Entity Recognition and Classification (NERC) are important in determining roles. Once multilingualism and cultural skew are introduced, the complexity of the challenge increases manifold. OpeNER will create base technologies for Cross-lingual NERC and Sentiment Analysis that will enable industry users to both implement and contribute to a basic set of core technologies that all require and allow them to focus their efforts on providing tailored and innovative solutions at the rules and analysis levels.

The OpeNER project will provide a rich Named Entity Data Source in a simple, structured and standardised format. The Named Entity Detection will be capable of marking Named Entities in the same format irrespective of the text under analysis or the language of the text. The project will also provide linking modules that are capable of matching locally detected Named Entities with generic data.

## Sample Posts

Keep up to date with the latest developments by reading this posts.

Here's a sample "posts list".

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
