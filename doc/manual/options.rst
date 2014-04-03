``lfetool`` Command Manual
==========================


``lfetool`` Options
-------------------


``help`` Option
,,,,,,,,,,,,,,,

To display a help message:

.. code:: bash

    $ lfetool help

Optionally, you may also use a flag:

.. code:: bash

    $ lfetool -h


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

As of version 0.2.3, ``lfetool`` runs as a compressed, self-extracting script.
This is due to the increasing number files that are embedded in it and is an
effort to reduce the download size of the script. The down-side of this is that
every time the script is run, it needs to decode a large chunk of base64 text
and then ``gunzip`` that, which takes more time.

For those who would prefer faster performance of the script, there is an option
to extract the compressed, encoded script from the self-extracting wrapper:

.. code:: bash

    $ lfetool extract

Optionally, you may also use a flag:

.. code:: bash

    $ lfetool -x

This will replace the wrapper (containing the compressed script) with an
uncompressed version of the script.

As of version 0.2.7, extraction is now done automatically after download.
