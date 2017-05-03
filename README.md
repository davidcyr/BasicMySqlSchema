
Quick example database schema for personal use




sudo yum update -y
sudo yum install -y mysql
sudo yum install -y git
git clone https://github.com/davidcyr/BasicMySqlSchema.git
cd BasicMySqlSchema/


 mysql -h dbinstance.cbj5rx4486o4.us-east-1.rds.amazonaws.com -P 3306 -u root --password=replaceMe -v < 0000_create_database.sql > 0000.out

 mysql -h dbinstance.cbj5rx4486o4.us-east-1.rds.amazonaws.com -P 3306 -u root --password=replaceMe -v < 0100_create_tables.sql > 0100.out

 mysql -h dbinstance.cbj5rx4486o4.us-east-1.rds.amazonaws.com -P 3306 -u root --password=replaceMe -v < 0200_create_user_and_grants.sql > 0200.out


