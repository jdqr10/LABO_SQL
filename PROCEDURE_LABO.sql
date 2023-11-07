use laboratorioSQL;
create database laboratorioSQL;

drop database laboratorioSQL;

create table profesor(
doc_prof varchar(20) primary key,
nom_prof varchar(30),
ape_prof varchar (30),
cate_prof int,
sal_prof int
);

create table curso(
cod_cur int primary key,
nom_cur varchar (100),
horas_cur int,
valor_cur int
);

create table estudiante(
doc_est varchar(30) primary key,
nom_est varchar(30),
ape_est varchar (30),
edad_est int
);

create table estudianteExcurso(
cod_cur_estcur int,
foreign key (cod_cur_estcur) references curso (cod_cur),
doc_est_estcur varchar(30),
foreign key (doc_est_estcur) references estudiante (doc_est),
fec_ini_estcur date
);

create table cliente(
id_cli varchar(30) primary key,
nom_cli varchar(30),
ape_cli varchar(30),
dir_cli varchar(100),
dep_cli varchar(20),
mes_cum_cli varchar(10)
);

create table articulo(
id_art int identity primary key,
tit_art varchar(100),
aut_art varchar(100),
edi_art varchar(300),
prec_art int
);

create table pedido(
id_ped int identity primary key,
id_cli_ped varchar(30),
foreign key (id_cli_ped) references cliente (id_cli),
fec_ped date,
val_ped int
);
set dateformat dmy;

create table articuloXpedido(
id_ped_artped int,
foreign key (id_ped_artped) references pedido (id_ped),
id_art_artped int,
foreign key (id_art_artped) references articulo (id_art),
cant_art_artped int,
val_ven_art_artped int
);

create table compania(
comnit varchar(11) primary key,
comnombre varchar(30),
comaniofun int,
comreplegal varchar(100)
);

create table tiposAutomotores(
auttipo int primary key,
nombre varchar(30)
);

create table automotores(
autoplaca varchar(6) primary key,
automarca varchar(30),
autotipo int,
foreign key (autotipo) references tiposAutomotores(auttipo),
automodelo int,
autopasajeros int,
autocilindraje int,
autonumchasis varchar(20)
);

create table aseguramientos(
asecodigo int identity primary key,
asefechainicio date,
asefechaexpiracion date,
asevalorasegurado int,
aseestado varchar(30),
asecosto int,
aseplaca varchar(6),
foreign key (aseplaca) references automotores (autoplaca)
);

create table incidentes(
incicodigo int identity primary key,
incifecha date,
inciplaca varchar(6),
foreign key (inciplaca) references automotores (autoplaca),
incilugar varchar(40),
inciantheridos int,
incicanfatalidades int,
incicanautosinvolucrados int
);

insert into profesor values
('63.502.720', 'Martha', 'Rojas', 2, 690000),
('91.216.904', 'Carlos', 'Pérez', 3, 950000),
('13.826.789', 'Maritza', 'Angarita', 1, 550000),
('1.098.765.789', 'Alejandra', 'Torres', 4, 1100000);

insert into curso values
(149842, 'Fundamentos de bases de datos', 40, 500000),
(250067, 'Fundamentos de SQL', 20, 700000),
(289011, 'Manejo de Mysql', 45, 550000),
(345671, 'Findamentos of Oraacle', 60, 1100000);

insert into estudiante values
('63.502.720', 'Maria', 'Peréz', 2),
('91.245.678', 'Carlos Jóse', 'López', 3),
('1.098.098.097', 'Jonatan', 'Ardila', 1),
('1.098.765.679', 'Carlos', 'Martínez', 4);

insert into estudianteExcurso values 
(289011, '1.098.765.679', '01/02/2011'),
(250067, '63.502.720', '01/03/2011'),
(289011, '1.098.098.097', '01/02/2011'),
(345671, '63.502.720', '01/04/2011');

insert into cliente values
('63502718', 'Maritza', 'Rojas', 'Calle 34 No. 14-45', 'Santander', 'Abril'),
('13890234', 'Roger', 'Ariza', 'Cra 30 No. 13-45', 'Antioquia', 'Junio'),
('77191956', 'Juan Carlos', 'Arenas', 'Diagonal 23 No. 12-34 apto 101', 'Valle', 'Marzo'),
('1098765789', 'Catalina', 'Zapata', 'Av. El libertador No. 30-14', 'Cauca', 'Marzo');

insert into articulo values
('Redes cisco', 'Ernesto Arigasello', 'Alfaomega-Rama', 60.000),
('Facebook y Twitter para adultos', 'Veloso Claudio', 'Alfaomega', 52.000),
('Creación de un portal con php y mysql', 'Jacob Pavón Puertas', 'Alfaomega - Rama', 40.000),
('Administración de sistemas operativos', 'Julio Gómez López', 'Alfaomega - Rama', 55.000);


insert into pedido values 
('63502718', '25/02/2012', 120000),
('77191956', '30/04/2012', 55000),
('63502718', '10/12/2011', 260000),
('1098765789', '25/02/2012', 1800000);

insert into articuloXpedido values
(1,3,5,40000),
(1,4,12,55000),
(2,1,5,65000),
(3,2,10,55000),
(3,3,12,45000),
(4,1,10,65000);

insert into compania values
('800890890-2', 'Seguros Atlantida' ,1998 ,'Carlos López'),
('899999999-1',' Aseguradora Rojas', 1991,' Luis Fernando Rojas' ),
('899999999-5', 'Seguros delEstado', 2001 ,'María Margarita Pérez');

insert into tiposAutomotores values
(51,'Automóviles'),
(52,'Camperos'),
(53,'Camiones');

select* from tiposAutomotores

insert into automotores values
('FLL420','chevrolet corsa',1, 2003, 5, 1400, 'wywzzz167kk009d25'),
('DKZ820','renault stepway',1, 2008, 5, 1600, 'wywwzz157kk009d45'),
('KJQ920','kia sportage',2, 2009, 7, 2000, 'wywzzz167kk009d25');

insert into aseguramientos values
('2012-09-30','2013-09-30', 30000000,'Vigente', 500000 ,'FLL420'),
('2012-09-27','2013-09-27', 35000000,'Vigente', 600000,'DKZ820'),
('2011-09-28','2013-09-28', 50000000,'Vigente', 800000 ,'KJQ920');

insert into incidentes values
('2012-09-30', 'DKZ820', 'Bucaramanga', 0 ,0, 2),
('2012-09-27', 'FLL420', 'Girón', 1 ,0, 1),
('2011-09-28', 'FLL420', 'Bucaramanga', 1 ,0, 2);

/*CONSULTAS*/

/*1. Mostrar los salarios de los profesores ordenados por categoría */
select sal_prof from profesor order by cate_prof

/*2. Mostrar los cursos cuyo valor sea mayor a $500.000. */
select * from curso where valor_cur > 500000

/* 3. Contar el número de estudiantes cuya edad sea mayor a 22.*/
select count(edad_est) as numeroEst from estudiante where edad_est > 2

/*4. Mostrar el nombre y la edad del estudiante más joven. */
select nom_est,edad_est  from estudiante
where edad_est = (select min(edad_est) FROM estudiante);

/* 5. Calcular el valor promedio de los cursos cuyas horas sean mayores a 40.*/
select avg(valor_cur)  as ValorPromedio from curso  where horas_cur > 40 

/* 6. Obtener el sueldo promedio de los profesores de la categoría 1.*/
select avg(sal_prof) as SueldoPromedio from profesor where cate_prof = 1
select * from profesor 

/*7. Mostrar todos los campos de la tabla curso en orden ascendente según el valor */
select * from curso order by valor_cur asc

/*8. Mostrar el nombre del profesor con menor sueldo. */
select nom_prof from profesor where sal_prof = (select min(sal_prof) from profesor)
select * from profesor

/*9. Visualizar los profesores cuyo sueldo este entre $500.000 y $700.000. */
select * from profesor where sal_prof between 500000 and 700000

