(defmodule lfetool-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "deps/ltest/include/ltest-macros.lfe")

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
