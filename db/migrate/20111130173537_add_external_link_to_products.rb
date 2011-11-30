class AddExternalLinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :external_link, :string, :limit => 500
  end
end
