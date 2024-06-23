CREATE TABLE IF NOT EXISTS toms(
    id BIGINT primary key generated always as identity,
    title_id BIGINT,
    numer INTEGER NOT NULL,
    edition DATE,
    img TEXT,
    description TEXT,
    FOREIGN KEY (title_id) REFERENCES manga (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS chapters(
    id BIGINT primary key generated always as identity,
    tom_id BIGINT,
    numer INTEGER,
    name TEXT, 
    name_eng TEXT,
    FOREIGN KEY (tom_id) REFERENCES toms (id) ON DELETE CASCADE
);

-- в дальнейшем можно создать две таблицы tom и chapter отдельно  
-- еще вариант изображений https://7-seeds.fandom.com/wiki/Manga
INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 1, '2002-04-26', 'https://m.media-amazon.com/images/I/51U7XrCaXXL._SL500_.jpg', 
    'Нацу, как обычно, заснула в своей спальне, но, проснувшись, она оказалась среди совершенно незнакомых людей во враждебной, дикой среде. Что еще хуже, ей говорят, что человечество было уничтожено и что ее отправили на много лет в будущее, чтобы сохранить человечество…!');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(1 , 1, 'Медленное пробуждение', 'Slow Awakening'),
(1 , 2, 'Белый звук', 'White Sound'),
(1 , 3, 'Тихий шаг', 'Quiet Step'),
(1 , 4, 'Нежный зверь', 'Tender Beast');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 2, '2002-09-26', 'https://m.media-amazon.com/images/I/518DFiyxWeL._SL500_.jpg', 
    'Жестоко разлученная со своим парнем и невольно брошенная в опустошенный мир будущего, Хана изо всех сил пытается выжить и справиться со своей новой реальностью. К сожалению, эта задача может показаться невыполнимой из-за гигантских насекомых, нестабильных погодных условий и враждебно настроенных членов команды.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(2 , 5, 'Первый день', 'The First Day'),
(2 , 6, 'Хана', 'Hana'),
(2 , 7, 'Вода', 'Water'),
(2 , 8, 'Звезды', 'Stars');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 3, '2003-03-26', 'https://m.media-amazon.com/images/I/51OyGpcMJvL._SL500_.jpg', 
    'И команда Лето Б, и Спринг решают вернуться в свои прежние дома, все еще надеясь узнать, что все истории о разрушении Японии не соответствуют действительности. Но пока они путешествуют по разрушенной стране, все их надежды без сожаления рушатся.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(3 , 9, 'Жизнь', 'Life'),
(3 , 10, 'Араши', 'Arashi'),
(3 , 11, 'Замок', 'Castle'),
(3 , 12, 'Дорога домой', 'Way Home'),
(3 , 13, 'Дух звука', 'Spirit of Sound');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 4, '2004-01-26', 'https://m.media-amazon.com/images/I/516VBb0ToVL._SL500_.jpg', 
    'В то время как Команда Спринг, утомленная долгим путешествием, решает на время успокоиться, фокус смещается на Команду Зимы. Их печальная история начинается с того, что трое их членов уже погибли из-за сбоя в процессе оттаивания, а остальные пятеро остались на произвол судьбы. Сражаясь с дикими зверями и экстремально низкими температурами, Арамаки и его сокращающаяся команда борются за то, чтобы выжить в безнадежной битве с самой природой.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(4 , 14, 'Море деревьев', 'Sea of Trees'),
(4 , 15, 'Цель и объект', 'Aim and Object'),
(4 , 16, 'Вой', 'Howling'),
(4 , 17, 'Дождь ночью', 'Rain at Night'),
(4 , 18, 'Другая сторона радуги', 'The Other Side of the Rainbow'),
(4 , 19, 'Путешествие', 'Journey');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 5, '2004-08-26', 'https://m.media-amazon.com/images/I/51kPoGYySTL._SL500_.jpg',
    'Отделившись от команды Саммер Б, Араши отправляется в Токио вместе с Семимару и Нацу. Неожиданно они сталкиваются с Командой Осени, куда вскоре приходят все трое, чтобы узнать, насколько жестокими могут быть люди.');   
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(5 , 20, 'Муравьи и картофель', 'Ants and Potatoes'),
(5 , 21, 'Дождевые черви и кукуруза', 'Earthworms and Corn'),
(5 , 22, 'Табак и Луна', 'Tobacco and Moon'),
(5 , 23, 'Молоко и могила', 'Milk and Grave'),
(5 , 24, 'Пылающий ветер и цветущая вишня', 'Burning Wind and Cherry Blossoms'),
(5 , 25, 'Июнь и октябрь', 'June and October'),
(5 , 26, 'Влажная почва пробуждает жизнь', 'Damp soil awakens life');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 6, '2005-05-26', 'https://static.wikia.nocookie.net/7-seeds/images/7/7d/Vol6_1.jpg/revision/latest?cb=20121203143213', 
    'После пятнадцати лет одиноких путешествий Арамаки наконец встречает других людей. Но вскоре случается катастрофа, когда Хана становится жертвой смертельной болезни.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(6, 27, 'Туман начинает сгущаться', 'Mist begins to roll in'),
(6, 28, 'Деревья и трава прорастают', 'Trees and grass germinate'),
(6, 29, 'Дверь в спячку насекомых открывается', 'The door to hibernating insects opens'),
(6, 30, 'Персик начинает улыбаться', 'The peach begins to smile'),
(6, 31, 'Гусеницы превращаются в бабочек', 'Caterpillars morph into butterflies'),
(6, 32, 'Воробьи начинают гнездиться', 'Sparrows begin nesting'),
(6, 33, 'Цветущая вишня', 'Sakura begin blooming'),
(6, 34, 'Звуки грома', 'Thunder Sounds'),
(6, 35, 'Начинают появляться радуги', 'Rainbows begin to appear');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 7, '2005-10-26', 'https://static.wikia.nocookie.net/7-seeds/images/8/81/Vol7_1.jpg/revision/latest?cb=20121203143257', 
    'В уединении неизвестного горного хребта около 100 детей воспитываются, чтобы стать экспертами по выживанию. Обладая превосходными генами и получая максимальное количество добавок, дети каждый день проходят строгие тренировки в надежде, что их выберут в качестве участников Summer A. Однако ужасная правда ждет их в будущем, когда они будут бороться за право быть избранными.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(7, 36, 'Полет валькирий', 'Ride of the Valkyries'),
