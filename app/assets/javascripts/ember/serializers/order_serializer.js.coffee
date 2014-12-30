Yufu.OrderSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    main_language_criterion: {embedded: 'always'}
    reserve_language_criterions: {embedded: 'always'}