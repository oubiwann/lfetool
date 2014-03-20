fill-yaws-bootstrap-files () {
    # LFE module
    template="plugins/yaws-bootstrap/templates/PROJECT-content.lfe.tmpl"
    pattern="{{YAWSBOOTSTRAPCONTENTMODULE}}"
    fill-tool-var $template $pattern
    # css files
    template="plugins/yaws-bootstrap/templates/bootstrap.css"
    pattern="{{YAWSBOOTSTRAPCSS}}"
    fill-tool-var $template $pattern
    template="plugins/yaws-bootstrap/templates/bootstrap-min.css"
    pattern="{{YAWSBOOTSTRAPCSSMIN}}"
    fill-tool-var $template $pattern
    template="plugins/yaws-bootstrap/templates/bootstrap-slate.css"
    pattern="{{YAWSBOOTSTRAPCSSSLATE}}"
    fill-tool-var $template $pattern
    template="plugins/yaws-bootstrap/templates/bootstrap-slate-min.css"
    pattern="{{YAWSBOOTSTRAPCSSMINSLATE}}"
    fill-tool-var $template $pattern
    # js files
    template="plugins/yaws-bootstrap/templates/bootstrap.js"
    pattern="{{YAWSBOOTSTRAPJS}}"
    fill-tool-var $template $pattern
    template="plugins/yaws-bootstrap/templates/bootstrap-min.js"
    pattern="{{YAWSBOOTSTRAPJSMIN}}"
    fill-tool-var $template $pattern
    # font files
    template="plugins/yaws-bootstrap/templates/glyphicons-halflings-regular.eot"
    pattern="{{YAWSBOOTSTRAPFONTEOT}}"
    fill-tool-var $template $pattern
    template="plugins/yaws-bootstrap/templates/glyphicons-halflings-regular.svg"
    pattern="{{YAWSBOOTSTRAPFONTSVG}}"
    fill-tool-var $template $pattern
    template="plugins/yaws-bootstrap/templates/glyphicons-halflings-regular.ttf"
    pattern="{{YAWSBOOTSTRAPFONTTTF}}"
    fill-tool-var $template $pattern
    template="plugins/yaws-bootstrap/templates/glyphicons-halflings-regular.woff"
    pattern="{{YAWSBOOTSTRAPFONTWOFF}}"
    fill-tool-var $template $pattern
}
