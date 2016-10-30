require "spec_helper"

describe Good, :type => :model do
  before :each do
    subject.valid?
  end

  describe 'validations' do
    context 'presence of' do
      subject { Good.new }

      it 'fails validation with no name' do
        expect(subject.errors).to have_key(:name)
      end
    end

    context 'numericality for price' do
      subject { Good.new(name: 'Test', price: -1) }

      it 'fails validation with negative price' do
        expect(subject.errors).to have_key(:price)
      end
    end

    context 'numericality for amount' do
      context 'with negative number' do
        subject { Good.new(name: 'Test', amount: -1) }

        it 'fails validation' do
          expect(subject.errors).to have_key(:amount)
        end
      end

      context 'with float' do
        subject { Good.new(name: 'Test', amount: 1.2) }

        it 'fails validation' do
          expect(subject.errors).to have_key(:amount)
        end
      end
    end
  end

  describe '#available?' do
    it 'get true when good available' do
      expect(Good.new(amount: 1).available?).to be true
    end

    it 'get false when good is available' do
      expect(Good.new(amount: 0).available?).to be false
    end
  end
end