class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :instructor_id
      t.datetime :session_start
      t.datetime :session_end

      t.timestamps
    end
  end
end
