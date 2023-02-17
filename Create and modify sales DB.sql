create table companies
(
company_id varchar(255),
company_name varchar(255) default 'X',
headquarters_phone_number varchar(255),
primary key (company_id),
unique key (headquarters_phone_number)
);


alter table companies
modify headquarters_phone_number varchar(255) null;

alter table companies
change headquarters_phone_number headquarters_phone_number varchar(255) not null


