# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_list = [
    ["c@saurabhj.net", "saurabh12.ggn","9999"],
    ["me@saurabhj.net", "saurabh12.ggn","9998"]
]

admin_list.each do |email, password|
  admin = Admin.new(:email => email, :password => password, :password_confirmation => password, name: "Saurabh")
  admin.confirmation_token = nil
  admin.skip_confirmation!
  admin.skip_confirmation_notification!
  admin.save

end

user_list = [
    ["user@saurabhj.net", "demo","9999"],
    ["u@saurabhj.net", "demo","9998"]
]

user_list.each do |email, password|
  user = User.new(:email => email, :password => password, :password_confirmation => password, name: "User")
  user.confirmation_token = nil
  user.skip_confirmation!
  user.skip_confirmation_notification!
  user.save

end