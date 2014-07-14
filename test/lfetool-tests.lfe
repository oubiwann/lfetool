(defmodule lfetool-tests
  (export all)
  (import
    (from lunit
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lunit/include/lunit-macros.lfe")

(deftest tokenize
  (is-equal '("this" "is" "my" "command")
            (lfetool:tokenize "this is my command")))

(deftest parse
  (is-equal #(ok (this is my command))
            (lfetool:parse "this is my command")))

(deftestskip something ()
  'noop)

(deftest failing ()
  (is 'false))
