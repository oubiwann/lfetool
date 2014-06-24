# Plugin Development Guide

## Create the Plugin


You may create a plugin in one of two ways:

1. for inclusion in lfetool, the project, or
1. as a user-plugin to be used locally only.


### Official Plugin

$ git clone
$ cd lfetool
$ mkdir -p plugins/myscript/templates
$ cd plugins/myscript/
$ vi lfetool-plugin-myscript.lfe
$ vi templates/SCRIPT.lfe

### User Plugin

$ mkdir -p ~/.lfetool/plugins/myscript/templates
$ cd ~/.lfetool/plugins/myscript/
$ vi lfetool-plugin-myscript.lfe
$ vi templates/SCRIPT.lfe

### Old Docs

Step 1
,,,,,,

Create a new plugin directory, filller file, and subdirectory for file
tempaltes:

.. code:: bash

    $ mkdir -p plugins/my-plugin/templates
    $ touch plugins/my-plugin/filler.sh
    $ touch plugins/my-plugin/templates/special-file.lfe

* In ``plugins/my-plugin/templates``, create all the files necessary to
  support your new command. These files should all have the same name they
  would have once added to a new project, with two exceptions:

  #. they should have a ``.tmpl`` extension, and

  #. anywhere a project name would have been used (e.g., a module), ``PROJECT``
     should be used instead.

* Note the use of of ``local varname=$n`` in other functions; to avoid name
  collisions you will want to duplicate this in your own functions.

* If you are creating a project type that has actual code, you need to add
  a test module that has at least one unit test defined. To encourage TDD,
  your unit test(s) should fail due to an intentional bug in the sample
  implementation. (See the ``library`` and ``service`` templates for two
  examples of these.)


Step 2
,,,,,,

Edit ``plugins/my-plugin/filler.sh`` to create a function named something
sensible (e.g., fill-my-plugin). This function needs to define two variables:

#. ``template`` - this should be a string value for the path to the template
   file whose template variables you want to replace (e.g.,
   ``plugins/my-plugin/templates/special-file.lfe``); and

#. ``pattern`` - this should be the placeholder text in your template that
   needs to be substituted with a value (e.g., {{NAME}}).

This function then needs to call the ``fill-tool-var`` function (defined in
``./bin/create-tool``).

If you have more than one template variable you'd like to replace, simply add
another line that defines the next ``pattern`` and then a call to
``fill-tool-var $template $pattern``.


Step 3
,,,,,,

* With the project files created, ``plugins/lfetools/templates/lfetool.tmpl``
  needs to be updated to accept the new command in the ``create-new`` function.
  You will dispatch here to a new function that will create all the required
  files for your new project type.

* Create any other functions necessary in support of your new dispatch function.

Tell ``lfetool`` about the Plugin
---------------------------------


Step 4
,,,,,,

Each ``filler.sh`` file created in ``plugins/*/``  (**Step 2**) will be be
sourced by ``./bin/create-tool``. As such, once you have created the
``filler.sh`` file for your plugin, you need to add it to the ``run``
function in ``./bin/create-tool``.


Step 5
,,,,,,

* For every file you have added to your plugin's template directory (which will
  be created by ``lfetool`` when it runs your plugin's commands), you will need
  to add a new variable at the top of
  ``plugins/lfetools/templates/lfetool.tmpl`` with a unique string of the form
  ``{{NAME}}`` which will later be substituted with actual content when
  ``./bin/create-tool`` is run.

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

Testing
-------


Step 8
,,,,,,

* Write a unit test in ``test/test.sh`` which checks for the existence of all
  the files you have created and examines at least some of the file contents to
  make sure they got created as expected.

* Your unit test functions will need to be in headless camel case (e.g.,
  ``testMyNewCommand``).

* Run the test suite:

.. code:: bash

    $ make check


Step 9
,,,,,,

* Build a local copy of ``lfetool`` by running ``make build``.

* Run your new command, e.g.: ``lfetool new my-new-proj-type awesome-proj-name``

* Check that all the expected files are created, that any new ``make`` targets
  work as expected.

* Submit a pull request!
