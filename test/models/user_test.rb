require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "should have many comments" do 
    user = user.new(
      first_name: "fouziah",
      last_name: "ahmed",
      username: "fouzistar",
      email: "ahmedfouziya22@gmail.com"
    )

      comment1 = Comment.new(body: "Comment body 1")
      comment2 = Comment.new(body: "Comment body 2")

      user.comments << comment1
      user.comments << comment2

      assert_equal 2, user.comments.length, "User should have two comments"
      assert user.save, "Could not save user with comments"
  end
end