/* 10.Listar todos los pedidos realizados incluyendo el nombre del artículo.*/
select  * from ArticuloxPedido  left join articulo  on ArticuloxPedido.id_art_artped  = articulo.id_art

/*11.Visualizar los clientes que cumplen años en marzo.*/
select * from cliente where mes_cum_cli = 'Marzo'

/*12. Visualizar los datos del pedido 1, incluyendo el nombre del cliente, la dirección del
mismo, el nombre y el valor de los artículos que tiene dicho pedido.*/


/*13.Visualizar el nombre del cliente, la fecha y el valor del pedido más costoso.*/
select nom_cli as NombreCliente, fec_ped as fechaPedido, val_ped as ValorPedido
from cliente inner join pedido on id_cli_ped = id_cli_ped
where val_ped = (select max(val_ped) from pedido)

/*14.Mostrar cuantos artículos se tienen de cada editorial.*/
select count(id_art) as Cantidad, edi_art  from articulo group by edi_art

/*15.Mostrar los pedidos con los respectivos artículos(código, nombre, valor y cantidad
pedida).*/


/*16.Visualizar todos los clientes organizados por apellido.*/
SELECT * FROM cliente ORDER BY ape_cli;

/*17.Visualizar todos los artículos organizados por autor.*/
select * from articulo order by aut_art

/*18.Visualizar los pedidos que se han realizado para el articulo con id 2, el listado debe
mostrar el nombre y dirección del cliente, el respectivo número de pedido y la cantidad
solicitada.*/

select nom_cli, dir_cli, id_ped_artped, cant_art_artped, id_art_artped from articuloXpedido
join pedido on id_ped = id_ped_artped
join cliente on id_cli = id_cli_ped where id_art_artped = 2

select * from pedido
select * from cliente
select * from articuloXpedido

/*19.Visualizar los datos de las empresas fundadas entre el año 1991 y 1998.*/
select * from compañia where comañofun between 1991 and 1998

/*20.Listar los todos datos de los automotores cuya póliza expira en octubre de 2013, este
reporte debe visualizar la placa, el modelo, la marca, número de pasajeros, cilindraje
nombre de automotor, el valor de la póliza y el valor asegurado.*/
select * from automotores
select * from aseguramientos
select * from tiposAutomotores
select autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, nombre, asecosto, asevalorasegurado, aseguramientos. asefechaexpiracion from automotores
join aseguramientos on autoplaca= aseplaca
join tiposAutomotores on automotores.autotipo = tiposAutomotores.auttipo where asefechaexpiracion = '2013-09-30'

/*21.Visualizar los datos de los incidentes ocurridos el 30 de septiembre de 2012, con su
respectivo número de póliza, fecha de inicio de la póliza, valor asegurado y valor de
la póliza.*/
select * from incidentes
select * from aseguramientos

select incicodigo, incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados, asecodigo, asefechainicio, asevalorasegurado, asecosto from incidentes
join aseguramientos on aseplaca = inciplaca where incifecha = '2012-09-30'


/*22.Visualizar los datos de los incidentes que han tenido un (1) herido, este reporte debe
visualizar la placa del automotor, con los respectivos datos de la póliza como son
fecha de inicio, valor, estado y valor asegurado*/
select * from incidentes
select * from aseguramientos

select inciplaca, asefechainicio, asevalorasegurado, aseestado, asecosto from  incidentes
join aseguramientos on aseplaca = inciplaca where inciantheridos = 1

/*23.Visualizar todos los datos de la póliza más costosa.*/
select * from aseguramientos where asecosto = (select max(asecosto) from aseguramientos)

/*24.Visualizar los incidentes con el mínimo número de autos involucrados, de este incidente*/
select * from incidentes where incicanautosinvolucrados =  (select min(incicanautosinvolucrados) from incidentes)

/*25.Visualizar el estado de la póliza y el valor asegurado.*/
select aseestado, asevalorasegurado from aseguramientos

/*26.Visualizar los incidentes del vehículo con placas " FLL420", este reporte debe visualizar
la fecha, el lugar, la cantidad de heridos del incidente, la fecha de inicio la de expiración
de la póliza y el valor asegurado.*/
select inciplaca, incifecha, incilugar, asefechainicio, asefechaexpiracion, asevalorasegurado from aseguramientos
join incidentes on incicodigo = asecodigo where inciplaca = 'FLL420'

/*27.Visualizar los datos de la empresa con nit 899999999-5*/
select * from compañia where comnit = '899999999-5'

/*28.Visualizar los datos de la póliza cuyo valor asegurado es el más costoso, este reporte
además de visualizar todos los datos de la póliza, debe presentar todos los datos del
vehículo que tiene dicha póliza.*/
SELECT asf.*, a.*
FROM aseguramientos asf
INNER JOIN automotores a ON asf.aseplaca = a.autoplaca
WHERE asf.asevalorasegurado = (
    SELECT MAX(asevalorasegurado)
    FROM aseguramientos
);

/*29.Visualizar los datos de las pólizas de los automotores tipo 1, este reporte debe incluir
placa, marca, modelo, cilindraje del vehículo junto con la fecha de inicio, de finalización
y estado de la póliza.*/
SELECT a.autoplaca, a.automarca, a.automodelo, a.autocilindraje, asf.asefechainicio, asf.asefechaexpiracion, asf.aseestado
FROM aseguramientos asf
INNER JOIN automotores a ON asf.aseplaca = a.autoplaca
WHERE a.autotipo = 1;

--- Compañia, Cliente, CURSO procedimientos de almacenad

--- COMPAñIA Procedmientos 
create proc InsertarCompania
    @comnit varchar(11),
    @comnombre varchar(30),
    @comaniofun int,
    @comreplegal varchar(100)
as
begin
    if EXISTS (select 1 from compania where comnit = @comnit)
    begin
        print 'NIT esxistente'
        return;
    end
    insert into compania (comnit, comnombre, comaniofun, comreplegal)
    values (@comnit, @comnombre, @comaniofun, @comreplegal);

    print 'La compañia se ha insertado correctamente.';
end


