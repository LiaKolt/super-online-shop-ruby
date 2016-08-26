class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :user_must_be_admin!

  private

  def user_must_be_admin
    redirect_to root_path unless current_user.is_admin
  end
end
