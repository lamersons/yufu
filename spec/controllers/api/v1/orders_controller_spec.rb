require 'rails_helper'

RSpec.describe Api::V1::OrdersController, :type => :controller do
  include_context 'default currency'

  let(:order) {create :order_verbal}
  let(:language) {create :language}

  before(:each) do
    request.accept = 'application/json'
  end


  describe 'POST create' do
    let(:attributes) {{
        _type: 'Order::Verbal',
        airport_pick_up: {need_car: true, double_way: true, flight_number: '123', airport: 'airport'},
        main_language_criterion_attributes: [{language_id: language.to_param, level: 'guide'}],
        include_near_city: true
    }}
    subject{post :create, {order: attributes}}
    it 'creates new verbal order' do
      expect{subject}.to change{Order::Verbal.count}.by(1)
    end
    it 'permits attributes for verbal order' do
      expect{subject}.to change{assigns(:order).try :include_near_city}.to(true)
    end
  end

  describe "GET index" do
    subject{get :index, profile_id: profile.to_param}

    RSpec.shared_examples 'scoped collection' do
      let(:other_order) {create :order_verbal, state: :new}
      before(:each) {other_order}
      subject{get :index, profile_id: profile.to_param, scope: scope}

      RSpec.shared_examples 'check orders inclusion' do
        it 'includes right orders' do
          subject
          expect(assigns :orders).to include(order)
        end
        it 'does not include other order' do
          subject
          expect(assigns :orders).not_to include(other_order)
        end
      end
      describe 'open scope' do
        let(:order) {create :order_verbal, state: :wait_application}
        let(:scope) {:open}
        include_examples 'check orders inclusion'
      end

      describe 'in_progress scope' do
        let(:scope) {:in_progress}
        let(:order) {create :order_verbal, state: :in_progress}
        include_examples 'check orders inclusion'
      end

      describe 'close scope' do
        let(:scope) {:close}
        let(:order) {create :order_verbal, state: :close}
        include_examples 'check orders inclusion'
      end

      describe 'incorrect scope' do
        let(:scope) {:fake}
        it 'includes all' do
          subject
          expect(assigns :orders).to include(order)
        end
      end
    end

    context 'signed in as client' do
      let(:profile) {order.owner}
      before(:each) {sign_in order.owner.user}

      it_behaves_like 'scoped collection'

      it 'assigns my order as @order' do
        expect{subject}.to change{assigns :orders}.to([order])
      end
    end

    context 'sign in as translator' do
      let(:translator) {create :translator}
      let(:profile) {translator.profiles.first}
      let(:order) {create :order_verbal, assignee: translator.profiles.first}
      before(:each) do
        order.assignee = profile
        order.save
        sign_in translator
      end

      it_behaves_like 'scoped collection'

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
