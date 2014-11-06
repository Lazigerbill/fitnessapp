class AddColumnsSessionPaidToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :session_cost, :integer
    add_column :appointments, :session_paid, :boolean
  end
end
