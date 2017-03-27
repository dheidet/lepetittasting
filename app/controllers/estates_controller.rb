class EstatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @estates = policy_scope(Estate).order(created_at: :desc)
  end

  def show
    @estate = Estate.find(params[:id])
    @wines = @estate.wines
    authorize @estate
  end

  def new
    @estate = Estate.new
    @estate.user = current_user
    @wine = @estate.wines.build
    @tasting = @wine.tastings.build
    @submit_label = "Ajouter le domaine"
    authorize @estate
  end

  def create
    @estate = Estate.new(estate_params)
    @estate.user = current_user
    @submit_label = "Ajouter le domaine"
    @estate.save
    authorize @estate
    if @estate.save
      flash[:notice] = "Domaine créée"
      redirect_to estate_path(@estate)
    else
      flash[:alert] = "Ça a planté, mec!"
      render :new
    end
  end

  def edit
    @estate = Estate.find(params[:id])
    @submit_label = "Modifier le domaine"
    authorize @estate
  end

  def update
    @estate = Estate.find(params[:id])
    @submit_label = "Modifier le domaine"
    @estate.update(estate_params)
    authorize @estate
    if @estate.save
      flash[:notice] = "Update ok!!"
      redirect_to estates_path
    else
      flash[:alert] = "Mais c'est pas bien rempli, tout ça!!"
      render :edit
    end
  end

  def destroy
    @estate = Estate.find(params[:id])
    @estate.delete
    authorize @estate
    redirect_to estates_path
  end

  private
  def estate_params
    params.require(:estate).permit(
        :id,
        :name,
        :mark,
        :description,
        :user_id,
        wines_attributes: [:id, :name, :label, :vintage, :grape_variety, :color,
        :style, :mark, :description, :agricultural_mode, :sulfite, :price_cents,
        :estate_id, :user_id, :photo, :photo_cache, :_destroy,
        tastings_attributes: [
          :eye_color, :nose_condition, :nose_intensity,
          :nose_development, :nose_quality, :palate_sweetness, :palate_acidity,
          :palate_tanin, :palate_alcohol, :palate_body, :flavour_intensity,
          :palate_finish, :palate_quality, :readiness, :balance, :description,
          :wine_id, :user_id, :_destroy
          ]])
  end
end
