class CreateShowrooms < ActiveRecord::Migration
  def change
    create_table :showrooms do |t|
      t.integer :user_id,  :null => false
      t.string :type,  :null => false

      t.timestamps
    end
    add_index :showrooms,  :user_id
  end
end
