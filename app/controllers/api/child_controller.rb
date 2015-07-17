class Api::ChildController < ApplicationController
  def create
    @child = Child.new(child_params)
    @child.family = params[:family]
    if @child.save
      @child
    else
      @child.errors
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :age, :allergies, :fav_food, :interests, :bed_time, :potty_trained, :special_needs)
  end

end
