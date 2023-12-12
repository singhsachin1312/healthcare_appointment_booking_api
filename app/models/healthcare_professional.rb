class HealthcareProfessional < ApplicationRecord
   
  has_many :professional_availabilities
  has_many :appointments

end
