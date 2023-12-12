# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  health = HealthcareProfessional.find_or_create_by(name: 'Dr. Vijay', specialization: 'Eye Specialist', email: 'vijay@gmail.com', phone_number: "919988888889")
  [{day: "Monday", available_from: "10 AM" , available_to: "2 PM"}, {day: "Monday", available_from: "5 PM" , available_to: "8 PM"}, {day: "Tuesday", available_from: "10 AM" , available_to: "7 PM"}, 
  {day: "Wednesday", available_from: "10 AM" , available_to: "2 PM"}, {day: "Thursday", available_from: "10 AM" , available_to: "6 PM"}, {day: "Friday", available_from: "10 AM" , available_to: "6 PM"}, 
  {day: "Saturday", available_from: "10 AM" , available_to: "2 PM"}].each do |available|
    health.professional_availabilities.create(available)
  end

  health = HealthcareProfessional.find_or_create_by(name: 'Dr. Arvind', specialization: 'Heart Specialist', email: 'arvind@gmail.com', phone_number: "919888888889")
  [{day: "Monday", available_from: "10 AM" , available_to: "2 PM"}, {day: "Monday", available_from: "5 PM" , available_to: "8 PM"}, {day: "Tuesday", available_from: "10 AM" , available_to: "7 PM"}, 
  {day: "Wednesday", available_from: "10 AM" , available_to: "2 PM"}, {day: "Thursday", available_from: "10 AM" , available_to: "6 PM"}, {day: "Friday", available_from: "10 AM" , available_to: "6 PM"}, 
  {day: "Saturday", available_from: "10 AM" , available_to: "2 PM"}].each do |available|
    health.professional_availabilities.create(available)
  end

  health = HealthcareProfessional.find_or_create_by(name: 'Dr. Praveen', specialization: 'Diabetologist and General Physician', email: 'praveen@gmail.com', phone_number: "919988988889")
  [{day: "Monday", available_from: "10 AM" , available_to: "2 PM"}, {day: "Monday", available_from: "5 PM" , available_to: "8 PM"}, {day: "Tuesday", available_from: "10 AM" , available_to: "7 PM"}, 
  {day: "Wednesday", available_from: "10 AM" , available_to: "2 PM"}, {day: "Thursday", available_from: "10 AM" , available_to: "6 PM"}, {day: "Friday", available_from: "10 AM" , available_to: "6 PM"}, 
  {day: "Saturday", available_from: "10 AM" , available_to: "2 PM"}].each do |available|
    health.professional_availabilities.create(available)
  end

  health = HealthcareProfessional.find_or_create_by(name: 'Dr. Deepak', specialization: 'Eye Specialist', email: 'deepak@gmail.com', phone_number: "919898888889")
  [{day: "Monday", available_from: "10 AM" , available_to: "2 PM"}, {day: "Monday", available_from: "5 PM" , available_to: "8 PM"}, {day: "Tuesday", available_from: "10 AM" , available_to: "7 PM"}, 
  {day: "Wednesday", available_from: "10 AM" , available_to: "2 PM"}, {day: "Thursday", available_from: "10 AM" , available_to: "6 PM"}, {day: "Friday", available_from: "10 AM" , available_to: "6 PM"}, 
  {day: "Saturday", available_from: "10 AM" , available_to: "2 PM"}].each do |available|
    health.professional_availabilities.create(available)
  end
  