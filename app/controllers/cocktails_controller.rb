class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses.includes(:ingredient)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: "Cocktail created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: "Cocktail updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to @cocktail, notice: "Cocktail removed!"
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
