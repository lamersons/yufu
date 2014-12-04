class Virtual::Alias < ActiveRecord::Base
  belongs_to :domain, class_name: 'Virtual::Domain'
  validates_presence_of :domain
end
