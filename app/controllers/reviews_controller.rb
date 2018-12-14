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
     @product = Product.find(params[:id])
     render :edit
    end

   def update
     @product = Product.find(params[:id])
     if @product.update(product_params)
       redirect_to products_path
     else
       render :edit
     end
   end

   def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end

private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end


end
