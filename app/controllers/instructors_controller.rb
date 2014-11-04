class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
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

end
