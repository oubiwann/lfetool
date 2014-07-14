(defmodule lfetool-inspect-tests
  (export all)
  (import
    (from lunit
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lunit/include/lunit-macros.lfe")

(deftest command?
  (lfetool:start)
  (is-equal 'false
            (lfetool-inspect:command? 'neat))
  (is-equal 'true
            (lfetool-inspect:command? 'new)))

(deftest all-plugin-commands
  (is-equal '(new)
            (lfetool-inspect:all-plugin-commands)))

