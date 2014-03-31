Testing
-------


Step 8
,,,,,,

* Write a unit test in ``test/test.sh`` which checks for the existence of all
  the files you have created and examines at least some of the file contents to
  make sure they got created as expected.

* Your unit test functions will need to be in headless camel case (e.g.,
  ``testMyNewCommand``).

* Run the test suite:

.. code:: bash

    $ make check


Step 9
,,,,,,

* Build a local copy of ``lfetool`` by running ``make build``.

* Run your new command, e.g.: ``lfetool new my-new-proj-type awesome-proj-name``

* Check that all the expected files are created, that any new ``make`` targets
  work as expected.

* Submit a pull request!
