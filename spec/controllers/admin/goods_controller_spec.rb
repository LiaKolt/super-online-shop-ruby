require 'rails_helper'

describe Admin::GoodsController, type: :controller do
  let(:admin_user) { User.create!(email: 'admin@admin1.com', is_admin: true, password: '.test.', password_confirmation: '.test.') }
  let(:user) { User.create!(email: 'admin@admin1.com', is_admin: false, password: '.test.', password_confirmation: '.test.') }

  before do
    %w(Book Cap Cup Table Phone Laptop).each do |name|
      Good.create!(name: name, amount: 1, price: 1)
    end
  end

  context 'when user is not admin' do
    subject { get :index }

    before do
      sign_in user
    end

    it 'redirects to root path' do
      expect(subject).to redirect_to(root_path)
    end
  end

  context 'when user is admin' do
    before do
      sign_in admin_user
    end

    describe '#index' do
      it 'assigns @goods with goods' do
        get :index
        expect(assigns(:goods)).to eq(Good.all)
        expect(response).to render_template(:index)
      end
    end

    describe '#create' do
      it 'creates a new good' do
        post :create, name: 'New Good', price: 2, amount: 3
        expect(Good.last.name).to eq('New Good')
        expect(response).to redirect_to(admin_goods_path)
      end
    end

    describe '#update' do
      it 'updates a good' do
        put :update, name: 'Updated Good', id: Good.first.id
        expect(Good.first.name).to eq('Updated Good')
        expect(response).to redirect_to(admin_goods_path)
      end
    end

    describe '#destroy' do
      it 'removes good' do
        good_to_remove = Good.last.id
        delete :destroy, id: good_to_remove
        expect(Good.last.id).not_to eq(good_to_remove)
        expect(response).to redirect_to(admin_goods_path)
      end
    end
  end
end
