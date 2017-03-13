class CreateCartsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts_products do |t|

      t.timestamps
    end
  end
end
