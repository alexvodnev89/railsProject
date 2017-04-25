json.extract! membership_option, :id, :title, :description, :price, :created_at, :updated_at
json.url membership_option_url(membership_option, format: :json)