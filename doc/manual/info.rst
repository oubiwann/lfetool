``lfetool`` Command Manual
==========================


``info`` Command
-----------------

The ``info`` command supports the following sub-commands:

* ``erllib``

* ``installdir``

* ``version``


``info erllibs``
,,,,,,,,,,,,,,,

``lfetool`` uses the environment variable ``ERL_LIBS`` to provide access to
all of a project's dependencies. Sometimes it's nice to see those lib dirs
directly, so this command is provided as a convenience:

.. code:: shell

    $ lfetool info erllibs


``info installdir``
,,,,,,,,,,,,,,,,,,,

``lfetool install lfe`` finds the ``lib`` directory for the installed/active
version of Erlang running and installs LFE there. This command returns the
install dir for informational purposes:

.. code:: shell

    $ lfetool info installdir


``info version``
,,,,,,,,,,,,,,,,

To get all the versions defined in your project (``lfetool`` looks for versions
defined in ``package.exs`` and ``src/*.app.src`` as well as git tags), use the
followingn command:

.. code:: shell

    $ lfetool info version



