Yufu.FileUploadMultiple = Ember.TextField.extend
  type: 'file'
  attributeBindings: ['name', 'file', 'multiple']
  file: null
  object: null
  change: (evt) ->
    input = evt.target

    # We're using a single upload, but multiple could be
    # supported by adding `multiple` on the input element
    # and iterating over the files list here.
    if input.files && input.files[0]
      for file in input.files
        reader = new FileReader()
        that = this
        reader.onloadend = (e)->
          fileToUpload = e.target.result
          Ember.run ->
            document = that.get('object').store.createRecord('document',{education: that.get('object')} )
            document.set('doc', fileToUpload)
        reader.readAsDataURL(file)