delete from Municipio;
delete from EspacioPublico;
delete from Zona;
delete from Usuario;
delete from Estacion;
delete from Direccion;
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
DROP table Direccion;
DROP table FranjaEspacio;
DROP table EspacioPublico;
DROP table Municipio;
------------------------------------------
-- CREATE TABLE Direccion(
--     id VARCHAR(20) not null, 
--     cp INTEGER not null, 
--     ciudad VARCHAR(50) not null,
--     calle VARCHAR(50) not null, 
--     numero INTEGER not null, 
--     piso INTEGER not null, 
--     puerta VARCHAR(20) not null,
--     CONSTRAINT cp_direccion PRIMARY KEY (id)
-- );


CREATE TABLE Municipio(
    id VARCHAR(20) not null,  
    nombre VARCHAR(50) not null,
    coordenadas VARCHAR(10) not null,
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
    dni VARCHAR(8) not null,
    nombre_usuario VARCHAR(20) not null,
    nombre_y_apellidos VARCHAR(50) not null,
    telefono INTEGER not null, 
    correo VARCHAR(20) not null,
    contraseña VARCHAR(30) not null,
    edad INTEGER not null,
    direccion VARCHAR(100) not null,
    tipo_usuario VARCHAR(10) not null,                  -- si es ciudadano, controlador o gestor municipal
    CONSTRAINT cp_usuario PRIMARY KEY (dni),
    CONSTRAINT calt1_usuario UNIQUE (telefono),         --clave alternativa 1, será el telefono
    CONSTRAINT calt2_usuario UNIQUE (correo),           --clave alternativa 2, será el correo electrónico
--     CONSTRAINT ca_usuario_direccion FOREIGN KEY (direccion) REFERENCES Direccion(id)  ON DELETE RESTRICT ON UPDATE CASCADE, -- clave ajena a dirección, será un identificador de dicha dirección
    CONSTRAINT ri_usuario_telefono CHECK (telefono>600000000 AND telefono<1000000000)  -- regla de integridad (RI)       

);

CREATE TABLE Ciudadano(
    dni VARCHAR(8) not null,  
    CONSTRAINT ca_ciudadano_usuario FOREIGN KEY (dni) REFERENCES Usuario(dni)  ON DELETE RESTRICT ON UPDATE CASCADE ,
    CONSTRAINT cp_ciudadano PRIMARY KEY (dni)
);

CREATE TABLE Gestor(
    dni VARCHAR(8) not null,  
    municipio VARCHAR(20) not null,
    CONSTRAINT ca_gestror_usuario FOREIGN KEY (dni) REFERENCES Usuario(dni)  ON DELETE RESTRICT ON UPDATE CASCADE ,
    CONSTRAINT cp_gestor PRIMARY KEY (dni),
    CONSTRAINT ca_gestror_munipio FOREIGN KEY (municipio) REFERENCES Municipio(id)  ON DELETE RESTRICT ON UPDATE CASCADE


);
CREATE TABLE Controlador(
    dni VARCHAR(8) not null,  
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
    dni_ciudadano VARCHAR(8) not null,
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


