Template for OpeNER Jekyll Website
==================================

The OpeNER portal (http://opener-project.github.io) contains all information you
need to get up and running with OpeNER language technologies in minutes. To make
sure the documentation stays up to date, each OpeNER github repository actually
maintains it's documentation in a gh-pages branch.

This causes a problem, how to keep the layout and styles between all
repositories synchronized? 

The solution: Create a repo that contains the basic template, and knows how to
update itself. That is exactly what you're looking at. 

All style changes to the website can be done in this repository, you then have
to update all repositories by running a ```rake update```.

Usage
-----

Copy the rakefile in this repository to any gh-pages branch of any repository.
Then run the ```rake update``` command.

```bash
wget https://raw.githubusercontent.com/opener-project/jekyll-page-template/master/Rakefile
rake update
```

Updates
-------

If you want to update the template, again, run:

```bash
rake update
```

Custom files
------------

If you want to add custom files to the general template, this is possible.
However, since the update mechanism is sometimes a bit blunt (especially on major updates),
it needs some special treatment.

There is a custom directory present. Any file that you put in the custom
directory will be copied OVER any template file. Also any files in the custom
directory not present in the template will be added to the final result.


### Why???

You might ask...WHY?! Well, because being able to do a "blunt" remove and
re-install update is straightforward and comes in handy. It is expected that
hardly any repository needs custom files, and those that do need custom files
only need very few.

When a "custom" file can actually be re-used it makes more sense to extend the
template anyway. 
