# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TicketStatus.delete_all  
User.delete_all

TicketStatus.create!(text: "Waiting for Staff Response")
TicketStatus.create!(text: "Waiting for Customer")
TicketStatus.create!(text: "On Hold")
TicketStatus.create!(text: "Cancelled")
TicketStatus.create!(text: "Complete")

role_admin = Role.create!(rolename: 'admin', admin: true)
role_member = Role.create!(rolename: 'member', admin: false)

User.create!(username: 'admin', password: 'password', email: 'admin@example.com', role: role_admin)
User.create!(username: 'david', password: 'password', email: 'd.spautz@mail.com', role: role_member)