exec InsertarCompania '12345678901', 'GlobalTech Solutions', 2000, 'Mia Smith';
exec InsertarCompania '23456789012', 'StarLight Industries', 2001, 'Liam Johnson';
exec InsertarCompania '34567890123', 'Quantum Innovations', 2002, 'Ava Williams';
exec InsertarCompania '45678901234', 'Phoenix Enterprises', 2003, 'Noah Davis';
exec InsertarCompania '56789012345', 'SilverLinx Corporation', 2004, 'Zoe Anderson';
exec InsertarCompania '67890123456', 'Horizon Systems', 2005, 'Ethan Brown';
exec InsertarCompania '78901234567', 'BlueWave Technologies', 2006, 'Lily Taylor';
exec InsertarCompania '89012345678', 'Atlas Innovations', 2007, 'Oliver White';
exec InsertarCompania '90123456789', 'TerraNova Global', 2008, 'Emma Martin';
exec InsertarCompania '01234567890', 'RedPulse Inc.', 2009, 'William Wilson';
exec InsertarCompania '12345098765', 'SunRay Solutions', 2010, 'Sophia Harris';
exec InsertarCompania '23450987654', 'SwiftEdge Group', 2011, 'Lucas Clark';
exec InsertarCompania '34509876543', 'NovaSys Corporation', 2012, 'Olivia Lee';
exec InsertarCompania '45098765432', 'GreenLink Ventures', 2013, 'Isla Hall';
exec InsertarCompania '50987654321', 'ApexGlobe Industries', 2014, 'Jackson Moore';
exec InsertarCompania '09876543210', 'BlueSky Innovations', 2015, 'Charlotte King';
exec InsertarCompania '98765432100', 'SunBurst Enterprises', 2016, 'Aiden Wright';
exec InsertarCompania '87654321009', 'FusionTech Solutions', 2017, 'Mia Turner';
exec InsertarCompania '76543210098', 'Mercury Industries', 2018, 'Harper Baker';
exec InsertarCompania '65432100987', 'CrystalPeak Ventures', 2019, 'Sophia Green';
exec InsertarCompania '54321009876', 'AlphaMatrix Systems', 2020, 'Liam Carter';
exec InsertarCompania '43210098765', 'InfiniteHorizon Inc.', 2021, 'Ella Reed';
exec InsertarCompania '32100987654', 'SkyLabs Group', 2022, 'Noah Hill';
exec InsertarCompania '21009876543', 'TerraNet Innovations', 2023, 'Ethan Cooper';
exec InsertarCompania '10098765432', 'StarGate Solutions', 2024, 'Isla Brooks';
exec InsertarCompania '00987654321', 'GlobalLink Enterprises', 2025, 'Zoe Perry';
exec InsertarCompania '09876543210', 'Quantum Dynamics', 2026, 'Mason Scott';
exec InsertarCompania '98765432100', 'RedRocket Industries', 2027, 'Ava Bailey';
exec InsertarCompania '87654321009', 'BlueFusion Ventures', 2028, 'Oliver Murphy';
exec InsertarCompania '76543210098', 'SunQuest Innovations', 2029, 'Lily Collins';
exec InsertarCompania '65432100987', 'TechNova Corporation', 2030, 'Emma Evans';
exec InsertarCompania '54321009876', 'Phoenix Dynamics', 2031, 'William Stewart';
exec InsertarCompania '43210098765', 'AquaNet Innovations', 2032, 'Harper Rogers';
exec InsertarCompania '32100987654', 'SilverBridges Group', 2033, 'Mia Morgan';
exec InsertarCompania '21009876543', 'GreenWave Technologies', 2034, 'Jackson Fisher';
exec InsertarCompania '10098765432', 'HorizonTech Solutions', 2035, 'Sophia Young';
exec InsertarCompania '00987654321', 'TerraCom Global', 2036, 'Ava Bennett';
exec InsertarCompania '09876543210', 'CrystalFusion Inc.', 2037, 'Olivia Gray';
exec InsertarCompania '98765432100', 'AlphaWave Ventures', 2038, 'Liam Adams';
exec InsertarCompania '87654321010', 'SunTech Solutions', 2039, 'Noah Parker';
exec InsertarCompania '87654321011', 'SwiftStream Corporation', 2040, 'Zoe Campbell';
exec InsertarCompania '87654321012', 'MercuryEdge Innovations', 2041, 'Isla Mitchell';
exec InsertarCompania '87654321013', 'SkyBridge Systems', 2042, 'Lily Hughes';
exec InsertarCompania '87654321014', 'QuantumLink Ventures', 2043, 'Emma Price';
exec InsertarCompania '87654321015', 'GlobalWave Corporation', 2044, 'William Turner';
exec InsertarCompania '87654321016', 'InfiniteHorizon Group', 2045, 'Aiden James';
exec InsertarCompania '87654321017', 'TerraTech Dynamics', 2046, 'Harper Phillips';
exec InsertarCompania '87654321018', 'StarLinx Industries', 2047, 'Ethan Foster';
exec InsertarCompania '87654321019', 'SunNova Technologies', 2048, 'Sophia Morris';

select * from compania;

-- procedimiento de almacenado de actualizar Compañia

create proc ActualizarCompania
    @ComNit varchar(11),
    @NuevoNombre varchar(30),
    @NuevoRepLegal varchar(100)
as
begin
    update compania
    set comnombre = @NuevoNombre,
        comreplegal = @NuevoRepLegal
    where comnit = @ComNit;
end

-- Procedimiento de almacenado para eliminar Compañia

create proc EliminarCompania
    @ComNit varchar(11)
as
begin
    delete from compania
    where comnit = @ComNit;
end

exec EliminarCompania '12345678901'
	




--- Inserciones Profesores 

insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P001', 'Juan', 'Gómez', 1, 30000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P002', 'María', 'López', 2, 40000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P003', 'Carlos', 'Rodríguez', 1, 35000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P004', 'Ana', 'Martínez', 3, 45000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P005', 'Luis', 'García', 2, 40000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P006', 'Laura', 'Pérez', 1, 32000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P007', 'Javier', 'Sánchez', 3, 46000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P008', 'Isabel', 'Fernández', 2, 38000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P009', 'Roberto', 'González', 1, 31000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P010', 'Elena', 'Díaz', 3, 47000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P011', 'Miguel', 'López', 2, 39000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P012', 'Sofía', 'Pérez', 1, 33000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P013', 'Alejandro', 'Rodríguez', 3, 48000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P014', 'Carmen', 'Martínez', 2, 40000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P015', 'Pablo', 'García', 1, 34000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P016', 'Lucía', 'López', 3, 49000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P017', 'Andrés', 'Fernández', 2, 41000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P018', 'Natalia', 'Sánchez', 1, 35000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P019', 'David', 'González', 3, 50000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P020', 'Lorena', 'Díaz', 2, 42000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P021', 'Ricardo', 'Pérez', 1, 36000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P022', 'Clara', 'Martínez', 3, 51000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P023', 'Alejandría', 'García', 2, 43000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P024', 'Felipe', 'López', 1, 37000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P025', 'Camila', 'Fernández', 3, 52000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P026', 'Diego', 'Sánchez', 2, 44000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P027', 'Valentina', 'González', 1, 38000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P028', 'Juan', 'Díaz', 3, 53000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P029', 'María', 'Pérez', 2, 45000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P030', 'Carlos', 'Rodríguez', 1, 39000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P031', 'Ana', 'Martínez', 3, 54000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P032', 'Luis', 'García', 2, 46000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P033', 'Laura', 'Pérez', 1, 40000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P034', 'Javier', 'Sánchez', 3, 55000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P035', 'Isabel', 'Fernández', 2, 47000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P036', 'Roberto', 'González', 1, 41000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P037', 'Elena', 'Díaz', 3, 56000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P038', 'Miguel', 'López', 2, 48000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P039', 'Sofía', 'Pérez', 1, 42000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P040', 'Alejandro', 'Rodríguez', 3, 57000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P041', 'Carmen', 'Martínez', 2, 49000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P042', 'Pablo', 'García', 1, 43000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P043', 'Lucía', 'López', 3, 58000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P044', 'Andrés', 'Fernández', 2, 50000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P045', 'Natalia', 'Sánchez', 1, 44000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P046', 'David', 'González', 3, 59000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P047', 'Lorena', 'Díaz', 2, 51000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P048', 'Ricardo', 'Pérez', 1, 45000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P049', 'Clara', 'Martínez', 3, 60000);
insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values ('P050', 'Alejandría', 'García', 2, 52000);
 

 select * from profesor;

-- Inserciones Curso con proc


create proc InsertarCurso
    @cod_cur int,
    @nom_cur varchar(100),
    @horas_cur int,
    @valor_cur int
as
begin
    if exists (select 1  from curso where cod_cur = @cod_cur)
    begin
        print ('El curso ya existe.')
        return
    end
    insert into curso (cod_cur, nom_cur, horas_cur, valor_cur) values (@cod_cur, @nom_cur, @horas_cur, @valor_cur)
end




