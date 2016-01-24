json.array!(@mappings) do |mapping|
  json.extract! mapping, :id, :customer_id, :phone_number_id, :incoming_phone_number_id, :received_text, :reply_text
  json.url mapping_url(mapping, format: :json)
end
