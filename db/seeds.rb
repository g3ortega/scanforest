# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.delete_all

Country.create(:iso=>"NIC",:name=>"Nicaragua")
Country.create(:iso=>"CRI",:name=>"Costa Rica")
Country.create(:iso=>"SLV",:name=>"El Salvador")
Country.create(:iso=>"HND",:name=>"Honduras")
Country.create(:iso=>"GTM",:name=>"Guatemala")
Country.create(:iso=>"PAN",:name=>"Panama")

puts "Se ha creado todos los paises"