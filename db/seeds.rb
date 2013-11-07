# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

oid = Organizer.create().id
ps = [Participant.create, P.create]
events = Events.create( name: 'Hot Yoga', description: 'Yoga', deadline: "2013-11-11 00:00:00", event_date: "2013-11-14 00:00:00", link: "www.yogatothepeople.com", organizer_id: oid, :participants=> ps, amount: 10.00 })
