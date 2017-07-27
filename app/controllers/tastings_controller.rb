class TastingsController < ApplicationController
  def index
    @tastings = policy_scope(Tasting).order(created_at: :desc)
  end

  def new
    @wine = Wine.find(params[:wine_id])
    @tasting = @wine.tastings.new
    @tasting.user = current_user
    @submit_label = "Ajouter une dégustation"
    authorize @tasting
  end

  def create
    @wine = Wine.find(params[:wine_id])
    @tasting = @wine.tastings.new(tasting_params)
    # @tasting.nose_quality = params[:wine][:tastings_attributes]["0"]["nose_quality"].to_f
    # @tasting.palate_quality = params[:wine][:tastings_attributes]["0"]["palate_quality"].to_f
    # @tasting.balance = params[:wine][:tastings_attributes]["0"]["balance"].to_f
    @tasting.user = current_user
    @submit_label = "Ajouter une dégustation"
    authorize @tasting
    if @tasting.save
      flash[:notice] = "Dégustation créée"
      redirect_to wine_path(@wine)
    else
      flash[:alert] = "Ça a planté, mec!"
      render :new
    end
  end

  def edit
    @tasting = Tasting.find(params[:id])
    @submit_label = "Modifier la dégustation"
    authorize @tasting
  end

  def update
    @tasting = Tasting.find(params[:id])
    @submit_label = "Modifier la dégustation"
    @tasting.update(tasting_params)
    authorize @tasting
    if @tasting.save
      flash[:notice] = "Update ok!!"
      redirect_to tastings_path
    else
      flash[:alert] = "Mais c'est pas bien rempli, tout ça!!"
      render :edit
    end
  end

  def destroy
    @tasting = Tasting.find(params[:id])
    @tasting.delete
    authorize @tasting
    redirect_to tastings_path
  end

  private
  def tasting_params
    params.require(:tasting).permit(:eye_color, :nose_condition, :nose_intensity,
      :nose_development, :nose_quality, :palate_sweetness, :palate_acidity,
      :palate_tanin, :palate_alcohol, :palate_body, :flavour_intensity,
      :palate_finish, :palate_quality, :readiness, :balance, :description, :wine_id)
  end
end
