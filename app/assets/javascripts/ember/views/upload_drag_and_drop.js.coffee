Yufu.UploadDragAndDrop = Ember.View.extend Yufu.FileUploadMixin,
  dragEnter: (event)->
    event.preventDefault()

  dragOver: (event)->
    event.preventDefault()

  drop: (event)->
    event.preventDefault()
    file = event.dataTransfer.files[0]
    if file
      @file_upload(file, @get('name'), @get('object'))
    return false
