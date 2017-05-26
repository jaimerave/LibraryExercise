require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
  end

  test "borrow" do
    @item = create(:item)
    2.times{create(:item_copy, item: @item)}
    @user.borrow(@item, 1)
    assert @user.borrowed_copies.count == 1
    assert @user.item_copies.count == 1
  end
end
