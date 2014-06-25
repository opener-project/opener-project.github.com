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

### Named Entity Disambiguation (NED)

| Tool        | Language | Precision | Recall | F-Score   | method | Dataset   |
| ----------- |:--------:|:-----:|:-----:|:-----:|:-----:|:-----:|
| ned | en | 87,31% | 61,83% |	72,39% |	Spotlight |	TAC KBP 2011 |
| ned | en | 81,94% | 71,12% |	76,15% |	Spotlight |	AIDA |
| ned | es | 78,92% | 58,40% |	67,13% |	Spotlight |	TAC KBP 2012 |

### Constituency parser

| Tool        | Language | Precision | Recall | F-Score   | method | Dataset   |
| ----------- |:--------:|:-----:|:-----:|:-----:|:-----:|:-----:|
| constituent-parser | en | 86,90% |	87,32% |	87,11% |	Maximum Entropy	Penn Treebank |
| constituent-parser | es | 86,34% |	87,25% |	86,79% |	Maximum Entropy	Ancora 3K sentence evaluation, rest for training |

### Coreference resolution

| Tool        | Language | F-Score   | method | Dataset   |
| ----------- |:--------:|:-----:|:-----:|:-----:|
| coreference | en | 69,0% | Multisieve | MUC |
| coreference | en | 61,2% | Multisieve | B3 |
| coreference | en | 54,5% | Multisieve | CEAFe |
| coreference | en | 65,0% | Multisieve | BLANC |
| coreference | en | 61,5% | Multisieve | CoNLL |

### Opinion detector

| Tool        | Language | Precision | Recall | F-Score   | method | Dataset   |
| ----------- |:--------:|:-----:|:-----:|:-----:|:-----:|:-----:|
|Opinion detector basic |	en | 62,0% |	46,3% | 53,01% |	Rules	| OpeNER manual hotel annotations |
|Opinion detector deluxe |	en |	85,52% |	58,45% |	69,44% |	CRF + SVM |	OpeNER manual hotel annotations |
|Opinion detector basic |	nl |	48,22% |	31,39% |	38,03% |	Rules |	OpeNER manual hotel annotations |
|Opinion detector deluxe |	nl |	82,8% |	51,77% |	63,71% |	CRF + SVM |	OpeNER manual hotel annotations |
|Opinion detector basic |	de |	56,22% |	35,6% |	43,59% |	Rules |	OpeNER manual hotel annotations |
|Opinion detector deluxe |	de |	75,64% |	48,88% |	59,38% |	CRF + SVM |	OpeNER manual hotel annotations |
|Opinion detector basic |	es |	26,11% |	6,14% |	9,94% |	Rules |	OpeNER manual hotel annotations |
|Opinion detector deluxe |	es |	74,41% |	46,55% |	57,27% |	CRF + SVM |	OpeNER manual hotel annotations |
|Opinion detector basic |	it	|	26,94% |	33,49% |	29,86% |	Rules |	OpeNER manual hotel annotations |
|Opinion detector deluxe |	it |	65,47% |	40,39% |	49,96% |	CRF + SVM |	OpeNER manual hotel annotations |
|Opinion detector basic |	fr |	37,02% |	34,71% |	35,83% |	Rules	| OpeNER manual hotel annotations |
|Opinion detector deluxe |	fr	|	70,94% |	46,28% |	56,02% |	CRF + SVM |	OpeNER manual hotel annotations |







