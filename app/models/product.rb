class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  #
  # scope :most_reviews, -> {(
  #   select("products.id, products.name, products.cost, products.country,count(reviews.id) as reviews_count")
  #   .joins(:reviews)
  #   .group("products.id")
  #   .order("reviews_count DESC")
  #   .limit(3)
  #   )}

  scope :most_reviews, -> {(
    select("products.id, count(reviews.product_id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(3)
    )}


  def self.recent_add
    self.order(created_at: :desc).limit(3)
  end

  def self.top_reviews
    self.order(created_at: :desc).limit(3)
  end



  # SELECT * FROM products, reviews WHERE products.id = reviews.product_id;

end
