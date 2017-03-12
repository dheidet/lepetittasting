class TastingsController < ApplicationController
  def index
    @tastings = policy_scope(Tasting).order(created_at: :desc)
  end

  def new
    @tasting = Tasting.new
    @tasting.user = current_user
    @submit_label = "Ajouter une dégustation"
    authorize @tasting
  end

  def create
    @tasting = Tasting.new(tasting_params)
    @tasting.user = current_user
    @submit_label = "Ajouter une dégustation"
    authorize @tasting
    if @tasting.save
      flash[:notice] = "Dégustation créée"
      redirect_to root_path
    else
      flash[:alert] = "Ça a planté, mec!"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def tasting_params
    params.require(:tasting).permit(:eye_color, :nose_condition, :nose_intensity,
      :nose_development, :nose_quality, :palate_sweetness, :palate_acidity,
      :palate_tanin, :palate_alcohol, :palate_body, :flavour_intensity,
      :palate_finish, :palate_quality, :readiness, :balance, :description)
  end
end
