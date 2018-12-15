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
    select("products, reviews, products.id = reviews.product_id")
    .order("reviews.product_id DESC")
    .limit(3)
    )}

  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}
  # scope :total_rating,includes(:reviews).group('product_id').where('SUM(reviews.rating)');

  def self.recent_add
    self.order(created_at: :desc).limit(3)
  end

  def self.top_ratings
    self.select("*").from("products, reviews").where("products.id = reviews.product_id").limit(3)
  end

  def self.total_rating
    self.select("product_id, sum(rating) as total").group("product_id").order("total DESC").limit(3)
  end


  # SELECT product_id, SUM (rating) AS total FROM reviews GROUP BY product_id ORDER BY total DESC;

  # SELECT * FROM products, reviews WHERE products.id = reviews.product_id;

end
