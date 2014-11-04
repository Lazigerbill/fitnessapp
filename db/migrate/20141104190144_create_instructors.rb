class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :photo_url
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :expertise

      t.timestamps
    end
  end
end
