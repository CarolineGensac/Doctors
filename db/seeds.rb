# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#création docteurs random
require 'faker'

5.times do
  city = City.create!(name: Faker::Address.city)
end


5.times do
  city = City.order("RANDOM()").first
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Number.between(from: 92000, to: 92900), city: city)
end

#création patients random
5.times do
  city = City.order("RANDOM()").first
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: city)
end

5.times do
  specialty = Specialty.create!(name: Faker::Games::WorldOfWarcraft.class_name)
end

#création rdv random
5.times do
  doctor = Doctor.order("RANDOM()").first
  patient = Patient.order("RANDOM()").first
  specialty = Specialty.order("RANDOM()").first
  appointment = Appointment.create!(date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short), doctor: doctor, patient: patient, specialty: specialty)
end

