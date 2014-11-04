class AddLongtitueLatitudeToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :longtitue, :float
    add_column :instructors, :latitude, :float
  end
end
