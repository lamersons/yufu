require 'rails_helper'

RSpec.describe Api::V1::OrdersController, :type => :controller do

  let(:order) {create :order_verbal}

  before(:each) do
    request.accept = 'application/json'
  end


  describe 'POST create' do
    let(:attributes) {{
        _type: 'Order::Verbal',
        airport_pick_up: {need_car: true, double_way: true, flight_number: '123', airport: 'airport'},
        include_near_city: true
    }}
    subject{post :create, {order: attributes}}
    it 'creates new verbal order' do
      expect{subject}.to change{Order::Verbal.count}.by(1)
    end
    it 'permits attributes for verbsl order' do
      expect{subject}.to change{assigns(:order).try :include_near_city}.to(true)
    end
  end

  describe "GET index" do
    context 'signed in as client' do
      subject{get :index, profile_id: order.owner.to_param}
      before(:each) {sign_in order.owner.user}
      it 'assigns my order as @order' do
        expect{subject}.to change{assigns :orders}.to([order])
      end
    end

    context 'sign in as translator' do
      let(:translator) {create :translator}
      let(:order) {create :order_verbal, assignee: translator.profiles.first}
      subject{get :index, profile_id: translator.profiles.first}
      before(:each) {sign_in translator}
      it 'assigns assigned to me order as @order' do
        expect{subject}.to change{assigns :orders}.to([order])
      end
    end
  end

  describe "GET show" do
    subject{get :show, id: order.to_param}
    before(:each) {sign_in order.owner.user}
    it 'assigns requested order as order' do
      expect{subject}.to change{assigns :order}.to(order)
    end
  end

end
