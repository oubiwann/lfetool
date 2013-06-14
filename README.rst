####################
LFE Skeleton Project
####################

This should really be converted into a `rebar`_ script sooner than later.
Perhaps someone else will have the time and rebar chops to do it? For now,
though, a simple shell script creates what is needed.

There are two modes, only one of which is currently implemented:

#. create a library project, one that intended to be used by other projects
   and does not start any services;

#. create a service project, one that should have at lease one services
   started.

Installation
============

Download the `shell script`_ and save it to a directory in your path.

Usage
=====

To create a library project, simply run the following:

.. code:: shell

    $ rebar-lfe library-project

To create a service project, TBD... coming soon!

.. Links
.. -----
.. _rebar: https://github.com/rebar/rebar
.. _shell script: 

