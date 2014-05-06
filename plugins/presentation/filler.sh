fill_presentation_files () {
    # yaws conf
    template="plugins/presentation/templates/yaws.conf.tmpl"
    pattern="{{PRESYAWSCONF}}"
    fill_tool_var $template $pattern
    # presentation rebar
    template="plugins/presentation/templates/rebar.config.tmpl"
    pattern="{{PRESREBAR}}"
    fill_tool_var $template $pattern
    # entry point module
    template="plugins/presentation/templates/PROJECT.lfe.tmpl"
    pattern="{{PRESMODULE}}"
    fill_tool_var $template $pattern
    # content module
    template="plugins/presentation/templates/PROJECT-content.lfe.tmpl"
    pattern="{{PRESCONTENTMODULE}}"
    fill_tool_var $template $pattern
    # slides module
    template="plugins/presentation/templates/PROJECT-slides.lfe.tmpl"
    pattern="{{PRESSLIDESMODULE}}"
    fill_tool_var $template $pattern
}
