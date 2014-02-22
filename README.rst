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
* ``help``
* ``version``

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

Assuming you have downloaded ``lfetool`` to your local directory, you can use it
to install the script to a path of your choosing. Simply provide the
installation directory:

.. code:: bash

    $ ./lfetool install /usr/local/bin

You need to have write permissions to the given directory in order for this
command to succeed. Note that the installation procedure sets the executable
bit for the script.


``update`` Command
------------------

If you have a regular install (not a link to the script in a ``git clone`` dir),
you may want to use this command to get the latest script from github:

.. code:: bash

    $ lfetool update

Though the command takes no parameters, it will fail if ``lfetool`` is not on
your ``$PATH``.


``new`` Command
---------------

For the collowing commands, keep in mind that Lisp functions and modules do not
use underscores by convention, but rather dashes. When naming your project,
it is recommended that you do this as well. Also note that it's probably best
to use just alphanumerica characters, dashes, and nothing else in your project
names.

The ``new`` command supports the following sub-commands:
* ``script``
* ``library``
* ``service``

To create an lfescript, simply run the following:

.. code:: shell

    $ lfetool new script my-script

To create a "library" project, run the following:

.. code:: shell

    $ lfetool new library my-new-lib

*Note*: upon running this script, not only with your project be set up with a
skeleton, but also:

* the dependencies for your project will be downloaded to your new project's
  ``deps`` dir;

* the stubbed unit test will be run and will fail (it's stubbed to fail because
  of TDD ;-));

* the project will be set up with a newly initialized github repo; and

* the new project files will be added to the repo.


One may create a "service" project by running the following:

.. code:: shell

    $ lfetool new service my-new-service

This will create an LFE OTP application skeleton for your project, complete with
unit tests and an initialized git repo.

To run your new server:

.. code:: shell

    $ cd my-new-service
    $ make shell

And then:

.. code:: cl

    > (: application start 'my-new-service)
    ok
    > (: my-new-service_server test-call '"a call message")
    Call: "a call message"
    ok
    > (: my-new-service_server test-cast '"a cast message")
    ok
    Cast: "a cast message"
    >

You may also start the application ahead of time, as is done in the ``run``
target:

.. code:: cl

    $ make run
    Erlang R16B (erts-5.10.1) [source] [smp:8:8] [async-threads:10] [hipe] ...

    LFE Shell V5.10.1 (abort with ^G)
    > (: my-new-service_server test-call '"a call message")
    Call: "a call message"
    ok
    > (: my-new-service_server test-cast '"a cast message")
    ok
    Cast: "a cast message"
    >

Note that the call to start the application wasn't needed, since it was started
via a command line option in the ``Makefile``.

If you would simply like to run in daemon mode, you may do that as well with the
supplied ``daemon`` target.

At a future date we will also support the e2 project in a similar fashion:

.. code:: shell

    $ lfetool new e2-service my-new-service


.. Links
.. -----
.. _LFE rebar: hhttps://github.com/oubiwann/lfe-sample-rebar-plugin
.. _lfe-skel: https://github.com/lfe/skeleton-project
.. _shell script: https://raw.github.com/lfe/lfetool/master/lfetool

