class CompetitionsController < ApplicationController

  def new
    @competition = Competition.new
    @wine = params[:wine]
    @competition_price_stages = @competition.competition_price_stages.build
    @submit_label = "Ajouter"
    authorize @competition
  end
  def create
    @competition = Competition.new(competition_params)
    @submit_label = "Ajouter"
    authorize @competition
    if @competition.save
      flash[:notice] = "Compétition créée"
      redirect_to root_path
    else
      flash[:alert] = "Ça a planté, mec!"
      render :new
    end
  end

  private
  def competition_params
    params.require(:competition).permit(
      :wine_id,
      :contenance,
      :competitor,
      :link,
      competition_price_stages_attributes: [
        :wine_price,
        :transport_price,
        :conditionning,
        :_destroy
        ])
  end
end
