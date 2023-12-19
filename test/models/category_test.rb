require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should have many articles" do 
    category = Category.new(name: "food")

    assert_respond_to category, :articles
    article = category.articles.create(title: "fashion", content: "blah blah")

    assert category.save
  end 

  test "should be valid with a unique and present name" do
    category = Category.new(name: "UniqueName")
    assert Category.valid?, "Model is not valid with a unique and present named"
  end

  test "description can be blank" do
  end
end
