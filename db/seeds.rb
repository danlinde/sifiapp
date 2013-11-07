# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

oid = Organizer.create(email: "ddlinde2@gmail.com").id
ps = [Participant.create(email: "vinaybeta@yahoo.com", response: "Yes"), Participant.create(email: "haley.xt.wright@gmail.com", response: "Yes"), Participant.create(email: "davwood_1@yahoo.com.au", response: "No"), Participant.create(email: "kiyhong@gmail.com", response: "Yes")]
events = Event.create( name: 'Hot Yoga', description: 'Yoga', deadline: "2013-11-11 00:00:00", event_date: "2013-11-14 00:00:00", link: "www.yogatothepeople.com", organizer_id: oid, :participants=> ps, amount: 10.00)