(7, 37, 'Пер Гюнт Сюита №1, соч.46: Утреннее настроение', 'Peer Gynt Suite No.1, Op.46: Morning Mood'),
(7, 38, 'Юмореска', 'Humoresque'),
(7, 39, 'Моя Родина: Влтава Молдавия', 'My Fatherland: Vltava The Moldau'),
(7, 40, 'Песня прощания', 'Song Of Farewell'),
(7, 41, 'Аве Мария', 'Ave Maria');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 8, '2006-04-26', 'https://static.wikia.nocookie.net/7-seeds/images/d/df/Vol8_1.jpg/revision/latest?cb=20121203143357', 
    'Последнее испытание для выбора славной семерки оказывается смертельным испытанием на выживание «последнего выжившего». Оставленные зимой в горах, кандидаты вынуждены бороться за место в команде лета - ведь только избранным будет разрешено жить.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(8, 42, 'Голубой Дунай', 'The Blue Danube'),
(8, 43, 'Лунная соната', 'Moonlight Sonata'),
(8, 44, 'Девичья молитва', 'A Maidens Prayer'),
(8, 45, 'Марс, несущий войну', 'Mars, the Bringer of War'),
(8, 46, 'Юпитер, Несущий радость', 'Jupiter, the Bringer of Jollity');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 9, '2006-09-26', 'https://static.wikia.nocookie.net/7-seeds/images/2/23/Vol9_1.jpg/revision/latest?cb=20121203143434', 
    'Поскольку число кандидатов Лето А сокращается, Анго, Ре и Сигэру оказываются застрявшими в глубокой подземной пещере. Поскольку все трое из одного и того же класса, они знают, что кому-то не удастся выбраться оттуда живым.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(9, 47, 'Карнавал животных', 'Carnival of the Animals'),
(9, 48, 'Кочевое племя', 'Nomadic Tribe'),
(9, 49, 'Картинки с выставки №1: Гном', 'Pictures at an Exhibition No.1 : Gnomus'),
(9, 50, 'Из Нового Света – Возвращение домой', 'From the New World – Going Home'),
(9, 51, 'Это место', 'That Place');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 10, '2007-04-26', 'https://static.wikia.nocookie.net/7-seeds/images/9/9b/Vol10_1.jpg/revision/latest?cb=20121203143517', 
    'Хана и ее друзья наткнулись на подземное убежище под названием Рюгу. Через старый дневник они узнают о судьбе нескольких тысяч людей, которые были вынуждены стать свидетелями разрушения их мира.');  
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(10, 52, 'Водяная трава', 'Water-weed'),
(10, 53, 'Леса живые', 'Forests Are Living'),
(10, 54, 'Дверь в лето', 'The Door into Summer'),
(10, 55, 'Проливные ворота', 'The Strait Gate'),
(10, 56, 'Рождественская песнь', 'A Christmas Carol');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 11, '2007-08-24', 'https://static.wikia.nocookie.net/7-seeds/images/b/b8/Vol11_1.jpg/revision/latest?cb=20121203143547',
    'Не зная о событиях, которые привели к гибели Приюта Рюгу, лидеры Команды Осени направляются прямо к морозильной камере, где их ждет верная смерть. Хана и ее группа отчаянно преследуют их, чтобы остановить окончательную гибель человечества, в то время как все убежище над ними разваливается.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(11, 57, 'На пляже', 'On the Beach'),
(11, 58, 'Грозовой перевал', 'Wuthering Heights'),
(11, 59, 'И их не было', 'And Then There Were None'),
(11, 60, 'Цепь', 'The Chain'),
(11, 61, 'Обращение', 'Circulate');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 12, '2008-01-25', 'https://static.wikia.nocookie.net/7-seeds/images/2/2a/Vol12_1.jpg/revision/latest?cb=20121203143616',
    'Араши, Нацу и Семимару опрометчиво отправились в плавание на своей новой найденной лодке. Вскоре они встречают загадочную девушку, которая предупреждает их, что остальные их товарищи по команде находятся на грани смерти. ');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(12, 62, 'Сбор', 'Gathering'),
(12, 63, 'Получить', 'Acquire'),
(12, 64, 'Чувствовать', 'Feel'),
(12, 65, 'Запутать', 'Confuse'),
(12, 66, 'Мисс', 'Miss');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 13, '2008-07-10', 'https://static.wikia.nocookie.net/7-seeds/images/1/10/Vol13_1.jpg/revision/latest?cb=20121203143648',
    'Группа Ханы возвращается на базу Команды Спринг и обнаруживает, что она полностью разрушена оползнем, а все ее друзья исчезли. После тщательного расследования они обнаруживают, что Момотаро захвачен командой Лета! Обе группы в ярости и готовы сойтись лицом к лицу, когда появляется третий, чрезвычайно грозный враг.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(13, 67, 'Поднять', 'Pick Up'),
(13, 68, 'Спросить', 'Ask'),
(13, 69, 'Найти', 'Find'),
(13, 70, 'Мишень', 'Target'),
(13, 71, 'Летать', 'Fly');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 14, '2009-01-09', 'https://static.wikia.nocookie.net/7-seeds/images/f/fc/Vol14_1.jpg/revision/latest?cb=20121203143715',
    'Вынужденные обстоятельствами, команда Саммер и группа Ханы решают жить вместе. Трепетные отношения между двумя группами вызывают искры, но вскоре появляются первые признаки взаимопонимания.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(14, 72, 'Осень', 'Fall'),
