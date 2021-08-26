# Make proper seeds
images_array = Dir["public/images/*"]

random_user1 = User.create(email: 'abc@gmail.com', password: '1234567', nickname: 'Kobolt')
random_user2 = User.create(email: 'k.eilers@gmail.com', password: '111111', nickname: 'Eilers')

Game.create(video: 'QTB5EhxXW-w',
            title: 'Puckered Lips',
            instructions: 'Stretch out your lips and form a circle.',
            difficulty: 'easy',
            img: images_array[0])

Game.create(video: '1NJPH_x_GJ4',
            title: 'Kiss and Smile',
            instructions: 'Push your lips forward and then smile.',
            difficulty: 'easy',
            img: images_array[1])

Game.create(video: '2a48kSakDLI',
            title: 'Teeth Toucher',
            instructions: 'Let the tongue touch all your teeth individually.',
            difficulty: 'medium',
            img: images_array[2])

Game.create(video: '-b1nl7jO8JQ',
            title: 'The Waving Tongue',
            instructions: 'Point the tongue towards your nose and chin.',
            difficulty: 'medium',
            img: images_array[3])

Game.create(video: '-B24LqnDRb4',
            title: 'Clicking Tongue',
            instructions: 'Suck your tongue onto your palate and release it with a bang.',
            difficulty: 'hard',
            img: images_array[4])
