# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
videos = Video.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Character.create(name: 'Luke', movie: movies.first)


require "open-uri"

random_user1 = User.create(email: 'abc@gmail.com', password: '1234567', first_name: 'Martin', last_name: 'Jones')
random_user2 = User.create(email: 'k.eilers@gmail.com', password: '111111', first_name: 'Karin', last_name: 'Eilers')


file = URI.open('https://youtu.be/QTB5EhxXW-w')
file = URI.open('https://youtu.be/1NJPH_x_GJ4')
file = URI.open('https://youtu.be/2a48kSakDLI')
file = URI.open('https://youtu.be/-b1nl7jO8JQ')
file = URI.open('https://youtu.be/-B24LqnDRb4')


Game.create(video: 'https://youtu.be/QTB5EhxXW-w', title: 'the stretching lips', instructions: 'stretch out your lips and form a circle' difficulty: 'easy' )

Game.create(video: 'https://youtu.be/1NJPH_x_GJ4', title: 'kiss and shout', instructions: 'push your lips forward and stretch them backwards' difficulty: 'easy' )

Game.create(video: 'https://youtu.be/2a48kSakDLI', title: 'teeth toucher', instructions: 'let the tongue touch all your teeth' difficulty: 'medium' )

Game.create(video: 'https://youtu.be/-b1nl7jO8JQ', title: 'the waving tongue', instructions: 'point the tongue towards your nose and chin' difficulty: 'medium' )

Game.create(video: 'https://youtu.be/-B24LqnDRb4', title: 'tongue banging', instructions: 'suck your tongue and release it with a bang' difficulty: 'hard' )
