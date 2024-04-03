CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;

-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
-- SET check_function_bodies = false;
-- SET xmloption = content;
-- SET client_min_messages = warning;
-- SET row_security = off;
-- SET default_tablespace = '';
-- SET default_table_access_method = heap;

CREATE TABLE IF NOT EXISTS manga(
    id BIGINT primary key generated always as identity,
    title VARCHAR (100) NOT NULL,
    title_en VARCHAR (100) NOT NULL,
    author TEXT NOT NULL,
    rating numeric(4,2) NOT NULL,
    start_d DATE NOT NULL,
    finish_d DATE
);

INSERT INTO manga (title, title_en, author, rating, start_d) VALUES
('Берсерк',                 'Berserk',              'Kentarou Miura',       9.98, '1989-08-29'),
('Бродяга',                 'Vagabond',             'Takehiko Inoue',       9.91, '1998-09-03'),
('Сага о Винланде',         'Vinland Saga',         'Makoto Yukimura',      9.73, '2005-04-13'),
('Башня Бога',              'Tower of God',         'SIU',                  9.57, '2010-07-05'),
('Синяя тюрьма: Блю Лок',   'Blue Lock',            'Muneyuki Kaneshiro',   9.43, '2018-08-01'),
('Начало после конца',      'The Beginning After The End', 'TurtleMe',      8.75, '2016-01-21'),
('Хикару и Го',             'Hikaru no Go',         'Yumi Hotta',           8.49, '1999-06-30'),
('Борьба в прямом эфире',   'Viral Hit',            'Tae-Jun Park',         8.44, '2019-11-16'),
('Реинкарнация безработного', 'Mushoku Tensei',     'Rifujin Na Magonote',  8.25, '2014-05-02'),
('Игра дарвина',            'Darwin’s Game',        'FLIPFLOPs',            8.14, '2013-06-07'),
('О моём перерождении в слизь', 'Tensei shitara Slime Datta Ken', 'Fuse',   7.81, '2015-03-26');
INSERT INTO manga (title, title_en, author, rating, start_d, finish_d) VALUES
('7 семян',                 '7 Seeds',              'Yumi Tamura',          9.82, '2001-10-13', '2017-05-27'),
('Огненный удар',           'Fire Punch',           'Tatsuki Fujimoto',     9.54, '2016-04-18', '2018-01-01'),
('Дорохедоро',              'Dorohedoro',           'Q Hayashida',          9.18, '2000-11-30', '2018-09-12'),
('Басара ',                 'Basara',               'Yumi Tamura',          9.05, '1990-08-11', '1998-05-13'),
('Обещанный Неверленд',     'Yakusoku no Neverland', 'Kaiu Shirai',         8.93, '2016-08-01', '2020-06-15'),
('Скалолаз',                'Kokou no Hito',        'Shinichi Sakamoto',    8.82, '2007-11-01', '2011-10-27'),
('Поднятие уровня в одиночку', 'Solo Leveling',     'Chugong',              8.74, '2018-04-04', '2022-07-25'),
('Милый дом',               'Sweet Home',           'Carnby Kim',           8.56, '2017-10-12', '2020-07-02'),
('Человек-бензопила',       'Chainsaw Man',         'Tatsuki Fujimoto',     8.21, '2018-12-03', '2020-12-14'),
('Невероятные Приключения ДжоДжо Часть 6: Каменный океан', 'JoJo Bizarre Adventure: Stone Ocean', 'Hirohiko Araki', 8.18, '1999-12-07', '2003-04-08'),
('Плутон',                  'Pluto',                'Osamu Tezuka',         8.07, '2003-09-09', '2009-04-01'),
('Человек-дьявол',          'Devilman',             'Go Nagai',             7.97, '1972-06-11', '1973-06-24'),
('Крушитель: Новые волны',  'The Breaker: New waves', 'Geuk-jin Jeon',      7.67, '2010-09-08', '2015-05-08'),
('Крушитель',               'The Breaker',          'Geuk-jin Jeon',        7.60, '2007-06-01', '2010-07-20'),
('Повар-боец Сома',         'Shokugeki no Soma',    'Yuuto Tsukuda',        7.58, '2012-11-26', '2019-08-29'),
('Клуб извращенцев',        'Pervert Club',         'Sang Ho Woo',          7.42, '2017-05-10', '2018-03-20');