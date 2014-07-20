(defmodule lfetool-plugin-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "deps/ltest/include/ltest-macros.lfe")

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
