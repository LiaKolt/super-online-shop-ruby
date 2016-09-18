class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name,    null: false, default: ""
      t.integer :amount, null: false, default: 0
      t.decimal :price,  null: false, default: 0

      t.timestamps null: false
    end
  end
end
