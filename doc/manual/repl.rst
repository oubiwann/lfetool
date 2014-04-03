``lfetool`` Command Manual
==========================


``repl`` Command
-----------------

The ``tests`` command supports the following sub-commands:

* ``lfe`` or empty string

* ``erlang``


``repl lfe``
,,,,,,,,,,,,,

To start an LFE REPL with all the dependency directories for your project
supplied in ``ERL_LIBS``, do the following:

.. code:: shell

    $ lfetool repl lfe

The ``repl`` command also accepts a default parameter of the empty string as
an alias to ``repl lfe``, so this will do the same thing as above:

.. code:: shell

    $ lfetool repl


``repl erlang``
,,,,,,,,,,,,,,,

To start an Erlang REPL with all the dependency directories for your project
supplied in ``ERL_LIBS``, do the following:

.. code:: shell

    $ lfetool repl erlang
