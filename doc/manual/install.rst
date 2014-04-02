``install`` Command
-------------------

The ``install`` command supports the following sub-commands:

* ``lfetool``

* ``lfe``

* ``erlang``

* ``kerl``

* ``rebar``

* ``relx``

You may also call ``./lfetool install`` without any parameters; this is an
alias for ``./lfetool install lfetool``.


``install`` or ``install lfetool``
,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

Assuming you have downloaded ``lfetool`` to your local directory, you can use it
to install the script either to ``/usr/local/bin`` (default) or to a path of
your choosing:

.. code:: bash

    $ ./lfetool install

.. code:: bash

    $ ./lfetool install ~/bin/

or (for lovers of verbosity):

.. code:: bash

    $ ./lfetool install lfetool /usr/local/bin

You need to have write permissions to the given directory in order for this
command to succeed. Note that the installation procedure sets the executable
bit for the script.


``install lfe``
,,,,,,,,,,,,,,,

If you would like to install LFE system-wide, you may use the following command
to do so. This does assume that you have ``erl`` in your path.

.. code:: bash

    $ lfetool install lfe

If using ``kerl``, this will install LFE in the lib dir for whichever Erlang
install was most recently ``activate``ed by ``kerl``.

Installing LFE is really only justified if you will be running ``lfescript``-
based scripts. In general, we discourage system-wide LFE installations and
suggest using something like `rebar`_ or `erlang.mk`_ to pull your
dependencies into a project dir and running LFE from there.


``install erlang``
,,,,,,,,,,,,,,,,,,

This command is merely a convenience wrapper for the ``kerl`` tool and assumes
that you have ``kerl`` installed and in your ``$PATH``. It takes a single
parameter, the release name of Erlang:

.. code:: bash

    $ lfetool install erlang R16B03-1

This will install the given release of Erlang at ``/opt/erlang/R16B03-1``.
You can override the install dir by passing a different one:

.. code:: bash

    $ lfetool install erlang R16B03-1 /usr/local


To get a list of available releases, you can use the following:

.. code:: bash

    $ kerl list releases


``install kerl``
,,,,,,,,,,,,,,,,

We depend upon ``kerl`` quite heavily, and as such, we provide a means
of easily installing it:

.. code:: bash

    $ lfetool install kerl

.. code:: bash

    $ lfetool install kerl ~/bin/

``install relx``
,,,,,,,,,,,,,,,,

For building releases, we recommend `relx`_. We go so far as to provide a
command to install it:

.. code:: bash

    $ lfetool install relx

.. code:: bash

    $ lfetool install relx ~/bin/

Note that if you don't have a recent version of ``rebar`` installed, this may
fail. We have provided a ``rebar`` install command for your convenience.
After installing a new version of ``rebar`` the ``relx`` install command should
work.


``install rebar``
,,,,,,,,,,,,,,,,,

``rebar`` is a widely used tool in the Erlang community, and one that can be
used with LFE and LFE projects. Here's how you install it:

.. code:: bash

    $ lfetool install rebar

.. code:: bash

    $ lfetool install rebar ~/bin/


``install expm``
,,,,,,,,,,,,,,,,

We use ``expm`` to upload project info to http://expm.co/. Here's how you
install it:

.. code:: bash

    $ lfetool install expm

.. code:: bash

    $ lfetool install expm ~/bin/
