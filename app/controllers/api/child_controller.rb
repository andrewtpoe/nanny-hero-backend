class Api::ChildController < ApplicationController
  def create
    @child = Child.new(child_params)
    @child.family = get_family
    if @child.save
      render nothing: true, status: :created
    else
      render nothing: true, status: 422
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

  def get_family
    Family.find_by(name: params[:family_id])
  end

  def get_child
    Child.find(params[:id])
  end

end
