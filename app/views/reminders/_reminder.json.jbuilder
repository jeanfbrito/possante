json.extract! reminder, :id, :name, :date, :mileage, :vehicle_id, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
