# frozen_string_literal: true

Campaign.destroy_all
Genre.destroy_all
User.destroy_all

fan = User.create(email: 'fan@venue.se', password: 'my-password', role: 'fan')
artist = User.create(email: 'artist@venue.se', password: 'my-password', role: 'artist')
admin = User.create(email: 'admin@venue.se', password: 'my-password', role: 'admin')

rock = Genre.create(name: 'rock')
metal = Genre.create(name: 'metal')
punk = Genre.create(name: 'punk')
indie = Genre.create(name: 'indie')
pop = Genre.create(name: 'pop')
electronic = Genre.create(name: 'electronic')
hiphop = Genre.create(name: 'hip hop')
rap = Genre.create(name: 'rap')
classic = Genre.create(name: 'classic')
country = Genre.create(name: 'country')
jazz = Genre.create(name: 'jazz')
blues = Genre.create(name: 'blues')

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

clare.profile_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: "image.jpg", content_type: 'image/jpg')
clare.background_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: "image.jpg", content_type: 'image/jpg')

marius = Campaign.create(
  title: 'Marius Ipsum',
  description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
  location: 'Luleå',
  state: 'accepted',
  user: artist
)

marius.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: "image.jpg", content_type: 'image/jpg')


fuscade = Campaign.create(
  title: 'Fusce sodales',
  description: 'This is a very long description designed to exceed 100 character, so that the truncation sets in and limits the description of the event on the front page. The guest needs to click the title of the campaign to see the full description of the campaign',
  location: 'Karlstad',
  state: 'accepted',
  user: artist
)

fuscade.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: "image.jpg", content_type: 'image/jpg')


Campaign.all.each do |campaign|
  campaign.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: 'image.jpg', content_type: 'image/jpg')
  ticket = campaign.tickets.create(price: 200)
  ticket.ticket_variants.create(name: 'Gig Starter', base_price_percentage: 50)
  ticket.ticket_variants.create(name: 'Game Changer', base_price_percentage: 75)
  ticket.ticket_variants.create(name: 'Sure Thing', base_price_percentage: 100)
end
