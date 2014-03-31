Documentation
-------------


Step 6
,,,,,,

For every new command, subcommand, etc., which you have added, you will need to
do the following:

* Update the README;

* Update ``plugins/lfetool/templates/usage.txt.tmpl`` to include the changes.


Step 7
,,,,,,

Discoverability is arguably a form of documentation, so as in the previous step,
for every new command or suncommand you have added (or old ones you have
changed), you will need to update the ``bash-complete`` script so that
tab-completion will present the latest and greatest.
