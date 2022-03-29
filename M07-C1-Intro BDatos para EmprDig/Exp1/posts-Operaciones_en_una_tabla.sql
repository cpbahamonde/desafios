-- PARTE 1
-- 1. Crear una base de datos con nombre “Posts”. (1 Punto)
CREATE DATABASE Posts

-- *** Conectar BDatos 'Posts' ***
\c Posts

-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,contenido y descripción. (1 Punto)
CREATE TABLE post(id VARCHAR(15) NOT NULL, nom_user VARCHAR(100), fech_creac DATE, conten_descripc VARCHAR(250));

-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)
INSERT INTO post(id,nom_user, fech_creac, conten_descripc) VALUES('11.111.111-1', 'Pamela','20220328', 'Hola, este es mi primer post-PamP1');
INSERT INTO post(id,nom_user, fech_creac, conten_descripc) VALUES('11.111.111-1', 'Pamela','20220329', 'este es mi segundo dia posteando-PamP2');
INSERT INTO post(id,nom_user, fech_creac, conten_descripc) VALUES('22.222.222-2', 'Carlos','20220328', 'Hola, este tambien es mi primer post-CarP1');

-- 4. Modificar la tabla post, agregando la columna título. (1 Punto)
ALTER TABLE post ADD COLUMN titulo VARCHAR(100);

-- 5. Agregar título a las publicaciones ya ingresadas. (1 Punto)
UPDATE post SET titulo='Pamela - primer post' WHERE id = '11.111.111-1' AND fech_creac = '20220328';;
UPDATE post SET titulo='Pamela - segundo post' WHERE id = '11.111.111-1' AND fech_creac = '20220329';
UPDATE post SET titulo='Carlos - primer post' WHERE id = '22.222.222-2';

-- 6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)
INSERT INTO post(id, nom_user, fech_creac, conten_descripc, titulo) VALUES('33.333.333-3', 'Pedro', '20220329', 'Hola, este es mi primer post-PedP1', 'Pedro - primer post');
INSERT INTO post(id, nom_user, fech_creac, conten_descripc, titulo) VALUES('33.333.333-3', 'Pedro', '20220330', 'Este es mi segundo post-PedP2', 'Pedro - segundo  post');

-- 7. Eliminar el post de Carlos. (1 Punto)
DELETE FROM post WHERE id = '22.222.222-2' AND nom_user='Carlos';

-- 8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)
INSERT INTO post(id, nom_user, fech_creac, conten_descripc, titulo) VALUES('22.222.222-2', 'Carlos', '20220331', 'Hola, este es un nuevo post, despues del eliminado', 'Carlos - segundo post');


-- PARTE 2

-- 0.1 Para crear una FK, antes se debe crear una PK en la tabla referenciada 'post',
-- 0.2 La tabla referenciada 'post', no debe tener 'id'duplicados, por lo que se debe dejar un solo registro con 'id' unico, y eliminar todos los demas
DELETE FROM post WHERE id = '11.111.111-1' AND nom_user='Pamela' AND fech_creac='20220329';
DELETE FROM post WHERE id = '33.333.333-3' AND nom_user='Pedro' AND fech_creac='20220330';
ALTER TABLE post ADD PRIMARY KEY(id);

-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts. (1 Punto)
-- No deja crear una FK, ver el punto 0.1
CREATE TABLE comentarios(id VARCHAR(15) NOT NULL, fecha DATE, hora_creac TIME, contenido VARCHAR(100), FOREIGN KEY (id) REFERENCES post(id));

-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('11.111.111-1','20220328','13:00:00.00', 'este es mi primer comentario-PamC1');
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('11.111.111-1','20220328','14:00:00.00', 'este es mi segundo comentario-PamC2');
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('22.222.222-2','20220328','13:00:00.00', 'este es mi primer comentario-CarC1');
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('22.222.222-2','20220328','13:30:00.00', 'este es mi segundo comentario-CarC2');
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('22.222.222-2','20220328','14:00:00.00', 'este es mi tercer comentario-CarC3');
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('22.222.222-2','20220328','14:30:00.00', 'este es mi cuarto comentario-CarC4');

-- 3. Crear un nuevo post para "Margarita". (1 Punto)
INSERT INTO post(id,nom_user, fech_creac, conten_descripc, titulo) VALUES('44.444.444-4', 'Margarita','20220331', 'Hola, este es mi primer post-MarP1', 'Margarita - primer post');

-- 4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('44.444.444-4','20220328','13:00:00.00', 'este es mi primer comentario-MarC1');
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('44.444.444-4','20220328','14:00:00.00', 'este es mi segundo comentario-MarC2');
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('44.444.444-4','20220328','15:00:00.00', 'este es mi tercer comentario-MarC3');
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('44.444.444-4','20220328','16:00:00.00', 'este es mi cuarto comentario-MarC4');
INSERT INTO comentarios(id, fecha, hora_creac, contenido) VALUES('44.444.444-4','20220328','17:00:00.00', 'este es mi quinto comentario-MarC5');

