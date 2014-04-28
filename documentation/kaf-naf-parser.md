---
layout: default
title: kaf-naf parser
sidebar: documentation

---



<div id='readme'></div>
kaf-naf-parser
==============

This library converts KAF to NAF and NAF to KAF. It also contains a webservice
for doing exactly this.

It uses slightly altered 
distributions of the VUA_pylib and KafNafParserPy but it keeps the external 
libraries contained, so that shouldn't influence anything on your system.

This does mean however, that changes to the VUA_pylib and KafNafParserPy are not
automatically resembled in the kaf-naf-parser.

It ships with 3 command line tools and a webservice:

```
kaf-to-naf
naf-to-kaf
kaf-naf-parser
kaf-naf-parser-server
```

It works like this:

```
cat some_kaf.kaf | kaf-to-naf > output.naf
cat some_naf.naf | naf-to-kaf > output.kaf

cat some_kaf.kaf | kaf-naf-parser --tonaf > output.naf
```

The webservice can be started like this:

```
naf-to-kaf-parser-server
```
And can then be accessed at: http://localhost:9292

Easiest way to install the gem:

```
git clone git@github.com:opener-project/kaf-naf-parser.git
cd kaf-naf-parser
rake install
```

