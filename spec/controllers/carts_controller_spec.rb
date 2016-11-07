require 'rails_helper'

describe CartsController, type: :controller do
  before do
    %w(Book Cap Cup Table Phone Laptop).each do |name|
      Good.create!(name: name, amount: 1, price: 1)
    end
  end

  describe '#show' do
    before do
      allow(OnlineCart).to receive(:ids).and_return([Good.all.first.id])
    end

    it 'assigns @goods with goods' do
      get :show
      expect(assigns(:goods)).to eq([Good.all.first])
      expect(response).to render_template(:show)
    end
  end

  describe '#create' do
    before do
      allow(OnlineCart).to receive(:ids).and_return([Good.first.id])
    end

    it 'adds good to Session-based cart' do
      expect(OnlineCart).to receive(:set)
      post :create, good_id: Good.first.id
      expect(response).to redirect_to(cart_path)
    end
  end

  describe '#destroy' do
    before do
      allow(OnlineCart).to receive(:ids).and_return([Good.first.id])
    end

    it 'removes good from Session-based cart' do
      expect(OnlineCart).to receive(:remove)
      delete :destroy, good_id: Good.first.id
      expect(response).to redirect_to(cart_path)
    end
  end

  describe '#proceed' do
    before do
      allow(OnlineCart).to receive(:ids).and_return([Good.first.id])
      allow(OnlineCart).to receive(:remove)
      allow(OnlineCart).to receive(:goods).and_return(Hash[[Good.first].map{|good| [good.id.to_s, 1] }])
    end

    it 'assigns @goods with goods' do
      post :proceed, user_email: 'test@test.com', user_phone: '+79997776611', user_address: 'Москва, Большая улица, 1'
      expect(assigns(:goods)).to eq(Good.where(id: Good.first.id))
      expect(response).to redirect_to(cart_path)
    end
  end
end
