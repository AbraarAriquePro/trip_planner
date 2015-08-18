class PlacesController < ApplicationController
  def create
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @place = @trip_plan.build_place(places_params)
    if @place.save
      redirect_to @trip_plan
    else
      render 'new'
    end
  end

  def new
    @place = Place.new
  end

  def edit
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @place = @trip_plan.place
  end

  def update
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @place = @trip_plan.place
    if @place.update(places_params)
      redirect_to @trip_plan
    else
      render 'edit'
    end
  end

  def destroy
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @trip_plan.place.destroy
    redirect_to @trip_plan
  end

  private
  def places_params
    params.require(:place).permit(:name, :location, :description, :lat, :long, :url)
  end
end