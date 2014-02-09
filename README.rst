#######
lfetool
#######

*An Erlang Lisper's Tool for Admin Tasks and Infrastructure*


Introduction
============

Currently, the script supports these commands:

* ``install``
* ``update``
* ``new``

Usage information for each of these is presented below.

*Note*: This project superscedes its precursor, the `lfe-skel`_ project.


``rebar`` and the Future
------------------------

Eventually, lfetool will be converted to an `LFE rebar`_ script. Perhaps someone
else will have the time and rebar chops to do it? Until then, this shell script
handles the necessary tasks suitably well.


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


``help`` Command
-------------------

To display a help message:

.. code:: bash

    $ lfetool help

Optionally, you may also use a flag:

.. code:: bash

    $ lfetool -h


``version`` Command
-------------------

To get the current installed version of ``lfetool``:

.. code:: bash

    $ lfetool version

Optionally, you may also use a flag:

.. code:: bash

    $ lfetool -v


``install`` Command
-------------------

To install ``lfetool``, simply provide the installation directory:

.. code:: bash

    $ ./lfetool install /usr/local/bin

You need to have write permissions to the given directory in order for this
command to succeed.


``update`` Command
------------------

If you have a regular install (not a link to the script in a ``git clone`` dir),
you may want to use this command to get the latest script from github.

.. code:: bash

    $ lfetool update

Though the command takes no parameters, it will fail if ``lfetool`` is not on
your ``$PATH``.


``new`` Command
---------------

To create a "library" project, simply run the following:

.. code:: shell

    $ lfetool new library my-new-lib

Though not currently implemented, in the future one will create a "service"
project by running the following:

.. code:: shell

    $ lfetool new service my-new-service

*Note*: upon running this script, not only with your project be set up with a
skeleton, but also:

* the dependencies for your project will be downloaded to your new project's
  ``deps`` dir;

* the stubbed unit test will be run and will fail (it's stubbed to fail because
  of TDD ;-));

* the project will be set up with a newly initialized github repo; and

* the new project files will be added to the repo.


.. Links
.. -----
.. _LFE rebar: hhttps://github.com/oubiwann/lfe-sample-rebar-plugin
.. _lfe-skel: https://github.com/lfe/skeleton-project
.. _shell script: https://raw.github.com/lfe/lfetool/master/lfetool

