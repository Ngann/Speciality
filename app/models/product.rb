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

  # def self.review_sort
  #  avg_test = Review.product_review
  #  avg_test.each do |review|
  #    id = review.product_id
  #    array.push(id)
  #  end
  # end

  # def self.total_ratings
  #   self.select("product_id, avg(rating) as total").group("product_id").order("total DESC").limit(3)
  # end


# SELECT product_id, AVG (rating) AS total FROM reviews GROUP BY product_id ORDER BY total DESC LIMIT 10;

  # SELECT * FROM products, reviews WHERE products.id = reviews.product_id;

end
