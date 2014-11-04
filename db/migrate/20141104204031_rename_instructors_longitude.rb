class RenameInstructorsLongitude < ActiveRecord::Migration
  def change
    rename_column :instructors, :longtitue, :longitude
  end
end
