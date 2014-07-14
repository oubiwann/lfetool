(defmodule lfetool-template-tests
  (export all)
  (import
    (from lunit
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lunit/include/lunit-macros.lfe")

(deftest get-template-file
  (is-equal "./plugins/script/templates/SCRIPT.tmpl"
            (lfetool-template:get-template-file 'script "SCRIPT.tmpl")))

(deftest render-template-no-pattern
  (is-equal (binary "#! /usr/bin/env lfescript")
            (binary:part
              (lfetool-template:render-template 'script "SCRIPT.tmpl" "")
              0
              25)))
