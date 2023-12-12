class AddProfessionalRefInAppoint < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :professional_availability
  end
end
