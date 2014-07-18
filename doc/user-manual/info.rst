``lfetool`` Command Manual
==========================


``info`` Command
-----------------

The ``info`` command supports the following sub-commands:

* ``bindir``

* ``erllibs``

* ``installdir``

* ``path``

* ``plugins``

* ``version``


``info bindir``
,,,,,,,,,,,,,,,

This command returns the ``bin`` directory for the installed/active version
of Erlang:

.. code:: shell

    $ lfetool info bindir


``info erllibs``
,,,,,,,,,,,,,,,

``lfetool`` uses the environment variable ``ERL_LIBS`` to provide access to
all of a project's dependencies. Sometimes it's nice to see those lib dirs
directly, so this command is provided as a convenience:

.. code:: shell

    $ lfetool info erllibs


``info installdir``
,,,,,,,,,,,,,,,,,,,

This command returns the ``lib`` directory for the installed/active version
of Erlang:

.. code:: shell

    $ lfetool info installdir


``info path``
,,,,,,,,,,,,,

``lfetool`` uses the environment variable ``PATH`` to provide access to
any needed binaries. It also adds some default directories:

* ``${DEPS}/lfe/bin``

* ``/opt/erlang/erjang``

Due to the fact that obtaining the ``lfetool`` PATH settings can be useful
for debugging or running commands manually, this is provided as a
convenience:

.. code:: shell

    $ lfetool info path


``info plugins``
,,,,,,,,,,,,,,,,

This command returns a list of tuples representing the plugins that lfetool
was able to find (both standard lfetool plugins, as well as user-supplied
lfetool plugins):

.. code:: shell

    $ lfetool info plugins


``info version``
,,,,,,,,,,,,,,,,

To get all the versions defined in your project (``lfetool`` looks for versions
defined in ``package.exs`` and ``src/*.app.src`` as well as git tags), use the
followingn command:

.. code:: shell

    $ lfetool info version



