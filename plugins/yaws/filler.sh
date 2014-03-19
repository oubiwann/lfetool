fill-yaws-files () {
    # yaws make include
    template="plugins/yaws/templates/yaws.mk.tmpl"
    pattern="{{YAWSMK}}"
    fill-tool-var $template $pattern
    # master make file for yaws projects
    template="plugins/yaws/templates/Makefile.tmpl"
    pattern="{{YAWSMAKEFILE}}"
    fill-tool-var $template $pattern
    # yaws conf
    template="plugins/yaws/templates/yaws.conf.tmpl"
    pattern="{{YAWSCONF}}"
    fill-tool-var $template $pattern
    # yaws rebar
    template="plugins/yaws/templates/rebar.config.tmpl"
    pattern="{{YAWSREBAR}}"
    fill-tool-var $template $pattern
    # entry point module
    template="plugins/yaws/templates/PROJECT.lfe.tmpl"
    pattern="{{YAWSMODULE}}"
    fill-tool-var $template $pattern
    # routes module
    template="plugins/yaws/templates/PROJECT-routes.lfe.tmpl"
    pattern="{{YAWSROUTESMODULE}}"
    fill-tool-var $template $pattern
    # content module
    template="plugins/yaws/templates/PROJECT-content.lfe.tmpl"
    pattern="{{YAWSCONTENTMODULE}}"
    fill-tool-var $template $pattern
    # util module
    template="plugins/yaws/templates/PROJECT-util.lfe.tmpl"
    pattern="{{YAWSUTILMODULE}}"
    fill-tool-var $template $pattern
}
