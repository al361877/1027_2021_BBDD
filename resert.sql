delete from Municipio;
delete from EspacioPublico;
delete from Zona;
delete from Usuario;
delete from Estacion;
delete from Controlador;
delete from Ciudadano;
delete from Gestor;
delete from Reserva; 
delete from Servicio;
delete from FranjaEspacio;

--------------------------------------------
DROP table Servicio;
DROP table Estacion;
DROP table Reserva; 
DROP table Zona;
DROP table Controlador;
DROP table Gestor;
DROP table Ciudadano;
DROP table Usuario;
DROP table FranjaEspacio;
DROP table EspacioPublico;
DROP table Municipio;



CREATE TABLE Municipio(
    id VARCHAR(20) not null,  
    nombre VARCHAR(50) not null,
    coordenadas VARCHAR(20) not null,
    habitantes int not null,
    CONSTRAINT cp_municipio PRIMARY KEY (id)
);


CREATE TABLE EspacioPublico(
    id VARCHAR(20) not null,
    municipio VARCHAR(20) not null,
    tipo_espacio VARCHAR(50) not null,
    cp INTEGER not null,
    CONSTRAINT cp_espacio PRIMARY KEY (id),
    CONSTRAINT ca_espacio_munipio FOREIGN KEY (municipio) REFERENCES Municipio(id)  ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE FranjaEspacio(
    id VARCHAR(50) not null,
    fechaIni date not null,
    fechaFin date not null, 
    horaIni time not null,
    horaFin time not null, 
    CONSTRAINT cp_franja PRIMARY KEY (id)
);


CREATE TABLE Usuario(
    dni VARCHAR(9) not null,
    nombre_usuario VARCHAR(30) not null,
    nombre_y_apellidos VARCHAR(100) not null,
    telefono VARCHAR(15) not null, 
    email VARCHAR(50) not null,
    contraseña VARCHAR(30) not null,
    nacimiento DATE not null,
    ciudad VARCHAR(100) not null,
    calle VARCHAR(100) not null,
    cp INTEGER not null,
    tipo_usuario VARCHAR(12) not null,                  -- si es ciudadano, controlador o gestor municipal
    CONSTRAINT cp_usuario PRIMARY KEY (dni),
    CONSTRAINT calt1_usuario UNIQUE (telefono),         --clave alternativa 1, será el telefono
    CONSTRAINT calt2_usuario UNIQUE (email),           --clave alternativa 2, será el correo electrónico
    CONSTRAINT calt3_usuario UNIQUE (nombre_usuario) --clave alternativa 3, nombre de usuario
);


CREATE TABLE Ciudadano(
    dni VARCHAR(9) not null,  
    CONSTRAINT ca_ciudadano_usuario FOREIGN KEY (dni) REFERENCES Usuario(dni)  ON DELETE RESTRICT ON UPDATE CASCADE ,
    CONSTRAINT cp_ciudadano PRIMARY KEY (dni)
);


CREATE TABLE Gestor(
    dni VARCHAR(9) not null,  
    municipio VARCHAR(20) not null,
    CONSTRAINT ca_gestror_usuario FOREIGN KEY (dni) REFERENCES Usuario(dni)  ON DELETE RESTRICT ON UPDATE CASCADE ,
    CONSTRAINT cp_gestor PRIMARY KEY (dni),
    CONSTRAINT ca_gestror_munipio FOREIGN KEY (municipio) REFERENCES Municipio(id)  ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE Controlador(
    dni VARCHAR(9) not null,  
    espacio_publico VARCHAR(20) not null,
    CONSTRAINT ca_controlador_usuario FOREIGN KEY (dni) REFERENCES Usuario(dni)  ON DELETE RESTRICT ON UPDATE CASCADE ,
    CONSTRAINT cp_controlador PRIMARY KEY (dni),
    CONSTRAINT ca_controlador_espacio FOREIGN KEY (espacio_publico) REFERENCES EspacioPublico(id)  ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE Zona(
    id VARCHAR(20) not null,
    nombre VARCHAR(50) not null,
    espacio_publico VARCHAR(20) not null,
    cp INTEGER not null,
    tipo_suelo VARCHAR(30) not null,
    tipo_acceso VARCHAR(30) not null,
    CONSTRAINT cp_zona PRIMARY KEY (id),
    CONSTRAINT ca_zona_espacio FOREIGN KEY (espacio_publico) REFERENCES EspacioPublico(id)  ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE Reserva(
    id VARCHAR(20) not null,
    dni_ciudadano VARCHAR(9) not null,
    franja_espacio VARCHAR(20) not null,
    espacio_publico VARCHAR(20) not null,
    estado_reserva VARCHAR(30) not null,
    zona VARCHAR(20) not null,
    
    CONSTRAINT cp_reserva PRIMARY KEY (id),
    CONSTRAINT ca_reserva_cidudadano FOREIGN KEY (dni_ciudadano) REFERENCES Ciudadano(dni)  ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ca_reserva_espacio FOREIGN KEY (espacio_publico) REFERENCES EspacioPublico(id)  ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ca_reserva_franja FOREIGN KEY (franja_espacio) REFERENCES FranjaEspacio(id)  ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ca_reserva_zona FOREIGN KEY (zona) REFERENCES Zona(id)  ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE Estacion(
    id VARCHAR(50) not null,
    fechaIni date not null,
    fechaFin date not null, 
    CONSTRAINT cp_estacion PRIMARY KEY (id)
);


CREATE TABLE Servicio(
    id  VARCHAR(20) not null,
    tipo_servicio VARCHAR(50) not null,
    estacion VARCHAR(50),
    CONSTRAINT cp_servicio PRIMARY KEY (id),
    CONSTRAINT ca_servicio_estacion FOREIGN KEY (estacion) REFERENCES Estacion(id)  ON DELETE RESTRICT ON UPDATE CASCADE
);





INSERT INTO Municipio VALUES('cs', 'Castellón', '39°58′N 0°03′O', 150000);
INSERT INTO Municipio VALUES('vlc', 'Valencia', '39°28′12″N 0°22′35″O', 2850000);
INSERT INTO Municipio VALUES('alc', 'Alicante', '38°21′N 0°29′W', 240000);
INSERT INTO Municipio VALUES('naq', 'Náquera', '39°48′N 0°33′O', 40000);
INSERT INTO Municipio VALUES('xat', 'Xativa', '39°58′N 0°53′O', 50000);

INSERT INTO EspacioPublico VALUES('rio1', 'alc', 'rio', 3004);
INSERT INTO EspacioPublico VALUES('rio2', 'alc', 'rio', 3004);
INSERT INTO EspacioPublico VALUES('des4', 'cs', 'otros', 12004);
INSERT INTO EspacioPublico VALUES('herm3', 'xat', 'otros', 10004);
INSERT INTO EspacioPublico VALUES('mgd2', 'cs', 'otros', 10004);
INSERT INTO EspacioPublico VALUES('mec2', 'naq', 'otros', 11004);



INSERT INTO Usuario VALUES ('A1234509','gemmen', 'GEMMA MENGUAL', '645456564', 'gemmen@hotmail.com', 'pass', 1994, 'iddir123456789','asdfgas',12345, 'Ciudadano');
INSERT INTO Usuario VALUES ('A2345091', 'gallego', 'ALBUSAC TAMARGO DANIEL', '623845091', 'gallego@gmail.com', 'pass', 1994, 'iddir1235093','fghs',6345, 'Ciudadano');
INSERT INTO Usuario VALUES ('A1345092','CASTELLS', 'CASTELLS GALLEGO MARAI DEL TISCAR', '613745092', 'CASTELLS@hotmail.com', 'pass', 1994, 'iddir1235054', 'sdgh',7346,'Ciudadano');
INSERT INTO Usuario VALUES ('G1245093','AVELLANEDA', 'CUETO AVELLANEDA RAFAEL', '612455093', 'AVELLANEDA@hotmail.com', 'pass', 1994, 'sgsfsdfg', 'asdfgas',5346,'Ciudadano');
INSERT INTO Usuario VALUES ('R1235094','ESCOT', 'ESCOT HIGUERAS SANDRA', '614235094', 'ESCOT@gmail.com', 'pass', '12-3-1994', 'iddir1235094','dsfgsg',23456, 'Ciudadano');

INSERT INTO Usuario VALUES ('G1245493', 'IBAÑEZ', 'GONZALEZ IBAÑEZ DAVID', '612364095', 'IBAÑEZ@hotmail.com', 'pass', 1994, 'iddir8234504', 'asdfgas',52346,'Gestor');
INSERT INTO Usuario VALUES ('A1234596', 'BECERRA', 'ALONSO BECERRA JOSE', '612347596', 'BECERRA@hotmail.com', 'pass', 1994, 'iddir1234596', 'asdfgas',34573,'Gestor');
INSERT INTO Usuario VALUES ('I1234508', 'SEGUIN', 'FERNANDEZ SEGUIN HUGO', '612348508', 'SEGUIN@gmail.com', 'pass',1994, 'iddir1234508', 'asdfgas',3245347,'Gestor');
INSERT INTO Usuario VALUES ('U2234509', 'CARREÑO', 'CARREÑO NAVARRO MONICA', '622394509', 'CARREÑO@hotmail.com', 'pass',1994, 'iddir2234509' ,'asdfgas',234532,'Gestor');
INSERT INTO Usuario VALUES ('A3234509', 'HERAS', 'GARCIA HERAS BEATRIZ', '633234509', 'HERAS@hotmail.com', 'pass', 1999, 'iddir3234509' ,'asdfgas',24523,'Gestor');

INSERT INTO Usuario VALUES ('H4234509', 'GARRIDO', 'GARRIDO RUIZ LUIS', '642434509', 'GARRIDO@gmail.com', 'pass', 1994, 'iddir4234509','asdfgas',24523, 'Controlador');
INSERT INTO Usuario VALUES ('G5234509', 'CAMBRONERO', 'GOMEZ CAMBRONERO MARTA', '652634509', '@hotmail.com', 'pass', 1994,'iddir5234509' ,'asdfgas',245,'Controlador');
INSERT INTO Usuario VALUES ('F6234509','OLGA', 'LOPEZ GONZALEZ OLGA', 662534509, 'CAMBRONERO@hotmail.com', 'pass', 1994, 'iddir6234509','asdfgas',2543523, 'Controlador');
INSERT INTO Usuario VALUES ('K7234509', 'RUEDA', 'LOPEZ RUEDA ROCIO ', '672347509', 'OLGA@gmail.com', 'pass', 1994, 'iddir7234509' ,'asdfgas',42352,'Controlador');
INSERT INTO Usuario VALUES ('T8234509', 'CHAVARRIAS', 'MONZON CHAVARRIAS MARINA', '682374509', 'CHAVARRIAS@gmail.com', 'pass', 1994, 'iddir8234509' ,'asdfgas',23456,'Controlador');
INSERT INTO Usuario VALUES ('E9234509', 'OÑA' , 'OÑA MORALES MONICA ', '692344509', 'OÑA@hotmail.com', 'pass', 1994, 'iddir9234509','asdfgas',24525, 'Controlador');


INSERT INTO Ciudadano VALUES ('A1234509');
INSERT INTO Ciudadano VALUES ('A2345091');
INSERT INTO Ciudadano VALUES ('A1345092');
INSERT INTO Ciudadano VALUES ('G1245093');
INSERT INTO Ciudadano VALUES ('R1235094');

INSERT INTO Gestor VALUES ('G1245493', 'cs');
INSERT INTO Gestor VALUES ('A1234596', 'vlc');
INSERT INTO Gestor VALUES ('I1234508', 'alc');
INSERT INTO Gestor VALUES ('U2234509', 'xat');
INSERT INTO Gestor VALUES ('A3234509', 'naq');

INSERT INTO Controlador VALUES ('H4234509', 'mgd2');
INSERT INTO Controlador VALUES ('G5234509', 'herm3');
INSERT INTO Controlador VALUES ('F6234509', 'rio1');
INSERT INTO Controlador VALUES ('K7234509', 'rio2');
INSERT INTO Controlador VALUES ('T8234509', 'des4');
INSERT INTO Controlador VALUES ('E9234509', 'mec2');

INSERT INTO  Zona VALUES ('1A', 'norte', 'mgd2', 10004, 'firme', 'tierra');
INSERT INTO  Zona VALUES ('1B', 'sur', 'mgd2', 11004, 'firme', 'tierra');
INSERT INTO  Zona VALUES ('1C', 'este', 'mec2', 10004, 'firme', 'tierra');
INSERT INTO  Zona VALUES ('2A', 'norte', 'mgd2', 10004, 'firme', 'tierra');
INSERT INTO  Zona VALUES ('3A', 'oeste', 'rio2', 3004, 'firme', 'tierra');

INSERT INTO Reserva VALUES ('cs1', 'A1345092', 'd2', 'rio2', 'finUso');
INSERT INTO Reserva VALUES ('cs2', 'A1345092', 'd4', 'rio2', 'pendienteDeUso');
INSERT INTO Reserva VALUES ('alc1', 'G1245093', 'd5', 'rio1', 'pendienteDeUso');
INSERT INTO Reserva VALUES ('xat1', 'R1235094', 'd1', 'herm3', 'finUso');
INSERT INTO Reserva VALUES ('vlc1', 'A1234509', 'd3', 'rio2', 'CanceladoUuario');


INSERT INTO Servicio VALUES ('X1', 'CCCC', 'aa');
INSERT INTO Servicio VALUES ('X2', 'BBBB', 'aa');
INSERT INTO Servicio VALUES ('X3', 'CCCC', 'dd');
INSERT INTO Servicio VALUES ('X4', 'DDDD', 'dd');
INSERT INTO Servicio VALUES ('X5', 'TTTT', 'cc');

