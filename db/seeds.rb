Campaign.destroy_all
Genre.destroy_all
User.destroy_all

fan = User.create(email: 'fan@venue.se', password: 'my-password', role: 'fan')
artist = User.create(email: 'artist@venue.se', password: 'my-password', role: 'artist')
admin = User.create(email: 'admin@venue.se', password: 'my-password', role: 'admin')

rock = Genre.create(name: "rock")
metal = Genre.create(name: "metal")
punk = Genre.create(name: "punk")
indie = Genre.create(name: "indie")
pop = Genre.create(name: "pop")
electronic = Genre.create(name: "electronic")
hiphop = Genre.create(name: "hip hop")
rap = Genre.create(name: "rap")
classic = Genre.create(name: "classic")
country = Genre.create(name: "country")
jazz = Genre.create(name: "jazz")
blues = Genre.create(name: "blues")

clare = artist.performers.create(
    name: 'Clare Cunningham',
    genres: [rock],
    city: 'Stockholm',
    description: 'Dubbed as having a vocal register similar to Adele (GAFFA) and for having a "Powerfull and killer voice" from Lzzy Hale (Halestorm) and Phil Campell (Motörhead) it is no wonder Clare Cunningham is making waves across the world with her music. Storytelling with unwavering honesty is what Cunningham is best at, and this little country rock/pop chick has proven she is a multi versatile recording and live artist, singing across many genres.',
    facebook: 'https://www.facebook.com',
    instagram: 'https://www.instagram.com',
    twitter: 'https://www.twitter.com',
    youtube: 'https://www.youtube.com',
    website: 'https://www.google.com',
    spotify: 'https://www.spotify.com',
    state: 'active'
)
clare.profile_image.(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy_logo.png')), filename: "logo-#{sp.name.underscore}.png", content_type: 'image/png')

beyonce = artist.performers.create(
    name: 'Beyonce',
    genres: [pop],
    city: 'Los Angeles',
    description: "Beyoncé Giselle Knowles-Carter is an American singer, songwriter, performer, and actress. Born and raised in Houston, Texas, Beyoncé performed in various singing and dancing competitions as a child. She rose to fame in the late 1990s as lead singer of the R&B girl-group Destiny's Child.",
    facebook: 'https://www.facebook.com',
    instagram: 'https://www.instagram.com',
    twitter: 'https://www.twitter.com',
    youtube: 'https://www.youtube.com',
    website: 'https://www.google.com',
    spotify: 'https://www.spotify.com',
    state: 'active'
)
boyonce.profile_image.(io: File.open(Rails.root.join('spec', 'fixtures', 'beyonce.jpg')), filename: "logo-#{sp.name.underscore}.jpg", content_type: 'image/jpg')

stevie = artist.performers.create(
    name: 'Stevie Wonder',
    genres: [rock],
    city: 'Stockholm',
    description: 'Stevie Wonder is an American singer, songwriter, record producer, and multi-instrumentalist. A child prodigy, he is considered to be one of the most critically and commercially successful musical performers of the late 20th century.',
    facebook: 'https://www.facebook.com',
    instagram: 'https://www.instagram.com',
    twitter: 'https://www.twitter.com',
    youtube: 'https://www.youtube.com',
    website: 'https://www.google.com',
    spotify: 'https://www.spotify.com',
    state: 'active'
)
stevie.profile_image.(io: File.open(Rails.root.join('spec', 'fixtures', 'stevie_wonder.jpg')), filename: "logo-#{sp.name.underscore}.png", content_type: 'image/jpg')

michael = artist.performers.create(
    name: 'Michael Buble',
    genres: [jazz],
    city: 'Burnaby',
    description: "Michael Steven Bublé is a Canadian-Italian singer, songwriter, actor and record producer. He has won several awards, including four Grammy Awards and multiple Juno Awards. His first album reached the top ten in Canada and the UK.",
    facebook: 'https://www.facebook.com',
    instagram: 'https://www.instagram.com',
    twitter: 'https://www.twitter.com',
    youtube: 'https://www.youtube.com',
    website: 'https://www.google.com',
    spotify: 'https://www.spotify.com',
    state: 'active'
)
michael.profile_image.(io: File.open(Rails.root.join('spec', 'fixtures', 'michael_buble.png')), filename: "logo-#{sp.name.underscore}.jpg", content_type: 'image/png')

katy = artist.performers.create(
    name: 'Katy Perry',
    genres: [pop],
    city: 'New York',
    description: "Katheryn Elizabeth Hudson, known professionally as Katy Perry, is an American singer, songwriter, and television personality. After singing in church during her childhood, she pursued a career in gospel music as a teenager.",
    facebook: 'https://www.facebook.com',
    instagram: 'https://www.instagram.com',
    twitter: 'https://www.twitter.com',
    youtube: 'https://www.youtube.com',
    website: 'https://www.google.com',
    spotify: 'https://www.spotify.com',
    state: 'active'
)
katy.profile_image.(io: File.open(Rails.root.join('spec', 'fixtures', 'katy_perry.jpg')), filename: "logo-#{sp.name.underscore}.jpg", content_type: 'image/jpg')


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


campaign = Campaign.with_state(:accepted).first
campaign.tickets.create(price: 200)

