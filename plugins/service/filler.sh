fill-service-files () {
    # otp make include
    template="plugins/service/templates/otp.mk.tmpl"
    pattern="{{OTPMK}}"
    fill-tool-var $template $pattern
    # master make file for service projects
    template="plugins/service/templates/Makefile.tmpl"
    pattern="{{SVCMAKEFILE}}"
    fill-tool-var $template $pattern
    # app.src file
    template="plugins/service/templates/PROJECT.app.src.tmpl"
    pattern="{{SVCAPPSRC}}"
    fill-tool-var $template $pattern
    # test module
    template="plugins/service/templates/PROJECT-tests.lfe.tmpl"
    pattern="{{SVCTESTMODULE}}"
    fill-tool-var $template $pattern
    # server module
    template="plugins/service/templates/PROJECT-server.lfe.tmpl"
    pattern="{{SVCSERVER}}"
    fill-tool-var $template $pattern
    # supervisor
    template="plugins/service/templates/PROJECT-sup.lfe.tmpl"
    pattern="{{SVCSUP}}"
    fill-tool-var $template $pattern
    # app
    template="plugins/service/templates/PROJECT-app.lfe.tmpl"
    pattern="{{SVCAPP}}"
    fill-tool-var $template $pattern
}
