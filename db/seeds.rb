# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Hiromi albums 5
a7 = Album.create!(band_id:5, live?:"Studio", title: "Spiral")
a8 = Album.create!(band_id:5, live?:"Studio", title: "Alive")
a9 = Album.create!(band_id:5, live?:"Studio", title: "Spark")
a10 = Album.create!(band_id:5, live?:"Studio", title: "Another Mind")



#Do As Infinity albums 1
a11 = Album.create!(band_id:1, live?:"Studio", title:"Time Machine")
a12 = Album.create!(band_id:1, live?:"Studio", title:"True Song")
a13 = Album.create!(band_id:1, live?:"Studio", title:"Eternal Flame")
a14 = Album.create!(band_id:1, live?:"Studio", title:"Brand New Days")



#Soil and Pimp Session albums 6
a15 = Album.create!(band_id:6, live?:"Studio", title: "Pimp of the year")
a16 = Album.create!(band_id:6, live?:"Studio", title: "Pimpoint")
a17 = Album.create!(band_id:6, live?:"Studio", title: "Black Track")
a18 = Album.create!(band_id:6, live?:"Studio", title: "Planet Pimp")


# tracks
["Spiral",
"Open Door - Tuning - Prologue",
"Déjà vu",
"Reverse",
"Edge",
"Old Castle, by the river, in the middle of the forest",
"Love and Laughter",
"Return of the Kung-Fu World Champion",
"Big Chill (Bonus track)"].each do |track|
  Track.create!(album_id: 7, title: track)
end

["XYZ",
"Double Personality",
"Summer Rain",
"Joy",
"010101 (Binary System)",
"Truth and Lies",
"Dançando no Paraiso",
"Another Mind",
"The Tom and Jerry Show,"].each do |track|
  Track.create!(album_id: 8, title: track)
end

["Alive",
"Wanderer",
"Dreamer",
"Seeker",
"Player",
"Warrior",
"Firefly",
"Spirit",
"Life Goes On"
].each do |track|
  Track.create!(album_id: 9, title: track)
end

["Spark",
"In A Trance",
"Take Me Away",
"Wonderland",
"Indulgence",
"Dilemma",
"What Will Be, Will Be",
"Wake Up And Dream",
"All's Well"].each do |track|
  Track.create!(album_id: 10, title: track)
end
