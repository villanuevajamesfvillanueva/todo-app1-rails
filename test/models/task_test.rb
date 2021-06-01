require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save task without title' do
    task = Task.create(
      title: nil,
      body: 'task description'
    )
    assert_not task.save, 'Error! Task saved without title'
  end

  test 'should not save task with empty string in title' do
    task = Task.create(
      title: '',
      body: 'task description'
    )
    assert_not task.save, 'Error! Task saved with empty string as title'
  end

  test 'should not save task without body' do
    task = Task.create(
      title: 'task title',
      body: nil
    )

    assert_not task.save, 'Error! Task saved without body'
  end

  test 'should not save task with empty string in body' do
    task = Task.create(
      title: 'task title',
      body: ''
    )
    assert_not task.save, 'Error! Task saved with empty string as body'
  end

end