(14, 73, 'Телль', 'Tell'),
(14, 74, 'Знать', 'Know'),
(14, 75, 'Обида', 'Resent'),
(14, 76, 'Штамм', 'Stain');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 15, '2009-04-10', 'https://static.wikia.nocookie.net/7-seeds/images/7/71/Vol15_1.jpg/revision/latest?cb=20121203143757',
    'Анго пришел в ярость, узнав правду о Хане. Настроение между ними резко ухудшается, что приводит к катастрофическому развитию событий!');  
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(15, 77, 'Понять', 'Understand'),
(15, 78, 'Жажда', 'Thirst'),
(15, 79, 'Защитить', 'Protect'),
(15, 80, 'Любовь', 'Love'),
(15, 81, 'Ловушка', 'Trap');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 16, '2009-09-10', 'https://static.wikia.nocookie.net/7-seeds/images/0/00/Vol16_1.jpg/revision/latest?cb=20121203143826',
    'Друзья Ханы отчаянно ищут пропавшую Хану, а сама Хана полна решимости найти воду, несмотря на свое неблагоприятное положение. Вскоре разворачиваются трагические события, в ходе которых натянутые отношения между группами наконец обрываются. Включает короткую побочную историю под названием «Желание».');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(16, 82, 'Конвей', 'Convey'),
(16, 83, 'Проиграть', 'Lose'),
(16, 84, 'Разделить', 'Divide'),
(16, 85, 'Прощание', 'Farewell'),
(16, 86, 'Незнакомцы', 'Strangers');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 17, '2010-02-10', 'https://static.wikia.nocookie.net/7-seeds/images/d/d0/Vol17.jpg/revision/latest?cb=20131221142506',
    'Изгнанные из своего сообщества, Анго и Ре натыкаются на мирный образ жизни команды Саммер Б. Скрывая свое кровавое прошлое, они тепло приветствуются веселой группой. Несмотря на то, что их совершенно сбивает с толку беззаботный образ жизни Саммер Би, они начинают приспосабливаться.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(17, 87, 'Синдбад с пляжа', 'Sindbad of the Beach'),
(17, 88, 'Танцуй всю ночь', 'Dancin All Night'),
(17, 89, 'Посмотрите на звезды в ночи', 'Look Up At The Stars In The Night'),
(17, 90, 'Хороший день для отъезда', 'A Good Day For Departure'),
(17, 91, 'Сбиться с пути', 'Lose Ones Way');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 18, '2010-08-10', 'https://static.wikia.nocookie.net/7-seeds/images/a/ae/Vol18_1.jpg/revision/latest?cb=20121203144000',
    'Отделившись от Араши, команда Лето Б и два лидера Лета А натыкаются на загадочный корабль-призрак. Кажется, оно несет в себе множество тайн прошлого и манит странников. Но что в итоге окажется для них опаснее: сам корабль или Анго и Ре?');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(18, 92, 'Кто-то на ветру', 'Someone in the Wind'),
(18, 93, 'Между небом и тобой', 'Between the Sky and You'),
(18, 94, 'Сломанное радио', 'Broken Radio'),
(18, 95, 'Кукольный дом', 'Dolls House'),
(18, 96, 'Околдованный', 'Bewitched');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 19, '2011-02-10', 'https://static.wikia.nocookie.net/7-seeds/images/d/d4/Vol19_1.jpg/revision/latest?cb=20121203144035',
    'Пока разделенные группы постепенно исследуют корабль-призрак, Анго и Ре вынуждены разобраться со своим трагическим прошлым. Но, без ведома большей части группы, корабль представляет смертельную угрозу для всей Японии.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(19, 97, 'Ход времени', 'The Passage of Time'),
(19, 98, '365 шагов марта', '365 Step March'),
(19, 99, 'Время радуги и кроссовок', 'The Time of Rainbow and Sneakers'),
(19, 100, 'Любовь, Боль и Утешение', 'Love and Pain and Reassurance'),
(19, 101, 'Росток', 'Sprout');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 20, '2011-07-08', 'https://static.wikia.nocookie.net/7-seeds/images/1/12/Vol20_1.jpg/revision/latest?cb=20121203144101',
    'Отчаянно пытаясь предотвратить катастрофу, этой разношерстной банде приходится иметь дело с еще одной угрозой — таинственным присутствием, скрывающимся на корабле, загоняющим Араши и Нацу в тупик.');  
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(20, 102, 'Дай мне крылья', 'Give Me Wings'),
(20, 103, 'Гордость', 'Pride'),
(20, 104, 'Матросская песня', 'Sailors Song'),
(20, 105, 'Делай, что хочешь', 'Do As You Please'),
(20, 106, 'Молодежь', 'Youngsters');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 21, '2011-12-09', 'https://static.wikia.nocookie.net/7-seeds/images/2/2b/Vol21_1.jpg/revision/latest?cb=20121203144124',
    'Разбросанные по всей Японии, группы, отправленные в будущее, делают все возможное, чтобы выжить, несмотря на множество невзгод, выпавших на их долю. Постепенно они осваивают новый мир.л');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(21, 107, 'Аплодисменты ', 'Applause'),
(21, 108, 'Можете ли вы праздновать?', 'Can You Celebrate?'),
(21, 109, 'Лунный свет', 'Moonlight'),
(21, 110, 'Одинокое путешествие', 'Lone Journey'),
(21, 111, 'Грейс', 'Grace');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 22, '2012-06-08', 'https://static.wikia.nocookie.net/7-seeds/images/3/39/Vol22_1.jpg/revision/latest?cb=20121203144151',
    'Несмотря ни на что, Хане удалось пережить покушение команды Саммер А и воссоединиться с двумя друзьями, которых очень не хватало. Тем временем Арамаки и Аю сближаются друг с другом, путешествуя в поисках Ханы. Смогут ли они найти ее вовремя, прежде чем ей придется столкнуться со своим самым опасным врагом: самой эволюцией…?');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(22, 112, 'Виктуал', 'Victual'),
(22, 113, 'Праздник', 'Feast'),
(22, 114, 'Предзнаменование', 'Omen'),
(22, 115, 'Предупреждение', 'Warning'),
(22, 116, 'Прогресс', 'Progress');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 23, '2012-11-09', 'https://static.wikia.nocookie.net/7-seeds/images/8/81/683738651.jpg/revision/latest?cb=20121208130154',
    'Грибы, выпущенные Весенней троицей, стремительно распространяются по лесу и даже на животных! Тем временем Арамаки отчаянно бросается ближе к Хане, в то время как гроза обрушивается на грибной лес.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(23, 117, 'Ускорение', 'Acceleration'),
