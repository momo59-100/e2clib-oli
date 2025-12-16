CREATE USER 'e2clib_admin'@'localhost' IDENTIFIED BY 'Aviva1605@';
GRANT ALL PRIVILEGES ON e2clib_oli.* To 'e2clib_admin'@'localhost';

CREATE TABLE if not exists users  (
id smallint UNSIGNED not null auto_increment primary key,    
email varchar(255) not null unique,
password varchar(255) not null,
pseudo varchar(15) not null unique,
biography TINYTEXT,
age TINYINT UNSIGNED not null,
is_admin boolean not null default 0    
)engine=InnoDB;


insert into users (password,  email, pseudo, age, is_admin)
values("Aviva1605@", "ennasrimohammed212@gmail.com", "Momo59100", 25, 1) 


insert into users (password,  email, pseudo, age)
values ("Aviva1605", "ennasrimohammed59100@gmail.com", "Momo59", 25), 
("Aviva1", "ennasrimohammed5@gmail.com", "Momo5911", 25), 
("Aviva16", "ennasrimohammed591@gmail.com", "Momo59966", 25);

CREATE TABLE if not exists genres (
id TINYINT UNSIGNED not null auto_increment primary key,
name varchar(50) not null unique
)ENGINE=InnoDB;

CREATE TABLE if not exists languages (
id TINYTEXT UNSIGNED not null auto_increment primary key,
name varchar(10) not null unique
)ENGINE=InnoDB;

CREATE TABLE if not exists format (
id TINYINT UNSIGNED not null auto_increment primary key,
name varchar(20) not null unique
)ENGINE=InnoDB;

insert into languages (name)
values('français'), ('anglais'), ('portugais'), ('arabe'); 

insert into formats (name)
values('Poche'), ('roman'), ('Bande déssiné'), ('manga'), ('magazine'); 

insert into genres (name)
values('non classé'), ('policier'), ('drame'), ('action'), ('thriller'); 

CREATE TABLE if not exists books(
ID smallint UNSIGNED not null auto_increment primary key;
title varchar(255) not null,
auteur varchar(255) not null default 'inconnu',
synopsis TINYTEXT not null default 'en attente',
year smallint,
editor varchar(255), 
cover varchar(255),
pages smallint,
genre_id TINYINT UNSIGNED not null default 1,
languages_ID TINYINT UNSIGNED not null default 1,
format_id TINYINT UNSIGNED,
constraint fk_genres
    foreign key (genre_id),
    references genres(id)
constraint fk_languages
    foreign key (languages_id),
    references languages(id)
constraint fk_format
    foreign key (format_id),
    references format(id)
)ENGINE=InnoDB;