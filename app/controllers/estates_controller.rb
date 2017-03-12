class EstatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @estates = policy_scope(Estate).order(created_at: :desc)
    # authorize @estates
  end

  def new
    @estate = Estate.new
    @estate.user = current_user
    @submit_label = "Ajouter le domaine"
    authorize @estate
  end

  def create
    @estate = Estate.new(estate_params)
    @estate.user = current_user
    @submit_label = "Ajouter le domaine"
    authorize @estate
    if @estate.save
      flash[:notice] = "Domaine créée"
      redirect_to estates_path
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
    params.require(:estate).permit(:name, :mark, :description, :user_id)
  end
end
