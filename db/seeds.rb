# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[User, Role].each { |model_name| model_name.destroy_all }

puts "~ Importing Roles."
admin_role = Role.create!(name: "admin", description: "Администратор")
puts admin_role.inspect

puts "~ Importing initial Users."
user = User.create!(email: "user@example.com", password: "123456", password_confirmation: "123456")
admin = User.create!(email: "admin@example.com", password: "123456", password_confirmation: "123456", :role => admin_role)
puts admin.inspect

# puts "~ Granting admin role."
# admin.role = admin_role
# admin.save!
# puts admin.inspect

