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

INSERT INTO FranjaEspacio VALUES ('d1', TO_DATE('21/05/2019', 'DD/MM/YYYY'),  TO_DATE('21/05/2019', 'DD/MM/YYYY'), '9:00', '12:00');
INSERT INTO FranjaEspacio VALUES ('d2', 21/07/2019, 22/07/2019, 12:00, 12:00)
INSERT INTO FranjaEspacio VALUES ('d3', 27/04/2019, 21/05/2019, 9:00, 12:00)
INSERT INTO FranjaEspacio VALUES ('d4', 21/05/2020, 21/05/2020, 11:00, 18:00)
INSERT INTO FranjaEspacio VALUES ('d5', 14/09/2021, 21/10/2021, 9:00, 12:00)


INSERT INTO Usuario VALUES ('A1234509','gemmen', 'GEMMA MENGUAL', '645456564', 'gemmen@hotmail.com', 'pass', '12-3-1994', 'iddir123456789','asdfgas',12345, 'Ciudadano');
INSERT INTO Usuario VALUES ('A2345091', 'gallego', 'ALBUSAC TAMARGO DANIEL', '623845091', 'gallego@gmail.com', 'pass', '12-3-1994', 'iddir1235093','fghs',6345, 'Ciudadano');
INSERT INTO Usuario VALUES ('A1345092','CASTELLS', 'CASTELLS GALLEGO MARAI DEL TISCAR', '613745092', 'CASTELLS@hotmail.com', 'pass', '12-3-1994', 'iddir1235054', 'sdgh',7346,'Ciudadano');
INSERT INTO Usuario VALUES ('G1245093','AVELLANEDA', 'CUETO AVELLANEDA RAFAEL', '612455093', 'AVELLANEDA@hotmail.com', 'pass', '12-3-1994', 'sgsfsdfg', 'asdfgas',5346,'Ciudadano');
INSERT INTO Usuario VALUES ('R1235094','ESCOT', 'ESCOT HIGUERAS SANDRA', '614235094', 'ESCOT@gmail.com', 'pass', '12-3-1994', 'iddir1235094','dsfgsg',23456, 'Ciudadano');

INSERT INTO Usuario VALUES ('G1245493', 'IBAÑEZ', 'GONZALEZ IBAÑEZ DAVID', '612364095', 'IBAÑEZ@hotmail.com', 'pass', '12-3-1994', 'iddir8234504', 'asdfgas',52346,'Gestor');
INSERT INTO Usuario VALUES ('A1234596', 'BECERRA', 'ALONSO BECERRA JOSE', '612347596', 'BECERRA@hotmail.com', 'pass', '12-3-1994', 'iddir1234596', 'asdfgas',34573,'Gestor');
INSERT INTO Usuario VALUES ('I1234508', 'SEGUIN', 'FERNANDEZ SEGUIN HUGO', '612348508', 'SEGUIN@gmail.com', 'pass','12-3-1994', 'iddir1234508', 'asdfgas',3245347,'Gestor');
INSERT INTO Usuario VALUES ('U2234509', 'CARREÑO', 'CARREÑO NAVARRO MONICA', '622394509', 'CARREÑO@hotmail.com', 'pass', '12-3-1994', 'iddir2234509' ,'asdfgas',234532,'Gestor');
INSERT INTO Usuario VALUES ('A3234509', 'HERAS', 'GARCIA HERAS BEATRIZ', '633234509', 'HERAS@hotmail.com', 'pass', '12-3-1994', 'iddir3234509' ,'asdfgas',24523,'Gestor');

INSERT INTO Usuario VALUES ('H4234509', 'GARRIDO', 'GARRIDO RUIZ LUIS', '642434509', 'GARRIDO@gmail.com', 'pass', '12-3-1994', 'iddir4234509','asdfgas',24523, 'Controlador');
INSERT INTO Usuario VALUES ('G5234509', 'CAMBRONERO', 'GOMEZ CAMBRONERO MARTA', '652634509', '@hotmail.com', 'pass', '12-3-1994','iddir5234509' ,'asdfgas',245,'Controlador');
INSERT INTO Usuario VALUES ('F6234509','OLGA', 'LOPEZ GONZALEZ OLGA', 662534509, 'CAMBRONERO@hotmail.com', 'pass', '12-3-1994', 'iddir6234509','asdfgas',2543523, 'Controlador');
INSERT INTO Usuario VALUES ('K7234509', 'RUEDA', 'LOPEZ RUEDA ROCIO ', '672347509', 'OLGA@gmail.com', 'pass', '12-3-1994', 'iddir7234509' ,'asdfgas',42352,'Controlador');
INSERT INTO Usuario VALUES ('T8234509', 'CHAVARRIAS', 'MONZON CHAVARRIAS MARINA', '682374509', 'CHAVARRIAS@gmail.com', 'pass', '12-3-1994', 'iddir8234509' ,'asdfgas',23456,'Controlador');
INSERT INTO Usuario VALUES ('E9234509', 'OÑA' , 'OÑA MORALES MONICA ', '692344509', 'OÑA@hotmail.com', 'pass', '12-3-1994', 'iddir9234509','asdfgas',24525, 'Controlador');


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

INSERT INTO Estacion VALUES ('aa', 12/08/2019. 12/08/2019);
INSERT INTO Estacion VALUES ('bb', 12/08/2019. 12/08/2019);
INSERT INTO Estacion VALUES ('cc', 12/08/2019. 12/08/2019);
INSERT INTO Estacion VALUES ('dd', 12/08/2019. 12/08/2019);
INSERT INTO Estacion VALUES ('ee', 12/08/2019. 12/08/2019);

INSERT INTO Servicio VALUES ('X1', 'CCCC', 'aa');
INSERT INTO Servicio VALUES ('X2', 'BBBB', 'aa');
INSERT INTO Servicio VALUES ('X3', 'CCCC', 'dd');
INSERT INTO Servicio VALUES ('X4', 'DDDD', 'dd');
INSERT INTO Servicio VALUES ('X5', 'TTTT', 'cc');
