class Admin::AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  # Помимо проверки на аутентикацию пользователя, мы еще проверяем его
  #   права доступа. Если это не администратор, то перенаправляем запрос на
  #   главную страницу сайта
  before_action :user_must_be_admin!

  private

  def user_must_be_admin!
    redirect_to root_path unless current_user.is_admin
  end
end
