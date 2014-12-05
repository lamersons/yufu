class Order::BaseSerializer < ActiveModel::Serializer
  attributes :id, :state, :type, :application_status

  has_one :airport_pick_up
  has_one :car_rent
  has_one :hotel

  def type
    object.class.name.demodulize
  end

  def application_status
    object.application_status_for @scope
  end
end