(23, 118, 'Натиск', 'Onrush'),
(23, 119, 'Обратный поток', 'Backflow'),
(23, 120, 'Противовес', 'Counterbalance'),
(23, 121, 'Последействие', 'Aftereffect');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 24, '2013-03-08', 'https://static.wikia.nocookie.net/7-seeds/images/8/85/Vol24.jpg/revision/latest?cb=20130324103440',
    'Едва спасшиеся от огня, разделяющиеся и воссоединяющиеся, оставшиеся в живых участники проекта «7 семян», разбросанные по всей Японии, сталкиваются с различными проблемами, пытаясь собраться вместе. Одинокая Нидзико вскоре понимает, что безопасность ее группы может полностью зависеть от ее решения - будет ли она снова действовать согласно своим учениям и бежать от опасности, оставив всех остальных позади, или действительно рискнет своей жизнью ради остальных...?');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(24, 122, 'Руководство', 'Guidance'),
(24, 123, 'Синхронизатор', 'Synchro'),
(24, 124, 'Вход', 'Entrance'),
(24, 125, 'КТО', 'WHO'),
(24, 126, 'ПОЧЕМУ', 'WHY');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 25, '2013-07-10', 'https://static.wikia.nocookie.net/7-seeds/images/6/6e/Vol25_1.jpg/revision/latest?cb=20130822203041',
    'Пытаясь спасти своих потерявшихся товарищей, члены различных поисковых групп исследуют таинственные пещеры – и им тоже удается заблудиться… но это не смешно, учитывая, сколько опасностей и тайн таит в себе это место.');  
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(25, 127, 'ЧТО', 'WHAT'),
(25, 128, 'КАК', 'HOW'),
(25, 129, 'ГДЕ', 'WHERE'),
(25, 130, 'КОГДА', 'WHEN'),
(25, 131, 'ОСП', 'OSP');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 26, '2014-01-10', 'https://static.wikia.nocookie.net/7-seeds/images/8/80/Vol26_1.jpg/revision/latest?cb=20140403195448',
    'Члены смешанной команды попадают на загадочный остров Кагишима. Настоящая личность Кагисимы заключалась в том, что на острове Садо был открыт приют для сохранения флоры, фауны и культурных ценностей. Тем временем Хана и ее друзья следуют словам, оставленным их покойным отцом, и направляются на остров Садо, но какое шокирующее зрелище они там видят!');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(26, 132, 'Сердце', 'Heart'),
(26, 133, 'Вместе', 'With'),
(26, 134, 'Взгляд', 'Sight'),
(26, 135, 'Бой', 'Fight'),
(26, 136, 'Два садо', 'The two sadow');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 27, '2014-07-10', 'https://jpbookstore.com/cdn/shop/products/71HNGz_e9QL_1024x1024@2x.jpg?v=1658992752',
    'Прибыв на остров Садо, Хана и другие замечают существование огромного подземного пространства и пытаются спуститься под землю. Тем временем в подвале Кагисимы бродят члены смешанной команды. Участники встречаются впервые, и когда они действуют вместе, их мысли пересекаются. И наконец, Хана и Нацу становятся ближе...!?');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(27, 137, 'Контакт', 'Contact'),
(27, 138, 'Надежда', 'Hope'),
(27, 139, 'Несколько идей', 'Several insights'),
(27, 140, 'Индивидуальные', 'Individual cases'),
(27, 141, 'Вкл', 'On');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 28, '2014-12-10', 'https://jpbookstore.com/cdn/shop/products/81Bzva1TbUL_1024x1024@2x.jpg?v=1658992033',
    'Прибыв на остров Садо, Хана и ее друзья впервые вступают в контакт с Нацу под землей через оставшегося робота-уборщика. Однако Нацу теряет сознание, а Хана и Шинмаки спускаются в подвал, чтобы спасти ее. Между тем, подземный Араши также столкнулся с разговорами между участниками через роботов. Когда Араши узнает, что цветок внутри живой...!?');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(28, 142, 'Искушение', 'Temptation'),
(28, 143, 'Старые добрые времена', 'The good old days'),
(28, 144, 'Выбор', 'Choice'),
(28, 145, 'Связь', 'Connection'),
(28, 146, 'Востановление', 'Regeneration');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 29, '2015-05-08', 'https://jpbookstore.com/cdn/shop/products/71bT2tafh7L_1024x1024@2x.jpg?v=1658992753',
    'План «7SEEDS» был опубликован с целью предотвратить вымирание человечества. Молодые люди просыпаются от крио-сна и продолжают свой суровый путь выживания, но каждый из них начинает собираться на острове Садо. Затем, когда Хана просыпается от галлюцинации в подземном переходе на острове Садо, она слышит голос своего возлюбленного, доносящийся из робота-связи...? Тем временем Шинмаки, спустившийся под землю вместе с Ханой, попадает в плен к пауку, и его жизнь находится в опасности. Хана начинает двигаться, чтобы помочь Шинмаки!');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(29, 147, 'Резонанс', 'Resonance'),
(29, 148, 'Погоня', 'Pursuit'),
(29, 149, 'Послесвечение', 'Afterglow'),
(29, 150, 'Подземное созвездиие', 'Underground Constellation'),
(29, 151, 'Впечатление', 'Impression');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 30, '2015-10-09', 'https://jpbookstore.com/cdn/shop/products/71WLSGpDQHL_1024x1024@2x.jpg?v=1658992756',
    'Члены каждой команды, скитавшиеся под землей на островах Садо и Кагисиме, теперь могут общаться с помощью роботов-коммуникаторов. Однако приток грунтовых вод приводит к тому, что переборки подземных сооружений закрываются одна за другой, оставляя ураган изолированным. Кого я встретил после того, как меня унесло бурей, которую поглотил мутный поток? И какая тайна острова Садо наконец раскрыта?');  
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(30, 152, 'Противостояние', 'Confrontation'),
(30, 153, 'Ковчег', 'The ark'),
(30, 154, 'Их трое', 'The three of them'),
(30, 155, 'Наблюдение', 'Observation'),
(30, 156, 'Цели', 'Goals');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 31, '2016-03-10', 'https://jpbookstore.com/cdn/shop/products/718-YdmQArL_1024x1024@2x.jpg?v=1658992403',
    'Узнав, что в «Ковчеге», расположенном под землей на острове Садо, спят 105 детей, участники «Весны», «Лета», «Осени» и «Зимы» отправились спасать Ковчег. Тем временем Ясуи и Ре встречаются в подземном переходе. Шокирующее зрелище, открывшееся перед ними, было…?');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(31, 157, 'Первый уровень', 'Level one'),
