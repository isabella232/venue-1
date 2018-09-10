# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fan = User.create(email: 'fan@venue.se', password: 'my-password', role: 'fan')
artist = User.create(email: 'artist@venue.se', password: 'my-password', role: 'artist')

campaigns = Campaign.create([
    {
        title: 'Marius Ipsum',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Luleå',
        user: artist

    },
    {
        title: 'Fusce sodales',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Karlstad',
        user: artist
    },
    {
        title: 'Someone else',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Stockholm',
        user: artist
    },
    {
        title: 'Someone different',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Stockholm',
        user: artist
    }
    {
        title: 'Ipsum',
        description: 'This is a very short description',
        location: 'Västerås'
    }
])
Campaign.all.each do |campaign|
    campaign.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: "image.jpg", content_type: 'image/jpg')
end


performer_clare = Performer.create(
    name: 'Clare Cunningham',
    genre: 'Rock',
    city: 'Stockholm',
    description: 'Dubbed as having a vocal register similar to Adele (GAFFA) and for having a "Powerfull and killer voice" from Lzzy Hale (Halestorm) and Phil Campell (Motörhead) it is no wonder Clare Cunningham is making waves across the world with her music. Storytelling with unwavering honesty is what Cunningham is best at, and this little country rock/pop chick has proven she is a multi versatile recording and live artist, singing across many genres.',
    facebook: 'https://www.facebook.com',
    instagram: 'https://www.instagram.com',
    twitter: 'https://www.twitter.com',
    youtube: 'https://www.youtube.com',
    website: 'https://www.google.com',
    spotify: 'https://www.spotify.com'
)