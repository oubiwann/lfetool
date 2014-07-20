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
  (('group (= (list _ (tuple 'desc 'undefined) _ _) data) state)
    'skipping)
  (('group (= (list _ (tuple 'desc mod) _ _) data) state)
    (io:format "starting group ~ts~n" (list mod))
    ; (io:format "\tdata: ~p~n" (list data))
    ; (io:format "\tstate: ~p~n" (list state))
    state)
  (('test (= (list _ _ (tuple 'source (tuple mod func arity)) _) data) state)
    (io:format "\tstarting test ~s ...~n" (list func))
    ;(io:format "\t\tdata: ~p~n" (list data))
    ;(io:format "\t\tstate: ~p~n" (list state))
    state)
  (('test data state)
    (io:format "\tstarting test ...~n")
    (io:format "\t\tdata: ~p~n" (list data))
    ;(io:format "\t\tstate: ~p~n" (list state))
    state)
  )

(defun handle_end
  (('group (= (list _ _ _ _ _ (tuple 'time time) _) data) state)
    ;(io:format "ending group ...~n")
    (io:format "\ttime: ~pms~n" (list time))
    ;(io:format "\tstate: ~p~n" (list state))
    state)
  (('group data state)
    ;(io:format "ending group ...~n")
    (io:format "\tdata: ~p~n" (list data))
    ;(io:format "\tstate: ~p~n" (list state))
    state)
  (('test (= (list _ (tuple 'status (tuple 'error error)) _ _ _ _ _) data) state)
    (io:format "\tending test ...")
    (io:format (++ "\t" (color:red "FAIL") "~n"))
    (lfe_io:format "\t~p~n" (list error))
    state)
  (('test (list _ (tuple 'status 'ok) _ _ _ _ _) state)
    (io:format "\tending test ...")
    (io:format (++ "\t" (color:greenb "OK") "~n"))
    state)
  (('test data state)
    (io:format "\tending test ...~n")
    (io:format "\t\tdata: ~p~n" (list data))
    (io:format "\t\tstate: ~p~n" (list state))
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
  (receive
    ((tuple 'stop reference reply-to)
      (! reply-to `#(result ,reference ,result))
      'ok)))

