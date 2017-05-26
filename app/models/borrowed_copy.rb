class BorrowedCopy < ApplicationRecord
  belongs_to :item_copy
  belongs_to :user
end
