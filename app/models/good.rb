class Good < ActiveRecord::Base

  validates :name, :price, :amount, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def available?
    amount > 0
  end

end
