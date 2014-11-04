class ChangePhoneToString < ActiveRecord::Migration
  def change
    remove_column :instructors, :phone
    add_column :instructors, :phone, :string
  end
end
