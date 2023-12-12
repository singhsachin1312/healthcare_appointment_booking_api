class CreateProfessionalAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :professional_availabilities do |t|
      t.string :day
      t.time :available_from
      t.time :available_to
      t.references :healthcare_professional

      t.timestamps
    end
  end
end
