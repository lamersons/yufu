Yufu.FileUploadMixin = Ember.Mixin.create(

  file_upload: (file, attr, object)->
    reader = new FileReader()
    reader.onloadend = (e)=>
      fileToUpload = e.target.result
      Ember.run =>
        object.set(attr, fileToUpload)
        object.set('avatar_name', file.name)
    return reader.readAsDataURL(file)
  file_upload_multiple: (files, attr, object, name, parent)->
    if files.length > 0
      for file in files
        reader = new FileReader()
        reader.onloadend =((file)=>
          return (e)->
            fileToUpload = e.target.result
            Ember.run =>
              for_parent = {}
              for_parent[parent] = object
              document = object.store.createRecord(name,for_parent )
              document.set(attr, fileToUpload)
              document.set('fileName', file.name)
              document.set('name', file.name))(file)
        reader.readAsDataURL(file)


)