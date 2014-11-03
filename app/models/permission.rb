class Permission
  include Mongoid::Document

  field :name
  field :subject_class
  field :subject_id, type: Integer
  field :action
  field :description

  embedded_in :user
end
