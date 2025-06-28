class ReviewsController < ApplicationController
  before_action :set_cocktail, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review = @cocktail.reviews.build(review_params)
    if @review.save
      redirect_to @cocktail, notice: "review added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
