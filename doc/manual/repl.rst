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


``repl jerl``
,,,,,,,,,,,,,

To start an Erjang REPL (running on the JVM), do the following:

... code:: shell

	$ lfetool repl jerl

Running the ``jerl`` REPL requires the ``rlwrap`` utility to be installed on
your system. This provides the REPL with ``readline`` support: arrow-key command
navigation, shell command history as well as hisory saved to disk, command
searching with ``^R``, etc.


``repl jlfe``
,,,,,,,,,,,,,

To start an LFE REPL (running on the JVM), do the following:

... code:: shell

	$ lfetool repl jlfe

Running the ``jlfe`` REPL requires the ``rlwrap`` utility to be installed on
your system. This provides the REPL with ``readline`` support: arrow-key command
navigation, shell command history as well as hisory saved to disk, command
searching with ``^R``, etc.