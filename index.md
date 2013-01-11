---
layout: page
title: Opener Project
tagline: Language Analysis for the rest of us
---
{% include JB/setup %}

Read [Opener Quick Start]()

## Introduction


## Sample Posts

Keep up to date with the latest developments by reading this posts.

Here's a sample "posts list".

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
