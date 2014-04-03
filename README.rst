#######
lfetool
#######

.. image:: resources/images/logo-small.png

*An Erlang Lisper's Tool for Admin Tasks, Project Creation, and Infrastructure*


Introduction
============

Currently, the script supports these basic options:

* ``help`` or ``-h``
* ``version`` or ``-v``
* ``extract`` or ``-x``

And these commands:

* ``install``
* ``update``
* ``new``
* ``tests``
* ``repl``
* ``info``

Usage information for each of these is linked to below in the "Usage" section.

*Note*: This project superscedes its precursor, the `lfe-skel`_ project.


Installation
============


Stable
------

Download the `shell script`_ and save it to a directory in your ``$PATH``. For
example:

.. code:: bash

    $ curl -o ./lfetool https://raw.github.com/lfe/lfetool/master/lfetool
    $ bash lfetool install /usr/local/bin

Depending upon how the permissions for your chossen path are setup, you may
need to use ``sudo``.

If you installed with ``sudo`` but would like to be able to self-update the
script in the future, you should also change the ownership:

.. code:: bash

    $ chown $USER /usr/local/bin/lfetool


Bleeding Edge
-------------

If you'd like to be able to update with the latest changes in the master branch,
you can do this instead:

.. code:: bash

    $ cd ~/lab/
    $ git clone https://github.com/lfe/lfetool.git
    $ cd lfetool
    $ ln -s ./lfetool /usr/local/bin/

Permissions are already set on the script in the repo, so there's no need to do
anything further.


Usage
=====

Basic Options
-------------


``help`` Command
,,,,,,,,,,,,,,,,

To display a help message:

.. code:: bash

    $ lfetool help

Optionally, you may also use a flag:

.. code:: bash

    $ lfetool -h


``version`` Command
,,,,,,,,,,,,,,,,,,,

To get the current installed version of ``lfetool``:

.. code:: bash

    $ lfetool version

Optionally, you may also use a flag:

.. code:: bash

    $ lfetool -v


``extract`` Command
,,,,,,,,,,,,,,,,,,,

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


``lfetool`` Commands
--------------------

Details on each of the commands listed below and the subcommands they offer
are linked to individual pages:

* `Install Command`_

* `Update Command`_

* `New Command`_

* `Tests Command`_

* `REPL Command`_

* `Info Command`_


Creating lfetool Plugins
========================

*Developing additional lfetool commands*

This section has been created for those that would like to submit patches/pull
requests to lfetool for bug fixes and/or new features. At the very least, it
should provide a means for understanding what is needed in order to add new
commands to lfetool.

Adding new commands to lfetool is as simple as creating a new plugin. One can
start by either copying an existing plugin that most closely resembles the sort
of plugin you want to create, or starting completely from scratch.

For those that wish to start from scratch, the following dev guide is
provided:

 * `Create the Plugin`_
 * `Integrate the Plugin`_
 * `Documentation and Autocompletion`_
 * `Testing the Plugin`_


.. Links
.. -----
.. _LFE rebar: hhttps://github.com/oubiwann/lfe-sample-rebar-plugin
.. _lfe-skel: https://github.com/lfe/skeleton-project
.. _shell script: https://raw.github.com/lfe/lfetool/master/lfetool
.. _exemplar: https://github.com/lfe/exemplar
.. _Twitter Bootstrap: http://getbootstrap.com/
.. _rebar: https://github.com/rebar/rebar
.. _erlang.mk: https://github.com/extend/erlang.mk
.. _relx: https://github.com/erlware/relx
.. _Create the Plugin: doc/dev-guide/01-create.rst
.. _Integrate the Plugin: doc/dev-guide/02-integrate.rst
.. _Documentation and Autocompletion: doc/dev-guide/03-docs.rst
.. _Testing the Plugin: doc/dev-guide/04-tests.rst
.. _Install Command: doc/manual/install.rst
.. _Update Command: doc/manual/update.rst
.. _New Command: doc/manual/new.rst
.. _Tests Command: doc/manual/tests.rst
.. _REPL Command: doc/manual/repl.rst
.. _Info Command: doc/manual/info.rst

