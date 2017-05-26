require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "available_copies" do
    @item = create(:item)
    2.times{@item.item_copies.create(status: :available)}
    assert @item.available_copies.count == 2
  end
end
