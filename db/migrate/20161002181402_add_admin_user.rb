class AddAdminUser < ActiveRecord::Migration
  def up
    User.new(
      email: 'admin@admin.com',
      password: '.test.',
      password_confirmation: '.test.',
      is_admin: true
    ).save!
  end

  def down
    User.find_by_email('admin@admin.com').destroy If User.exists?(email: 'admin@admin.com')
  end
end
