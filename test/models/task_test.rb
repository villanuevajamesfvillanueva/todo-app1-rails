require "test_helper"

class TaskTest < ActiveSupport::TestCase
 
  test 'should not save task without title' do
    task = Task.create(
      title: nil,
      body: 'task description'
    )
    assert_not task.valid?, 'Invalid! Task\'s title is missing'
  end

  test 'should not save task with empty string in title' do
    task = Task.create(
      title: '',
      body: 'task description'
    )
    assert_not task.valid?, 'Invalid! Task\'s title cannot be empty string'
  end

  test 'should not save task without body' do
    task = Task.create(
      title: 'task title',
      body: nil
    )

    assert_not task.valid?, 'Invalid! Task\'s body is missing'
  end

  test 'should not save task with empty string in body' do
    task = Task.create(
      title: 'task title',
      body: ''
    )
    assert_not task.valid?, 'Invalid! Task\'s body cannot be empty string'
  end

end
