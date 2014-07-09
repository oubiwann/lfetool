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
    'noop)
  (((tuple 'error reason) state)
    'noop))

(defun sync_end (result)
  'noop)
