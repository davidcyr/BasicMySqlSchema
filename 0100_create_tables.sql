use deadmouse;

drop table if exists pulse;
drop table if exists initiative_element;
drop table if exists element;
drop table if exists initiative;
drop table if exists client;
drop table if exists organization;

create table organization (
	org_id integer 			auto_increment,
	org_code varchar(10)		not null,
	org_name varchar(50)		not null,	
	unique key ix_org_code (org_code),
	unique key ix_org_name (org_name),
	primary key (org_id)
);

create table client (
	org_id integer,
	client_id integer			auto_increment,
	client_name varchar(50)			not null,
	foreign key (org_id) references organization (org_id),
	unique key ix_client_id (client_id),
	primary key (org_id, client_id)
);

create table initiative (
	org_id integer,
	client_id integer,
	initiative_id integer			auto_increment,
	initiative_name varchar(50)		not null,
	foreign key (org_id) references organization (org_id),
	foreign key (client_id) references client (client_id),
        unique key ix_initiative_id (initiative_id),
	primary key (org_id, client_id, initiative_id)
);


create table element (
	org_id integer,
	element_id integer			auto_increment,
	element_name varchar(50)			not null,
	foreign key (org_id) references organization (org_id),
	unique key ix_element_id (element_id),
	primary key (org_id, element_id)
);


create table initiative_element (
	org_id integer,
	initiative_id integer,
	element_id integer,
	initiative_current_risk integer,
	foreign key (org_id) references organization (org_id),
	foreign key (initiative_id) references initiative (initiative_id),
	foreign key (element_id) references element (element_id),
	primary key (org_id, initiative_id, element_id)
);

create table pulse (
	org_id integer,
	initiative_id integer,
	element_id integer,
	pulse_id integer			auto_increment,
	created_ts timestamp			default CURRENT_TIMESTAMP,
	created_by_user varchar(50)		not null,
	risk_value integer			not null,
	note varchar(150)			not null,
	unique key ix_pulse_id (pulse_id),
	foreign key (org_id) references organization (org_id),
	foreign key (initiative_id) references initiative (initiative_id),
	foreign key (element_id) references element (element_id),
	primary key (org_id, initiative_id, element_id, pulse_id)
);
	


	

