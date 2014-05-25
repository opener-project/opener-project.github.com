---
layout: default
title: OpeNER - Webservices
sidebar: webservices
---

<div id="introduction"></div>

# Webservices

Go to the [Entrace page of the webservices to try the webservices immediately](/webservices/entrance.html). There
you will find a form where you can copy paste some text, press a button, and be
up and running in no-time.

{% for cluster in page.clusters %}

<div id="{{cluster.name | handle}}"></div>

## {{cluster.name }}

-------------------

{{ cluster.description }}

{% for component in cluster.components %}
<div id="{{component.name | handle}}"></div>

### {{component.name }}

{{component.description}}

More information about the webserice can be found at its endpoint. The endpoint for this webservice is:
[{{component.webservice}}]({{component.webservice}}).

{% endfor %}


{% endfor %}
