# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Workout.delete_all
Member.delete_all
Dashboard.delete_all

puts "creating members..."

member1 = Member.new(
  id: 1,
  email: "ange@test.com",
  first_name: "Angee",
  last_name: "Otic",
  BIO: "Hellow, I enjoy working out",
  DOB: "29-05-1995",
  password: "seeded1"
)

member1.save

puts "created #{member1}!!"

workout1 = Workout.new(
  id: 1,
  name: "angee",
  description: "as many reps a possible"
)

workout1.save

puts "created #{workout1}!!"

dash1 = Dashboard.new(
  id: 1,
  score: "nil"
)

dash1.save!

# dash1.create(workout1)

puts "created #{dash1}!!"
