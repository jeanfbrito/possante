json.extract! vehicle, :id, :brand, :model, :fabrication, :mileage, :status, :numberplate, :slug, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
