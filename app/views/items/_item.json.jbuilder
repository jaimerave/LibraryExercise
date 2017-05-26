json.extract! item, :id, :title, :length, :copies, :item_type, :created_at, :updated_at
json.url item_url(item, format: :json)
