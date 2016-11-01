class Good < ActiveRecord::Base
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # TODO: в базе данных у нас есть поле item_type, которое содержит в себе тип товара (Книга, программа, автомобиль и так далее)
  #       В данный момент мы нигде не используем это поле. Оно может пригодиться для каталогизации товаров,
  #         а также добавления специальной логики для того или иного типа товаров (например, цена на автомобиль
    #       должна быть не меньше 100000 рублей).

  def available?
    amount > 0
  end
end
