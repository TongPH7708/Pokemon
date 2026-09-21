drop database Pokemon_PC;

create database Pokemon_PC;

use Pokemon_PC;

create table Trainer(
trainer_id int auto_increment primary key,
trainer_name varchar(255) not null,
region varchar(100),
badge_count int
);

create table Pokemon(
pokemon_id int auto_increment primary key,
pokemon_name varchar(255) not null,
level int,
hp int,
OT int,
FOREIGN KEY(OT) REFERENCES Trainer (trainer_id)
);



create table Battle(
battle_id int auto_increment primary key,
battle_date date,
location varchar(255),
outcome varchar(100),
participant int,
FOREIGN KEY (participant) REFERENCES Trainer (trainer_id)
);

create table Type(
type_id int auto_increment primary key,
type_name varchar(255) not null,
pokemon_type int,
FOREIGN KEY (pokemon_type) REFERENCES Pokemon (pokemon_id)
);

insert into Trainer (trainer_name, region, badge_count) values ('Yellow', 'Kanto', 0);
insert into Trainer (trainer_name, region, badge_count) values ('Red', 'Kanto', 8);
insert into Trainer (trainer_name, region, badge_count) values ('Blue', 'Kanto', 2);
insert into Trainer (trainer_name, region, badge_count) values ('Gold', 'Johto', 4);
insert into Trainer (trainer_name, region, badge_count) values ('Crystal', 'Johto', 6);
insert into Trainer (trainer_name, region, badge_count) values ('Sapphire', 'Hoenn', 8);


insert into Pokemon (pokemon_name, level, hp, OT) values ('Pikachu', 100, 75, 2);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Venusaur', 68, 125, 2);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Blastoise', 77, 255, 3);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Typhlosion', 69, 235, 4);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Meganium', 54, 136, 5);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Blaziken', 78, 234, 6);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Butterfree', 86, 157, 2);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Poliwrath', 79, 154, 2);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Jigglypuff', 45, 86, 3);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Sunflora', 37, 98, 4);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Smoochum', 97, 394, 5);
insert into Pokemon (pokemon_name, level, hp, OT) values ('Altaria', 56, 203, 5);

insert into Type (type_name, pokemon_type) values ('Electric', 1);
insert into Type (type_name, pokemon_type) values ('Grass', 2);
insert into Type (type_name, pokemon_type) values ('Poison', 2);
insert into Type (type_name, pokemon_type) values ('Water', 3);
insert into Type (type_name, pokemon_type) values ('Fire', 4);
insert into Type (type_name, pokemon_type) values ('Fighting', 6);
insert into Type (type_name, pokemon_type) values ('Flying', 12);
insert into Type (type_name, pokemon_type) values ('Bug', 7);
insert into Type (type_name, pokemon_type) values ('Normal', 9);
insert into Type (type_name, pokemon_type) values ('Fairy', 9);
insert into Type (type_name, pokemon_type) values ('Ice', 11);
insert into Type (type_name, pokemon_type) values ('Psychic', 11);
insert into Type (type_name, pokemon_type) values ('Dragon', 12);

insert into Battle (battle_date, location, outcome, participant) values('1996-09-08', 'Viridian City', 'Win', 2);
insert into Battle (battle_date, location, outcome, participant) values('1998-06-23', 'Pallet Town', 'Draw', 3);
insert into Battle (battle_date, location, outcome, participant) values('2001-07-15', 'Goldenrod', 'Lose', 4);
insert into Battle (battle_date, location, outcome, participant) values('2002-09-08', 'Indigo Plateau', 'Win', 2);
insert into Battle (battle_date, location, outcome, participant) values('2004-10-23', 'Oldale Town', 'Draw', 6);
insert into Battle (battle_date, location, outcome, participant) values('2006-06-29', 'Ever Grande City', 'Lose', 5);
insert into Battle (battle_date, location, outcome, participant) values('2010-02-08', 'Battle Frontier', 'Win', 2);
insert into Battle (battle_date, location, outcome, participant) values('2003-09-08', 'Cinnabar Island', 'Lose', 3);

SELECT Trainer.trainer_id, Trainer.trainer_name, Pokemon.pokemon_name
FROM Trainer
LEFT JOIN Pokemon ON Trainer.trainer_id = Pokemon.OT;

SELECT Trainer.trainer_id, Trainer.trainer_name,
COUNT(pokemon_name) AS pokemon_count
FROM Trainer
LEFT JOIN Pokemon ON Trainer.trainer_id = Pokemon.OT
GROUP BY trainer_id, trainer_name
ORDER BY pokemon_count;

SELECT Pokemon.pokemon_id, Pokemon.pokemon_name, Type.type_name
FROM Pokemon
JOIN Type ON Type.pokemon_type = pokemon_id;

SELECT Pokemon.Pokemon_name, Pokemon.level, Trainer.trainer_name
FROM Pokemon
JOIN Trainer ON Trainer.trainer_id = Pokemon.OT
WHERE level >30;

SELECT Trainer.trainer_name,
COUNT(Battle.participant) AS battle_count
FROM Trainer
LEFT JOIN Battle ON Battle.participant = Trainer.trainer_id
group by Trainer.trainer_name
order by battle_count DESC;

SELECT Trainer.trainer_name,
COUNT(Battle.outcome) AS win_count
FROM Trainer
LEFT JOIN Battle ON Trainer.trainer_id = participant
WHERE Battle.outcome = 'win'
group by Trainer.trainer_name
HAVING COUNT(Battle.outcome) >= 2
order by win_count;

SELECT Battle.location, Battle.outcome, Trainer_name
FROM Battle
LEFT JOIN Trainer ON Battle.participant = trainer_id
WHERE Battle.outcome = 'win';

SELECT Trainer.trainer_id, Trainer.trainer_name,
COUNT(Pokemon.pokemon_id) AS pokemon_count
FROM Trainer
LEFT JOIN Pokemon ON Trainer.trainer_id = Pokemon.OT
GROUP BY trainer_id, trainer_name
ORDER BY pokemon_count DESC
LIMIT 1;