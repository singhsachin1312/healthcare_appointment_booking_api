class Api::V1::HealthcareProfessionalsController < ApiController

  before_action :authenticate_request

  def index
    render json: HealthcareProfessional.all
  end

  def available_slotes
    slots = []
    healthcare_professional = HealthcareProfessional.find_by(id: params[:id])
    professional_availability_days = healthcare_professional.professional_availabilities.where(day: params["date"].to_date.strftime("%A"))
    professional_availability_days.each do |availablity|
      start_datetime = DateTime.parse(availablity.available_from.strftime('%H:%M:%S'))
      end_datetime = DateTime.parse(availablity.available_to.strftime('%H:%M:%S'))
      current_datetime = start_datetime

      arr = availablity.appointments.map{|x| x.appointment_start_time.to_datetime}
      while current_datetime < end_datetime
        end_of_slot = current_datetime + Rational(30, 1440) # Increment by the interval in minutes
          slots << "#{current_datetime.strftime('%H:%M:%S')} - #{end_of_slot.strftime('%H:%M:%S')}" unless arr.include?(current_datetime.strftime('%H:%M:%S'))
          current_datetime = end_of_slot
      end
    end
    render json: slots
  end
end
