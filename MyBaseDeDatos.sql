create table public.client(
idclient serial primary key,
name varchar(150) not null,
phone varchar(30),
email varchar(150),
document varchar(30) not null,
constraint client_document_uq unique (document),
constraint client_email_uq unique (email)
);


create table public.employee(
idemployee serial primary key,
name varchar(150) not null,
jobtittle varchar(100),
phone varchar(30),
hiredate date not null default current_date
);


create table public.supplier(
idsupplier serial primary key,
name varchar(150) not null,
phone varchar(30),
email varchar(150)
);


create table public.sparepart(
idpart serial primary key,
idsupplier int,
name varchar(150) not null,
description varchar(500),
stock integer not null default 0,
unit_price numeric(10,2) not null,
constraint sparepart_stock_ck check (stock >= 0),
constraint sparepart_supplier_fk
	foreign key (idsupplier) references public.supplier (idsupplier)
	    on delete set null
);


create table public.serviceorder(
idorder serial primary key,
idclient int not null,
idemployee int not null,
equipmenttype varchar(50),
brandmodel varchar(100),
reportedfault text,
diagnosis text,
status varchar(20) not null default 'pending',
admissiondate date not null default current_date,
deliverydate date,
constraint serviceorder_status_ck
	check (status in ('pending','in_progress','delivered','cancelled')),
constraint serviceorder_client_fk
	foreign key (idclient) references public.client (idclient)
	    on delete restrict,
constraint serviceorder_employee_fk
	foreign key (idemployee) references public.employee (idemployee)
	    on delete restrict
);
 

 
create table public.orderpart(
idorder int not null,
idpart int not null,
quantity int not null default 1,
constraint orderpart_pk primary key (idorder, idpart),
constraint orderpart_quantity_ck check (quantity > 0),
constraint orderpart_order_fk
	foreign key (idorder) references public.serviceorder (idorder)
	    on delete cascade,
constraint orderpart_part_fk
	foreign key (idpart) references public.sparepart (idpart)
	    on delete restrict
);
 

create table public.cyberstation(
idstation serial primary key,
pcname varchar(50) not null,
status varchar(20) not null default 'available',
hourlyrate numeric(10,2) not null,
constraint cyberstation_status_ck
	check (status in ('available','occupied','maintenance'))
);
 
 
create table public.internetsession(
idsession serial primary key,
idclient int not null,
idstation int not null,
starttime timestamp not null default now(),
endtime timestamp,
totalamount numeric(10,2),
constraint internetsession_client_fk
	foreign key (idclient) references public.client (idclient)
	    on delete restrict,
constraint internetsession_station_fk
	foreign key (idstation) references public.cyberstation (idstation)
	    on delete restrict
);
 

 
 
create table public.console(
idconsole serial primary key,
type varchar(20) not null,
status varchar(20) not null default 'available',
hourlyrate numeric(10,2) not null,
constraint console_type_ck check (type in ('Xbox','PS5')),
constraint console_status_ck
	check (status in ('available','occupied','maintenance'))
);
 
 
create table public.gamingsession(
idgamingsession serial primary key,
idclient int not null,
idconsole int not null,
game varchar(100),
starttime timestamp not null default now(),
endtime timestamp,
totalamount numeric(10,2),
constraint gamingsession_client_fk
	foreign key (idclient) references public.client (idclient)
	    on delete restrict,
constraint gamingsession_console_fk
	foreign key (idconsole) references public.console (idconsole)
	    on delete restrict
);
 

 
create table public.invoice(
idinvoice serial primary key,
idclient int not null,
idemployee int not null,
date date not null default current_date,
totalamount numeric(10,2) not null,
servicetype varchar(30) not null,
constraint invoice_servicetype_ck
	check (servicetype in ('Repair','Cyber','Gaming')),
constraint invoice_client_fk
	foreign key (idclient) references public.client (idclient)
	    on delete restrict,
constraint invoice_employee_fk
	foreign key (idemployee) references public.employee (idemployee)
	    on delete restrict
);
 

 
