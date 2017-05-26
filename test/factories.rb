FactoryGirl.define do
  factory :user do
    username "jaimerave"
  end

  factory :item do
    title "How I Met Your Mother - Season 1"
    item_type "dvd"
  end

  factory :item_copy do
    item
    status :available
  end
end
