class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :presence => true
  validates(:content_body, {:presence => true, :length => { :maximum => 50 }})

end
