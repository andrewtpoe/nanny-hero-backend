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
      format.json { render json: @family }
    end
  end

  def create
    @family = Family.new(family_params)
    respond_to do |format|
      if @family.save
        format.json { render json: @family, status: :created }
      else
        format.json { render json: @family.errors, status: :unprocessable_entity }
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

  def get_family
    Family.find(params[:id])
  end

end
