require "test_helper"

class RecipeTest < ActiveSupport:: TestCase
  
  def setup
    @chef = Chef.create(name: "Bob", email: "bob@example.com")
    @recipe = @chef.recips.build(name: "chicken parm", summary: "this is the best chikcen parm ever",
              description: "Heat oil, add onions, add tomato sauce, add chicken, cook for 10 minutes" )
  end
  
  test "Recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "Chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "Name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "Summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "Summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "Summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "Description must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "Description length should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "Description length should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end

end