require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: 'Fruit Custard', summary: 'custard with fruits', description: "milk, fruits, custard" )
  end
  
  test 'recipe sould be valid' do
    assert @recipe.valid?
  end
  
  test "name should be prasent" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
end