(31, 158, 'Дорога домой', 'The way home/return trip'),
(31, 159, 'Родной дом', 'Birthplace/Hometown'),
(31, 160, 'Испытание', 'The trial'),
(31, 161, 'Испытание 2', 'The trial 2');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 32, '2016-08-10', 'https://jpbookstore.com/cdn/shop/products/71xNqAXKo2L_1024x1024@2x.jpg?v=1658992757',
    'А из видеозаписи, оставленной под землей на острове Садо, выясняется, что Рикако, одна из исследователей проекта 7SEEDS, связана с Кадоматой. И прошлое Кадоматы раскрывается. Что Рикако оставит после себя в будущем?');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(32, 162, 'Воссоединение', 'Reunion'),
(32, 163, 'Нагоми', 'Nagomi'),
(32, 164, 'Пронизывающий холод', 'Penetrating Cold'),
(32, 165, 'Доверие', 'Entrustment'),
(32, 166, 'Движение', 'Move');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 33, '2017-01-10', 'https://jpbookstore.com/cdn/shop/products/71VLEOgbivL_1024x1024@2x.jpg?v=1658992758',
    'Пытаясь спасти детей, Хана отделена от остальных участников перегородкой! Араши и остальные бросаются вперед, чтобы спасти Хану, но Хана оказывается по другую сторону огромной стены...! Более того, подземные воды приближаются к цветам, и если что-то не продолжится, цветы исчезнут... Шинмаки теряет терпение и предпринимает отчаянные меры, чтобы открыть переборку, но...! ?');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(33, 167, 'Резолюция', 'Resolution'),
(33, 168, 'Открытие', 'Opening'),
(33, 169, 'Смерть', 'Death'),
(33, 170, 'Жизнь/Существование', 'Life/Existence'),
(33, 171, 'Ковчег', 'The ark');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 34, '2017-06-09', 'https://jpbookstore.com/cdn/shop/products/71ymTH04piL_1024x1024@2x.jpg?v=1658992759',
    'Благодаря отчаянным действиям Шинмаки Хана переживает кризис и присоединяется к Нацу и остальным внутри ковчега. Он пытается направиться к земле, но на него нападают водяные пауки, и в туннеле вспыхивает пожар! По мере приближения срока для побега участники нажимают на переключатель активации, но...! ?');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(34, 172, 'Таг', 'Tag'),
(34, 173, 'Реальность', 'Reality'),
(34, 174, 'Неудача', 'Failure'),
(34, 175, 'Мужество', 'Courage'),
(34, 176, 'С безлунной зари', 'From a moonless dawn');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(12, 35, '2017-08-10', 'https://jpbookstore.com/cdn/shop/products/71CPIifxoPL_1024x1024@2x.jpg?v=1658992271',
    'Куруми и Рюсей рожают в суровых условиях. Именно Канаме использовал себя как щит, чтобы защитить свою новую жизнь от гигантских муравьев, подкрадывавшихся к нему сзади... Тем временем в подвале рушащегося Садо Хана и остальные пытаются сбежать в ковчеге, стремясь к вершине.В одиночестве, когда некуда идти, это буря абсолютного отчаяния. Неся на спине труп Сигэру, Ясуо, Ре и остальные бросают вызов стене. Шинмаки и его друзья отчаянно пытаются спастись, воспользовавшись канатной дорогой...!');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(35, 177, 'Выйти за пределы', 'Go beyond the limits'),
(35, 178, 'Сегодня и завтра', 'Today and tomorrow');






INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 1, '2006-08-23', 'https://static.wikia.nocookie.net/vinlandsaga/images/b/b1/Volume_1.jpg/revision/latest?cb=20190316211958&path-prefix=ru',
    'В детстве Торфинн сидел у ног великого Лейфа Эриксона и с восторгом слушал дикие истории о землях далеко на западе. Но его юношеские фантазии были разбиты набегом наемников. Выросший викингами, убившими его семью, Торфинн стал ужасающим воином, вечно стремящимся убить лидера банды Аскеладда и отомстить за своего отца. Торфинна поддержали в его испытаниях его гордость за свою семью и его мечты о плодородной земле на западе, земле без войн и рабства... земле, которую Лейф назвал Винландом.');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(36, 1, 'Норманны', 'Normanni'),
