---
layout: default
title: OpeNER - Webservices
sidebar: webservices
---

<div id="introduction"></div>

# Webservices

{% for cluster in page.clusters %}

<div id="{{cluster.name | handle}}"></div>

## {{cluster.name }}

-------------------

{{ cluster.description }}

{% for component in cluster.components %}
<div id="{{component.name | handle}}"></div>

### {{component.name }}

{{component.description}}

{% if component.webservice %}
More information about the webservice can be found at its endpoint. The endpoint for this webservice is:
[{{component.webservice}}]({{component.webservice}}).
{% endif %}



{% endfor %}


{% endfor %}
