# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "ex@hrl.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Administrator",
             email: "xrd-admin@hrl.com",
             password:              "galaxy",
             password_confirmation: "galaxy",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Another User",
             email: "an@hrl.com",
             password:              "asdf",
             password_confirmation: "asdf",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

another = User.find_by(email: 'an@hrl.com')
for i in (0..10)
  a = "Sample #{i}"
  b = "6110.597.#{i}"
  c = "In Line"
  d = "x00"
  e = "RC"
  f = 1 + rand(20)
  g = f + 1 + rand(50)
  another.entries.create!(sample: a, charge: b, need_by: c, file_format: d, scan_type: e,
                       description: Faker::Lorem.sentence(2),
                       conditions: "#{f} to #{g} degrees",
                       instructions: Faker::Lorem.sentence(5))
end

example = User.find_by(email: 'ex@hrl.com')
for i in (0..5)
  a = "Samp-Examp-#{i}"
  b = "ABCD.XYZ.#{i}"
  c = "ASAP"
  d = "all"
  e = "XRR"
  f = 1 + rand(10)
  g = f + 1 + rand(50)
  example.entries.create!(sample: a, charge: b, need_by: c, file_format: d, scan_type: e,
                       description: Faker::Lorem.sentence(2),
                       conditions: "#{f} to #{g} degrees",
                       instructions: Faker::Lorem.sentence(5))
end

admin = User.find_by(email: 'xrd-admin@hrl.com')
today = Date.today
for i in (0..5)
  start_time = Time.parse("#{today+i} at 9:00am")
  end_time   = Time.parse("#{today+i} at 9:59am")
  admin.appointments.create!(start_time: start_time, end_time: end_time)
end
