---
layout: default
title: kaf2json
sidebar: documentation
webservice: http://opener.olery.com/kaf2json
repository: https://github.com/opener-project/kaf-to-json

---



<div id='readme'></div>

#KAF to JSON

Even if KAF is the true OpeNER data representation format, it is not very friendly for humans. It is also difficult to parse and work with it, specially for new users that are not familiarized with KAF.

This is part of the feedback we got from the OpeNER hackathon held in Amsterdam during first days of July.

To ease the post-processing of the results by any potential user, we are designing an alternative JSON format to output translate KAF, and turn its complexity into a much more usable format.

Although, the specification for this JSON is currently work in progress, we have already a version that covers the most relevant parts from the KAF representation.

The following files:

* [kaf1.xml](kaf1.xml): Contains an example of the KAF file.
* [kaf2json.xsl](kaf2json.xsl): Contains the xsl schema that converts KAF to JSON.
