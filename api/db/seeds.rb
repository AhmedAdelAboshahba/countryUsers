# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'start reading file ....'
t1 = Time.now
users_attributes = CsvUtils.read_users('test_file')
t2 = Time.now
puts "File read in #{t2 - t1} seconds"

puts 'start inserting data ...'
t1 = Time.now
User.transaction do
  User.insert_all(users_attributes)
end
t2 = Time.now
puts "Data inserted in #{t2 - t1} seconds"