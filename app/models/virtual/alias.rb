class Virtual::Alias < ActiveRecord::Base
  belongs_to :domain, class_name: 'Virtual::Domain'
end
