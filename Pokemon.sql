create database Pokemon_PC;

use Pokemon_PC;

create table Trainer(
id int auto_increment primary key,
trainer_id int,
trainer_name varchar(255) not null,
region varchar(100),
badge_count int
);

create table Pokemon(
id int auto_increment primary key,
pokemon_id int,
pokemon_name varchar(255) not null,
level int,
hp int
);

create table Battle(
id int auto_increment primary key,
battle_id int,
battle_date date,
location varchar(255),
outcome varchar(100)
);

create table Type(
id int auto_increment primary key,
type_id int,
type_name varchar(255) not null
);

insert into Trainer (trainer_id, trainer_name, region, badge_count) values (1, 'Yellow', 'Kanto', 0);
insert into Trainer (trainer_id, trainer_name, region, badge_count) values (2, 'Red', 'Kanto', 8);
insert into Trainer (trainer_id, trainer_name, region, badge_count) values (3, 'Blue', 'Kanto', 2);
insert into Trainer (trainer_id, trainer_name, region, badge_count) values (4, 'Gold', 'Johto', 4);
insert into Trainer (trainer_id, trainer_name, region, badge_count) values (5, 'Crystal', 'Johto', 6);
insert into Trainer (trainer_id, trainer_name, region, badge_count) values (6, 'Sapphire', 'Hoenn', 8);

insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (1, 'Pikachu', 100, 75);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (2, 'Venusaur', 68, 125);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (3, 'Blastoise', 77, 255);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (4, 'Typhlosion', 69, 235);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (5, 'Meganium', 54, 136);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (6, 'Blaziken', 78, 234);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (7, 'Butterfree', 86, 157);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (8, 'Poliwrath', 79, 154);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (9, 'Jigglypuff', 45, 86);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (10, 'Sunflora', 37, 98);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (11, 'Smoochum', 97, 394);
insert into Pokemon (pokemon_id, pokemon_name, level, hp) values (12, 'Altaria', 56, 203);

insert into Type (type_id, type_name) values (1, 'Electric');
insert into Type (type_id, type_name) values (2, 'Grass');
insert into Type (type_id, type_name) values (3, 'Poison');
insert into Type (type_id, type_name) values (4, 'Water');
insert into Type (type_id, type_name) values (5, 'Fire');
insert into Type (type_id, type_name) values (6, 'Fighting');
insert into Type (type_id, type_name) values (7, 'Flying');
insert into Type (type_id, type_name) values (8, 'Bug');
insert into Type (type_id, type_name) values (9, 'Normal');
insert into Type (type_id, type_name) values (10, 'Fairy');
insert into Type (type_id, type_name) values (11, 'Ice');
insert into Type (type_id, type_name) values (12, 'Psychic');
insert into Type (type_id, type_name) values (13, 'Dragon');
