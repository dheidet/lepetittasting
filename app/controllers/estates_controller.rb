class EstatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update]

  def index
    @estates = Estate.all
    authorize @estates
  end

  def new
    @estate = Estate.new
    @submit_label = "Ajouter le domaine"
    authorize @estate
  end

  def create
    @estate = Estate.new(estate_params)
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
      redirect_to root_path
    else
      flash[:alert] = "Mais c'est pas bien rempli, tout ça!!"
      render :edit
    end
  end

  private
  def estate_params
    params.require(:estate).permit(:name, :mark, :description)
  end
end
