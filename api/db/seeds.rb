# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Country.transaction do 
  Country.find_or_create_by(name: "Cameroon", code: "237", regex: "237 ?[2368]\\d{7,8}$")
  Country.find_or_create_by(name: "Ethiopia", code: "251", regex: "251 ?[1-59]\\d{8}$")
  Country.find_or_create_by(name: "Morocoo", code: "212", regex: "212 ?[5-9]\\d{8}$")
  Country.find_or_create_by(name: "Mozambique", code: "258", regex: "258 ?[28]\\d{7,8}$")
  Country.find_or_create_by(name: "Uganda", code: "256", regex: "256 ?\\d{9}$")
end

santized_data = CsvUtils.read_users('test_file')
User.insert_all(santized_data[:users])
santized_data[:code_to_count_hash].each do |code, users_count|
  Country.where(code: code).update(users_count: users_count)
end