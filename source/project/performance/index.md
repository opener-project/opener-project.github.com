---
layout: default
title: OpeNER Lexicons
sidebar: project
---


### Language identifier

| Tool        | Language | Accuracy    | method | Dataset   |
| ----------- |:--------:|:-----:|:-----:|:-----:|:------:|----------:|
| Language Identifier         | en  |  99,51%   | Bayesian methods | Leipzig Corpus Collection, 10-20 words per sentence: http://corpora.uni-leipzig.de/download |
| Language Identifier         | es  |  99,03%   | Bayesian methods | Leipzig Corpus Collection, 10-20 words per sentence: http://corpora.uni-leipzig.de/download |
| Language Identifier         | fr  |  99,08%   | Bayesian methods | Leipzig Corpus Collection, 10-20 words per sentence: http://corpora.uni-leipzig.de/download |
| Language Identifier         | it  |  99,38%   | Bayesian methods | Leipzig Corpus Collection, 10-20 words per sentence: http://corpora.uni-leipzig.de/download |
| Language Identifier         | de  |  99,73%   | Bayesian methods | Leipzig Corpus Collection, 10-20 words per sentence: http://corpora.uni-leipzig.de/download |
| Language Identifier         | nl  |  99,31%   | Bayesian methods | Leipzig Corpus Collection, 10-20 words per sentence: http://corpora.uni-leipzig.de/download |


### Tokenizer

| Tool        | Language | Accuracy    | method | Dataset   |
| ----------- |:--------:|:-----:|:-----:|:-----:|:------:|----------:|
| Tokenizer-base | 20 langs, evaluated with French | 98,44% | Regex and Nonbreaking Prefixes | ESTER Corpus test dataset, http://catalog.elra.info/product_info.php?products_id=999 |

### Part-of-speech tagger

| Tool        | Language | Accuracy    | method | Dataset   |
| ----------- |:--------:|:-----:|:-----:|:-----:|:------:|----------:|
| Pos-tagger-en-es | en | 96,66% | Perceptron | Penn TreeBank |
| Pos-tagger-en-es | es | 96,66% | Perceptron | Penn TreeBank |
| Pos-tagger-en-es | fr | 94,9% | Maximum Entropy | French Treebank test dataset, http://www.llf.cnrs.fr/Gens/Abeille/French-Treebank-fr.php |
| Pos-tagger-en-es | it | 92,19% | Perceptron | "PAROLE corpus, small sample https://sites.google.com/site/francescafrontini/resources-materials#opener-tagger-it" |

### Named Entity Recognition and Classification (NERC)

| Tool        | Language | Precision | Recall | F-Score   | method | Dataset   |
| ----------- |:--------:|:-----:|:-----:|:-----:|:-----:|:-----:|
| ner-base | en | 89,39% |	85,19% |	87,24% | Perceptron + Dictionaries | CoNLL 2003 |
| ner-base | es | 79,91% |	80,58% |	80,24% | Maximum Entropy | CoNLL 2002 |
| ner-base | fr | 86,15% |	75,69% |	80,58% | Maximum Entropy | ESTER corpus |
| ner-base | it | 81,15% |	62,70% |	70,74% | Perceptron + Dictionaries | Evalita 2007 |
| ner-base | de | 84,02% |	58,56% |	69,02% |	Perceptron |	CoNLL 2003 |
| ner-base | nl | 79,85% |	75,41% |	77,57% |	Perceptron |	CoNLL 2002 |







