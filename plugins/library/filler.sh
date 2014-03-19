fill-library-files () {
    # master make file for library projects
    template="plugins/library/templates/Makefile.tmpl"
    pattern="{{LIBMAKEFILE}}"
    fill-tool-var $template $pattern
    # app.src file
    template="plugins/library/templates/PROJECT.app.src.tmpl"
    pattern="{{LIBAPPSRC}}"
    fill-tool-var $template $pattern
    # test module
    template="plugins/common/templates/PROJECT-tests.lfe.tmpl"
    pattern="{{LIBTESTMODULE}}"
    fill-tool-var $template $pattern
    # module
    template="plugins/common/templates/PROJECT.lfe.tmpl"
    pattern="{{LIBMODULE}}"
    fill-tool-var $template $pattern
}
