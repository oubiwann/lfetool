(defmodule lfetool-inspect-tests
  (behaviour lunit-unit)
  (export all))

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

