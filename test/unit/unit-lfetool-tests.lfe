(defmodule unit-lfetool-tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest tokenize
  (is-equal '("this" "is" "my" "command")
            (lfetool:tokenize "this is my command")))

(deftest parse
  (is-equal #(ok (this is my command))
            (lfetool:parse "this is my command")))
