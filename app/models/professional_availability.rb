class ProfessionalAvailability < ApplicationRecord

  belongs_to :healthcare_professional
  has_many :appointments

end
