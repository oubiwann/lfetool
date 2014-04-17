``lfetool`` Command Manual
==========================


``tests`` Command
-----------------

The ``tests`` command supports the following sub-commands:

* ``build`` amd ``jbuild``

* ``unit``, ``junit``, and ``show-unit``

* ``integration``, ``jintegration``, and ``show-integration``

* ``system``, ``jsystem``, and ``show-system``

* ``all`` and ``jall``

* ``clean``


``tests build``
,,,,,,,,,,,,,,,

This will build all the eunit tests found in the current directory's (LFE
project) ``./test`` sub-directory. By convention, LFE unit tests are placed (by
the project developer) in ``./test/unit``; integration tests are placed in
``./test/integration``; and system tests are placed in ``./test/system``.

Furthermore, ``lfetool`` supports custom testing modules which may be used by
the unit tests (e.g., modules for utility functions that are only ever used
in the test modules). If you wish to create and use testing modules like these,
simply create modules in ``./test`` that are prefixed with ``testing-``.

The following command builds all of the aforementioned:

.. code:: shell

    $ lfetool tests build


``tests unit``
,,,,,,,,,,,,,,

To run the unit tests for the LFE project in the current working directory,
execute the following:

.. code:: shell

    $ lfetool tests unit

If you would like to only see the unit test modules defined for the project,
and not actually run them, execute this command:

.. code:: shell

    $ lfetool tests show-unit


``tests integration``
,,,,,,,,,,,,,,,,,,,,,

To run the integration tests for the LFE project in the current working
directory, execute the following:

.. code:: shell

    $ lfetool tests integration

If you would like to only see the integration test modules defined for the
project, and not actually run them, execute this command:

.. code:: shell

    $ lfetool tests show-integration


``tests system``
,,,,,,,,,,,,,,,,

To run the system tests for the LFE project in the current working
directory, execute the following:

.. code:: shell

    $ lfetool tests system

If you would like to only see the system test modules defined for the
project, and not actually run them, execute this command:

.. code:: shell

    $ lfetool tests show-system


``tests all``
,,,,,,,,,,,,,

To run the entire test suites the LFE project in the current working directory,
execute the following:

.. code:: shell

    $ lfetool tests all


``tests clean``
,,,,,,,,,,,,,,,

To remove all the compiled test modules, execute the following:

.. code:: shell

    $ lfetool tests clean
