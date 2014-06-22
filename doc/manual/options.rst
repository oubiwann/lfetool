``lfetool`` Command Manual
==========================


``lfetool`` Options
-------------------

``commands`` Option
,,,,,,,,,,,,,,,,,,,

To display list of available commands and a short description for each:

.. code:: bash

    $ lfetool commands


``help`` Option
,,,,,,,,,,,,,,,

To display a help message:

.. code:: bash

    $ lfetool help

Optionally, you may also use a flag:

.. code:: bash

    $ lfetool -h


``usage`` Option
,,,,,,,,,,,,,,,,,

To display ``lfetool`` usage:

.. code:: bash

    $ lfetool usage

This provides more information than ``commands`` but less than ``help``.
This is what is returned when an incorrect ``lfetool`` command is
entered.


``version`` Option
,,,,,,,,,,,,,,,,,,

To get the current installed version of ``lfetool``:

.. code:: bash

    $ lfetool version

Optionally, you may also use a flag:

.. code:: bash

    $ lfetool -v


``extract`` Option
,,,,,,,,,,,,,,,,,,

As of version 2.0, ``lfetool`` is no longer built as a compressed shell
script. This option is still provided for backwards compatibility, but is
a no-op.
