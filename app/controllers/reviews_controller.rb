class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @reviews = Review.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
      @product = Product.find(params[:product_id])
      @review = @product.reviews.new(review_params)
      if @review.save
        redirect_to product_path(@review.product)
      else
        render :new
      end
    end

    def edit
    @product = Product.find(params[:product_id])
     @review = Review.find(params[:id])
     render :edit
    end

   def update
     @review = Review.find(params[:id])
     if @review.update(review_params)
       redirect_to products_path
     else
       render :show
     end
   end

   def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to products_path
    end

private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end


end