--- inserciones curso 
exec InsertarCurso 1, 'Curso Matemáticas', 40, 200;
exec InsertarCurso 2, 'Curso Historia', 30, 150;
exec InsertarCurso 3, 'Curso Ciencias', 45, 250;
exec InsertarCurso 4, 'Curso Inglés', 60, 300;
exec InsertarCurso 5, 'Curso Programación', 50, 350;
exec InsertarCurso 6, 'Curso Arte', 35, 180;
exec InsertarCurso 7, 'Curso Música', 40, 200;
exec InsertarCurso 8, 'Curso Economía', 30, 150;
exec InsertarCurso 9, 'Curso Psicología', 45, 250;
exec InsertarCurso 10, 'Curso Química', 60, 300;
exec InsertarCurso 11, 'Curso Biología', 50, 350;
exec InsertarCurso 12, 'Curso Literatura', 35, 180;
exec InsertarCurso 13, 'Curso Geografía', 40, 200;
exec InsertarCurso 14, 'Curso Física', 30, 150;
exec InsertarCurso 15, 'Curso Informática', 45, 250;
exec InsertarCurso 16, 'Curso Filosofía', 60, 300;
exec InsertarCurso 17, 'Curso Sociología', 50, 350;
exec InsertarCurso 18, 'Curso Psicología', 35, 180;
exec InsertarCurso 19, 'Curso Química', 40, 200;
exec InsertarCurso 20, 'Curso Biología', 30, 150;
exec InsertarCurso 21, 'Curso Literatura', 45, 250;
exec InsertarCurso 22, 'Curso Geografía', 60, 300;
exec InsertarCurso 23, 'Curso Física', 50, 350;
exec InsertarCurso 24, 'Curso Informática', 35, 180;
exec InsertarCurso 25, 'Curso Filosofía', 40, 200;
exec InsertarCurso 26, 'Curso Sociología', 30, 150;
exec InsertarCurso 27, 'Curso Psicología', 45, 250;
exec InsertarCurso 28, 'Curso Química', 60, 300;
exec InsertarCurso 29, 'Curso Biología', 50, 350;
exec InsertarCurso 30, 'Curso Literatura', 35, 180;
exec InsertarCurso 31, 'Curso Geografía', 40, 200;
exec InsertarCurso 32, 'Curso Física', 30, 150;
exec InsertarCurso 33, 'Curso Informática', 45, 250;
exec InsertarCurso 34, 'Curso Filosofía', 60, 300;
exec InsertarCurso 35, 'Curso Sociología', 50, 350;
exec InsertarCurso 36, 'Curso Psicología', 35, 180;
exec InsertarCurso 37, 'Curso Química', 40, 200;
exec InsertarCurso 38, 'Curso Biología', 30, 150;
exec InsertarCurso 39, 'Curso Literatura', 45, 250;
exec InsertarCurso 40, 'Curso Geografía', 60, 300;
exec InsertarCurso 41, 'Curso Física', 50, 350;
exec InsertarCurso 42, 'Curso Informática', 35, 180;
exec InsertarCurso 43, 'Curso Filosofía', 40, 200;
exec InsertarCurso 44, 'Curso Sociología', 30, 150;
exec InsertarCurso 45, 'Curso Psicología', 45, 250;
exec InsertarCurso 46, 'Curso Química', 60, 300;
exec InsertarCurso 47, 'Curso Biología', 50, 350;
exec InsertarCurso 48, 'Curso Literatura', 35, 180;
exec InsertarCurso 49, 'Curso Geografía', 40, 200;
exec InsertarCurso 50, 'Curso Física', 30, 150;

select * from curso;


-- procedimiento de actulizar para curso

create proc ActualizarCurso
    @CodigoCurso int,
    @NuevoNombreCurso varchar(100),
    @NuevasHorasCurso int,
    @NuevoValorCurso int
as
begin
    update curso
    set nom_cur = @NuevoNombreCurso,
        horas_cur = @NuevasHorasCurso,
        valor_cur = @NuevoValorCurso
    where cod_cur = @CodigoCurso;
end

--- procedimiento de aliminar para curso



create proc  EliminarCurso
    @CodigoCurso int
as
begin
    delete from curso
    where cod_cur = @CodigoCurso;
end



-- inserciones Estudiante 


insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e01', 'Juan', 'Gómez', 20)
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e02', 'María', 'López', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e03', 'Carlos', 'Rodríguez', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e04', 'Ana', 'Martínez', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e05', 'Luis', 'García', 23);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e06', 'Laura', 'Pérez', 20);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e07', 'Javier', 'Sánchez', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e08', 'Isabel', 'Fernández', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e09', 'Roberto', 'González', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e10', 'Elena', 'Díaz', 23);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e11', 'Miguel', 'López', 20);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e12', 'Sofía', 'Pérez', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e13', 'Alejandro', 'Rodríguez', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e14', 'Carmen', 'Martínez', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e15', 'Pablo', 'García', 23);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e16', 'Lucía', 'López', 20);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e17', 'Andrés', 'Fernández', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e18', 'Natalia', 'Sánchez', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e19', 'David', 'González', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e20', 'Lorena', 'Díaz', 23);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e21', 'Ricardo', 'Pérez', 20);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e22', 'Clara', 'Martínez', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e23', 'Alejandría', 'García', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e24', 'Felipe', 'López', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e25', 'Camila', 'Fernández', 23);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e26', 'Diego', 'Sánchez', 20);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e27', 'Valentina', 'González', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e28', 'Juan', 'Díaz', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e29', 'María', 'Pérez', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e30', 'Carlos', 'Rodríguez', 23);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e31', 'Ana', 'Martínez', 20);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e32', 'Luis', 'García', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e33', 'Laura', 'Pérez', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e34', 'Javier', 'Sánchez', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e35', 'Isabel', 'Fernández', 23);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e36', 'Roberto', 'González', 20);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e37', 'Elena', 'Díaz', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e38', 'Miguel', 'López', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e39', 'Sofía', 'Pérez', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e40', 'Alejandro', 'Rodríguez', 23);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e41', 'Carmen', 'Martínez', 20);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e42', 'Pablo', 'García', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e43', 'Lucía', 'López', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e44', 'Andrés', 'Fernández', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e45', 'Natalia', 'Sánchez', 23);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e46', 'David', 'González', 20);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e47', 'Lorena', 'Díaz', 22);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e48', 'Ricardo', 'Pérez', 19);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e49', 'Clara', 'Martínez', 21);
insert into estudiante (doc_est, nom_est, ape_est, edad_est) values ('e50', 'Alejandría', 'García', 23);



--- inserciones estudiantexCurso

insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (1, 'e01', '2023-01-15');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (2, 'e02', '2023-02-20');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (3, 'e03', '2023-03-25');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (4, 'e04', '2023-04-30');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (5, 'e05', '2023-05-05');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (6, 'e06', '2023-06-10');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (7, 'e07', '2023-07-15');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (8, 'e08', '2023-08-20');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (9, 'e09', '2023-09-25');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (10,'e10', '2023-10-30');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (11,'e11', '2023-11-05');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (12,'e12', '2023-12-10');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (13,'e13', '2024-01-15');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (14,'e14', '2024-02-20');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (15,'e15', '2024-03-25');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (16,'e16', '2024-04-30');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (17,'e17', '2024-05-05');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (18,'e18', '2024-06-10');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (19,'e19', '2024-07-15');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (20,'e20', '2024-08-20');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (21,'e21', '2024-09-25');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (22,'e22', '2024-10-30');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (23,'e23', '2024-11-05');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (24,'e24', '2024-12-10');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (25,'e25', '2025-01-15');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (26,'e26', '2025-02-20');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (27,'e27', '2025-03-25');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (28,'e28', '2025-04-30');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (29,'e29', '2025-05-05');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (30,'e30', '2025-06-10');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (31,'e31', '2025-07-15');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (32,'e32', '2025-08-20');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (33,'e33', '2025-09-25');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (34,'e34', '2025-10-30');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (35,'e35', '2025-11-05');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (36,'e36', '2025-12-10');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (37,'e37', '2026-01-15');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (38,'e38', '2026-02-20');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (39,'e39', '2026-03-25');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (40,'e40', '2026-04-30');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (41,'e41', '2026-05-05');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (42,'e42', '2026-06-10');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (43,'e43', '2026-07-15');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (44,'e44', '2026-08-20');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (45,'e45', '2026-09-25');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (46,'e46', '2026-10-30');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (47,'e47', '2026-11-05');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (48,'e48', '2026-12-10');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (49,'e49', '2027-01-15');
insert into estudianteExcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values (50,'e50', '2027-02-20');

 select * from estudianteExcurso;
 
 
  --  Procedmientos de almacenado Cliente

  create proc InsertarCliente
    @id_cli varchar(30),
    @nom_cli varchar(30),
    @ape_cli varchar(30),
    @dir_cli varchar(100),
    @dep_cli varchar(20),
    @mes_cum_cli varchar(10)
