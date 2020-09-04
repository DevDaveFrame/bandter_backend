#DB CLEARANCE
User.destroy_all
Song.destroy_all
MatchChat.destroy_all
Genre.destroy_all
Message.destroy_all
Photo.destroy_all

#USERS
users = []
20.times do
  user_fn = Faker::Name.first_name
  user_ln = Faker::Name.last_name
  User.create(first_name: user_fn, last_name: user_ln email: `#{user_fn}_#{user_ln}`, password: "password", bio: "I like music and whatnot.", location: "Washington, DC", img_url: Faker::Avatar.image, seeking: "Uke players", search_radius: 100 )
end

#MATCHES
5.times do |i|
  users = User.all
  MatchChat.create(friender_id: users[i], friendee_id: users[-i], accepted: true)
end

#GENRES
genres = ["Alternative", "Art Punk", "Alternative Rock", "Britpunk", "College Rock", "Crossover Thrash", "Crust Punk", "Emocore", "Experimental Rock", "Folk Punk", "Goth / Gothic Rock", "Grunge", "Hardcore Punk", "Hard Rock", "Indie Rock", "Lo-fi", "Musique Concrète", "New Wave", "Progressive Rock", "Punk", "Shoegaze", "Steampunk", "Anime", "Blues", "Acoustic Blues", "African Blues", "Blues Rock", "Blues Shouter", "British Blues", "Canadian Blues", "Chicago Blues", "Classic Blues", "Classic Female Blues", "Contemporary Blues", "Contemporary R&B", "Country Blues", "Dark Blues", "Delta Blues", "Detroit Blues", "Doom Blues", "Electric Blues", "Folk Blues", "Gospel Blues", "Harmonica Blues", "Hill Country Blues", "Hokum Blues", "Jazz Blues", "Jump Blues", "Kansas City Blues", "Louisiana Blues", "Memphis Blues", "Modern Blues", "New Orleans Blues", "NY Blues", "Piano Blues", "Piedmont Blues", "Punk Blues", "Ragtime Blues", "Rhythm Blues", "Soul Blues", "St. Louis Blues", "Swamp Blues", "Texas Blues", "Urban Blues", "Vaudeville", "West Coast Blues", "Zydeco", "Children’s Music", "Lullabies", "Sing-Along", "Classical", "Avant-Garde", "Ballet", "Baroque", "Cantata", "Chamber Music", "String Quartet", "Chant", "Choral", "Classical Crossover", "Concerto", "Concerto Grosso", "Contemporary Classical", "Early Music", "Expressionist", "High Classical", "Impressionist", "Mass Requiem", "Medieval", "Minimalism", "Modern Composition", "Modern Classical", "Opera", "Oratorio", "Orchestral", "Organum", "Renaissance", "Romantic", "Romantic", "Sonata", "Symphonic", "Symphony", "Wedding Music", "Comedy", "Novelty", "Parody Music", "Stand-up Comedy", "Commercial", "Jingles", "TV Themes", "Country", "Alternative Country", "Americana", "Australian Country", "Bakersfield Sound", "Bluegrass", "Progressive Bluegrass", "Reactionary Bluegrass", "Blues Country", "Cajun Fiddle Tunes", "Christian Country", "Classic Country", "Close Harmony", "Contemporary Bluegrass", "Contemporary Country", "Country Gospel", "Country Pop", "Country Rap", "Country Rock", "Country Soul", "Cowboy / Western", "Cowpunk", "Dansband", "Honky Tonk", "Franco-Country", "Gulf and Western", "Hellbilly Music", "Instrumental Country", "Lubbock Sound", "Nashville Sound", "Neotraditional Country", "Outlaw Country", "Progressive", "Psychobilly / Punkabilly", "Red Dirt", "Sertanejo", "Texas County", "Traditional Bluegrass", "Traditional Country", "Truck-Driving Country", "Urban Cowboy", "Western Swing", "Zydeco", "Dance/EDM", "Club/Club Dance", "Breakcore", "Breakbeat", "Breakstep", "4-Beat", "Acid Breaks", "Baltimore Club", "Big Beat", "Breakbeat Hardcore", "Broken Beat", "Florida Breaks", "Nu Skool Breaks", "Brostep", "Chillstep", "Deep House", "Dubstep", "Electro House", "Electroswing", "Exercise", "Future Garage", "Garage", "Glitch Hop", "Glitch Pop", "Grime", "Hardcore", "Bouncy House", "Bouncy Techno", "Digital Hardcore", "Doomcore", "Dubstyle", "Gabber", "Happy Hardcore", "Hardstyle", "Jumpstyle", "Makina", "Speedcore", "Terrorcore", "Uk Hardcore", "Hard Dance", "Hi-NRG / Eurodance", "Horrorcore", "House", "Acid House", "Chicago House", "Deep House", "Diva House", "Dutch House", "Electro House", "Freestyle House", "French House", "Funky House", "Ghetto House", "Hardbag", "Hip House", "Italo House", "Latin House", "Minimal House", "Progressive House", "Rave Music", "Swing House", "Tech House", "Tribal House", "UK Hard House", "US Garage", "Vocal House", "Jackin House", "Jungle / Drum’n’bass", "Liquid Dub", "Regstep", "Speedcore", "Techno", "Acid Techno", "Detroit Techno", "Free Tekno", "Ghettotech", "Minimal", "Nortec", "Schranz", "Techno-Dnb", "Technopop", "Tecno Brega", "Toytown Techno", "Trance", "Acid Trance", "Classic Trance", "Dream Trance", "Goa Trance", "Dark Psytrance", "Full on", "Psybreaks", "Psyprog", "Suomisaundi", "Hard Trance", "Tech Trance", "Uplifting Trance", "Orchestral", "Uplifting", "Vocal Trance", "Trap", "Easy Listening", "Background", "Bop", "Elevator", "Furniture", "Lounge", "Middle of the Road", "Swing", "Electronic", "2-Step", "8bit", "Ambient", "Ambient Dub", "Ambient House", "Ambient Techno", "Dark Ambient", "Drone Music", "Illbient", "Isolationism", "Lowercase", "Asian Underground", "Bassline", "Chillwave", "Chiptune", "Bitpop", "Game Boy", "Nintendocore", "Video Game Music", "Yorkshire Bleeps and Bass", "Crunk", "Downtempo", "Acid Jazz", "Balearic Beat", "Chill Out", "Dub Music", "Dubtronica", "Ethnic Electronica", "Moombahton", "Nu Jazz", "Trip Hop", "Drum & Bass", "Darkcore", "Darkstep", "Drumfunk", "Drumstep", "Hardstep", "Intelligent Drum and Bass", "Jump-Up", "Liquid Funk", "Neurofunk", "Oldschool Jungle", "Darkside Jungle", "Ragga Jungle", "Raggacore", "Sambass", "Techstep", "Electro", "Electro Backbeat", "Electro-Grime", "Electropop", "Electro-swing", "Electroacoustic", "Acousmatic Music", "Computer Music", "Electroacoustic Improvisation", "Field Recording", "Live Coding", "Live Electronics", "Soundscape Composition", "Tape Music", "Electronica", "Berlin School", "Electronic Art Music", "Electronic Dance Music", "Folktronica", "Freestyle Music", "Glitch", "Idm", "Laptronica", "Skweee", "Sound Art", "Synthcore", "Electronic Rock", "Alternative Dance", "Baggy", "Madchester", "Dance-Punk", "Dance-Rock", "Dark Wave", "Electroclash", "Electronicore", "Electropunk", "Ethereal Wave", "Indietronica", "New Rave", "Space Rock", "Synthpop", "Synthpunk", "Eurodance", "Bubblegum Dance", "Italo Dance", "Turbofolk", "Hardstyle", "Hi-Nrg", "Eurobeat", "Hard Nrg", "New Beat", "IDM/Experimental", "Industrial", "UK Garage", "4×4", "Grime", "Speed Garage", "Enka", "French Pop", "Folk Music", "American Folk Revival", "Anti-Folk", "British Folk Revival", "Contemporary Folk", "Filk Music", "Freak Folk", "Indie Folk", "Industrial Folk", "Neofolk", "Progressive Folk", "Psychedelic Folk", "Sung Poetry", "Techno-Folk", "German Folk", "German Pop", "Hip-Hop/Rap", "Alternative Rap", "Bounce", "Chap Hop", "Christian Hip Hop", "Conscious Hip Hop", "Country-Rap", "Crunkcore", "Cumbia Rap", "Dirty South", "East Coast", "Brick City Club", "Hardcore Hip Hop", "Mafioso Rap", "New Jersey Hip Hop", "Freestyle Rap", "G-Funk", "Gangsta Rap", "Golden Age", "Hardcore Rap", "Hip-Hop", "Hip Pop", "Hyphy", "Industrial Hip Hop", "Instrumental Hip Hop", "Jazz Rap", "Latin Rap", "Low Bap", "Lyrical Hip Hop", "Merenrap", "Midwest Hip Hop", "Chicago Hip Hop", "Detroit Hip Hop", "St. Louis Hip Hop", "Twin Cities Hip Hop", "Motswako", "Nerdcore", "New Jack Swing", "New School Hip Hop", "Old School Rap", "Rap", "Turntablism", "Underground Rap", "West Coast Rap", "Indie Pop", "Aggrotech", "Coldwave", "Cybergrind", "Dark Electro", "Death Industrial", "Electro-Industrial", "Electronic Body Music", "Futurepop", "Industrial Metal", "Neue Deutsche Härte", "Industrial Rock", "Noise", "Japanoise", "Power Electronics", "Power Noise", "Witch House", "Christian & Gospel", "CCM", "Christian Metal", "Christian Pop", "Christian Rap", "Christian Rock", "Classic Christian", "Contemporary Gospel", "Gospel", "Praise & Worship", "Qawwali", "Southern Gospel", "Traditional Gospel", "Instrumental", "March", "J-Pop", "J-Rock", "J-Synth", "J-Ska", "J-Punk", "Jazz", "Avant-Garde Jazz", "Bebop", "Big Band", "Blue Note", "Contemporary Jazz", "Cool", "Crossover Jazz", "Dixieland", "Ethio-jazz", "Fusion", "Gypsy Jazz", "Hard Bop", "Latin Jazz", "Mainstream Jazz", "Ragtime", "Smooth Jazz", "Trad Jazz", "Third Stream", "Jazz-Funk", "Free Jazz", "Modal Jazz", "Karaoke", "Kayokyoku", "Latin", "Alternativo & Rock Latino", "Argentine tango", "Bachata", "Baithak Gana", "Baladas y Boleros", "Bolero", "Brazilian", "Axé", "Bossa Nova", "Brazilian Rock", "Brega", "Choro", "Forró", "Frevo", "Funk Carioca", "Lambada", "Maracatu", "Música Popular Brasileira", "Música Sertaneja", "Pagode", "Samba", "Samba Rock", "Tecnobrega", "Tropicalia", "Zouk-Lambada", "Chicha", "Criolla", "Contemporary Latin", "Cumbia", "Flamenco", "Huayno", "Mariachi", "Merengue Típico", "Nuevo Flamenco", "Pop Latino", "Portuguese fado", "Punta", "Punta Rock", "Ranchera", "Raíces", "Raison", "Reggaeton y Hip-Hop", "Regional Mexicano", "Salsa y Tropical", "Soca", "Son", "Tejano", "Timba", "Twoubadou", "Zouk", "Metal", "Heavy Metal", "Speed Metal", "Thrash Metal", "Power Metal", "Death Metal", "Black Metall", "Pagan Metal", "Viking Metal", "Folk Metal", "Symphonic Metal", "Gothic Metal", "Glam Metal", "Hair Metal", "Doom Metal", "Groove Metal", "Modern Metal", "Neoclassical Metal", "New Wave British Heavy Metal", "Post Metal", "Progressive Metal", "Avantgarde Metal", "Sludge", "Djent", "Drone", "Kawaii Metal", "Pirate Metal", "Nu Metal", "Math Metal", "Crossover", "Grindcore", "Metalcore", "Deathcore", "Post Hardcore", "Mathcore", "New Age", "Environmental", "Healing", "Meditation", "Nature", "Relaxation", "Travel", "Pop", "Adult Contemporary", "Arab Pop", "Britpop", "Bubblegum Pop", "Chamber Pop", "Chanson", "Europop", "Austropop", "Balkan Pop", "Latin Pop", "Laïkó", "Nederpop", "Russian Pop", "Dance Pop", "Dream Pop", "Electro Pop", "Iranian Pop", "Jangle Pop", "Latin Ballad", "Levenslied", "Louisiana Swamp Pop", "Mexican Pop", "Motorpop", "New Romanticism", "Orchestral Pop", "Pop Rap", "Popera", "Pop/Rock", "Pop Punk", "Power Pop", "Psychedelic Pop", "Schlager", "Soft Rock", "Sophisti-Pop", "Space Age Pop", "Sunshine Pop", "Surf Pop", "Synthpop", "Teen Pop", "Traditional Pop Music", "Turkish Pop", "Vispop", "Wonky Pop", "Post-Disco", "Boogie", "Dance-pop", "Progressive House / Trance", "Disco House", "Dream House", "Space House", "Japanese House", "Bounce/Scouse House", "Progressive Breaks", "Progressive Drum & Bass", "Progressive Techno", "R&B/Soul", "Disco", "Doo Wop", "Funk", "Modern Soul", "Motown", "Neo-Soul", "Northern Soul", "Psychedelic Soul", "Quiet Storm", "Soul", "Soul Blues", "Southern Soul", "Reggae", "2-Tone Reggae", "Dancehall", "Dub", "Roots Reggae", "Reggae Fusion", "Reggae en Español", "Spanish Reggae", "Reggae 110", "Reggae Bultrón", "Romantic Flow", "Lovers Rock", "Raggamuffin", "Ragga", "Ska", "2 Tone Ska", "Rocksteady", "Rock", "Acid Rock", "Adult-Oriented Rock", "Afro Punk", "Adult Alternative", "Alternative Rock", "American Traditional Rock", "Anatolian Rock", "Arena Rock", "Art Rock", "Blues-Rock", "British Invasion", "Cock Rock", "Death Metal / Black Metal", "Doom Metal", "Glam Rock", "Gothic Metal", "Grind Core", "Math Metal", "Math Rock", "Metal", "Metal Core", "Noise Rock", "Jam Bands", "Post Punk", "Prog-Rock/", "Psychedelic", "Rock & Roll", "Rockabilly", "Roots Rock", "Singer/Songwriter", "Southern Rock", "Spazzcore", "Stoner Metal", "Surf", "Technical Death Metal", "Tex-Mex", "Time Lord Rock", "Trip-hop", "Alternative Folk", "Contemporary Singer/Songwriter", "Indie Folk", "Folk-Rock", "Love Song", "New Acoustic", "Traditional Folk", "Soundtrack", "Foreign Cinema", "Movie Soundtrack", "Musicals", "Original Score", "TV Soundtrack", "Spoken Word", "Chicano", "Classic", "Conjunto", "Conjunto Progressive", "New Mex", "Vocal", "A cappella", "Barbershop", "Cantique", "Doo-wop", "Gregorian Chant", "Standards", "Traditional Pop", "Vocal Jazz", "Vocal Pop", "World", "Africa", "African Heavy Metal", "African Hip Hop", "Afro-Beat", "Afro-Pop", "Apala", "Benga", "Bikutsi", "Bongo Flava", "Cape Jazz", "Chimurenga", "Coupé-Décalé", "Fuji Music", "Genge", "Highlife", "Hiplife", "Isicathamiya", "Jit", "Jùjú", "Kapuka", "Kizomba", "Kuduro", "Kwaito", "Kwela", "Makossa", "Maloya", "Marrabenta", "Mbalax", "Mbaqanga", "Mbube", "Morna", "Museve", "Palm-Wine", "Raï", "Sakara", "Sega", "Seggae", "Semba", "Soukous", "Taarab", "Zouglou", "Asia", "Anison", "C-Pop", "Cantopop", "Hong Kong English Pop", "Fann At-Tanbura", "Fijiri", "Japanese Pop", "K-Pop", "Khaliji", "Kayōkyoku", "Korean Pop", "Liwa", "Mandopop", "Onkyokei", "Taiwanese Pop", "Sawt", "Australia", "Cajun", "Calypso", "Caribbean", "Chutney", "Chutney Soca", "Compas", "Mambo", "Merengue", "Méringue", "Carnatic", "Celtic", "Celtic Folk", "Contemporary Celtic", "Coupé-décalé", "Dangdut", "Drinking Songs", "Europe", "France", "Hawaii", "Japan", "Klezmer", "Middle East", "North America", "Ode", "Piphat", "Polka", "South Africa", "South America", "South / Southeast Asia", "Baila", "Bhangra", "Bhojpuri", "Dangdut", "Filmi", "Indian Pop", "Hindustani", "Indian Ghazal", "Lavani", "Luk Thung", "Luk Krung", "Manila Sound", "Morlam", "Pinoy Pop", "Pop Sunda", "Ragini", "Thai Pop", "Traditional Celtic", "Worldbeat"]
genres.each do |genre|
  Genre.create(name: genre)
end

#INSTRUMENTS
instruments = ["Guitar", "Piano", "Drumset", "Percussion", "Bass", "Cello", "Viola", "Violin", "Brass", "Trumpet", "Trombone", "Coronet", "Saxaphone", "Woodwinds", "Ukelele", "Mandolin", "Banjo", "Flute", "Fiddle", "Cajon ,Djembe", "Congas", "Bongos", "Dobro", "Pedal Steel Guitar", "Steel Guitar", "Dulcimer", "Synth", "Organ", "DAW"]
instuments.each do |inst|
  Instrument.create(name: inst)
end 