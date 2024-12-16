json.extract! item, :id, :name, :quantity, :status, :list_id, :created_at, :updated_at
json.url item_url(item, format: :json)
