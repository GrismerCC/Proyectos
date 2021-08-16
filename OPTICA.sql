create database OPTICA
GO

USE OPTICA
GO

------TABLA CLIENTE-------
create table [Cliente](
id_cliente varchar(8) primary key not null,
nombre_cliente varchar(40) not null,
ape_Paterno varchar(50) not null,
ape_Materno varchar(50) not null,
edad int not null,
email varchar(40) not null,
direccion varchar(50) not null)

---unicidad del dni---
alter table [Cliente] 
add constraint uni_dni unique(id_cliente)

-----TABLA PROVEEDOR----------
create table [Proveedor](
id_proveedor varchar(10) primary key not null,
nombre_proveedor varchar(50) not null,
telefono_prov char(9) not null,
direccion_prov varchar(50) not null,
ruc char(11) not null,
razonSocial varchar(50) not null)

-----------TABLA LUNA-------------
create table [Luna](
id_luna varchar(10) primary key not null,
id_proveedor varchar(10) not null,
material varchar(50) not null,
tipo varchar (50) not null,
caracteristicas varchar(100) not null,
precio_unitario float not null,
descripcion text  not null)

alter table Luna
add constraint fk_proveedor foreign key (id_proveedor) references Proveedor(id_proveedor)

-----------TABLA MONTURA-------------
create table [Montura](
id_montura varchar(10) primary key not null,
id_proveedor varchar(10) not null,
material varchar(50) not null,
precio float not null,
marca varchar (50) not null,
color varchar(50) not null,
clasificacion varchar(100) not null,
descripcion text not null)

alter table Montura
add constraint fk1_proveedor foreign key (id_proveedor) references Proveedor(id_proveedor)

-----TABLA EMPLEADO-------
create table [Empleado](
id_empleado varchar(10)  primary key not null,
nombre varchar(50) not null,
ape_Paterno varchar(50) not null,
ape_Materno varchar(50) not null,
cargo varchar(50) not null,
edad int not null,
telefono char(9) not null)

-----TABLA BOLETA-----

create table [Boleta](
id_boleta varchar(10) primary key not null,
id_empleado varchar(10) not null,
id_cliente varchar(8) not null,
total float not null,
fecha date not null)

alter table Boleta
add constraint fk_empleado foreign key (id_empleado) references Empleado(id_empleado)

alter table Boleta
add constraint fk_cliente foreign key (id_cliente) references Cliente(id_cliente)

-----TABLA FACTURA-----

create table [Factura](
id_factura varchar(10) primary key not null,
id_empleado varchar(10) not null,
id_cliente varchar(8) not null,
ruc char(11) not null,
razonSocial varchar(50) not null,
direccion varchar(100) not null,
total float not null,
fecha date not null)

alter table Factura
add constraint fk1_empleado foreign key (id_empleado) references Empleado(id_empleado)

alter table Factura
add constraint fk1_cliente foreign key (id_cliente) references Cliente(id_cliente)

-----TABLA  DETALLE BOLETA-------
create table [DetalleBoleta](
id_boleta varchar(10) not null,
id_montura varchar(10) not null,
id_luna varchar(10) not null,
medida varchar(50) not null,
descripcion text not null,
subTotal float not null)

alter table [DetalleBoleta]
add constraint fk_boleta foreign key (id_boleta) references Boleta(id_boleta)

alter table [DetalleBoleta]
add constraint fk_montura foreign key (id_montura) references Montura(id_montura)

alter table [DetalleBoleta]
add constraint fk_luna foreign key (id_luna) references Luna(id_luna)

-----TABLA  DETALLE FACTURA-------
create table [DetalleFactura](
id_factura varchar(10) not null,
id_montura varchar(10) not null,
id_luna varchar(10) not null,
medida varchar(50)not null,
descripcion text not null,
subTotal float not null)

alter table [DetalleFactura]
add constraint fk1_factura foreign key (id_factura) references Factura(id_factura)

alter table [DetalleFactura]
add constraint fk1_montura foreign key (id_montura) references Montura(id_montura)

alter table [DetalleFactura]
add constraint fk1_luna foreign key (id_luna) references Luna(id_luna)


--REGISTROS CHRISTiAN--

--TABLA PROVEEDOR--
insert into Proveedor (id_proveedor,nombre_proveedor,telefono_prov,direccion_prov,ruc,razonSocial)
values ( 'P000001','Jose Rojas Rodriguez','909168439','Av. Giraldez N°456 - Huancayo','20552103816','SALUD PERU SAC'),
	   ( 'P000002','Rodrigo Mendoza Salas','976550125','Av.España  N°500 - Trujillo','20265589107','LUNAS LUZ SAC'),
	   ( 'P000003','Emma Delgado Luz','900783208','Av.Caminos del Inca N°315 - Lima','37895540071','OCULENTIS SAC'),
	   ( 'P000004','Sophia De la Cruz Vega','918664570','Av. Samuel Alcazar  N° 293- Rimac','10366819625','RAYNER SAC'),
	   ( 'P000005','Kevin Samaniego Pasquel','910507790','Av.Antigua Panamericana  N°187 - Lurin','35589600147','SOLAR X SAC')


