fill-common-files () {
    # base make include
    template="plugins/common/templates/common.mk.tmpl"
    pattern="{{COMMONMK}}"
    fill-tool-var $template $pattern
    # ignores
    template="plugins/common/templates/.gitignore.tmpl"
    pattern="{{GITIGNORE}}"
    fill-tool-var $template $pattern
    # expm package file
    template="plugins/common/templates/package.exs.tmpl"
    pattern="{{PACKAGE}}"
    fill-tool-var $template $pattern
    # rebar config file
    template="plugins/common/templates/rebar.config.tmpl"
    pattern="{{REBAR}}"
    fill-tool-var $template $pattern
    # Travis CI file
    template="plugins/common/templates/.travis.yml.tmpl"
    pattern="{{TRAVISCI}}"
    fill-tool-var $template $pattern
    # README file
    template="plugins/common/templates/README.rst.tmpl"
    pattern="{{README}}"
    fill-tool-var $template $pattern
}