(36, 2, 'Где-то не здесь', 'Somewhere not here'),
(36, 3, 'За краем моря', 'Beyond the edge of the sea'),
(36, 4, 'Неснимаемые цепи', 'Unbreakable chains'),
(36, 5, 'Тролль', 'Troll');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 2, '2006-09-22', 'https://static.wikia.nocookie.net/vinlandsaga/images/5/53/Volume_2.jpg/revision/latest?cb=20190316212236&path-prefix=ru',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(37, 6, 'Посланцы войны', 'Messenger from the battlefield'),
(37, 7, 'Меч', 'Sword'),
(37, 8, 'Путешествие начинается', 'The journey begins'),
(37, 9, 'Ловушка в дальних краях', 'A trap in distant seas'),
(37, 10, 'Бессонная ночь', 'Night wake'),
(37, 11, 'Клетка', 'Cage'),
(37, 12, 'Сильнее любого чудовища', 'More than a monster'),
(37, 13, 'Запах', 'Smell'),
(37, 14, 'Меч Торса', 'The sword of thors'),
(37, 15, 'Настоящий воин', 'A true warrior'),
(37, 16, 'Смерть Торса', 'The death of thors');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 3, '2006-10-23', 'https://istari.ru/images/cms/thumbs/3ef4676849371dcf2e5a6636440f8f726bf49c45/3e071f8e-e23e-11ea-0a80-0914000049a4-%D0%92%D0%B8%D0%BD%D0%BB%D0%B0%D0%BD%D0%B4%202%20%D0%BE%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0%201_auto_540_jpg_5_80.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(38, 17, 'Англия, 1008 год', 'England, 1008 age'),
(38, 18, 'Англия, 1013 год', 'England, 1013 age'),
(38, 19, 'Бой на лондонском мосту', 'The battle of London bridge'),
(38, 20, 'Рагнарёк', 'Ragnarok'),
(38, 21, 'Вальхалла', 'Valhala');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 4, '2007-02-23', 'https://istari.ru/images/cms/thumbs/3ef4676849371dcf2e5a6636440f8f726bf49c45/3e071f8e-e23e-11ea-0a80-0914000049a4-%D0%92%D0%B8%D0%BD%D0%BB%D0%B0%D0%BD%D0%B4%202%20%D0%BE%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0%202_auto_540_jpg_5_80.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(39, 22, 'Сын Троля', 'The Trolls son'),
(39, 23, 'Подкрепления', 'Reinforcements'),
(39, 24, 'На другом берегу', 'The land on the far bank'),
(39, 25, 'Блеф', 'bluff'),
(39, 26, 'Арторий', 'Artorius'),
(39, 27, 'Воин и монах', 'The warriors and the monk'),
(39, 28, 'Ночное наподение', 'Night Attack');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 5, '2007-10-23', 'https://istari.ru/images/cms/thumbs/3ef4676849371dcf2e5a6636440f8f726bf49c45/3f5314d1-d278-11eb-0a80-0664002cd59d-Vinland_03-2_auto_540_jpg_5_80.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(40, 29, 'Отец и сын', 'Father and son'),
(40, 30, 'Обеденный стол господина', 'Master and servant at the table'),
(40, 31, 'История зверей', 'History of beast'),
(40, 32, 'Дезертиры', 'Defectors'),
(40, 33, 'Предательство', 'Betrayal'),
(40, 34, 'Авалон', 'Avalon'),
(40, 35, 'Контакт', 'Contact');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 6, '2008-06-23', 'https://i.pinimg.com/564x/ff/9e/54/ff9e5485ed3ab095ecfd0b0cbca1e3cf.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(41, 36, 'Двое на поле битвы', 'Two on the Battlefield'),
(41, 37, 'Значение любви', 'The Definition of Love'),
(41, 38, 'За пределами колыбели', 'Out of the Cradle'),
(41, 39, 'Пробуждение короля', 'The King Awakens'),
(41, 40, 'История Торса', 'The Legend of Thors'),
(41, 41, 'Совместная битва', 'United Front'),
(41, 42, 'Твоя жизнь или смерть в моих руках', 'Verdict');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 7, '2009-02-23', 'https://i.pinimg.com/564x/80/6e/e4/806ee4ee67615f37a257b714515c06cf.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(42, 43, 'Мы должны занять трон и твою жизнь', 'The Prince Returns'),
(42, 44, 'Проклятие Короны', 'The Curse of the Crown'),
(42, 45, 'Последний друг', 'His Last Friend'),
(42, 46, 'Два волка', 'Two Lone Wolves'),
(42, 47, 'Героя нет', 'The Hero is Gone'),
(42, 48, 'Воссоединение', 'Reunion'),
(42, 49, 'Прошло одиннадцать лет', 'Karlsefni');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 8, '2009-09-23', 'https://i.pinimg.com/564x/d1/fa/62/d1fa6276cc17506f9801498a80afcef2.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(43, 50, 'Позвольте мне привить вам ядовитый клык', 'Plot'),
(43, 51, 'Просчет', 'Miscalculation'),
(43, 52, 'Возрождение героя', 'The Hero Returns'),
(43, 53, 'Ярость короля Британии', 'The Fury of Britannia King'),
(43, 54, 'Конец пролога', 'End of the Prologue'),
(43, 55, 'Раб', 'Slave'),
(43, 56, 'Ферма Кетил', 'Ketil Farm');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 9, '2010-06-23', 'https://i.pinimg.com/564x/e3/97/c8/e397c82744ee6bafb09f1d0c6ac4dd69.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(44, 57, 'Молодой господин', 'Young Master'),
(44, 58, 'Человек, которого можно убить', 'The Men Youre Allowed to Kill'),
(44, 59, 'Змея', 'Snake'),
(44, 60, 'Его первый друг', 'His First Friend'),
(44, 61, 'Окровавленная дорога', 'The Way of Blood'),
(44, 62, 'Метод Канута', 'Canutes Way'),
(44, 63, 'Нужна лошадь', 'I Need a Horse'),
(44, 64, 'Нужна лошадь 2', 'I Need a Horse, Part II');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 10, '2011-04-22', 'https://i.pinimg.com/564x/99/2b/a0/992ba09546e7974dd07353cd4feaa58e.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(45, 65, 'Во главе дома', 'At the Old Master House'),
(45, 66, 'Прорастание', 'Budding'),
(45, 67, 'Котел Железного Кулака', 'Iron Fist Ketil'),
(45, 68, 'Пустой человек', 'An Empty Man'),
(45, 69, 'Издевательства', 'Provocation'),
(45, 70, 'Содержание сна', 'The Dream'),
(45, 71, 'Клятва', 'Oath');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 11, '2012-01-23', 'https://i.pinimg.com/564x/9b/c9/be/9bc9befd8a7bfb4d21d842805e39cda7.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(46, 72, 'Проклятая голова', 'The Curse of the Head'),
(46, 73, 'Когда мы станем свободными', 'When Youre Free'),
(46, 74, 'Сбежавший раб', 'Escaped Slave'),
(46, 75, 'Король и его меч', 'King and Sword'),
(46, 76, 'Выступление Ормана', 'Olmars Finest Hour'),
(46, 77, 'Оскорбление', 'Disgrace'),
(46, 78, 'Измена', 'Treason');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 12, '2012-11-22', 'https://i.pinimg.com/564x/c5/15/9b/c5159bb510db9f3ab6c1a497693edb7c.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(47, 79, 'Надвигающиеся темные тучи', 'Portents of Storm Clouds'),
(47, 80, 'Набег Гардара', 'Gardar Assault'),
(47, 81, 'Шторм', 'Storm'),
(47, 82, 'Веревкии', 'Bondage'),
(47, 83, 'Искупление', 'Atonement'),
(47, 84, 'Самообманчивая фантазия', 'A Convenient Dream'),
(47, 85, 'Противостояние', 'Confrontation'),
(47, 86, 'Безвозвратные жизни', 'No Going Home');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 13, '2013-07-23', 'https://i.pinimg.com/564x/56/d5/28/56d528f9825bf9a8186994cd3f35875b.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(48, 87, 'Ночь перед бурей', 'The First Move'),
(48, 88, 'Наказание', 'Punishment'),
(48, 89, 'Ночь перед битвой', 'The Eve of the Battle'),
(48, 90, 'Цена еды', 'The Price of the Food'),
(48, 91, 'Битва на ферме Кутиля', 'The Battle of Ketil Farm'),
(48, 92, '100 секунд', 'Hundred-count'),
(48, 93, 'Рождение воина', 'Birth of a Warrior');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 14, '2014-02-21', 'https://i.pinimg.com/564x/18/a4/de/18a4dea5e9eeccf07323e6432bf97976.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(49, 94, 'Предложение о капитуляции', 'Recommendation of Surrender'),
(49, 95, 'Забытая вещь', 'Forgotten Things'),
(49, 96, 'Никаких врагов', 'Invincible'),
(49, 97, 'Король возглавил восстание', 'Emperor of Rebellion'),
(49, 98, 'Два рая', 'Two Paradises'),
(49, 99, 'Отплытие', 'Departure'),
(49, 100, 'Возвращение', 'Homecoming');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 15, '2014-10-23', 'https://i.pinimg.com/564x/02/56/f1/0256f192775ce869e58553dd2e6e10b7.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES
(50, 101, 'Скованная крачка (1)', 'The Fettered Tern (1)'),
(50, 102, 'Скованная крачка (2)', 'The Fettered Tern (2)'),
(50, 103, 'Скованная крачка (3)', 'The Fettered Tern (3)'),
(50, 104, 'Скованная крачка (4)', 'The Fettered Tern (4)'),
(50, 105, 'Скованная крачка (5)', 'The Fettered Tern (5)'),
(50, 106, 'Скованная крачка (6)', 'The Fettered Tern (6)'),
(50, 107, 'Скованная крачка (7)', 'The Fettered Tern (7)');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 16, '2015-06-23', 'https://i.pinimg.com/564x/b8/f6/f4/b8f6f4629b70ef734546942ede02abb2.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(51, 108, 'Скованная крачка 8', 'The Fettered Tern (8)'),
(51, 109, 'Освобожденная крачка', 'The Liberated Tern'),
(51, 110, 'Пересечение северного моря', 'Crossing the North Sea'),
(51, 111, 'От воина к воину', 'From Warrior to Warrior'),
(51, 112, 'Обязательное насилие', 'Obligatory Violence'),
(51, 113, 'Нарушители спокойствия', 'Troublemakers'),
(51, 114, 'Охотник и жертва (1)', 'The Hunter and the Hunted (1)'),
(51, 115, 'Охотник и жертва (2)', 'The Hunter and the Hunted (2)');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 17, '2016-01-22', 'https://i.pinimg.com/564x/f5/5d/62/f55d62283d96f123b3a53bd832b61a8c.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(52, 116, 'Охотник и жертва (3)', 'The Hunter and the Hunted (3)'),
(52, 117, 'Охотник и жертва (4)', 'The Hunter and the Hunted (4)'),
(52, 118, 'Охотник и жертва (5)', 'The Hunter and the Hunted (5)'),
(52, 119, 'Охотник и жертва (6)', 'The Hunter and the Hunted (6)'),
(52, 120, 'Охотник и жертва (7)', 'The Hunter and the Hunted (7)'),
(52, 121, 'Охотник и жертва (8)', 'The Hunter and the Hunted (8)'),
(52, 122, 'Охотник и жертва (9)', 'The Hunter and the Hunted (9)');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 18, '2016-08-23', 'https://i.pinimg.com/564x/f0/b4/d2/f0b4d27a1eeea264438407cccb97d75e.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(53, 123, 'Жизнь взаймы', 'A Borrowed Life'),
(53, 124, 'Отъезд из Норвегии', 'Departing Norway'),
(53, 125, 'Война в Болтийском море (1)', 'War in the Baltic (1)'),
(53, 126, 'Война в Болтийском море (2)', 'War in the Baltic (2)'),
(53, 127, 'Война в Болтийском море (3)', 'War in the Baltic (3)'),
(53, 128, 'Война в Болтийском море (4)', 'War in the Baltic (4)'),
(53, 129, 'Война в Болтийском море (5)', 'War in the Baltic (5)');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 19, '2017-04-21', 'https://i.pinimg.com/564x/60/bb/c2/60bbc231a46ff04b8163375321899702.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(54, 130, 'Война в Болтийском море (6)', 'War in the Baltic (6)'),
(54, 131, 'Война в Болтийском море (7)', 'War in the Baltic (7)'),
(54, 132, 'Война в Болтийском море (8)', 'War in the Baltic (8)'),
(54, 133, 'Война в Болтийском море (9)', 'War in the Baltic (9)'),
(54, 134, 'Война в Болтийском море (10)', 'War in the Baltic (10)'),
(54, 135, 'Война в Болтийском море (11)', 'War in the Baltic (11)'),
(54, 136, 'Война в Болтийском море (12)', 'War in the Baltic (12)');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 20, '2017-11-22', 'https://i.pinimg.com/564x/46/bb/1f/46bb1f76af56c4ba2bd3d298d93a6d99.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(55, 137, 'Война в Болтийском море (13)', 'War in the Baltic (13)'),
(55, 138, 'Война в Болтийском море (14)', 'War in the Baltic (14)'),
(55, 139, 'Война в Болтийском море (15)', 'War in the Baltic (15)'),
(55, 140, 'Война в Болтийском море (16)', 'War in the Baltic (16)'),
(55, 141, 'Война в Болтийском море (17)', 'War in the Baltic (17)'),
(55, 142, 'Война в Болтийском море (18)', 'War in the Baltic (18)'),
(55, 143, 'Война в Болтийском море (19)', 'War in the Baltic (19)'),
(55, 144, 'Война в Болтийском море (20)', 'War in the Baltic (20)');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 21, '2018-08-23', 'https://i.pinimg.com/564x/cc/7f/b3/cc7fb374ee46c12b4256b0fabac09d5d.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(56, 145, 'Война в Болтийском море (21)', 'War in the Baltic (21)'),
(56, 146, 'Война в Болтийском море (22)', 'War in the Baltic (22)'),
(56, 147, 'Война в Болтийском море (23)', 'War in the Baltic (23)'),
(56, 148, 'Война в Болтийском море (24)', 'War in the Baltic (24)'),
(56, 149, 'Война в Болтийском море (25)', 'War in the Baltic (25)'),
(56, 150, 'Война в Болтийском море (26)', 'War in the Baltic (26)'),
(56, 151, 'Война в Болтийском море (27)', 'War in the Baltic (27)'),
(56, 152, 'Война в Болтийском море (28)', 'War in the Baltic (28)');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 22, '2019-06-21', 'https://i.pinimg.com/564x/2c/a0/61/2ca0612685e674285bcb5c7bb8ab00d9.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(57, 153, 'Война в Болтийском море (29)', 'War in the Baltic (29)'),
(57, 154, 'Война в Болтийском море (30)', 'War in the Baltic (30)'),
(57, 155, 'Война в Болтийском море (31)', 'War in the Baltic (31)'),
(57, 156, 'Война в Болтийском море (32)', 'War in the Baltic (32)'),
(57, 157, 'Война в Болтийском море (33)', 'War in the Baltic (33)'),
(57, 158, 'Война в Болтийском море (34)', 'War in the Baltic (34)'),
(57, 159, 'Война в Болтийском море (35)', 'War in the Baltic (35)'),
(57, 160, 'Война в Болтийском море (36)', 'War in the Baltic (36)');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 23, '2019-11-22', 'https://i.pinimg.com/564x/54/fa/ed/54faed6f581f9315be02ca778a834ae6.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(58, 161, 'Решение Сигурда', 'Sigurd Decision'),
(58, 162, 'Возвращение Сигурда', 'Sigurd Return'),
(58, 163, 'Сиг и Хэтт', 'Sig and Hatt'),
(58, 164, 'Сигурд непокорный', 'Sigurd Defiant'),
(58, 165, 'Прощание Сигурда', 'The Parting of Sigurd'),
(58, 166, 'Свадьба', 'Wedding');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 24, '2020-10-23', 'https://i.pinimg.com/564x/17/8b/2f/178b2fb300ee2015dbcce47c89fafadc.jpg',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(59, 167, 'Путешествие на Запад (1)', 'Voyage to the West (1)'),
(59, 168, 'Путешествие на Запад (2)', 'Voyage to the West (2)'),
(59, 169, 'Путешествие на Запад (3)', 'Voyage to the West (3)'),
(59, 170, 'Путешествие на Запад (4)', 'Voyage to the West (4)'),
(59, 171, 'Путешествие на Запад (5)', 'Voyage to the West (5)'),
(59, 172, 'Путешествие на Запад (6)', 'Voyage to the West (6)'),
(59, 173, 'Путешествие на Запад (7)', 'Voyage to the West (7)'),
(59, 174, 'Путешествие на Запад (8)', 'Voyage to the West (8)'),
(59, 175, 'Путешествие на Запад (9)', 'Voyage to the West (9)');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 25, '2021-06-21', 'https://jpbookstore.com/cdn/shop/products/810dgEUplIL_1024x1024@2x.jpg?v=1627395479',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(60, 176, 'Путешествие на Запад (10)', 'Voyage to the West (10)'),
(60, 177, 'Путешествие на Запад (11)', 'Voyage to the West (11)'),
(60, 178, 'Путешествие на Запад (12)', 'Voyage to the West (12)'),
(60, 179, 'Путешествие на Запад (13)', 'Voyage to the West (13)'),
(60, 180, 'Путешествие на Запад (14)', 'Voyage to the West (14)'),
(60, 181, 'Название деревни...', 'The Name of the Village Is...'),
(60, 182, 'Самый пугающий человек', 'The Most Frightening Man'),
(60, 183, 'Туземцы', 'Natives');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 26, '2022-05-23', 'https://jpbookstore.com/cdn/shop/products/71VkEH_yW5L_1024x1024@2x.jpg?v=1653297032',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(61, 184, 'Лну', 'Lnu'),
(61, 185, 'Мечта Нискаваджи', 'Niskawaji Dream'),
(61, 186, 'Муки Корделии', 'Cordelia Anguish'),
(61, 187, 'Экспедиция Нискаваджи', 'Niskawaji Expedition'),
(61, 188, 'Хильд и Бог Леса', 'Hild and the God of the Forest'),
(61, 189, 'Ритуал Мисквекепу', 'Miskwekepu Ritual'),
(61, 190, 'Диалог Рагнарёк', 'The Ragnarok Dialogue'),
(61, 191, 'День наступает', 'The Day Arrives');

