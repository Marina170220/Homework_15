
Create table animals_type
(
    id text primary key,
    name text not null
);

insert into animals_type (id, name)
select distinct (animal_type), (animal_type) from animals;


Create table animal_breeds
(
    id text primary key,
    name text not null
);

insert into animal_breeds (id, name)
select distinct (breed), (breed) from animals;


Create table outcome_subtypes
(
    id integer primary key autoincrement,
    name text not null
);


Create table outcome_subtypes
(
    id text primary key,
    name text not null
);

insert into outcome_subtypes (id, name)
select distinct (outcome_subtype), (outcome_subtype) from animals
where outcome_subtype not null;


create table colors_temp
(
   id integer primary key autoincrement,
    name text not null
);

insert into colors_temp (name)
select distinct color1 from animals
where color1 not null;

insert into colors_temp (name)
select distinct color2 from animals
where color2 not null;


Create table animals_colors
(
    id text primary key,
    name text not null
);


insert into animals_colors (id, name)
select distinct (name), (name) from colors_temp
where name not like '% '
order by name;


Create table outcome_types
(
    id text primary key,
    name text not null
);

insert into outcome_types (id, name)
select distinct (outcome_type), (outcome_type) from animals
where outcome_type not null
order by outcome_type;


Create table outcome_month
(
    id text primary key,
    month integer not null
);

insert into outcome_month (id, month)
select distinct (outcome_month), (outcome_month) from animals
where outcome_month not null
order by outcome_month;
;


Create table outcome_year
(
    id text primary key,
    year integer not null
);

insert into outcome_year (id, year)
select distinct (outcome_year), (outcome_year) from animals
where outcome_year not null
order by outcome_year;


create table animals_new (
    [index] integer primary key autoincrement,
    age_upon_outcome text,
    animal_id text NOT NULL,
    animal_type text,
    name text,
    breed text,
    color1 text,
    color2 text,
    date_of_birth text,
    outcome_subtype text,
    outcome_type text,
    outcome_month integer,
    outcome_year integer,
    foreign key (animal_type) references animals_type(id) ON UPDATE cascade on delete set null,
    foreign key (breed) references animal_breeds(id) ON UPDATE cascade on delete set null,
    foreign key (color1) references animals_colors(id) ON UPDATE cascade on delete set null,
    foreign key (color2) references animals_colors(id) ON UPDATE cascade on delete set null,
    foreign key (outcome_subtype) references outcome_subtypes(id) ON UPDATE cascade on delete set null,
    foreign key (outcome_type) references outcome_types(id) ON UPDATE cascade on delete set null,
    foreign key (outcome_month) references outcome_month(id) ON UPDATE cascade on delete set null,
    foreign key (outcome_year) references outcome_year(id) ON UPDATE cascade on delete set null
);

insert into animals_new (age_upon_outcome, animal_id, animal_type, name, breed, color1, color2, date_of_birth, outcome_subtype, outcome_type, outcome_month, outcome_year)
select age_upon_outcome, animal_id, animal_type, name, breed, color1, color2, date_of_birth, outcome_subtype, outcome_type, outcome_month, outcome_year
from animals
;
