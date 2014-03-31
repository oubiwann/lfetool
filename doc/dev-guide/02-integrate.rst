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
