class User < ApplicationRecord
  has_many :borrowed_copies
  has_many :item_copies, through: :borrowed_copies

  def borrow(item, amount)
    item.available_copies.limit(amount).each do |copy|
      borrowed_copies.create(item_copy: copy)
      copy.update_attribute(:status, :borrowed)
    end
  end
end
