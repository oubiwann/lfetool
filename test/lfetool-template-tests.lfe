(defmodule lfetool-template-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "deps/ltest/include/ltest-macros.lfe")

(deftest get-template-file
  (is-equal "./plugins/script/templates/SCRIPT.tmpl"
            (lfetool-template:get-template-file 'script "SCRIPT.tmpl")))

(deftest render-template-no-pattern
  (is-equal (binary "#! /usr/bin/env lfescript")
            (binary:part
              (lfetool-template:render-template 'script "SCRIPT.tmpl" "")
              0
              25)))
