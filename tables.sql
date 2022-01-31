
Create table animals_type
(
    id integer primary key autoincrement,
    name text not null
);

insert into animals_type (name)
select distinct animal_type from animals;


Create table animal_breeds
(
    id integer primary key autoincrement,
    name text not null
);

insert into animal_breeds (name)
select distinct breed from animals;


Create table outcome_subtypes
(
    id integer primary key autoincrement,
    name text not null
);

Create table outcome_subtypes
(
    id integer primary key autoincrement,
    name text not null
);

insert into outcome_subtypes (name)
select distinct outcome_subtype from animals
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
    id integer primary key autoincrement,
    name text not null
);


insert into animals_colors (name)
select distinct name from colors_temp
where name not like '% '
order by name;


Create table outcome_types
(
    id integer primary key autoincrement,
    name text not null
);

insert into outcome_types (name)
select distinct outcome_type from animals
where outcome_type not null;

Create table outcome_month
(
    id integer primary key autoincrement,
    name integer not null
);

alter table outcome_month
rename name to month;

alter table outcome_year
rename name to year;

insert into outcome_month (name)
select distinct outcome_month from animals
where outcome_month not null
order by outcome_month;
;


Create table outcome_year
(
    id integer primary key autoincrement,
    name integer not null
);

insert into outcome_year (name)
select distinct outcome_year from animals
where outcome_year not null
order by outcome_year;

Create table age_upon_outcome
(
    id integer primary key autoincrement,
    age_id integer,
    amount integer not null,
    foreign key (age_id) references age_type(id)
);

Create table age_type
(
    id integer primary key autoincrement,
    name text not null
);

insert into age_type (name)
VALUES ('day'), ('week'), ('month'), ('year');

insert into age_upon_outcome (amount)
VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (16), (17), (18), (19), (20);


CREATE TABLE animals_new (
    [index] integer primary key autoincrement,
    age_upon_outcome_id integer,
    animal_id text NOT NULL,
    animal_type_id integer,
    name text DEFAULT 'Noname',
    breed_id integer,
    color1_id integer,
    color2_id integer,
    date_of_birth text,
    outcome_subtype_id integer,
    outcome_type_id integer,
    outcome_month_id integer,
    outcome_year_id integer,
    foreign key (age_upon_outcome_id) references age_upon_outcome(id) ON UPDATE cascade on delete set null,
    foreign key (animal_type_id) references animals_type(id) ON UPDATE cascade on delete set null,
    foreign key (breed_id) references animal_breeds(id) ON UPDATE cascade on delete set null,
    foreign key (color1_id) references animals_colors(id) ON UPDATE cascade on delete set null,
    foreign key (color2_id) references animals_colors(id) ON UPDATE cascade on delete set null,
    foreign key (outcome_subtype_id) references outcome_subtypes(id) ON UPDATE cascade on delete set null,
    foreign key (outcome_type_id) references outcome_types(id) ON UPDATE cascade on delete set null,
    foreign key (outcome_month_id) references outcome_month(id) ON UPDATE cascade on delete set null,
    foreign key (outcome_year_id) references outcome_year(id) ON UPDATE cascade on delete set null
);

insert into animals_new ("index", animal_id, name, date_of_birth)
select "index", animal_id, name, date_of_birth
from animals
where name not null
;
