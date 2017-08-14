# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.create(email: 'admin@example.com', password: 'password');

Vehicle.create( brand: "Honda", model: 'Civic LX 16V 115cv 4p', fabrication: "2005", mileage: 123456, numberplate: 'IMP-4233', status: :ok)
Vehicle.create( brand: "Toyota", model: 'Corolla Xli 110cv Aut.', fabrication: "2004", mileage: 123456, numberplate: 'IOY-9926', status: :warning)
Vehicle.create( brand: "Honda", model: 'XR 250 Tornado', fabrication: "2007", mileage: 123456, numberplate: 'INU-3636', status: :danger)

kmanterior = 0
for i in 0..50
  thatdate = 780 - i * 15
  kmatual = kmanterior + rand(420..590)
  kmanterior = kmatual
  Refuelling.create( date: thatdate.day.ago, mileage: kmatual, liter_price: rand(2.791..2.899), total_value: 100 + rand(25..45), gas_station: 'Ipiranguinha', vehicle_id: 3)
end

kmanterior = 10000
for i in 0..50
  thatdate = 780 - i * 15
  kmatual = kmanterior + rand(420..590)
  kmanterior = kmatual
  Refuelling.create( date: thatdate.day.ago, mileage: kmatual, liter_price: rand(2.791..2.899), total_value: 100 + rand(25..45), gas_station: 'Ipiranguinha', vehicle_id: 1)
end

kmanterior = 45000
for i in 0..50
  thatdate = 780 - i * 15
  kmatual = kmanterior + rand(420..590)
  kmanterior = kmatual
  Refuelling.create( date: thatdate.day.ago, mileage: kmatual, liter_price: rand(2.791..2.899), total_value: 100 + rand(25..45), gas_station: 'Ipiranguinha', vehicle_id: 2)
end
