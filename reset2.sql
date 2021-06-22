    delete from RelacionRZ;
    delete from Gestor;
    delete from Reserva;
    delete from Servicio;
    delete from Controlador;
    delete from Zona;
    delete from EspacioPublico;
    delete from Municipio;
    delete from Ciudadano;
    delete from Usuario;
    delete from Estacion;
    delete from franjaespacio;

    --------------------------------------------
    DROP table RelacionRZ;
    DROP table Servicio;
    DROP table Estacion;
    DROP table Reserva;
    DROP table Zona;
    DROP table Controlador;
    DROP table Gestor;
    DROP table Ciudadano;
    DROP table Usuario;
    DROP table EspacioPublico;
    DROP table Municipio;
    DROP table franjaespacio;

    CREATE TABLE Municipio(
        n_municipio VARCHAR(50) not null,
        coordenadas VARCHAR(20) not null,
        habitantes int not null,
        CONSTRAINT cp_municipio PRIMARY KEY (n_municipio)
    );


    CREATE TABLE EspacioPublico(
        id_espacio VARCHAR(20) not null,
        nombre VARCHAR(50) not null,
        n_municipio VARCHAR(20) not null,
        tipo_espacio VARCHAR(50) not null,
        cp INTEGER not null,

        CONSTRAINT cp_espacio PRIMARY KEY (id_espacio),
        CONSTRAINT ca_espacio_munipio FOREIGN KEY (n_municipio) REFERENCES Municipio(n_municipio)  ON DELETE RESTRICT ON UPDATE CASCADE
    );


    CREATE TABLE FranjaEspacio(
        id_franja VARCHAR(50) not null,
        horaIni time not null,
        horaFin time not null,
        CONSTRAINT cp_franja PRIMARY KEY (id_franja)
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
        n_municipio VARCHAR(20) not null,
        CONSTRAINT ca_gestror_usuario FOREIGN KEY (dni) REFERENCES Usuario(dni)  ON DELETE RESTRICT ON UPDATE CASCADE ,
        CONSTRAINT cp_gestor PRIMARY KEY (dni),
        CONSTRAINT ca_gestror_munipio FOREIGN KEY (n_municipio) REFERENCES Municipio(n_municipio)  ON DELETE RESTRICT ON UPDATE CASCADE
    );


    CREATE TABLE Controlador(
        dni VARCHAR(9) not null,
        id_espacio VARCHAR(20) not null,
        CONSTRAINT ca_controlador_usuario FOREIGN KEY (dni) REFERENCES Usuario(dni)  ON DELETE RESTRICT ON UPDATE CASCADE ,
        CONSTRAINT cp_controlador PRIMARY KEY (dni),
        CONSTRAINT ca_controlador_espacio FOREIGN KEY (id_espacio) REFERENCES EspacioPublico(id_espacio)  ON DELETE RESTRICT ON UPDATE CASCADE
    );


    CREATE TABLE Zona(
        id_zona VARCHAR(20) not null,
        nombre VARCHAR(50) not null,
        id_espacio VARCHAR(20) not null,
        cp INTEGER not null,
        tipo_suelo VARCHAR(30) not null,
        tipo_acceso VARCHAR(30) not null,
        aforo_actual INTEGER not null,
        aforo_maximo INTEGER not null,
        CONSTRAINT cp_zona PRIMARY KEY (id_zona),
        CONSTRAINT ca_zona_espacio FOREIGN KEY (id_espacio) REFERENCES EspacioPublico(id_espacio)  ON DELETE RESTRICT ON UPDATE CASCADE
    );


    CREATE TABLE Reserva(
        id_reserva VARCHAR(20) not null,
        dni_ciudadano VARCHAR(9) not null,
        id_franja VARCHAR(20) not null,
        id_espacio VARCHAR(20) not null,
        estado_reserva VARCHAR(30) not null,
        fechaIni date not null,
        numPersonas INTEGER not null,
        CONSTRAINT cp_reserva PRIMARY KEY (id_reserva),
        CONSTRAINT ca_reserva_cidudadano FOREIGN KEY (dni_ciudadano) REFERENCES Ciudadano(dni)  ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT ca_reserva_espacio FOREIGN KEY (id_espacio) REFERENCES EspacioPublico(id_espacio)  ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT ca_reserva_franja FOREIGN KEY (id_franja) REFERENCES FranjaEspacio(id_franja)  ON DELETE RESTRICT ON UPDATE CASCADE

    );


    CREATE TABLE Estacion(
        id_estacion VARCHAR(50) not null,
        fechaIni date not null,
        fechaFin date not null,
        CONSTRAINT cp_estacion PRIMARY KEY (id_estacion)
    );

    CREATE TABLE RelacionRZ(
        id_zona VARCHAR(20) not null,
        id_reserva VARCHAR(20) not null,
        CONSTRAINT ca_zona FOREIGN KEY (id_zona) REFERENCES Zona(id_zona)  ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT ca_reserva FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva)  ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT cp_relacion PRIMARY KEY (id_zona,id_reserva)
    );

    CREATE TABLE Servicio(
        id_servicio  VARCHAR(20) not null,
        tipo_servicio VARCHAR(50) not null,
        id_estacion VARCHAR(50),
        id_espacio VARCHAR(20) not null,
        CONSTRAINT cp_servicio PRIMARY KEY (id_servicio),
        CONSTRAINT ca_servicio_estacion FOREIGN KEY (id_estacion) REFERENCES Estacion(id_estacion)  ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT ca_servicio_espacio FOREIGN KEY (id_espacio) REFERENCES EspacioPublico(id_espacio)  ON DELETE RESTRICT ON UPDATE CASCADE

    );





    INSERT INTO Municipio VALUES( 'Castellón', '39°58′N 0°03′O', 150000);
    INSERT INTO Municipio VALUES('Valencia', '39°28′12″N 0°22′35″O', 2850000);
    INSERT INTO Municipio VALUES('Alicante', '38°21′N 0°29′W', 240000);
    INSERT INTO Municipio VALUES('Náquera', '39°48′N 0°33′O', 40000);
    INSERT INTO Municipio VALUES('Xativa', '39°58′N 0°53′O', 50000);

    INSERT INTO EspacioPublico VALUES('rio1', 'Las fuentes del Algar', 'Alicante', 'rio', 3004);
    INSERT INTO EspacioPublico VALUES('rio2', 'Las Pozas del río Clariano', 'Alicante', 'rio', 3004);
    INSERT INTO EspacioPublico VALUES('des4', 'Desierto de las Palma', 'Castellón', 'otros', 12004);
    INSERT INTO EspacioPublico VALUES('erm3', 'Ermita de Sant Josep', 'Xativa', 'otros', 10004);
    INSERT INTO EspacioPublico VALUES('mgd2', 'Ermita La Magdalena', 'Castellón', 'otros', 12004);
    INSERT INTO EspacioPublico VALUES('mec2', 'Mirador de Naquera', 'Náquera', 'otros', 11004);


    INSERT INTO FranjaEspacio VALUES ('d1', '9:00', '10:00');
    INSERT INTO FranjaEspacio VALUES ('d2',  '10:00', '11:00');
    INSERT INTO FranjaEspacio VALUES ('d3', '11:00', '12:00');
    INSERT INTO FranjaEspacio VALUES ('d4',  '12:00', '13:00');
    INSERT INTO FranjaEspacio VALUES ('d5',  '15:00', '16:00');
    INSERT INTO FranjaEspacio VALUES ('d6',  '16:00', '17:00');
    INSERT INTO FranjaEspacio VALUES ('d7',  '17:00', '18:00');
    INSERT INTO FranjaEspacio VALUES ('d8',  '18:00', '19:00');
    INSERT INTO FranjaEspacio VALUES ('d9',  '19:00', '20:00'); 
    
    INSERT INTO Usuario VALUES ('A1234509','gemmen', 'GEMMA MENGUAL', '645456564', 'gemmen@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir123456789','asdfgas',12345, 'Ciudadano');
    INSERT INTO Usuario VALUES ('A2345091', 'gallego', 'ALBUSAC TAMARGO DANIEL', '623845091', 'gallego@gmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir1235093','fghs',6345, 'Ciudadano');
    INSERT INTO Usuario VALUES ('A1345092','CASTELLS', 'CASTELLS GALLEGO MARAI DEL TISCAR', '613745092', 'CASTELLS@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir1235054', 'sdgh',7346,'Ciudadano');
    INSERT INTO Usuario VALUES ('G1245093','AVELLANEDA', 'CUETO AVELLANEDA RAFAEL', '612455093', 'AVELLANEDA@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'sgsfsdfg', 'asdfgas',5346,'Ciudadano');
    INSERT INTO Usuario VALUES ('R1235094','ESCOT', 'ESCOT HIGUERAS SANDRA', '614235094', 'ESCOT@gmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir1235094','dsfgsg',23456, 'Ciudadano');

    INSERT INTO Usuario VALUES ('G1245493', 'IBAÑEZ', 'GONZALEZ IBAÑEZ DAVID', '612364095', 'IBAÑEZ@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir8234504', 'asdfgas',52346,'Gestor');
    INSERT INTO Usuario VALUES ('A1234596', 'BECERRA', 'ALONSO BECERRA JOSE', '612347596', 'BECERRA@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir1234596', 'asdfgas',34573,'Gestor');
    INSERT INTO Usuario VALUES ('I1234508', 'SEGUIN', 'FERNANDEZ SEGUIN HUGO', '612348508', 'SEGUIN@gmail.com', 'pass',TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir1234508', 'asdfgas',3245347,'Gestor');
    INSERT INTO Usuario VALUES ('U2234509', 'CARREÑO', 'CARREÑO NAVARRO MONICA', '622394509', 'CARREÑO@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir2234509' ,'asdfgas',234532,'Gestor');
    INSERT INTO Usuario VALUES ('A3234509', 'HERAS', 'GARCIA HERAS BEATRIZ', '633234509', 'HERAS@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir3234509' ,'asdfgas',24523,'Gestor');

    INSERT INTO Usuario VALUES ('H4234509', 'GARRIDO', 'GARRIDO RUIZ LUIS', '642434509', 'GARRIDO@gmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir4234509','asdfgas',24523, 'Controlador');
    INSERT INTO Usuario VALUES ('G5234509', 'CAMBRONERO', 'GOMEZ CAMBRONERO MARTA', '652634509', '@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'),'iddir5234509' ,'asdfgas',245,'Controlador');
    INSERT INTO Usuario VALUES ('F6234509','OLGA', 'LOPEZ GONZALEZ OLGA', 662534509, 'CAMBRONERO@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir6234509','asdfgas',2543523, 'Controlador');
    INSERT INTO Usuario VALUES ('K7234509', 'RUEDA', 'LOPEZ RUEDA ROCIO ', '672347509', 'OLGA@gmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir7234509' ,'asdfgas',42352,'Controlador');
    INSERT INTO Usuario VALUES ('T8234509', 'CHAVARRIAS', 'MONZON CHAVARRIAS MARINA', '682374509', 'CHAVARRIAS@gmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir8234509' ,'asdfgas',23456,'Controlador');
    INSERT INTO Usuario VALUES ('E9234509', 'OÑA' , 'OÑA MORALES MONICA ', '692344509', 'OÑA@hotmail.com', 'pass', TO_DATE('12-3-1994', 'DD/MM/YYYY'), 'iddir9234509','asdfgas',24525, 'Controlador');


    INSERT INTO Ciudadano VALUES ('A1234509');
    INSERT INTO Ciudadano VALUES ('A2345091');
    INSERT INTO Ciudadano VALUES ('A1345092');
    INSERT INTO Ciudadano VALUES ('G1245093');
    INSERT INTO Ciudadano VALUES ('R1235094');

    INSERT INTO Gestor VALUES ('G1245493', 'Castellón');
    INSERT INTO Gestor VALUES ('A1234596', 'Valencia');
    INSERT INTO Gestor VALUES ('I1234508', 'Alicante');
    INSERT INTO Gestor VALUES ('U2234509', 'Xativa');
    INSERT INTO Gestor VALUES ('A3234509', 'Náquera');

    INSERT INTO Controlador VALUES ('H4234509', 'mgd2');
    INSERT INTO Controlador VALUES ('G5234509', 'erm3');
    INSERT INTO Controlador VALUES ('F6234509', 'rio1');
    INSERT INTO Controlador VALUES ('K7234509', 'rio2');
    INSERT INTO Controlador VALUES ('T8234509', 'des4');
    INSERT INTO Controlador VALUES ('E9234509', 'mec2');

    INSERT INTO  Zona VALUES ('1A', 'norte', 'mgd2', 12004, 'piedra', 'abierto',2,500);
    INSERT INTO  Zona VALUES ('1B', 'sur', 'mgd2', 11004, 'arena', 'abierto',0,500);
    INSERT INTO  Zona VALUES ('1C', 'este', 'mec2', 10004, 'arena', 'abierto',0,500);
    INSERT INTO  Zona VALUES ('2A', 'norte', 'mgd2', 12004, 'roca', 'restringido',0,500);
    INSERT INTO  Zona VALUES ('3A', 'oeste', 'rio2', 3004, 'pieda', 'abierto',4,500);

    INSERT INTO  Zona VALUES ('4A', 'oeste', 'rio1', 3004, 'pieda', 'abierto',4,500);
    INSERT INTO  Zona VALUES ('2D', 'oeste', 'rio1', 3004, 'arena', 'abierto',4,500);
    INSERT INTO  Zona VALUES ('1D', 'oeste', 'rio1', 3004, 'arena', 'restringido',4,500);

    INSERT INTO  Zona VALUES ('5A', 'oeste', 'des4', 3004, 'arena', 'abierto',4,500);
    INSERT INTO  Zona VALUES ('3D', 'oeste', 'des4', 3004, 'arena', 'abierto',4,500);
    INSERT INTO  Zona VALUES ('5B', 'oeste', 'des4', 3004, 'arena', 'abierto',4,500);



    INSERT INTO Reserva VALUES ('cs1', 'A1345092', 'd1' ,'rio2', 'finUso', TO_DATE('21/07/2019', 'DD/MM/YYYY') ,5);
    INSERT INTO Reserva VALUES ('cs2', 'A1345092', 'd2','rio2', 'pendienteDeUso',  TO_DATE('21/05/2020', 'DD/MM/YYYY'),4);
    INSERT INTO Reserva VALUES ('alc1', 'G1245093',  'd2','rio1', 'pendienteDeUso',  TO_DATE('14/09/2021', 'DD/MM/YYYY'),2);
    INSERT INTO Reserva VALUES ('xat1', 'R1235094',  'd2','erm3', 'finUso',  TO_DATE('21/05/2019', 'DD/MM/YYYY'),1);
    INSERT INTO Reserva VALUES ('vlc1', 'A1234509', 'd4', 'rio2', 'canceladaU', TO_DATE('27/04/2019', 'DD/MM/YYYY'),4);

    INSERT INTO  RelacionRZ VALUES ('2A', 'cs1');
    INSERT INTO  RelacionRZ VALUES ('3A', 'cs2');
    INSERT INTO  RelacionRZ VALUES ('1A', 'alc1');
    INSERT INTO  RelacionRZ VALUES ('3A', 'xat1');
    INSERT INTO  RelacionRZ VALUES ('1C', 'vlc1');

    INSERT INTO Estacion VALUES ('verano', TO_DATE('21/06/2019', 'DD/MM/YYYY'), TO_DATE('22/09/2019', 'DD/MM/YYYY'));
    INSERT INTO Estacion VALUES ('invierno', TO_DATE('21/12/2019', 'DD/MM/YYYY'), TO_DATE('20/03/2019', 'DD/MM/YYYY'));
    INSERT INTO Estacion VALUES ('otoño', TO_DATE('22/09/2019', 'DD/MM/YYYY'), TO_DATE('21/12/2019', 'DD/MM/YYYY'));
    INSERT INTO Estacion VALUES ('primavera', TO_DATE('20/03/2019', 'DD/MM/YYYY'), TO_DATE('21/06/2019', 'DD/MM/YYYY'));


    INSERT INTO Servicio VALUES ('X1', 'baño', 'verano','rio1');
    INSERT INTO Servicio VALUES ('V1', 'ver flores', 'primavera','rio1');
    INSERT INTO Servicio VALUES ('Y1', 'picnics', 'otoño','rio1');
    INSERT INTO Servicio VALUES ('T1', 'nevar', 'invierno','rio1');


    INSERT INTO Servicio VALUES ('X2', 'baño', 'verano','rio2');
    INSERT INTO Servicio VALUES ('V2', 'ver flores', 'primavera','rio2');
    INSERT INTO Servicio VALUES ('Y2', 'picnics', 'otoño','rio2');
    INSERT INTO Servicio VALUES ('T2', 'nevar', 'invierno','rio2');


    INSERT INTO Servicio VALUES ('X3', 'baño', 'verano','des4');
    INSERT INTO Servicio VALUES ('V3', 'ver flores', 'primavera','des4');
    INSERT INTO Servicio VALUES ('Y3', 'picnics', 'otoño','des4');
    INSERT INTO Servicio VALUES ('T3', 'nevar', 'invierno','des4');



    INSERT INTO Servicio VALUES ('X4', 'baño', 'verano','erm3');
    INSERT INTO Servicio VALUES ('V4', 'ver flores', 'primavera','erm3');
    INSERT INTO Servicio VALUES ('Y4', 'picnics', 'otoño','erm3');
    INSERT INTO Servicio VALUES ('T4', 'nevar', 'invierno','erm3');



    INSERT INTO Servicio VALUES ('X5', 'baño', 'verano','mgd2');
    INSERT INTO Servicio VALUES ('V5', 'ver flores', 'primavera','mgd2');
    INSERT INTO Servicio VALUES ('Y5', 'picnics', 'otoño','mgd2');
    INSERT INTO Servicio VALUES ('T5', 'nevar', 'invierno','mgd2');


    INSERT INTO Servicio VALUES ('X6', 'baño', 'verano','mec2');
    INSERT INTO Servicio VALUES ('V6', 'ver flores', 'primavera','mec2');
    INSERT INTO Servicio VALUES ('Y6', 'picnics', 'otoño','mec2');
    INSERT INTO Servicio VALUES ('T6', 'nevar', 'invierno','mec2');

