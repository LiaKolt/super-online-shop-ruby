class AddItemTypeFieldToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :item_type, :string, default: 'book'
  end
end
