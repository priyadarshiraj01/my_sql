--  TRIGGERES IN MYSQL 
-- In mysql triggeres is a database object that is automatically 
-- executeed or firred in responseto certainevents or actions
-- like (update insert delete after before) etc
-- Triggers are used to enforce bussinss ruples that maintain
-- data integrity and automate task within database.

create database SBI;
use SBI;

create table main_table(
cust_id int auto_increment primary key,
cust_name varchar(50),
cust_age int,
cust_ac_no bigint unique,
cust_mobile_no bigint unique,
cust_Balance bigint,
cust_created_at timestamp default current_timestamp,
cust_updated_at timestamp on update current_timestamp
);

drop table backup_table;





create table backup_table(
cust_id int ,
cust_name varchar(50),
cust_ac_no bigint unique,
cust_mobile_no bigint unique,
cust_Balance bigint,
cust_created_at timestamp default current_timestamp,
cust_updated_at timestamp default current_timestamp,
cust_deleted_at timestamp default current_timestamp

);





-- crreating triggeres 
 

delimiter //
create trigger before_main_table_delete
before delete on main_table
for each row
	begin
		insert into backup_table(cust_id,cust_name,cust_ac_no,cust_mobole_no,cust_balance,cust_crreated_at,cust_updated_at)
        values(old.cust_id,old.cust_name,old.cust_ac_no,old.cust_mobile_no,old.cust_balance,old.cust_created_at,old.cust_updated_at);
	end;
     // 
     delimiter ;
     
insert into main_table(cust_name,cust_ac_no,cust_mobile_no,cust_balance)
values("Raj",402118950765,9628281969,987654);

select * from main_table;