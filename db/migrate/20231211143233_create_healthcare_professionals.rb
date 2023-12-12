class CreateHealthcareProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :healthcare_professionals do |t|
      t.string :name
      t.string :specialization
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
