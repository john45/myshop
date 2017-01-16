class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new(save_params)

    if @review.save
      @product = Product.find(params[:review][:product_id])
      @review = Review.new
    else
      @product = Product.find(params[:review][:product_id])
      @review
    end
    # if @review.save
    #   redirect_to product_path(params[:review][:product_id]), notice: 'Your revie will published after moderate'
    # else
    #
    # end
  end

  private
    def save_params
      params.require(:review).permit(:author,
                                     :product_id,
                                     :body,
                                     :rating,
                                     :email)
    end
end