as
begin
    if exists (select 1 from cliente where id_cli = @id_cli)
    begin
        print ('El cliente  ya existe.')
        return
    end

    insert into cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli) values (@id_cli, @nom_cli, @ape_cli, @dir_cli, @dep_cli, @mes_cum_cli)
end


-- procedimiento de actualizar para Cliente 

create proc ActualizarCliente
    @IdCliente varchar(30),
    @NuevoNombre varchar(30),
    @NuevoApellido varchar(30),
    @NuevaDireccion varchar(100)
as 
begin
    update cliente
    set nom_cli = @NuevoNombre,
        ape_cli = @NuevoApellido,
        dir_cli = @NuevaDireccion
    where id_cli = @IdCliente;
end


-- procedimiento de actualizar para Cliente 

CREATE PROCEDURE EliminarClientes
    @IdCliente varchar(30)
AS
BEGIN
  
    delete from  articuloXpedido
    where id_ped_artped IN (select id_ped from pedido where id_cli_ped = @IdCliente);

    delete from pedido
    where id_cli_ped = @IdCliente;


    delete from cliente
    where id_cli = @IdCliente;
end

exec EliminarClientes 'c01'



-- inserciones para cliente 


exec InsertarCliente 'c01', 'Juan', 'Pérez', 'Calle 123', 'Bogotá', 'Enero';
exec InsertarCliente 'c02', 'María', 'López', 'Avenida 456', 'Medellín', 'Febrero';
exec InsertarCliente 'c03', 'Carlos', 'González', 'Calle 789', 'Bogotá', 'Marzo';
exec InsertarCliente 'c04', 'Ana', 'Martínez', 'Avenida 012', 'Cali', 'Abril';
exec InsertarCliente 'c05', 'Luis', 'Rodríguez', 'Carrera 345', 'Medellín', 'Mayo';
exec InsertarCliente 'c06', 'Laura', 'Sánchez', 'Calle 678', 'Bogotá', 'Junio';
exec InsertarCliente 'c07', 'Javier', 'Fernández', 'Avenida 901', 'Cali', 'Julio';
exec InsertarCliente 'c08', 'Isabel', 'Díaz', 'Carrera 234', 'Medellín', 'Agosto';
exec InsertarCliente 'c09', 'Roberto', 'Pérez', 'Calle 567', 'Cali', 'Septiembre';
exec InsertarCliente 'c10', 'Elena', 'González', 'Avenida 890', 'Bogotá', 'Octubre';
exec InsertarCliente 'c11', 'Miguel', 'Martínez', 'Calle 123', 'Bogotá', 'Noviembre';
exec InsertarCliente 'c12', 'Sofía', 'López', 'Avenida 456', 'Medellín', 'Diciembre';
exec InsertarCliente 'c13', 'Alejandro', 'Sánchez', 'Calle 789', 'Bogotá', 'Enero';
exec InsertarCliente 'c14', 'Carmen', 'Fernández', 'Avenida 012', 'Cali', 'Febrero';
exec InsertarCliente 'c15', 'Pablo', 'Rodríguez', 'Carrera 345', 'Medellín', 'Marzo';
exec InsertarCliente 'c16', 'Lucía', 'Díaz', 'Calle 678', 'Bogotá', 'Abril';
exec InsertarCliente 'c17', 'Andrés', 'González', 'Avenida 901', 'Cali', 'Mayo';
exec InsertarCliente 'c18', 'Natalia', 'Martínez', 'Carrera 234', 'Medellín', 'Junio';
exec InsertarCliente 'c19', 'David', 'Pérez', 'Calle 567', 'Cali', 'Julio';
exec InsertarCliente 'c20', 'Lorena', 'Sánchez', 'Avenida 890', 'Bogotá', 'Agosto';
exec InsertarCliente 'c21', 'Ricardo', 'Fernández', 'Calle 123', 'Bogotá', 'Septiembre';
exec InsertarCliente 'c22', 'Clara', 'López', 'Avenida 456', 'Medellín', 'Octubre';
exec InsertarCliente 'c23', 'Alejandría', 'Díaz', 'Calle 789', 'Bogotá', 'Noviembre';
exec InsertarCliente 'c24', 'Simón', 'González', 'Carrera 345', 'Medellín', 'Diciembre';
exec InsertarCliente 'c25', 'Sara', 'Martínez', 'Avenida 012', 'Cali', 'Enero';
exec InsertarCliente 'c26', 'Felipe', 'Pérez', 'Calle 678', 'Bogotá', 'Febrero';
exec InsertarCliente 'c27', 'Cristina', 'Sánchez', 'Carrera 234', 'Medellín', 'Marzo';
exec InsertarCliente 'c28', 'Diego', 'Rodríguez', 'Calle 567', 'Cali', 'Abril';
exec InsertarCliente 'c29', 'Victoria', 'González', 'Avenida 901', 'Bogotá', 'Mayo';
exec InsertarCliente 'c30', 'Manuel', 'Fernández', 'Carrera 345', 'Medellín', 'Junio';
exec InsertarCliente 'c31', 'Camila', 'Díaz', 'Calle 678', 'Bogotá', 'Julio';
exec InsertarCliente 'c32', 'Diego', 'Martínez', 'Avenida 012', 'Cali', 'Agosto';
exec InsertarCliente 'c33', 'Valentina', 'Pérez', 'Carrera 234', 'Medellín', 'Septiembre';
exec InsertarCliente 'c34', 'Lucas', 'Sánchez', 'Calle 567', 'Cali', 'Octubre';
exec InsertarCliente 'c35', 'Eva', 'González', 'Avenida 890', 'Bogotá', 'Noviembre';
exec InsertarCliente 'c36', 'Daniel', 'Martínez', 'Carrera 345', 'Medellín', 'Diciembre';
exec InsertarCliente 'c37', 'Isabella', 'Pérez', 'Calle 123', 'Bogotá', 'Enero';
exec InsertarCliente 'c38', 'Joaquín', 'López', 'Avenida 456', 'Medellín', 'Febrero';
exec InsertarCliente 'c39', 'Mariana', 'Sánchez', 'Calle 789', 'Bogotá', 'Marzo';
exec InsertarCliente 'c40', 'Javier', 'Fernández', 'Avenida 012', 'Cali', 'Abril';
exec InsertarCliente 'c41', 'Olivia', 'Rodríguez', 'Carrera 234', 'Medellín', 'Mayo';
exec InsertarCliente 'c42', 'Tomás', 'Díaz', 'Calle 678', 'Bogotá', 'Junio';
exec InsertarCliente 'c43', 'Raquel', 'González', 'Avenida 901', 'Cali', 'Julio';
exec InsertarCliente 'c44', 'Miguel', 'Martínez', 'Carrera 345', 'Medellín', 'Agosto';
exec InsertarCliente 'c45', 'Emma', 'Pérez', 'Calle 567', 'Cali', 'Septiembre';
exec InsertarCliente 'c46', 'Fernando', 'Sánchez', 'Avenida 890', 'Bogotá', 'Octubre';
exec InsertarCliente 'c47', 'Carolina', 'Fernández', 'Calle 123', 'Bogotá', 'Noviembre';
exec InsertarCliente 'c48', 'Mateo', 'López', 'Avenida 456', 'Medellín', 'Diciembre';
exec InsertarCliente 'c49', 'Santiago', 'Díaz', 'Calle 789', 'Bogotá', 'Enero';
exec InsertarCliente 'c50', 'Valeria', 'Martínez', 'Avenida 012', 'Cali', 'Febrero';

select * from cliente;

-- inserciones de articulos

insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Ciencia', 'Juan Pérez', 'Editorial A', 25);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Historia', 'María López', 'Editorial B', 5);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Matemáticas', 'Carlos González', 'Editorial C', 30);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Poesía', 'Ana Martínez', 'Editorial D', 15);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Arte', 'Luis Rodríguez', 'Editorial E', 7);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Historia', 'Laura Sánchez', 'Editorial F', 20);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Ficción', 'Javier Fernández', 'Editorial G', 18);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Ciencia', 'Isabel Díaz', 'Editorial H', 6);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Filosofía', 'Roberto Pérez', 'Editorial I', 22);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Biología', 'Elena González', 'Editorial J', 28);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Música', 'Miguel Martínez', 'Editorial K', 8);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Literatura', 'Sofía López', 'Editorial L', 17);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Geografía', 'Alejandro Sánchez', 'Editorial M', 19);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Economía', 'Carmen Fernández', 'Editorial N', 24);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Psicología', 'Pablo Rodríguez', 'Editorial O', 10);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Química', 'Lucía Díaz', 'Editorial P', 32);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Informática', 'Andrés González', 'Editorial Q', 27);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Sociología', 'Natalia Martínez', 'Editorial R', 21);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Psicología', 'David Pérez', 'Editorial S', 23);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Filosofía', 'Lorena Sánchez', 'Editorial T', 9);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Historia', 'Ricardo Fernández', 'Editorial U', 19);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Arte', 'Clara López', 'Editorial V', 6);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Ficción', 'Alejandría Díaz', 'Editorial W', 15);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Matemáticas', 'Simón González', 'Editorial X', 30);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Poesía', 'Sara Martínez', 'Editorial Y', 14);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Ciencia', 'Felipe Pérez', 'Editorial Z', 7);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Filosofía', 'Cristina Sánchez', 'Editorial AA', 22);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Biología', 'Diego Rodríguez', 'Editorial BB', 28);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Literatura', 'Victoria González', 'Editorial CC', 17);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Geografía', 'Manuel Fernández', 'Editorial DD', 20);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Música', 'Camila Díaz', 'Editorial EE', 8);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Economía', 'Diego Martínez', 'Editorial FF', 24);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Química', 'Isabella Pérez', 'Editorial GG', 31);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Informática', 'Joaquín López', 'Editorial HH', 27);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Sociología', 'Mariana Sánchez', 'Editorial II', 21);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Psicología', 'Javier Fernández', 'Editorial JJ', 23);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Filosofía', 'Olivia Rodríguez', 'Editorial KK', 9);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Historia', 'Tomás Díaz', 'Editorial LL', 19);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Arte', 'Raquel González', 'Editorial MM', 6);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Ficción', 'Miguel Martínez', 'Editorial NN', 15);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Matemáticas', 'Emma Pérez', 'Editorial OO', 30);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Poesía', 'Fernando Sánchez', 'Editorial PP', 14);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Ciencia', 'Carolina Fernández', 'Editorial QQ', 7);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Filosofía', 'Mateo López', 'Editorial RR', 22);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Biología', 'Santiago Díaz', 'Editorial SS', 28);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Literatura', 'Valeria Martínez', 'Editorial TT', 17);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Música', 'Diego Martínez', 'Editorial UU', 10);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Historia', 'Valeria López', 'Editorial VV', 19);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Revista de Arte', 'Laura Sánchez', 'Editorial WW', 6);
insert into articulo (tit_art, aut_art, edi_art, prec_art) values ('Libro de Ficción', 'Joaquín Pérez', 'Editorial XX', 15);

select * from articulo;

-- insercion de pedido

insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c01', '01/01/2023', 100);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c02', '02/01/2023', 150);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c03', '03/01/2023', 200);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c04', '04/01/2023', 80);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c05', '05/01/2023', 120);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c06', '06/01/2023', 90);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c07', '07/01/2023', 75);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c08', '08/01/2023', 110);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c09', '09/01/2023', 130);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c10', '10/01/2023', 160);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c11', '11/01/2023', 70);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c12', '12/01/2023', 95);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c13', '13/01/2023', 120);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c14', '14/01/2023', 85);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c15', '15/01/2023', 110);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c16', '16/01/2023', 130);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c17', '17/01/2023', 70);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c18', '18/01/2023', 85);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c19', '19/01/2023', 110);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c20', '20/01/2023', 160);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c21', '21/01/2023', 75);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c22', '22/01/2023', 90);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c23', '23/01/2023', 120);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c24', '24/01/2023', 95);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c25', '25/01/2023', 110);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c26', '26/01/2023', 130);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c27', '27/01/2023', 70);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c28', '28/01/2023', 85);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c29', '29/01/2023', 110);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c30', '30/01/2023', 160);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c31', '31/01/2023', 75);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c32', '01/02/2023', 90);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c33', '02/02/2023', 120);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c34', '03/02/2023', 85);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c35', '04/02/2023', 110);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c36', '05/02/2023', 130);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c37', '06/02/2023', 70);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c38', '07/02/2023', 85);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c39', '08/02/2023', 110);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c40', '09/02/2023', 160);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c41', '10/02/2023', 75);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c42', '11/02/2023', 90);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c43', '12/02/2023', 120);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c44', '13/02/2023', 95);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c45', '14/02/2023', 110);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c46', '15/02/2023', 130);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c47', '16/02/2023', 70);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c48', '17/02/2023', 85);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c49', '18/02/2023', 110);
insert into pedido (id_cli_ped, fec_ped, val_ped) values ('c50', '19/02/2023', 160);

select * from pedido
-- inserciones de Articulo pedido

insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (1, 1, 2, 50);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (2, 3, 3, 45);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (3, 5, 1, 20);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (4, 7, 4, 60);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (5, 9, 2, 40);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (6, 11, 3, 30);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (7, 13, 2, 25);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (8, 15, 1, 15);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (9, 17, 4, 75);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (10, 19, 2, 35);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (11, 21, 3, 50);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (12, 23, 1, 15);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (13, 25, 4, 80);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (14, 27, 3, 45);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (15, 29, 2, 30);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (16, 31, 1, 25);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (17, 33, 4, 70);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (18, 35, 2, 40);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (19, 37, 3, 60);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (20, 39, 1, 20);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (21, 41, 4, 55);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (22, 43, 2, 35);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (23, 45, 3, 50);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (24, 47, 1, 15);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (25, 49, 4, 75);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (26, 2, 2, 40);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (27, 4, 3, 30);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (28, 6, 2, 25);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (29, 8, 1, 15);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (30, 10, 4, 75);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (31, 12, 2, 35);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (32, 14, 3, 50);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (33, 16, 1, 20);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (34, 18, 4, 60);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (35, 20, 3, 45);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (36, 22, 2, 30);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (37, 24, 1, 25);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (38, 26, 4, 70);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (39, 28, 2, 40);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (40, 30, 3, 60);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (41, 32, 1, 20);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (42, 34, 4, 55);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (43, 36, 2, 35);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (44, 38, 3, 50);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (45, 40, 1, 15);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (46, 42, 4, 75);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (47, 44, 3, 45);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (48, 46, 2, 30);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (49, 48, 1, 25);
insert into articuloXpedido (id_ped_artped, id_art_artped, cant_art_artped, val_ven_art_artped) values (50, 50, 4, 26);

 select * from articuloXpedido 


-- inserciones de tipos de automotores

