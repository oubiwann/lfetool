fill-lfetool-files () {
    template="plugins/lfetool/templates/usage.txt.tmpl"
    pattern="{{USAGE}}"
    fill-tool-var $template $pattern
}
