Create the Plugin
-----------------

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