--TABLA LUNA--
insert into Luna (id_luna, id_proveedor, material, tipo, caracteristicas, precio_unitario,descripcion)
values ('L000001','P000001','Mineral','Blancos','Antireflejante',70,'Estandar 1.5'),
	   ('L000002','P000002','Policarbonato','Coloreados','Endurecido',90,'Reducidos 1.6'),
	   ('L000003','P000003','Organico','Polarizados','Fotocromático',110,'Alta 1.67'),
       ('L000004','P000004','Organico','Degradados','Auntolimpieza',130,'Finos 1.67'),
	   ('L000005','P000005','Policarbonato','Espejados','Azul protect',150,'Ultrafinos 1.7')

--TABLA MONTURA--
insert into Montura (id_montura,id_proveedor,material,color,marca,precio,clasificacion,descripcion)
values ('M000001','P000001','Acetato','negro','BOSS',90,'Grande','redondas'),
	   ('M000002','P000002','Titanio','azul metalico','TimberLand',70,'Medio','angulares'),
	   ('M000003','P000003','ULTEM','negro con rojo','Persol',150,'Pequeño','cat eye'),
	   ('M000004','P000004','Acero inoxidable','plateadas','OAKLEY',120,'Grande','cuadrado'),
	   ('M000005','P000005','Aluminio','lilas','Dior',70,'Medio','ovalado y sport')

--TABLA CLIENTES--
insert into Cliente (id_cliente, nombre_cliente, ape_Paterno,ape_Materno,edad, email,direccion)
values  ('70844580','Roman','Manzilla','Quispe',24,'roman.manzilla@hotmail.com','Sect. 2 Grp. 2 Mz. J Lt. 9 VES'),
		('70960381','Katty','Atencio','Garcia',21,'kattyatencio@gmail.com','Sect. 9 Grp. 10 Mz. B Lt. 15 Surco'),
		('79541003','Luz Maria','Ramirez','Espinoza',24	,'MariaRamirez60@gmail.com','Sect. 2 Grp. 2 Mz. J Lt. 9 Miraflores'),
		('76533980','Cristian','Altamirano','Condor',19,'cristian.altamirano@hotmail.com','Sect. 3 Grp. 22A  Cercado de Lima'),
		('78523961','Vanderley','Reyes','Aguilar',22,'reyesdaniel08@hotmail.com','Sect. 5 Grp. 13 Mz. L Lt. 2 San Isidro')

--TABLA EMPLEADOS--
insert into Empleado(id_empleado,nombre,ape_Paterno,ape_Materno,cargo,edad,telefono)
values  ('E000001','Jose','Zarate','Duran','recepcionista',24,'970550054'),
		('E000002','Melany','Jasmin','Arango','recepcionista',24,'915576650'),
		('E000003','Miguel','Rojas','Zapata','cajero',25,'900177769'),
		('E000004','Milagros','Paz','Vega','cajero',30,'978661750'),
		('E000005','Joel','Velasquez','Cruz','técnico oftalmólogo',28,'960891104')

--TABLA BOLETA--
insert into Boleta (id_boleta,id_empleado,id_cliente,total,fecha)
values  ('B000001','E000001','70844580',160,'2019/11/22'),
		('B000002','E000002','70960381',160,'2019/11/22'),
		('B000003','E000003','79541003',260,'2019/11/22'),
		('B000004','E000004','76533980',250,'2019/11/22'),
		('B000005','E000005','78523961',220,'2019/11/22')

--TABLA DETALLE BOLETA--
insert into DetalleBoleta (id_boleta,id_montura,id_luna,medida,descripcion,subTotal)
values	('B000001','M000001','L000001','-','Estetica',160),
		('B000001','M000002','L000002','140 x 100','Medida',160),
		('B000003','M000003','L000003','-','Estetica',260),
		('B000004','M000004','L000004','100 x 80','Medida',250),
		('B000005','M000005','L000005','80 x 95','Medida',220)

--TABLA FACTURA--
insert into Factura(id_factura,id_empleado,id_cliente,ruc,razonSocial,direccion,total,fecha)
values  ('F000001','E000001','70844580','25769913478','XORNAT SAA','Av. Avancay N°106 - Lima',160,'2019/11/22'),
		('F000002','E000002','70960381','34495007651','El vivero CA','Av.Alejandro Toledo N°220- Lima',160,'2019/11/22'),
		('F000003','E000003','79541003','60125033789','El paisano',	'Av.Alfonso Ugarte  N°350 - Lima',260,'2019/11/22'),
		('F000004','E000004','76533980','85689911700','Café SRL','Av.Angamos  N°789 - Lima',250,'2019/11/22'),
		('F000005','E000005','78523961','10697750311','Cielito Tinto CA','Av. Pedro de Osma  N°150 - Lima',220,'2019/11/22')

--TABLA DETALLE FACTURA--
insert into DetalleFactura (id_factura,id_luna,id_montura,medida,descripcion,subTotal)
values  ('F000001','L000001','M000001','-','Estetica',160),
		('F000002','L000002','M000002','-','Estetica',160),
		('F000003','L000003','M000003','-','Estetica',260),
		('F000004','L000004','M000004','85 x 85','Medida',250),
		('F000005','L000005','M000005','100 x 120','Medida',220)

select * from DetalleBoleta
select * from DetalleFactura
select * from Boleta

