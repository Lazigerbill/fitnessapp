class AppointmentsController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @instructor = Instructor.find(params[:instructor_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @user = current_user
    @appointment.user_id = @user.id
    @appointment.instructor_id = params[:instructor_id]
    @appointment.session_end = @appointment.session_start + 60*60
    @appointment.session_paid = false
    if @appointment.save
      redirect_to new_instructor_appointment_charge_path(@appointment.instructor.id, @appointment.id), notice: 'Your session is reserved, please complete payment below.' 
    else
      render :new 
    end
  end

  def delete
  end

  def show
  end
end

private
def appointment_params
  params.require(:appointment).permit(:session_start)
  
end