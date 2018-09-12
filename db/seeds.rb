Campaign.destroy_all
User.destroy_all

fan = User.create(email: 'fan@venue.se', password: 'my-password', role: 'fan')
artist = User.create(email: 'artist@venue.se', password: 'my-password', role: 'artist')
admin = User.create(email: 'admin@venue.se', password: 'my-password', role: 'admin')

artist.performers.create(
    name: 'Clare Cunningham',
    genre: 'Rock',
    city: 'Stockholm',
    description: 'Dubbed as having a vocal register similar to Adele (GAFFA) and for having a "Powerfull and killer voice" from Lzzy Hale (Halestorm) and Phil Campell (Motörhead) it is no wonder Clare Cunningham is making waves across the world with her music. Storytelling with unwavering honesty is what Cunningham is best at, and this little country rock/pop chick has proven she is a multi versatile recording and live artist, singing across many genres.',
    facebook: 'https://www.facebook.com',
    instagram: 'https://www.instagram.com',
    twitter: 'https://www.twitter.com',
    youtube: 'https://www.youtube.com',
    spotify: 'https://www.spotify.com'   
)

campaigns = Campaign.create([
    {
        title: 'Marius Ipsum',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Luleå',
        state: 'pending',
        user: artist

    },
    {
        title: 'Fusce sodales',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Karlstad',
        state: 'accepted',
        user: artist
    },
    {
        title: 'Someone else',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Stockholm',
        state: 'accepted',
        user: artist
    },
    {
        title: 'Someone different',
        description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
        location: 'Stockholm',
        state: 'accepted',
        user: artist
    }
])

Campaign.all.each do |campaign|
    campaign.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: "image.jpg", content_type: 'image/jpg')
end
