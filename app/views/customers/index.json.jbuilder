json.array!(@customers) do |customer|
  json.extract! customer, :id, :business_name, :stripe_id, :uuid
  json.url customer_url(customer, format: :json)
end
