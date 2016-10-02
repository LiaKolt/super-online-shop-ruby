class CartController < ApplicationController
  before_action :authenticate_user!

  def create
    OnlineCart.add(object_instance: params[:good_id], session_object: session)
    load_cart
  end

  def show
    load_cart
  end

  def destroy
    OnlineCart.remove(object_instance: params[:good_id], session_object: session)
    load_cart
  end

  private

  def load_cart
    @goods = OnlineCart.load(object_class: Good, session_object: session)
  end
end
