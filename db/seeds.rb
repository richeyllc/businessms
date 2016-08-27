# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if MappingType.count < 1
  [
    {type:"AutoResponse", description:"Automatically responds to a text based on the received text from the user."},
    {type:"External Function", description:"Executes an external function or method then returns the results via text."},
    {type:"Hours", description:"Returns the current open/closed status and the business hours based on an API call to an external url."},
    {type:"Location", description:"Sends back the location (map coordinates) and the address of a location."},
    {type:"CallBack", description:"Schedules a call back to the texter so they can be contacted by a CSR"}
  ].each do |this_type|
    MappingType.create(name: this_type[:type], description: this_type[:description])
  end
end

if UserType.count < 1
  [
    {name: "super_admin", description: "Backend Administrators - Myself & Owners."},
    {name: "admin", description: "My Company employees."},
    {name: "owner", description: "Signed-up User account. Owner of an account or product."},
    {name: "manager", description: "Signed-up User account. Given different permissions by an owner."},
    {name: "user", description: "Signed-up User account. Given no permissions."},
    {name: "guest", description: "User Signed-up user. May be an unnecessary account. Can see token links."}
  ].each do |this_type|
    UserType.create(name: this_type[:name], description: this_type[:description])
  end
end
