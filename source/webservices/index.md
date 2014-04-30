---
layout: default
title: OpeNER - Webservices
sidebar: webservices
---

<div id="introduction"></div>

# Webservices
Put some generic text on the webservices here. Foo

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
