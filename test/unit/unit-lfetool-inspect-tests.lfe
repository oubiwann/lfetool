(defmodule unit-lfetool-inspect-tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest command?
  (lfetool:start)
  (is-equal 'false
            (lfetool-inspect:command? 'neat))
  (is-equal 'true
            (lfetool-inspect:command? 'new)))

(deftest all-plugin-commands
  (is-equal '(new)
            (lfetool-inspect:all-plugin-commands)))

