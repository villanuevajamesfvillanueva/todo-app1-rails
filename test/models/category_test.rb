require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save task without name' do
    category = Category.create(
      name: nil
    )
    assert_not category.save, 'Error! Category saved without name'
  end

  test 'should not save task with empty string as name' do
    category = Category.create(
      name: ''
    )
    assert_not category.save, 'Error! Category saved with empty string as name'
  end
end
