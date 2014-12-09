Yufu.FileUpload = Ember.TextField.extend Yufu.FileUploadMixin,
  type: 'file'
  attributeBindings: ['name', 'file']
  file: null
  object: null
  change: (evt) ->
    input = evt.target

    # We're using a single upload, but multiple could be
    # supported by adding `multiple` on the input element
    # and iterating over the files list here.
    if input.files && input.files[0]
      @file_upload(input.files[0], @get('name'), @get('object'))