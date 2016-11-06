require "rails_helper"

describe OrderMailer, :type => :mailer do
  describe '#order_email' do
    let(:user) { {user_email: 'some@com.com'} }
    let(:order) { [] }
    let(:mail) { OrderMailer.order_email(user: user, order: order) }

    it 'renders the headers' do
      expect(mail.to).to eq([user[:user_email]])
      expect(mail.subject).to eq(I18n.t('mailer.order.new'))
    end
  end
end