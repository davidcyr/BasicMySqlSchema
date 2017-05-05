

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


insert into organization (org_code, org_name, status) values ('JNK','Dev Test Organization', 'ACTIVE');
set @org = LAST_INSERT_ID();


insert into element (org_id, element_name) values (@org, 'Budget');
set @eBudget = LAST_INSERT_ID();

insert into element (org_id, element_name) values (@org, 'Schedule');
set @eSchedule = LAST_INSERT_ID();

insert into element (org_id, element_name) values (@org, 'Quality');
set @eQuality = LAST_INSERT_ID();

insert into element (org_id, element_name) values (@org, 'Scope');
set @eScope = LAST_INSERT_ID();

insert into element (org_id, element_name) values (@org, 'Team');
set @eTeam = LAST_INSERT_ID();

insert into element (org_id, element_name) values (@org, 'Client');
set @eClient = LAST_INSERT_ID();


insert into client (org_id, client_name, status) values ( @org, 'CLIENT A', 'ACTIVE');
set @clientA = LAST_INSERT_ID();

insert into client (org_id, client_name, status) values ( @org, 'CLIENT B', 'ACTIVE');
set @clientB = LAST_INSERT_ID();

insert into client (org_id, client_name, status) values ( @org, 'CLIENT C', 'ACTIVE');
set @clientC = LAST_INSERT_ID();


insert into initiative (org_id, client_id, initiative_name, status) values ( @org, @clientA, 'HAPPY FROG', 'ACTIVE');
set @initiativeA1 = LAST_INSERT_ID();

insert into initiative (org_id, client_id, initiative_name, status) values ( @org, @clientA, 'DEAD MOUSE', 'ACTIVE');
set @initiativeA2 = LAST_INSERT_ID();

insert into initiative (org_id, client_id, initiative_name, status) values ( @org, @clientA, 'QUICK GOOSE', 'ACTIVE');
set @initiativeA3 = LAST_INSERT_ID();

insert into initiative (org_id, client_id, initiative_name, status) values ( @org, @clientB, 'KOROSENAI', 'ACTIVE');
set @initiativeB1 = LAST_INSERT_ID();

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

