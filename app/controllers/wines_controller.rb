class WinesController < ApplicationController
  def index
    @wines = policy_scope(Wine).order(created_at: :desc)
  end
  def new
    @wine = Wine.new
    @wine.user = current_user
    @submit_label = "Ajouter ce vin"
    @submit_label_2 = "Ajouter une dégustation"
    authorize @wine
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.user = current_user
    @submit_label = "Ajouter ce vin"
    @submit_label_2 = "Ajouter une dégustation"
    authorize @wine
    if @wine.save
      flash[:notice] = "Vin créé"
      if params[:commit] == @submit_label
        redirect_to wines_path
      else
        redirect_to new_tasting_path
      end
    else
      flash[:alert] = "Ça a planté, mec!"
      render :new
    end
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
    params.require(:wine).permit(:name, :label, :vintage, :grape_variety, :color,
      :color, :mark, :description, :alcohol, :agricultural_mode, :available,
      :price_cents, :style, :sulfites, :estate_id)
  end
end
