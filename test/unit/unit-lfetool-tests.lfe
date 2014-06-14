(defmodule unit-lfetool-tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest eval
  (is-equal #(ok ("this" "is" "my" "command"))
            (lfetool:eval "this is my command")))

(deftest parse
  (is-equal #(ok ("this" "is" "my" "command"))
            (lfetool:parse "this is my command")))

(deftest dispatch
  (is-equal #(ok ("this" "is" "my" "command"))
            (lfetool:dispatch #(ok ("this" "is" "my" "command")))))

(deftest parse-dispatch
  (is-equal #(ok ("this" "is" "my" "command"))
            (lfetool:dispatch (lfetool:parse "this is my command"))))
