class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_start_time
      t.datetime :appointment_end_time
      t.integer :status
      t.references :healthcare_professional
      t.references :user
      
      t.timestamps
    end
  end
end
