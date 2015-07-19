class Api::FamilyController < ApplicationController

  def index
    @families = Family.all
  end

  def show
    @family = get_family
    if @family
      render :show
    else
      render nothing: true, status: 404
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
        nanny = Nanny.find_by(name: params[:family][:nanny])
        unless nanny
          nanny = Nanny.new(name: params[:family][:nanny])
        end
      else
        valid << false
      end
    else
      valid << false
    end
    if valid.include?(false)
      render nothing: true, status: :unprocessable_entity
    else
      nanny.save
      @family.nanny = nanny
      @family.save
      valid_children.each do |child|
        child.family = @family
        child.save
      end
      render nothing: true, status: :created
    end
  end

  def update
    @family = get_family
    if @family.update_attributes(family_params)
      params[:family][:children].each do |child|
        kid = Child.find(child[:child_id])
        kid.update_attributes(child_params(child))
      end
      unless params[:family][:nanny] == @family.nanny.name
        nanny = Nanny.find_by(name: params[:family][:nanny])
        unless nanny
          nanny = Nanny.new(name: params[:family][:nanny])
        end
        nanny.save
        @family.nanny = nanny
        @family.save
      end
      render nothing: true, status: 201
    else
      render nothing: true, status: 422
    end
  end

  def destroy
    @family = get_family
    @family.destroy
    render nothing: true, status: 200
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
