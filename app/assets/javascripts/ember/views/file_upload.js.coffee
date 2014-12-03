Yufu.FileUpload = Ember.TextField.extend
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
      reader = new FileReader()
      that = this
      reader.onload = (e)->
        fileToUpload = e.target.result
        Ember.run ->
          that.get('object').set('avatar', fileToUpload)
    return reader.readAsDataURL(evt.target.files[0])