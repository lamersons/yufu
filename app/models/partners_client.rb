# Model for partner's client. It isn't independent user. Need only for partner's backoffice
class PartnersClient
  include Mongoid::Document
  include Mongoid::Timestamps
  include Personalized

  has_many :orders, class_name: 'Order::Base'
  belongs_to :profile_partner, class_name: 'Profile::Partner', inverse_of: :clients
end
