# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create( name: 'Admin', 
  password: '1234567',
  email: 'admin@test.com')

admin.approved = true

Broker.create( name: 'Broker', 
    password: '123456',
    email: 'broker@test.com',
    approved: true)

Buyer.create( name: 'Buyer', 
  password: '123456',
  email: 'buyer@test.com')