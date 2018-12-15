require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should belong_to :product }

  it("validates presence of comment") do
    review = Review.new({:content_body => ""})
    expect(review.save()).to(eq(false))
  end

  it("ensures the length of comment is at most 5 characters") do
    review = Review.new({:content_body => "a".*(6)})
    expect(review.save()).to(eq(false))
  end
end
