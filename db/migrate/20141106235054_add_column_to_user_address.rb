class AddColumnToUserAddress < ActiveRecord::Migration
  def change
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
  end
end
