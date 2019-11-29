class DosesController < ApplicationController

  def create
    @dose = Dose.new(doses_params)
    cocktail_id = params[:cocktail_id]
    @cocktail = Cocktail.find(cocktail_id)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @review = Review.new
      render 'cocktails/show'
    end
  end

  def destroy
    dose_id = params[:id]
    @dose = Dose.find(dose_id)
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
