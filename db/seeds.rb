# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

muros = [
  { name: 'Actualidad', description: 'Noticias y opiniones sobre lo que pasa en la ciudad y el país' },
  { name: 'Clasificados', description: '¿Tienes algo que vender? ¿Buscas u ofreces algún producto o servicio?' },
  { name: 'Confesiones', description: 'Sácate del pecho eso que no le puedes contar a nadie' },
  { name: 'Deportes', description: 'Actualidad deportiva, noticias y resultados' },
  { name: 'Humor', description: 'Unas risas nunca caen mal. Memes, chistes y más' },
  { name: 'Social', description: '¿Buscas pareja, amistades o plan para el fin de semana?' },
]

muros.each { |m| Fabricate :board, name: m[:name], description: m[:description] }
