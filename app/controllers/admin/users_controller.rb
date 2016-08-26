class Admin::UsersController < Admin::AdminController
  def index
    @user = User.all
  end

  def make_admin


    redirect_to admin_user_index_path
  end

  def make_user

    redirect_to admin_user_index_path
  end
end
