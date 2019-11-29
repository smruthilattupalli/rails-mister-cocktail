class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    cocktail_id = params[:cocktail_id]
    @cocktail = Cocktail.find(cocktail_id)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      @dose = Dose.new
      render 'cocktails/show'
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
