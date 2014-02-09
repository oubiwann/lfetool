#######
lfetool
#######

*An Erlang Lisper's Tool for Admin Tasks and Infrastructure*


Introduction
============

Currently, the script supports one command:

* ``new``

The ``new`` command has two contexts, though only one is implemented for now:

#. ``library``: create a library project, one that intended to be used by other
   LFE, Erlang, or Elixir projects and does not start any services;

#. ``service``: create a service project, one that should have at lease one
   Erlang service started.

*Note*: This project superscedes the `lfe-skel`_ project.


``rebar`` and the Future
------------------------

Eventually, lfetool will be converted to an `LFE rebar`_ script. Perhaps someone
else will have the time and rebar chops to do it? Until then, this shell script
handles the necessary tasks suitably well.


Installation
============

Download the `shell script`_ and save it to a directory in your ``$PATH``.


Usage
=====


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

