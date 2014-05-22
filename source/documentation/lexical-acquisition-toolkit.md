---
layout: default
title: Lexical acquisition toolkit
sidebar: documentation
webservice: http://opener.olery.com/lexical-acquisition-toolkit

---



<div id='readme'></div>

#Acquisition of expressions and targets lexicons from a domain#


This toolkit allows to generate domain specific lexicons:
* Polarity or expression lexicons: lexicons with words in the specific domain used to state opinions
* Target or property lexicons: lexicons with expressions that represent properties of the entities
represented in the given domain (for a hotel review domain, these properties could be the rooms, the staff
or the ambience). 

Usually the polarity expressions are used to give opinions about properties.

Two approaches for automatically generating these domains have been implemented
and are available within this toolkit:
* Supervised acquisition: from domain annotated data
* Unsupervised acquisition: from raw data belonging to the domain

##Supervised Acquisition##

This approach is implemented in the script `acquire_from_annotated_data.py`. It basically takes as input
a set of KAF/NAF files annotated with opinions (targets, holders and expressions), and generates 2 CSV
output files with the most relevant expressions and targets. You can call directly to the script with
the option -h or --help to see the parameters:

```shell
$ acquire_from_annotated_data.py -h
usage: acquire_from_annotated_data.py [-h] (-l file_with_list | -f folder)
                                      -exp_csv expressions_file.csv -tar_csv
                                      targets_file.csv

Extract expressions and targets from annotated data

optional arguments:
  -h, --help            show this help message and exit
  -l file_with_list, --list file_with_list
                        A file with a list of paths to KAF/NAF files
  -f folder, --folder folder
                        A folder with KAF/NAF files
  -exp_csv expressions_file.csv
                        CSV file to store the expressions
  -tar_csv targets_file.csv
                        CSV file to store the targets

```

The input KAF/NAF files can be specified using in 2 exclusive ways:
* Providing a file which contains a list of paths to the annotated files (one per line) (option -l / --list)
* Providing a folder which contains the annotated files, all files with extension .kaf or .naf will be processed
(option -f / --folder)

