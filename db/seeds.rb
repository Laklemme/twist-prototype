# Make proper seeds
images_array = Dir["public/images/*"]

random_user1 = User.create(email: 'abc@gmail.com', password: '1234567', nickname: 'Kobolt', balance: 30)
random_user2 = User.create(email: 'k.eilers@gmail.com', password: '111111', nickname: 'Bello', balance: 25)
random_user3 = User.create(email: 'philipp@philipp.com', password: '654321', nickname: 'Hippo', balance: 29)
random_user4 = User.create(email: 'luke@luke.com', password: '222222', nickname: 'Monkey', balance: 23)
random_user5 = User.create(email: 'lara@lara.com', password: '123456', nickname: 'Hamster', balance: 15)
random_user6 = User.create(email: 'peter@gmail.com', password: '1234567', nickname: 'Mickey', balance: 34)
random_user7 = User.create(email: 'Margot@gmail.com', password: '111111', nickname: 'Minnie', balance: 10)
random_user8 = User.create(email: 'Santi@Santi.com', password: '654321', nickname: 'Momo', balance: 12)
random_user9 = User.create(email: 'Valerie@Valerie.com', password: '222222', nickname: 'Kitty', balance: 8)
random_user10 = User.create(email: 'Sarah@Sarah.com', password: '123456', nickname: 'Susi', balance: 13)

Game.create(video: 'QTB5EhxXW-w',
            title: 'Monkey Mouth',
            instructions: 'Stretch out your lips and form a circle. Hold it for 5 seconds, let go and do it again.',
            difficulty: 'easy',
            img: images_array[0])

Game.create(video: '1NJPH_x_GJ4',
            title: 'Kiss and Smile',
            instructions: 'Imitate a kiss and then smile. Do this in alternation several times.',
            difficulty: 'easy',
            img: images_array[1])

Game.create(video: '2a48kSakDLI',
            title: 'Counting Teeth',
            instructions: 'Let the tongue touch all your teeth individually. Make sure you are not missing one. How many can you count?',
            difficulty: 'medium',
            img: images_array[2])

Game.create(video: '-b1nl7jO8JQ',
            title: 'Waving Tongue',
            instructions: 'Point the tongue towards your nose, then point it towards your chin. It should look like a slow waving motion.',
            difficulty: 'medium',
            img: images_array[3])

Game.create(video: '-B24LqnDRb4',
            title: 'Clicking Tongue',
            instructions: 'Suck your tongue onto your palate (tongue resting position) and release it with a bang.',
            difficulty: 'hard',
            img: images_array[4])

Game.create(video: 'KN3DMCmZzwI',
            title: 'Nutcracker',
            instructions: 'Suck your tongue onto your palate (tongue resting position) and open and close your jaw in alternation.',
            difficulty: 'hard',
            img: images_array[5])

Game.create(video: 'dTHKsBly3TE',
            title: 'Stick Out Your Tongue',
            instructions: 'Stick your tongue out in a straight line and draw it back slowly.',
            difficulty: 'medium',
            img: images_array[6])

Game.create(video: '1tk4CAH7PPM',
            title: 'Broad Tongue',
            instructions: 'Relax your tongue as best as you can, it shoul look very broad. Now try to make it as narrow as a stick.',
            difficulty: 'medium',
            img: images_array[7])

Game.create(video: '-wB3M7YQGKo',
            title: 'Fish',
            instructions: 'Imitate a kiss and then open your mouth while your lips are still puckered. You should look like a fish.',
            difficulty: 'easy',
            img: images_array[8])

Game.create(video: 'FmUyrDAJYao',
            title: 'Diagonal Smile',
            instructions: 'Raise only the right corner of your mouth. Now do the same with the left side. Alternate between the two.',
            difficulty: 'easy',
            img: images_array[9])
