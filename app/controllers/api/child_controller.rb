class Api::ChildController < ApplicationController
  def create
    @child = Child.new(child_params)
    @child.family = params[:family]
    respond_to do |format|
      if @child.save
        format.json { render json: @child, status: :created }
      else
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @child = get_child
    @child.destroy
    respond_to do |format|
      format.json { render json: "", status: :no_content }
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :age, :allergies, :fav_food, :interests, :bed_time, :potty_trained, :special_needs)
  end

  def get_child
    Child.find(params[:id])
  end

end
