---
layout: default
title: Tree Tagger
sidebar: documentation

---



<div id='readme'></div>

[![Build Status](https://drone.io/github.com/opener-project/VU-tree-tagger_kernel/status.png)](https://drone.io/github.com/opener-project/VU-tree-tagger_kernel/latest)

# Opener::TreeTagger

Opener Tree Tagger
==================

This module implements a wrapper to process text with the PoS tagger TreeTagger. TreeTagger is a tool that assigns the lemmas and part-of-speech information to an input text.
This module takes KAF as input, with the token layer created (for instance by one of our tokenizer modules) and outputs KAF with a new term layer. It is important to note
that the token layer in the input is not modified in the output, so the program takes care of performing the correct matching between the term and the token layer.

By default this module works for text in English, Dutch and German, but can be easily extended to other languages. The language of the input KAF text has to be specified through
the attribute xml:lang in the main KAF element.

Initial version
----------------

This module has a dependency on the following external module:
TreeTagger (http://www.ims.uni-stuttgart.de/projekte/corplex/TreeTagger/)
More information is further down in this document.

Installation
------------

Add this line to your application's Gemfile:

    gem 'opener-tree-tagger', :git=>"git@github.com/opener-project/opener-tree-tagger.git"

And then execute:
````shell
$ bundle install
`````

Or install it yourself as:
````shell
$ gem specific_install opener-tree-tagger -l https://github.com/opener-project/opener-tree-tagger.git
````

If you dont have specific_install already:
````shell
    $ gem install specific_install
````

Finally you have to indicate to your program where TreeTagger is installed in your machine, which is a requirement. If TreeTagger is not installed in your machine
you can download it from http://www.ims.uni-stuttgart.de/projekte/corplex/TreeTagger/ and follow the installation instructions. To indicate to our scripts where
TreeTagger is located, you have to set an environment variable with the
location:

```shell
export TREE_TAGGER_PATH=/usr/local/TreeTagger/
```

It is advised you add the path to the tree tagger in your bash or zsh profile by
adding it to ```~/.bash_profile``` or ```~/.zshrc```


Usage
----

Once installed as a gem you can access the gem from anywhere. The input has to be KAF format with the token layer created.

````shell
cat input.token.kaf | opener-tree-tagger > output.token.term.kaf
````

In the file output.token.term.kaf we will have the KAF file extended with the term layer (containing both lemma and PoS information)


## Contributing

1. Pull it
2. Create your feature branch (`git checkout -b features/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin features/my-new-feature`)
5. If you're confident, merge your changes into master.
