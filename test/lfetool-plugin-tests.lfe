(defmodule lfetool-plugin-tests
  (export all)
  (import
    (from lunit
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lunit/include/lunit-macros.lfe")

(deftest get-plugin-module
  (is-equal 'lfetool-plugin-neat
            (lfetool-plugin:get-plugin-module 'neat)))

(deftest get-plugin-beam
  (is-equal "lfetool-plugin-script"
            (filename:basename (lfetool-plugin:get-plugin-beam 'script))))

(deftest get-plugin-attributes
  (let (((tuple ok (tuple plugin-mod data))
         (lfetool-plugin:get-plugin-attributes 'name 'script)))
    (is-equal 'lfetool-plugin-script
              plugin-mod)))

(deftest get-plugin-behaviour
  (is-equal '(lfetool-plugin)
            (lfetool-plugin:get-plugin-behaviour 'name 'script)))
