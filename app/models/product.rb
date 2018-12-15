class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true

  # scope :most_products, -> {(
  #   select("products.id, products.name, products.cost, products.country,count(reviews.id) as reviews_count")
  #   .joins(:reviews)
  #   .group("products.id")
  #   .order("reviews_count DESC")
  #   .limit(3)
  #   )}

  def self.recent
    self.order(created_at: :desc).limit(3)
  end

end