insert into tiposAutomotores (auttipo, nombre) values (1, 'Sedán');
insert into tiposAutomotores (auttipo, nombre) values (2, 'Camioneta');
insert into tiposAutomotores (auttipo, nombre) values (3, 'Coupé');
insert into tiposAutomotores (auttipo, nombre) values (4, 'SUV');
insert into tiposAutomotores (auttipo, nombre) values (5, 'Camión');
insert into tiposAutomotores (auttipo, nombre) values (6, 'Motocicleta');
insert into tiposAutomotores (auttipo, nombre) values (7, 'Furgoneta');
insert into tiposAutomotores (auttipo, nombre) values (8, 'Convertible');
insert into tiposAutomotores (auttipo, nombre) values (9, 'Minivan');
insert into tiposAutomotores (auttipo, nombre) values (10, 'Deportivo');
insert into tiposAutomotores (auttipo, nombre) values (11, 'Autobús');
insert into tiposAutomotores (auttipo, nombre) values (12, 'Monovolumen');
insert into tiposAutomotores (auttipo, nombre) values (13, 'Motocicleta Eléctrica');
insert into tiposAutomotores (auttipo, nombre) values (14, 'Pick-up');
insert into tiposAutomotores (auttipo, nombre) values (15, 'Van');
insert into tiposAutomotores (auttipo, nombre) values (16, 'Ciclomotor');
insert into tiposAutomotores (auttipo, nombre) values (18, 'Remolque');
insert into tiposAutomotores (auttipo, nombre) values (19, 'Cuatriciclo');
insert into tiposAutomotores (auttipo, nombre) values (20, 'Caravana');
insert into tiposAutomotores (auttipo, nombre) values (21, 'Bicicleta Eléctrica');
insert into tiposAutomotores (auttipo, nombre) values (22, 'Tractor');
insert into tiposAutomotores (auttipo, nombre) values (23, 'Barco');
insert into tiposAutomotores (auttipo, nombre) values (24, 'Lancha');
insert into tiposAutomotores (auttipo, nombre) values (25, 'Submarino');
insert into tiposAutomotores (auttipo, nombre) values (26, 'Avión');
insert into tiposAutomotores (auttipo, nombre) values (27, 'Helicóptero');
insert into tiposAutomotores (auttipo, nombre) values (28, 'Tren');
insert into tiposAutomotores (auttipo, nombre) values (29, 'Tranvía');
insert into tiposAutomotores (auttipo, nombre) values (30, 'Monopatín Eléctrico');
insert into tiposAutomotores (auttipo, nombre) values (31, 'Patineta');
insert into tiposAutomotores (auttipo, nombre) values (32, 'Scooter Eléctrico');
insert into tiposAutomotores (auttipo, nombre) values (33, 'Bicicleta');
insert into tiposAutomotores (auttipo, nombre) values (34, 'Carro de Golf');
insert into tiposAutomotores (auttipo, nombre) values (35, 'Segway');
insert into tiposAutomotores (auttipo, nombre) values (36, 'Patineta Eléctrica');
insert into tiposAutomotores (auttipo, nombre) values (37, 'Patinete');
insert into tiposAutomotores (auttipo, nombre) values (38, 'Motonieve');
insert into tiposAutomotores (auttipo, nombre) values (39, 'Carro de Caballos');
insert into tiposAutomotores (auttipo, nombre) values (40, 'Carro de Tracción Animal');
insert into tiposAutomotores (auttipo, nombre) values (41, 'Patín');
insert into tiposAutomotores (auttipo, nombre) values (42, 'Patineta Eléctrica');
insert into tiposAutomotores (auttipo, nombre) values (43, 'Monopatín');
insert into tiposAutomotores (auttipo, nombre) values (44, 'Triciclo Eléctrico');
insert into tiposAutomotores (auttipo, nombre) values (45, 'Carro de Mano');
insert into tiposAutomotores (auttipo, nombre) values (46, 'Trotinete Eléctrico');
insert into tiposAutomotores (auttipo, nombre) values (47, 'Patineta a Motor');
insert into tiposAutomotores (auttipo, nombre) values (48, 'Triciclo Eléctrico');
insert into tiposAutomotores (auttipo, nombre) values (49, 'Patinete a Pedales');
insert into tiposAutomotores (auttipo, nombre) values (50, 'Bicicleta de Montaña');


select * from tiposAutomotores;

-- inserciones de automotores 

insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('AAA001', 'Toyota', 1, 2020, 5, 1600, 'ABC123456789');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('BBB002', 'Ford', 2, 2019, 7, 2200, 'XYZ987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('CCC003', 'Chevrolet', 4, 2021, 5, 1800, 'PQR456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('DDD004', 'Honda', 3, 2018, 4, 2000, 'LMN123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('EEE005', 'Volkswagen', 1, 2022, 5, 1600, 'STU987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('FFF006', 'Nissan', 2, 2017, 7, 2200, 'JKL456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('GGG007', 'Kia', 4, 2019, 5, 1800, 'EFG123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('HHH008', 'Hyundai', 3, 2020, 4, 2000, 'OPQ987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('III009', 'Mazda', 1, 2021, 5, 1600, 'XYZ456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('JJJ010', 'Mercedes-Benz', 2, 2022, 7, 2200, 'ABC123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('KKK011', 'Audi', 4, 2020, 5, 1800, 'LMN987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('LLL012', 'BMW', 3, 2021, 4, 2000, 'PQR456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('MMM013', 'Lexus', 1, 2019, 5, 1600, 'STU123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('NNN014', 'Subaru', 2, 2018, 7, 2200, 'EFG987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('OOO015', 'Volvo', 4, 2022, 5, 1800, 'JKL456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('PPP016', 'Jaguar', 3, 2021, 4, 2000, 'OPQ123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('QQQ017', 'Tesla', 1, 2019, 5, 1600, 'LMN987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('RRR018', 'Porsche', 2, 2020, 7, 2200, 'PQR456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('SSS019', 'Ferrari', 4, 2022, 5, 1800, 'ABC123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('TTT020', 'Lamborghini', 3, 2021, 4, 2000, 'XYZ987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('UUU021', 'Maserati', 1, 2020, 5, 1600, 'EFG123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('VVV022', 'Bugatti', 2, 2019, 7, 2200, 'STU987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('WWW023', 'McLaren', 4, 2021, 5, 1800, 'JKL456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('XXX024', 'Rolls-Royce', 3, 2020, 4, 2000, 'PQR123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('YYY025', 'Bentley', 1, 2018, 5, 1600, 'ABC987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('ZZZ026', 'Aston Martin', 2, 2022, 7, 2200, 'XYZ456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('AAA027', 'Lotus', 4, 2019, 5, 1800, 'LMN123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('BBB028', 'Alfa Romeo', 3, 2021, 4, 2000, 'PQR987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('CCC029', 'Fiat', 1, 2022, 5, 1600, 'STU123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('DDD030', 'Jeep', 2, 2018, 7, 2200, 'EFG987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('EEE031', 'Dodge', 4, 2020, 5, 1800, 'JKL456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('FFF032', 'Chrysler', 3, 2021, 4, 2000, 'OPQ123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('GGG033', 'Cadillac', 1, 2017, 5, 1600, 'LMN987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('HHH034', 'Lincoln', 2, 2022, 7, 2200, 'PQR123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('III035', 'Buick', 4, 2018, 5, 1800, 'ABC987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('KKK037', 'Audi', 4, 2022, 5, 1800, 'STU987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('LLL038', 'BMW', 3, 2020, 4, 2000, 'JKL456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('MMM039', 'Lexus', 1, 2021, 5, 1600, 'EFG123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('NNN040', 'Subaru', 2, 2019, 7, 2200, 'OPQ987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('OOO041', 'Volvo', 4, 2022, 5, 1800, 'PQR456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('PPP042', 'Jaguar', 3, 2021, 4, 2000, 'ABC123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('QQQ043', 'Tesla', 1, 2018, 5, 1600, 'XYZ987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('RRR044', 'Porsche', 2, 2019, 7, 2200, 'LMN456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('SSS045', 'Ferrari', 4, 2020, 5, 1800, 'STU123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('TTT046', 'Lamborghini', 3, 2021, 4, 2000, 'EFG987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('UUU047', 'Maserati', 1, 2019, 5, 1600, 'JKL123012345');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('VVV048', 'Bugatti', 2, 2020, 7, 2200, 'OPQ987654321');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('WWW049', 'McLaren', 4, 2022, 5, 1800, 'PQR456789012');
insert into automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) values ('XXX050', 'Rolls-Royce', 3, 2020, 4, 2000, 'ABC987654321');

 select * from automotores
-- inserciones de aseguramientos


insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-01-15', '2024-01-15', 25000, 'Vigente', 1000, 'AAA001');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-02-20', '2024-02-20', 30000, 'Vigente', 1200, 'BBB002');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-03-10', '2024-03-10', 18000, 'Vigente', 800, 'CCC003');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-04-05', '2024-04-05', 20000, 'Vigente', 900, 'DDD004');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-05-12', '2024-05-12', 27000, 'Vigente', 1100, 'EEE005');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-06-17', '2024-06-17', 32000, 'Vigente', 1300, 'FFF006');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-07-22', '2024-07-22', 22000, 'Vigente', 1000, 'GGG007');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-08-30', '2024-08-30', 18000, 'Vigente', 800, 'HHH008');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-09-25', '2024-09-25', 25000, 'Vigente', 1100, 'III009');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-10-11', '2024-10-11', 30000, 'Vigente', 1300, 'JJJ010');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-11-08', '2024-11-08', 18000, 'Vigente', 900, 'KKK011');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2023-12-14', '2024-12-14', 20000, 'Vigente', 1000, 'LLL012');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-01-20', '2025-01-20', 27000, 'Vigente', 1300, 'MMM013');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-02-28', '2025-02-28', 32000, 'Vigente', 1500, 'NNN014');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-03-05', '2025-03-05', 22000, 'Vigente', 1100, 'OOO015');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-04-10', '2025-04-10', 18000, 'Vigente', 900, 'PPP016');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-05-15', '2025-05-15', 25000, 'Vigente', 1200, 'QQQ017');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-06-20', '2025-06-20', 30000, 'Vigente', 1400, 'RRR018');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-07-25', '2025-07-25', 18000, 'Vigente', 800, 'SSS019');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-08-30', '2025-08-30', 20000, 'Vigente', 1000, 'TTT020');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-09-05', '2025-09-05', 27000, 'Vigente', 1300, 'UUU021');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-10-10', '2025-10-10', 32000, 'Vigente', 1500, 'VVV022');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-11-15', '2025-11-15', 22000, 'Vigente', 1000, 'WWW023');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2024-12-20', '2025-12-20', 20000, 'Vigente', 900, 'XXX024');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-01-25', '2026-01-25', 27000, 'Vigente', 1300, 'YYY025');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-02-28', '2026-02-28', 32000, 'Vigente', 1500, 'ZZZ026');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-03-05', '2026-03-05', 22000, 'Vigente', 1100, 'AAA027');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-04-10', '2026-04-10', 18000, 'Vigente', 800, 'BBB028');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-05-15', '2026-05-15', 25000, 'Vigente', 1200, 'CCC029');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-06-20', '2026-06-20', 30000, 'Vigente', 1400, 'DDD030');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-07-25', '2026-07-25', 18000, 'Vigente', 800, 'EEE031');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-08-30', '2026-08-30', 20000, 'Vigente', 1000, 'FFF032');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-09-05', '2026-09-05', 27000, 'Vigente', 1300, 'GGG033');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-10-10', '2026-10-10', 32000, 'Vigente', 1500, 'HHH034');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-11-15', '2026-11-15', 22000, 'Vigente', 1000, 'III035');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2025-12-20', '2026-12-20', 20000, 'Vigente', 900, 'JJJ036');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-01-25', '2027-01-25', 27000, 'Vigente', 1300, 'KKK037');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-02-28', '2027-02-28', 32000, 'Vigente', 1500, 'LLL038');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-03-05', '2027-03-05', 22000, 'Vigente', 1100, 'MMM039');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-04-10', '2027-04-10', 18000, 'Vigente', 800, 'NNN040');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-05-15', '2027-05-15', 25000, 'Vigente', 1200, 'OOO041');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-06-20', '2027-06-20', 30000, 'Vigente', 1400, 'PPP042');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-07-25', '2027-07-25', 18000, 'Vigente', 800, 'QQQ043');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-08-30', '2027-08-30', 20000, 'Vigente', 1000, 'RRR044');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-09-05', '2027-09-05', 27000, 'Vigente', 1300, 'SSS045');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-10-10', '2027-10-10', 32000, 'Vigente', 1500, 'TTT046');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-11-15', '2027-11-15', 22000, 'Vigente', 1000, 'UUU047');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2026-12-20', '2027-12-20', 20000, 'Vigente', 900, 'VVV048');
insert into aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) values ('2027-01-25', '2028-01-25', 27000, 'Vigente', 1300, 'WWW049');

