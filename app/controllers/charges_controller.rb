class ChargesController < ApplicationController
  def new
    @instructor = Instructor.find(params[:instructor_id])
  end

  def create
    # Amount in cents
    @amount = 5000

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'GymHero customer',
      :currency    => 'cad'
    )

    Appointment.find(params[:appointment_id]).update_attributes(session_paid: true)
    redirect_to instructor_appointment_path(params[:instructor_id], params[:appointment_id])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to instructor_appointment_path
  end
end
