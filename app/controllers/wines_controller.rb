class WinesController < ApplicationController
  def index
    @wines = policy_scope(Wine).order(created_at: :desc)
  end
  def new
    @estate = params[:estate]
    @wine = Wine.new
    @tasting = @wine.tastings.build
    @wine.user = current_user
    @submit_label = "Ajouter ce vin"
    @submit_label_2 = "Ajouter une dégustation"
    authorize @wine
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.user = current_user
    @nose = @wine.tastings.last.nose_quality = params[:wine][:tastings_attributes]["0"]["nose_quality"].to_f
    @palate = @wine.tastings.last.palate_quality = params[:wine][:tastings_attributes]["0"]["palate_quality"].to_f
    @balance = @wine.tastings.last.balance = params[:wine][:tastings_attributes]["0"]["balance"].to_f
    @wine.save
    @submit_label = "Ajouter ce vin"
    @submit_label_2 = "Ajouter une dégustation"
    authorize @wine
    if @wine.save
      flash[:notice] = "Vin créé"
      redirect_to estate_path(@wine.estate)
    else
      flash[:alert] = "Ça a planté, mec!"
      render :new
    end
  end

  def show
    @wine = Wine.find(params[:id])
    authorize @wine
  end

  def edit
    @wine = Wine.find(params[:id])
    @submit_label = "Modifier le vin"
    authorize @wine
  end

  def update
    @wine = Wine.find(params[:id])
    @submit_label = "Modifier le vin"
    @wine.update(wine_params)
    authorize @wine
    if @wine.save
      flash[:notice] = "Update ok!!"
      redirect_to wines_path
    else
      flash[:alert] = "Mais c'est pas bien rempli, tout ça!!"
      render :edit
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.delete
    authorize @wine
    redirect_to wines_path
  end

private
  def wine_params
    params.require(:wine)
      .permit(
        :name,
        :label,
        :vintage,
        :grape_variety,
        :color,
        :alcohol,
        :mark,
        :description,
        :alcohol,
        :agricultural_mode,
        :available,
        :price_cents,
        :style,
        :sulfites,
        :estate_id,
        :photo,
        :photo_cache,
        tastings_attributes: [
          :eye_color, :nose_condition, :nose_intensity,
          :nose_development, :nose_quality, :palate_sweetness, :palate_acidity,
          :palate_tanin, :palate_alcohol, :palate_body, :flavour_intensity,
          :palate_finish, :palate_quality, :readiness, :balance, :description,
          :wine_id, :user_id, :_destroy
          ])
  end
end
