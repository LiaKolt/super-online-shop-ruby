class Admin::UsersController < Admin::AdminController
  def index
    @user = User.all
  end

  def make_admin
    set_admin_status
  end

  def make_user
    set_admin_status(false)
  end

  private

  def set_admin_status(is_admin = true)
    current_user.is_admin = true
    unless current_user.save
        # TODO
    end
    redirect_to admin_user_index_path
  end
end
