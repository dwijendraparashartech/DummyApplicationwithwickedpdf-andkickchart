json.extract! order, :id, :price, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
