# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
nanny = Nanny.new
nanny.name = "Carlos"
nanny.save

fam = Family.new
fam.name = "Poes"
fam.phone_number = "843-222-2222"
fam.address = "1234 Not Your Street, Charleston SC 29414"
fam.nanny = nanny
fam.save

kid = Child.new
kid.name = "Audrey"
kid.family = fam
kid.save

kid2 = Child.new
kid.name = "Jasper"
kid.family = fam
kid.save
