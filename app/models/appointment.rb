class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :healthcare_professional
  belongs_to :professional_availability
  
  enum status: [:booked, :completed, :cancelled]

  after_create do
    self.update_column(:status, 'booked')
  end

  def as_json(*)
    super(include: [:user, :healthcare_professional, :professional_availability]).except("user_id", "healthcare_professional_id", "professional_availability_id").tap do |hash|
    end
  end
end
