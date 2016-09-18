class CartController < ApplicationController
  before_action :authenticate_user!

  def create

  end

  def show
    @goods = OnlineCart.load(object_class: Good, session_object: session)
  end

  def destroy

  end
end
