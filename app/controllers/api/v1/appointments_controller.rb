class Api::V1::AppointmentsController < ApiController

  before_action :authenticate_request, except: :complete_appointment

  def create
    return render json: {message: "Appointment should be for future date!"}, status: 422 unless appointment_params["appointment_start_time"].to_time >= Time.now && appointment_params["appointment_end_time"].to_time >= Time.now
    healthcare_professional = HealthcareProfessional.find_by(id: appointment_params["healthcare_professional_id"])
    professional_availability_days = healthcare_professional.professional_availabilities.where(id: appointment_params["professional_availability_id"])
    if professional_availability_days.present?
      professional_availability_days.each do |days|
        all_appointments = days.appointments.where(appointment_start_time: appointment_params["appointment_start_time"].to_datetime, appointment_end_time: appointment_params["appointment_end_time"].to_datetime, status: 'booked')
        return render json: {message: "This slot is not available!"}, status: 422 if all_appointments.present?
      end
    end
    appoint = current_user.appointments.create(appointment_params)
    render json: {message: "Appointment booked!", data: appoint}
  end

  def cancel_appointment
    appointment = current_user.appointments.find_by(id: params[:id])
    if appointment.present?
      return render json: {message: "Appointment already cancelled!"} if appointment.status == 'cancelled'
      if appointment.appointment_start_time > DateTime.now + 24.hours
        appointment.update(status: params[:status])
        render json: {message: 'Appointment is cancelled successfully!', data: appointment}
      else
        return render json: { message: "You can only cancel this booking before 24 hours!"}, status: 422
      end
    else
      return render json: { message: "Appointment not found!"}, status: 404
    end
  end

  def complete_appointment
    healthcare_professional = HealthcareProfessional.find_by(id: params[:healthcare_professional_id])
    appointment = healthcare_professional.appointments.find_by(id: params[:id])
    if appointment.present?
      appointment.update(status: "completed")
      render json: { message: 'Appointment completed successfully!', data: appointment }
    else
      render json: { message: "Appointment not found!" }, status: 404
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:appointment_start_time, :appointment_end_time, :healthcare_professional_id, :user_id, :professional_availability_id)
  end
end
