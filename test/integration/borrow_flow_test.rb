require 'test_helper'

class BorrowFlowTest < ActionDispatch::IntegrationTest
  setup do
    @item = create(:item)
    @user = create(:user)
  end

  test "borrow an available item" do
    2.times{@item.item_copies.create(status: :available)}
    post borrow_item_url(@item), params: {username: @user.username, amount: 1}
    assert_response :success
    assert @user.item_copies.count == 1
  end

  test "try to borrow an item without providing a username" do
    post borrow_item_url(@item), params: {amount: 1}
    assert_match "Invalid User", @response.body
    assert_response :unprocessable_entity
  end

  test "try to borrow an item that have not enough copies" do
    2.times{@item.item_copies.create(status: :available)}
    post borrow_item_url(@item), params: {username: @user.username, amount: 3}
    assert_match "Not enough copies available", @response.body
    assert_response :unprocessable_entity
  end

  test "Return an item" do
    2.times{@item.item_copies.create(status: :available)}
    @user.borrow(@item, 1)
    post return_item_url(@item), params: {username: @user.username, amount: 1}
    assert_response :success
    assert @user.borrowed_copies.count == 0
    assert @item.available_copies.count == 2
  end
end
