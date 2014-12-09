Yufu.FileUploadMultiple = Ember.TextField.extend Yufu.FileUploadMixin,
  type: 'file'
  attributeBindings: ['name', 'file', 'multiple']
  file: null
  object: null
  change: (evt) ->
    @file_upload_multiple(evt.target.files, @get('name'), @get('object'), @get('model'), @get('parent'))