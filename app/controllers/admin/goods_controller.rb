class Admin::GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def show
  end

  def index
    @goods = []
  end

  def update
  end

  def destroy
  end
end
