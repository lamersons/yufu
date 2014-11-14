class Permission
  include Mongoid::Document

  AVAILABLE_ACTIONS = %w(read creat update destroy manage)

  field :name
  field :subject_class
  field :subject_id, type: Integer
  field :action
  field :description

  embedded_in :user

  validates_inclusion_of :action ,in: AVAILABLE_ACTIONS
end
