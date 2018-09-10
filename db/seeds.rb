# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

campaigns = Campaign.create([
    {
        title: 'Marius Ipsum',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Luleå'
    },
    {
        title: 'Fusce sodales',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Karlstad'
    }
    {
        title: 'Ipsum',
        description: 'This is a very short description',
        location: 'Västerås'
    }
])

fan = User.create(email: 'fan@venue.se', password: 'my-password', role: 'fan')
artist = User.create(email: 'artist@venue.se', password: 'my-password', role: 'artist')
