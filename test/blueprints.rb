require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.email { Faker::Internet.email }
Sham.first_name { Faker::Name.first_name }
Sham.last_name { Faker::Name.last_name }
Sham.name { Faker::Internet.email }

Contact.blueprint do
  first_name
  last_name
  email
end

Group.blueprint do
  name{["Family","Friends","Work"][rand(3)]}
end

Twitter.blueprint do
  name
end

Gtalk.blueprint do
  name
end

Jabber.blueprint do
  name
end