class DosesController < ApplicationController
  before_action :set_cocktail, only: %i[new create destroy]

  def new
    @dose = Dose.new
    @doses = @cocktail.doses
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to new_cocktail_dose_path(@cocktail), notice: "Ingredient added!"
    else
      @doses = @cocktail.doses
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to new_cocktail_dose_path(@cocktail, @dose), notice: "Ingredient removed."
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
