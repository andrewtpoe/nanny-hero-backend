class Api::NannyController < ApplicationController

  def create
    @nanny = Nanny.new(nanny_params)
    if @nanny.save
      render nothing: true, status: :created
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def show
    @nanny = get_nanny
    if @nanny
      render :show
    else
      render nothing: true, status: 404
    end
  end

  def destroy
    @nanny = get_nanny
    @nanny.destroy
    render nothing: true, status: 200
  end

  private

  def nanny_params
    params.require(:nanny).permit(:name, :family_id)
  end

  def get_nanny
    Nanny.find_by(name: params[:id])
  end

end
