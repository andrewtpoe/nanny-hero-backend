json.name @family.name
json.phone_number @family.phone_number
json.address @family.address
json.picture @family.picture
json.nanny @family.nanny.name
json.children @family.children do |child|
  json.name child.name
  json.age child.age
  json.allergies child.allergies
  json.fav_food child.fav_food
  json.interests child.interests
  json.bed_time child.bed_time
  json.potty_trained child.potty_trained
  json.special_needs child.special_needs
end
