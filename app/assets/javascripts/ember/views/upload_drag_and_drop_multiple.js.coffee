Yufu.UploadDragAndDropMultiple = Ember.View.extend Yufu.FileUploadMixin,
  dragEnter: (event)->
    event.preventDefault()

  dragOver: (event)->
    event.preventDefault()

  drop: (event)->
    event.preventDefault()
    @file_upload_multiple(event.dataTransfer.files, @get('name'), @get('object'), @get('model'), @get('parent'))