INSERT INTO toms (title_id, numer, edition, img, description) VALUES
(3, 27, '2023-06-22', 'https://jpbookstore.com/cdn/shop/products/7194svoCCLL_1024x1024@2x.jpg?v=1687770041',
    '');
INSERT INTO chapters (tom_id, numer, name, name_eng) VALUES    
(62, 192, 'Тысячелетнее путешествие. Часть (1)', 'Thousand Year Voyage Part (1)'),
(62, 193, 'Тысячелетнее путешествие. Часть (2)', 'Thousand Year Voyage Part (2)'),
(62, 194, 'Тысячелетнее путешествие. Часть (3)', 'Thousand Year Voyage Part (3)'),
(62, 195, 'Тысячелетнее путешествие. Часть (4)', 'Thousand Year Voyage Part (4)'),
(62, 196, 'Тысячелетнее путешествие. Часть (5)', 'Thousand Year Voyage Part (5)'),
(62, 197, 'Тысячелетнее путешествие. Часть (6)', 'Thousand Year Voyage Part (6)'),
(62, 198, 'Тысячелетнее путешествие. Часть (7)', 'Thousand Year Voyage Part (7)'),
(62, 199, 'Тысячелетнее путешествие. Часть (8)', 'Thousand Year Voyage Part (8)'),
(62, 200, 'Тысячелетнее путешествие. Часть (9)', 'Thousand Year Voyage Part (9)'),
(62, 201, 'Тысячелетнее путешествие. Часть (10)', 'Thousand Year Voyage Part (10)');

--select m.id, title, 
--    t.numer, ch.numer, LEFT(t.description, 40), LEFT(ch.name, 40) 
--from manga m 
--join toms t on t.title_id = m.id
--join chapters ch on ch.tom_id = t.id