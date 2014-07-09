(defmodule lfetool-tests-listener
  (behaviour eunit_listener)
  (export all))

(defun start ()
  (start '()))

(defun start (options)
  (eunit_listener:start (MODULE) options))

(defun init (options)
  'noop)

(defun handle_begin
  (('group data state)
    'noop)
  (('test data state)
    'noop))

(defun handle_end
  (('group data state)
    'noop)
  (('test data state)
    'noop))

(defun handle_cancel
  ((_ data state)
    'noop))

(defun terminate
  (((tuple 'ok data) state)
    (lfetool-tests-formatter:display-failures state)
    (lfetool-tests-formatter:display-pending state)
    (lfetool-tests-formatter:display-profile state)
    (lfetool-tests-formatter:display-timing state)
    (lfetool-tests-formatter:display-results data state))
  (((tuple 'error reason) state)
    (io:nl)
    (io:nl)
    (sync_end 'error)))

(defun sync_end (result)
  'noop)
