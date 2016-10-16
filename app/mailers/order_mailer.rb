class OrderMailer < ApplicationMailer
  default from: 'notifications@superonlineshop.com'

  def order_email(user: user, order: order)
    @user = user
    @order = order
    mail(to: user[:user_email], subject: I18n.t('mailer.order.new'))
  end
end
