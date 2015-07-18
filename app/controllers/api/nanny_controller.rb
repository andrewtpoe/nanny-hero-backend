class Api::NannyController < ApplicationController
  def create
    @nanny = Nanny.new(nanny_params)
    respond_to do |format|
      if @nanny.save
        format.json { render json: @nanny, status: :created }
      else
        format.json { render json: @nanny.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @nanny = get_nanny
    @nanny.destroy
    respond_to do |format|
      format.json { render json: "", status: :no_content }
    end
  end

  private

  def nanny_params
    params.require(:nanny).permit(:name, :family_id)
  end

  def get_nanny
    Nanny.find(params[:id])
  end

end