select * from aseguramientos;

-- inserciones de incidentes

insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-01-15', 'AAA001', 'Calle Principal', 2, 0, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-02-20', 'BBB002', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-03-10', 'CCC003', 'Carretera Norte', 3, 1, 4);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-04-05', 'DDD004', 'Calle Principal', 0, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-05-12', 'EEE005', 'Avenida Central', 2, 0, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-06-17', 'FFF006', 'Carretera Norte', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-07-22', 'GGG007', 'Calle Principal', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-08-30', 'HHH008', 'Avenida Central', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-09-25', 'III009', 'Carretera Norte', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-10-11', 'JJJ010', 'Calle Principal', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-11-08', 'KKK011', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2023-12-14', 'LLL012', 'Carretera Norte', 2, 0, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-01-20', 'MMM013', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-02-28', 'NNN014', 'Avenida Central', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-03-05', 'OOO015', 'Carretera Norte', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-04-10', 'PPP016', 'Calle Principal', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-05-15', 'QQQ017', 'Avenida Central', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-06-20', 'RRR018', 'Carretera Norte', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-07-25', 'SSS019', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-08-30', 'TTT020', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-09-05', 'UUU021', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-10-10', 'VVV022', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-11-15', 'WWW023', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2024-12-20', 'XXX024', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-01-25', 'YYY025', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-02-28', 'ZZZ026', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-03-05', 'AAA027', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-04-10', 'BBB028', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-05-15', 'CCC029', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-06-20', 'DDD030', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-07-25', 'EEE031', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-08-30', 'FFF032', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-09-05', 'GGG033', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-10-10', 'HHH034', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-11-15', 'III035', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2025-12-20', 'JJJ036', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-01-25', 'KKK037', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-02-28', 'LLL038', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-03-05', 'MMM039', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-04-10', 'NNN040', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-05-15', 'OOO041', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-06-20', 'PPP042', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-07-25', 'QQQ043', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-08-30', 'RRR044', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-09-05', 'SSS045', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-10-10', 'TTT046', 'Calle Principal', 0, 0, 1);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-11-15', 'UUU047', 'Avenida Central', 1, 0, 2);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2026-12-20', 'VVV048', 'Carretera Norte', 2, 1, 3);
insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) values ('2027-01-25', 'WWW049', 'Calle Principal', 0, 0, 1);


select * from incidentes;



--  i. Visualizar los clientes que cumplen años según un mes ingresado por parámetros.

create proc Cumple_Clientes 
 @MesCumple varchar(10)
as 

begin
	select * from cliente where mes_cum_cli like @MesCumple  
end

exec Cumple_Clientes 'Febrero'


 -- ii. Visualizar el nombre del cliente, la fecha y el valor según id del cliente ingresado.
  
create proc info_Clientee
 @idCliente varchar (30)
 as 
 begin
     select nom_cli, fec_ped, val_ped
    from cliente c
     join pedido p on c.id_cli = p.id_cli_ped
    where c.id_cli = @idCliente;
	end

	exec info_Clientee 'c01'

--  iii. Visualizar los datos de las empresas fundadas según año ingresado.

create proc infoEmpresa_Anio 
@anioEmpresa int 
as 
begin
	select * from compania where comaniofun = @anioEmpresa
end

exec infoEmpresa_Anio 2025


-- v. Visualizar los datos de la empresa según nit ingresado.
	create proc datos_Empresa_NIT
		@nitEmpresa varchar (11)
		as 
		begin
			select * from compania where comnit =@nitEmpresa
		end


		exec datos_Empresa_NIT '12345678901'

 -- Visualizar los pedidos que se han realizado según id de articulo ingresado, el  listado debe mostrar el nombre y dirección del cliente, el respectivo número de
 -- pedido y la cantidad solicitada.
		
	create proc visualizarPedidos 
	 @idArticulo int
	 as 
	 begin
	select c.nom_cli, c.dir_cli, p.id_ped, ap.cant_art_artped
    from cliente c
    JOIN pedido p on c.id_cli = p.id_cli_ped
    JOIN articuloXpedido ap on p.id_ped = ap.id_ped_artped
    where ap.id_art_artped = 1;
	end

	exec visualizarPedidos 2


