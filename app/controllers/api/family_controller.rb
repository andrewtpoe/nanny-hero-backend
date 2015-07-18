class Api::FamilyController < ApplicationController

  def index
    @families = Family.all
    respond_to do |format|
      format.json { render json: @families }
    end
  end

  def show
    @family = get_family
    respond_to do |format|
      if @family
        format.json { render json: @family }
      else
        format.json { render json: "", status: :unprocessable_entity }
      end
    end
  end

  def create
    @family = Family.new(family_params)
    valid = []
    valid_children = []
    @family.nanny_id = 1
    if @family.valid?
      valid << true
      # needs to iterate over array of children in params and build children objects
      if params[:family][:children]
        children = params[:family][:children]
        children.each do |child|
          c = Child.new(child_params(child))
          c.family_id = 1
          if c.valid?
            # binding.pry
            valid << true
            valid_children << c
          else
            valid << false
          end
        end
      else
        valid << false
      end
      if params[:family][:nanny]
        nanny = Nanny.new(name: params[:family][:nanny])
      else
        valid << false
      end
    else
      valid << false
    end
    respond_to do |format|
      if valid.include?(false)
        format.json { render json: @family.errors, status: :unprocessable_entity }
      else
        nanny.save
        @family.nanny = nanny
        @family.save
        valid_children.each do |child|
          child.family = @family
          child.save
        end
        nanny.save
        format.json { render json: @family, status: :created }
      end
    end
  end

  def update
    @family = get_family
    respond_to do |format|
      if @family.update_attributes(family_params)
        format.json { render json: @family }
      else
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @family = get_family
    @family.destroy
    respond_to do |format|
      format.json { render json: "", status: :no_content }
    end
  end

  private

  def family_params
    params.require(:family).permit(:name, :phone_number, :address, :picture)
  end

  def child_params(child)
    child.permit(:name, :age, :allergies, :fav_food, :interests, :bed_time, :potty_trained, :special_needs)
  end

  def get_family
    Family.find_by(name: params[:id])
  end

end
