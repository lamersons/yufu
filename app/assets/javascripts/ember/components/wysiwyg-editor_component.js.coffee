Yufu.WysiwygEditorComponent = Ember.Component.extend(
  classNames: ["wysiwyg-editor"]
  btnSize: "btn-xs"
  height: 120
  id: 'ckedit'

  didInsertElement: ->
    _this = this
    btnSize = @get("btnSize")
    height = @get("height")
    @$("textarea").ckeditor $.noop, {
      toolbar: [
        { name: 'document', items: [ 'Source', '-', 'NewPage', 'Preview', '-', 'Templates' ] }
        [ 'Cut', 'Copy', 'Paste', 'Undo', 'Redo' ]
        { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] }
        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', '-', 'RemoveFormat' ] }
        { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] }
        { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
        { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
]
    }
    content = @get("content")
    @$("textarea").val content
    CKEDITOR.instances[@get('id')].on 'change', =>
      content =  @$("textarea").val()
      @set "content", content


)