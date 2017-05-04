

set @org = -1;
set @clientA = -1;
set @clientB = -1;
set @clientC = -1;

set @eBudget = -1;
set @eSchedule = -1;
set @eQuality = -1;
set @eScope = -1;
set @eTeam = -1;
set @eClient = -1;

use deadmouse;

select (@org := org_id) as org_id from organization where org_code='JNK';

#
#
# can I make this conditional on @org not -1?
#
#

delete from pulse where org_id = @org;
delete from initiative_element where org_id = @org;
delete from initiative where org_id = @org;
delete from client where org_id = @org;
delete from element where org_id = @org;
delete from organization where org_id = @org;


insert into organization (org_code, org_name) values ('JNK','Dev Test Organization');

select (@org := org_id) as org_id from organization where org_code='JNK';

insert into element (org_id, element_name) values (@org, 'Budget');
select (@eBudget := element_id) from element as element_id where org_id = @org AND element_name = 'Budget';

insert into element (org_id, element_name) values (@org, 'Schedule');
select (@eSchedule := element_id) from element as element_id where org_id = @org AND element_name = 'Schedule';

insert into element (org_id, element_name) values (@org, 'Quality');
select (@eQuality := element_id) from element as element_id where org_id = @org AND element_name = 'Quality';

insert into element (org_id, element_name) values (@org, 'Scope');
select (@eScope := element_id) from element as element_id where org_id = @org AND element_name = 'Scope';

insert into element (org_id, element_name) values (@org, 'Team');
select (@eTeam := element_id) from element as element_id where org_id = @org AND element_name = 'Team';

insert into element (org_id, element_name) values (@org, 'Client');
select (@eClient := element_id) from element as element_id where org_id = @org AND element_name = 'Client';


insert into client (org_id, client_name) values ( @org, 'CLIENT A');
insert into client (org_id, client_name) values ( @org, 'CLIENT B');
insert into client (org_id, client_name) values ( @org, 'CLIENT C');

select (@clientA := client_id) as client_id from client where org_id = @org AND client_name = 'CLIENT A';
select (@clientB := client_id) as client_id from client where org_id = @org AND client_name = 'CLIENT B';
select (@clientC := client_id) as client_id from client where org_id = @org AND client_name = 'CLIENT C';

insert into initiative (org_id, client_id, initiative_name) values ( @org, @clientA, 'HAPPY FROG');
select (@initiativeA1 := initiative_id) as initiative_id from initiative 
	where org_id = @org AND 
	client_id = @clientA AND
	initiative_name ='HAPPY FROG';

insert into initiative (org_id, client_id, initiative_name) values ( @org, @clientA, 'DEAD MOUSE');
select (@initiativeA2 := initiative_id) as initiative_id from initiative 
	where org_id = @org AND 
	client_id = @clientA AND
	initiative_name ='DEAD MOUSE';

insert into initiative (org_id, client_id, initiative_name) values ( @org, @clientA, 'QUICK GOOSE');
select (@initiativeA3 := initiative_id) as initiative_id from initiative 
	where org_id = @org AND 
	client_id = @clientA AND
	initiative_name ='QUICK GOOSE';

insert into initiative (org_id, client_id, initiative_name) values ( @org, @clientB, 'KOROSENAI');
select (@initiativeB1 := initiative_id) as initiative_id from initiative 
	where org_id = @org AND 
	client_id = @clientB AND
	initiative_name ='KOROSENAI';

insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA1, @eBudget);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA1, @eSchedule);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA1, @eQuality);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA1, @eScope);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA1, @eTeam);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA1, @eClient);

insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA2, @eBudget);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA2, @eSchedule);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA2, @eQuality);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA2, @eScope);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA2, @eTeam);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA2, @eClient);

insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA3, @eBudget);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA3, @eSchedule);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA3, @eQuality);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA3, @eScope);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA3, @eTeam);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeA3, @eClient);

insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeB1, @eBudget);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeB1, @eSchedule);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeB1, @eQuality);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeB1, @eScope);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeB1, @eTeam);
insert into initiative_element (org_id, initiative_id, element_id) values (@org, @initiativeB1, @eClient);

insert into pulse (org_id, initiative_id, element_id, created_by_user, risk_value, note) values
    (@org, @initiativeA1, @eBudget, 'scriptuser', 1, 'this has a note');
insert into pulse (org_id, initiative_id, element_id, created_by_user, risk_value, note) values
    (@org, @initiativeA1, @eSchedule, 'scriptuser', 2, 'asdfasd');
insert into pulse (org_id, initiative_id, element_id, created_by_user, risk_value, note) values
    (@org, @initiativeA1, @eSchedule, 'scriptuser', 2, 'another comment');
insert into pulse (org_id, initiative_id, element_id, created_by_user, risk_value, note) values
    (@org, @initiativeA1, @eQuality, 'scriptuser', 2, 'quality comment');
insert into pulse (org_id, initiative_id, element_id, created_by_user, risk_value, note) values
    (@org, @initiativeA1, @eScope, 'scriptuser', 2, 'scope comment');
insert into pulse (org_id, initiative_id, element_id, created_by_user, risk_value, note) values
    (@org, @initiativeA1, @eTeam, 'scriptuser', 2, 'team comment');
insert into pulse (org_id, initiative_id, element_id, created_by_user, risk_value, note) values
    (@org, @initiativeA1, @eClient, 'scriptuser', 2, 'client comment');


insert into pulse (org_id, initiative_id, element_id, created_by_user, risk_value, note) values
    (@org, @initiativeA2, @eBudget, 'scriptuser', 2, 'budget comment');

