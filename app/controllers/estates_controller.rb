class EstatesController < ApplicationController

  def new
    @estate = Estate.new
    @submit_label = "Ajouter mon vin"
    authorize @estate
  end

  def create
    @estate = Estate.new(estate_params)
  end

  private
  def estate_params
    params.require(:estate).permit(:name, :mark, :description)
  end
end
