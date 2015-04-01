class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @innovation = Innovation.find(params[:innovation_id])
    @review = current_user.reviews.build(review_params)
    @review.innovation = @innovation
    if @review.save
      flash[:notice] = "Review Submitted"
      redirect_to innovation_path(@innovation)
    else
      redirect_to innovation_path(@innovation)
    end
  end

  private

  def review_params
    params.require(:review).permit(:novelty_rating,
                                   :usability_rating,
                                   :value_rating,
                                   :fourth_rating,
                                   :fifth_rating,
                                   :content)
  end
end
