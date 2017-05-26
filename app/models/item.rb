class Item < ApplicationRecord
  has_many :item_copies
  has_many :available_copies, ->{where(status: :available)}, class_name: "ItemCopy" 
end
