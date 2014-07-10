(defmodule lfetool-tests-listener
  (behaviour eunit_listener)
  (export all))

(defrecord state
  (status (orddict:new))
  (pass 0)
  (fail 0)
  (skip 0)
  (cancel 0)
  (timings '()))

(defun start ()
  (start '()))

(defun start (options)
  (eunit_listener:start (MODULE) options))

(defun init (options)
  (make-state))

(defun handle_begin
  (('group data state)
    state)
  (('test data state)
    state))

(defun handle_end
  (('group data state)
    state)
  (('test data state)
    state))

(defun handle_cancel
  ((_ data state)
    state))

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
