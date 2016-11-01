require 'rails_helper'

describe GoodsController, type: :controller do
  describe '#index' do
    before do
      Good.create!(name: 'New Cool Cap', amount: 1, price: 1)
    end

    it 'assigns @goods with goods' do
      get :index
      expect(assigns(:goods)).to eq(Good.all)
    end
  end
end
