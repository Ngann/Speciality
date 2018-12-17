class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :presence => true
  validates(:content_body, {:presence => true, :length => { :maximum => 50 }})

  # scope :total_rating,includes(:reviews).group('product_id').where('SUM(reviews.rating)');

  def self.total_ratings
    self.select("product_id, avg(rating) as total").group("product_id").order("total DESC").limit(3)
  end

  def self.product_review
   array= []
   average_product_review = self.total_ratings
   average_product_review.each do |review|
     id = review.product_id
     array.push(id)
   end
   array
  end

end
