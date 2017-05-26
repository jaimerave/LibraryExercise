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
end
