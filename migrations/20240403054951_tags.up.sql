CREATE TYPE group_type AS ENUM ('manga', 'anime', 'film');
ALTER TABLE manga ADD COLUMN variety group_type;
UPDATE manga SET variety = 'manga';

CREATE TABLE IF NOT EXISTS tags(
    id BIGINT primary key generated always as identity,
    title VARCHAR (100) NOT NULL
);
CREATE TABLE IF NOT EXISTS taxonomies(
    title_id INTEGER,
    tag_id INTEGER,
    FOREIGN KEY (title_id) REFERENCES manga (id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags (id)
);

INSERT INTO tags (title) VALUES ('Апокалипсис');
INSERT INTO tags (title) VALUES ('Вампиры');
INSERT INTO tags (title) VALUES ('Видеоигры');
INSERT INTO tags (title) VALUES ('Демоны');
INSERT INTO tags (title) VALUES ('Комедия');
INSERT INTO tags (title) VALUES ('Прокачка'); 
INSERT INTO tags (title) VALUES ('Спорт');
INSERT INTO tags (title) VALUES ('Странствия');

INSERT INTO taxonomies VALUES (12, 1); --// 7 seeds
INSERT INTO taxonomies VALUES (13, 1); --// Fire Punch
INSERT INTO taxonomies VALUES (15, 1); --// Basara
INSERT INTO taxonomies VALUES (19, 1); --// Sweet Home
INSERT INTO taxonomies VALUES (10, 1); --// Darwin’s Game
INSERT INTO taxonomies VALUES (18, 3); --// Solo Leveling
INSERT INTO taxonomies VALUES (1, 4); --// Berserk
INSERT INTO taxonomies VALUES (16, 4); --// Yakusoku no Neverland
INSERT INTO taxonomies VALUES (19, 4); --// Sweet Home
INSERT INTO taxonomies VALUES (20, 4); --// Chainsaw Man
INSERT INTO taxonomies VALUES (23, 4); --// Devilman
INSERT INTO taxonomies VALUES (14, 5); --// Dorohedoro
INSERT INTO taxonomies VALUES (1, 6); --// Berserk
INSERT INTO taxonomies VALUES (2, 6); --// Vagabond
INSERT INTO taxonomies VALUES (4, 6); --// Tower of God
INSERT INTO taxonomies VALUES (5, 6); --// Blue Lock
INSERT INTO taxonomies VALUES (6, 6); --// The Beginning After The End
INSERT INTO taxonomies VALUES (18, 6); --// Solo Leveling
INSERT INTO taxonomies VALUES (8, 6); --// Viral Hit
INSERT INTO taxonomies VALUES (10, 6); --// Darwin’s Game
INSERT INTO taxonomies VALUES (11, 6); --// Tensei shitara Slime Datta Ken
INSERT INTO taxonomies VALUES (5, 7); --// Blue Lock
INSERT INTO taxonomies VALUES (17,7); --// Kokou no Hito
INSERT INTO taxonomies VALUES (7, 7); --// Hikaru no Go
INSERT INTO taxonomies VALUES (2, 8); --// Vagabond
INSERT INTO taxonomies VALUES (3, 8); --// Vinland Saga
INSERT INTO taxonomies VALUES (15,8); --// Basara
INSERT INTO taxonomies VALUES (17,8); --// Kokou no Hito

-- select a.id, a.title, c.* from manga as a
-- left join taxonomies as b on a.id = b.title_id
-- left join tags as c on b.tag_id = c.id
-- order by a.id;

-- select a.id, a.title, ARRAY_AGG(c.title) from manga as a
-- left join taxonomies as b on a.id = b.title_id
-- left join tags as c on b.tag_id = c.id 
-- group by a.id
-- order by a.id;