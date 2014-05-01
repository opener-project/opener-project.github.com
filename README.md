Template for OpeNER Jekyll Website
==================================

The OpeNER portal (http://opener-project.github.io) contains all information you
need to get up and running with OpeNER language technologies in minutes. 

This repository is a bid odd. The actual SOURCE of the repository can be found
in the SOURCE dir. the root of this repository contains the compiled source of
the website.

Also, some documentation is actually taken from specific files from different
repositories. So to answer the most pressing questions.

Keep in mind: Github pages, and therefore this portal uses Jekyll to build the
website. Please find [all you need to know about Jekyll
here](http://jekyllrb.com)

Setup
-----

When working with the portal, please clone this repository and then run:

```
bundle install
```

You're all good to go now.


How to update text in general
-----------------------------

Find the right file in the ```source/``` folder. Update the text in the file.
Then from the root of this folder run:

```rake build```

now you can test your change by typing

```jekyll serve``` 

You should be able to see the portal now at
[http://localhost:4000](http://localhost:4000)


How to update documentation of components
-----------------------------------------

Go to the repository of the component you want to update the documentation for
and update the ```README.md```, ```reference.md``` or ```webservices.md``` file.
Then, from the root of the portal repository run:

```
rake update:documentation
```

and to test:

```
rake build
jekyll serve
```

How to update styling and layouts
---------------------------------

The styling can be changed using the CSS files in the ```source/css```
directory. Don't be fooled by the ```css``` directory in root.

Layouts can be found in: ```source/_layouts```. Most probably you'll need
changes to the "default" file not to the "basic" file.


How to release a new version to GitHub?
---------------------------------------

```
rake release
```

Other fancy stuff?
------------------

If you want a more dynamic way of writing your documentation, you can actually
go into the "source" directory and start Jekyll with the -w (watch) option. Then
you can make your changes and jekyll will automatically update the compiled
version of the site.

```
cd source
jekyll serve -w
```

Help I don't see my changes deployed!
-------------------------------------

Make sure you make your changes in the SOURCE directory and then run a release.


