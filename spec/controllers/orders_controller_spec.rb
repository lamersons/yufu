require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  describe '#update' do
    let(:order_verbal) {create :order_verbal, reserve_language_criterions_count: 0, main_language_criterion: nil}

    subject {put :update, id: order_verbal.id, order: {_type: 'Order::Verbal', main_language_criterion_attributes: {level: 'guide'}, reserve_language_criterions_attributes: [{level: 'guide'}]}}


    it 'expect update main' do
      expect{subject}.to change{assigns(:order).try(:main_language_criterion).try(:level)}.to('guide')
    end


    it 'expect update reserve' do
      expect{subject}.to change{assigns(:order).try(:reserve_language_criterions).try(:first).try(:level)}.to('guide')
    end
  end
end
