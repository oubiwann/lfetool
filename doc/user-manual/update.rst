``lfetool`` Command Manual
==========================


``update`` Command
------------------

The ``update`` command supports the following sub-commands:

* ``lfetool``

* ``deps``


``update lfetool``
,,,,,,,,,,,,,,,,,,

If you have a regular install (not a link to the script in a ``git clone`` dir),
you may want to use this command to get the latest script from github:

.. code:: bash

    $ lfetool update lfetool

The ``update`` command will accept an empty parameter as well, in which case it
will default to updating ``lfetool``:

.. code:: bash

    $ lfetool update

Note that the update will fail if ``lfetool`` is not on your ``$PATH``.


``update deps``
,,,,,,,,,,,,,,,

``lfetool`` has to ability to update a project's dependencies:

.. code:: bash

    $ lfetool update deps

With this command, ``lfetool`` will enter each directory in ``./deps`` and
perform a ``git pull``.

