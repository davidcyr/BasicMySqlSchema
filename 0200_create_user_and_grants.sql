use deadmouse;

drop user "dmdev"@"%"; 
create user "dmdev"@"%" identified by "pa55word";



grant INSERT, SELECT, UPDATE, DELETE on table pulse  to "dmdev"@"%";
grant INSERT, SELECT, UPDATE, DELETE on table initiative_element to "dmdev"@"%";
grant INSERT, SELECT, UPDATE, DELETE on table element to "dmdev"@"%";
grant INSERT, SELECT, UPDATE, DELETE on table initiative to "dmdev"@"%";
grant INSERT, SELECT, UPDATE, DELETE on table client to "dmdev"@"%";
grant INSERT, SELECT, UPDATE, DELETE on table organization to "dmdev"@"%";

grant EXECUTE on *.* TO "dmdev"@"%";
