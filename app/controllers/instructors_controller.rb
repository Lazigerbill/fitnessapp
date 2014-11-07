class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, except: [:edit]
  def index
    @instructors = Instructor.all
    @my_location = Geocoder.coordinates(current_user.postal_code)
  end

  def show

  end

  def new 
    @instructor = Instructor.new
  end

  def edit

  end

  def update
    if @instructor.update_attributes(instructor_params)
      redirect_to @instructor, notice: 'Instructor profile is successfully updated.' 
    else
      render 'edit', notice: 'error'
    end
  end

  def destroy

  end

  def marker
    @instructor = Instructor.find(params[:id])
    @hash = Gmaps4rails.build_markers(@instructor) do |instructor, marker|
      marker.lat instructor.latitude
      marker.lng instructor.longitude
    end
    respond_to do |format|
      format.json { render :json => @hash }
    end
  end

  def markers
    @instructors = Instructor.all
    @hash = Gmaps4rails.build_markers(@instructors) do |instructor, marker|
      marker.lat instructor.latitude
      marker.lng instructor.longitude
    end
    respond_to do |format|
      format.json { render :json => @hash }
    end
  end

  private
  def set_instructor
    @instructor = Instructor.find(params[:id])
  end
  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :phone, :street_address, :city, :postal_code, :expertise, :avatar)
  end

end
