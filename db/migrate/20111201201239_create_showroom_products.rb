class CreateShowroomProducts < ActiveRecord::Migration
  def change
    create_table :showroom_products do |t|
      t.integer :showroom_id,   :null => false
      t.integer :product_id,    :null => false
      t.integer :stylist_id
      t.string :note
      t.boolean :active,  :default => true

      t.timestamps
    end
    add_index :showroom_products,  :showroom_id
    add_index :showroom_products,  :product_id
    add_index :showroom_products,  :stylist_id
  end
end
