require 'csv'

m = Member.new(
  first_name: "ange",
  last_name: "otic",
  BIO: "i am loving this code",
  DOB: "29/05/1995",
  email: "angelee@tja.com",
  password: "1234455"
)

if m.save
  puts "#{m.first_name} saved!"
else
  puts "#{m.errors.full_messages.join(', ')} not created. "
end

d = Dashboard.new(
  score: "23",
  member: m
)

if d.save
  puts "#{d} saved!"
else
  puts "#{d.errors.full_messages.join(', ')} not created. "
end
# DASHBOARD
# need to create a dashboard for the members below
def generate_unique_id
  def generate_unique_id
    loop do
      id = rand(36**10).to_s(36).rjust(10, '0') # Generate a pseudo-random alphanumeric ID
      return id unless Dashboard.exists?(dashboard_id: id)
    end
  end
end

member_csv = File.read(Rails.root.join('db', 'csv_seed', 'member.csv'))

# MEMBERS
p "creating other members!!!!"
csv_data = CSV.parse(member_csv, headers: true)

csv_data.each do |row|
  # counter = 0

  member = Member.new(
    first_name: row['first_name'],
    last_name: row['last_name'],
    BIO: row['BIO'],
    DOB: row['DOB'],
    email: row['email'],
    password: row['1234']
    # member_id: generate_unique_id,
    # dashboard_id: generate_unique_id
  )

  if member.save
    dashboard = Dashboard.new(
      dashboard_id: generate_unique_id,
      score: ''
    )
    if dashboard.save
      member.update(dashboard_id: dashboard.id)
      dashboard.update(member_id: member.id)
      puts "#{member.first_name}, #{member.last_name} and dashboard created with dashboard ID: #{dashboard.dashboard_id}."
    else
      puts "FAILEDDDD to create dashboard #{dashboard.errors.full_messages.join(', ')}"
      member.destroy_all
    end
  else
    puts "failed again to create #{member.first_name}, #{member.last_name}"
    puts "errorrrrrr : #{member.errors.full_messages.join(', ')}"
  end
end







# member_csv.each do |d|
#   dassh(d).save
# end
# member_csv_data.each do |row|
  # u = Member.create!(
  #   first_name: row['first_name'],
  #   last_name: row['last_name'],
  #   BIO: row['BIO'],
  #   DOB: row['DOB'],
  #   email: row['email'],
  #   password: "123456"
  # )
# end
# puts member_csv


# p ""
# p ">>> #{counter} #{u.pluralize(counter)} generated"



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
