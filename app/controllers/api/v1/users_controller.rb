class Api::V1::UsersController < ApiController

  before_action :authenticate_request, except: [:create, :login]

  def create
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode(user_id: user.id, phone_number: user.phone_number)
      render json: {user: user, token: token}, status: 201
    else
      render json: { errors: user.errors.full_messages },
             status: 422
    end
  end

  def login
    user = User.find_by(phone_number: params[:phone_number])
    return render json: {message: "Password can't be blank!"}, status: 422 if params[:password].blank?
    if user.present?
      validate_password = user.authenticate(params[:password])
      return render json: { message: "Password incorrect!" }, status: 422 if validate_password.blank?
      token = JsonWebToken.encode(user_id: user.id, phone_number: user.phone_number)
      render json: { user: user, token: token }, status: :ok
    else
      render json: { message: "User not found with this phone number" }, status: 404
    end
  end

  def appointment_list
    if params[:status].present?
      render json: current_user.appointments.where(status: params[:status])
    else
      render json: current_user.appointments
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone_number, :email, :password)
  end
end
