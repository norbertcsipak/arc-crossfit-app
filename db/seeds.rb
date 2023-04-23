require 'csv'

member_csv = File.read(Rails.root.join('db', 'csv_seed', 'member.csv'))

# MEMBERS
p "creating "
member_csv_data = CSV.parse(member_csv, headers: true, encoding: 'ISO-8859-1')
counter = 0
member_csv_data.each do |row|
  u = Member.create!(
    first_name: row['first_name'],
    last_name: row['last_name'],
    BIO: row['BIO'],
    email: row['email'],
    password: "123456"
  )
  counter += 1 if u.persisted?
  print "."
end

p ""
p ">>> #{counter} #{'member'.pluralize(counter)} generated"


# workout1 = Workout.new(
#   id: 1,
#   name: "angee",
#   description: "as many reps a possible"
# )

# workout1.save

# puts "created #{workout1}!!"

# dash1 = Dashboard.new(
#   id: 1,
#   score: "nil"
# )

# dash1.save!

# # dash1.create(workout1)

# puts "created #{dash1}!!"