There are two mandatory output parameters to specify where the expression and targets lexicons must be stored (the
options -exp_cvs and -tar_csv. 

The script also prints the lexicons on the standard output in a more user readable way, as well as some debugging
information on the error output. One example of usage of this program would be:

```shell
acquire_from_annotated_data.py -f ~/data/hotel -exp_csv my_expressions.csv -tar_csv my_targets.csv > log.out 2> log.err
```

This would read all the KAF/NAF files in the folder ~/data/hole and store the output in the file log.out, the debugging information in the file log.err, and the resulting
lexicons in CSV format on the files my_expressions.csv and my_targets.csv respectively.

##Unsupervised Acquisition##

With this approach it is possible to build an expression and a target lexicon from raw data from the domain. The method is based on patterns and frequency distribution of words in our new domain,
so usually the larger our domain corpus is, the best lexicon we will get. The process is divided into 3 steps:
* Data preparation
* Creation of the indexes
* Running the lexicon creator

###Data preparation###

We need first to annotate all the data that we have with this information:
* Token and sentence information: which is provided by our tokenisers (https://github.com/opener-project/tokenizer)
* Lemma and part-of-speech information: which is provided by our pos-taggers (https://github.com/opener-project/pos-tagger https://github.com/opener-project/opener-tree-tagger)

So you will need to tag all your plain files with the required information using these 2 tools and store all the resulting KAF files within a folder (is not necessary but it is the easiest)

###Creation of the indexes###

This tool reads all the KAF files created in the previous step and generates several indexes with ngram frequencies and extra information that will be used in the last step when creating the lexicons.
This step needs to be performed just once, so when you create the indexes from your KAF files, you can reuse these indexes as many times as you want, and they implement a cache optimisation for making
the queries more efficiently. The script which implements this is "create_index.py". It accepts a list of parameters to customize the indexes, you can check the accepted parameters by calling to the script
with the option -h:

````shell
create_index.py -h
usage: create_index.py [-h]
                       (-input_file file_with_list | -input_folder folder)
                       -output folder
                       [-punc punctuation_symbols default ".?;!")] [-no_lower]
                       [-max_ngram integer (default 3)]
                       [-min_ngram integer (default 1)] [-no_sent_borders]
                       [-no_remove_out] [-min_freq integer (default 1]

Create n-gram indexes from a set of KAF/NAF files

optional arguments:
  -h, --help            show this help message and exit
  -punc punctuation_symbols (default ".?;!")
                        Symbols to be considered as punctuation
  -no_lower             Tokens are NOT converted to lowercase (by default they
                        are)
  -max_ngram integer (default 3)
                        Maximum size of n-grams to create
  -min_ngram integer (default 1)
                        Mininum size of n-grams to create
  -no_sent_borders      Sentence delimiters are NOT included (by default they
                        are)
  -no_remove_out        Output folder is not removed if exists
  -min_freq integer (default 1)
                        Minimum frequency allowed for ngram

Required arguments:
  -input_file file_with_list
                        File with a list of paths to KAF/NAF files, one per
                        line
  -input_folder folder  Folder with a set of KAF/NAF files
  -output folder        Output folder to store the indexes
````

The only required arguments are those to specify the input files (via a folder or via a file with a list of paths to your KAF files), and the name of the output folder where you want to store the new indexes. The rest
of parameters are used to specify some characteristics of your ngram indexes, like the maximum length of the ngram (-max_ngram), the minimum frequency allowed for an ngram in your index (-min_freq). So considering
you have all your KAF (with tokens and terms) in a folder called my_kaf_files, you want to create indexes for ngram with length up to 3 and with minimum frequency of 2, and you want to store the indexes in my_indexes, you
should run this command:
````shell
create_index.py -input_folder my_kaf_files -max_ngram 3 -min_freq 2 -output my_indexes
````

Once you have created this index you can reuse it as many times as you want. It has implemented an internal cache for speeding up queries already done, so the first time you use the indexes the speed could be low if you
are using large datasets or creating indexes for long ngrams (usually in these cases by forcing each ngram to appear at least twice with the option -min_freq 2 for the create_index.py).


###Lexicon creator###

Once you have created the index of ngram frequencies, you can create the lexicons. You will have to provide with a small amount of information to represent your domain. We provide in the toolkit with some example
files that you can use as an start or modify to suit your needs. These are the three pieces of information required:
* A list of polarity seeds along with the polarity of those words in your domain
* A list of patterns that represent the relation between polarity words and targets/aspects in your domain
* A list of patterns that represent usages of polarity words with the same/opposite polarity

This is an example the polarity seed file, where there is a polarity word per line and a symbol + or - depending on the polarity of this word:

````shell
good +
bad -
nice +
ugly -
````

This is an example of the relational patterns. Each line contains a pattern with the placeholders [EXP] representing the polarity word and [TAR] standing for the target or aspect
````shell
a [EXP] [TAR]
the [EXP] [TAR]
````

And finally below you can see and example of the patterns that represents usages of words with the same polarity. There is one pattern per line, with the placeholders [A] and [B] representing the polarity words
, and the firs symbol of the line can be either = or ! indicating that the pattern represents an example of words with the same polarity (=) or with opposite polarities (!)
````shell
= [A] and [B]
= [A] and very [B]
! [A] but [B]
````

As already said, in the subfolder `resources` you can find some examples of these files, that you could you straight forward or adapt them.

Once you have these three list ready and the index created, you can run the lexicon creator. The script is `acquire_from_raw_data.py`. The usage and possible parameteres are shown by calling to the script with the -h argument.
````shell
acquire_from_raw_data.py -h
usage: acquire_from_raw_data.py [-h] -index index_folder -seeds
                                file_with_seeds -patterns file_with_patterns
                                -p_pol file_with_patterns [-lang, lang_code]
                                [-no_verbose] [-min_freq integer]
                                [-target_pos list of tags "N R G"]
                                [-expression_pos list of tags "N R G"]
                                [-max_iter integer]

Creates expression and target lexicons from domain raw data

optional arguments:
  -h, --help            show this help message and exit
  -lang, lang_code, -l lang_code
                        Force to use this lang, otherwise the language from
                        the indexs is used
  -no_verbose           No verbose log information
  -min_freq integer, -mf integer
                        Minimum frequency allowed for a query (default 1)
  -target_pos list of tags "N R G"
                        Allowed pos tags for targets (default "N" nouns) Use
                        ALL for all possible pos
  -expression_pos list of tags "N R G"
                        Allowed pos tags for expressions (default "G"
                        adjectives) Use ALL for all possible pos
  -max_iter integer     Maximum number of iterations (default 5)

Required arguments:
  -index index_folder   Folder with ngram indexes
  -seeds file_with_seeds, -s file_with_seeds
                        File with seeds, one per line
  -patterns file_with_patterns, -p file_with_patterns
                        File with patterns, one per line (example-> "a [Exp]
                        [Tar]")
  -p_pol file_with_patterns
                        File with patterns for guessing the polarity, one per
                        line (example-> "# [A] and [B]")
````

The required parameters are the folder where we stored our indexes and the three lists of seeds and patterns. The rest of parameters are optional, and the values
used by default if they are not specified can be seen in the help output of the script. If you want to create the lexicons using the indexes stored in my_indexes
and the examples files provided for English, you should run:
````shell
acquire_from_raw_data.py -index my_indexes -seeds resources/seeds/en.txt -patterns resources/patterns/en.txt -p_pol resources/patterns_guess_polarity/en.txt
````

##Installation##
The only requirement of this toolkit is to have installed the KafNafParserPy, which can be found at https://github.com/opener-project/KafNafParserPy
Then you need only to make sure the KafNafParserPy library is on the Python path and clone this repository.


##Contact##
* Ruben Izquierdo
* Vrije University of Amsterdam
* ruben.izquierdobevia@vu.nl