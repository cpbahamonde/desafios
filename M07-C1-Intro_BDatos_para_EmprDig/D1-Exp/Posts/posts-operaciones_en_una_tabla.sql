-- PARTE 1
-- 1. Crear una base de datos con nombre “Posts”. (1 Punto)
CREATE DATABASE Posts

-- *** Conectar BDatos 'Posts' ***
\c Posts

-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,contenido y descripción. (1 Punto)
CREATE TABLE Post( id_posts integer NOT NULL, nom_user VARCHAR, fech_creac date, contenido VARCHAR, descripc VARCHAR, PRIMARY KEY (id_posts))
-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)
INSERT INTO post(id_posts, nom_user, fech_creac, contenido, descripc) VALUES('1', 'Pamela','20220328', 'Hola, este es mi primer', 'Pam-Saludo1' );
INSERT INTO post(id_posts, nom_user, fech_creac, contenido, descripc) VALUES('2', 'Pamela','20220328', 'este es mi segundo dia posteando', 'Pam-Seguim2' );
INSERT INTO post(id_posts, nom_user, fech_creac, contenido, descripc) VALUES('3', 'Carlos','20220328', 'Hola, este tambien es mi primer post', 'Car-Saludo1');

-- 4. Modificar la tabla post, agregando la columna título. (1 Punto)
ALTER TABLE post ADD COLUMN titulo VARCHAR(100);

-- 5. Agregar título a las publicaciones ya ingresadas. (1 Punto)
UPDATE post SET titulo='PamP1' WHERE id_posts = '1';
UPDATE post SET titulo='PamP2' WHERE id_posts = '2';
UPDATE post SET titulo='CarP1' WHERE id_posts = '3';

-- 6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)
INSERT INTO post(id_posts, nom_user, fech_creac, contenido, descripc, titulo) VALUES('4', 'Pedro', '20220329', 'Hola, este es mi primer post','Ped-Saludo1', 'PedP1');
INSERT INTO post(id_posts, nom_user, fech_creac, contenido, descripc, titulo) VALUES('5', 'Pedro', '20220330', 'Este es mi segundo post', 'Ped-Seguim2', 'PedP2');

-- 7. Eliminar el post de Carlos. (1 Punto)
DELETE FROM post WHERE id_posts = '3' AND nom_user='Carlos';

-- 8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)
INSERT INTO post(id_posts, nom_user, fech_creac, contenido, descripc, titulo) VALUES('6', 'Carlos','20220331', 'Este es mi nuevo post, despues del eliminado', 'Car-Seguim2', 'CarP2');

-- PARTE 2

-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts. (1 Punto)

CREATE TABLE Comentarios( id_comments INTEGER NOT NULL, fecha DATE, hora TIME, contenido VARCHAR, id_posts INTEGER, PRIMARY KEY (id_comments), FOREIGN KEY (id_posts) REFERENCES Post(id_posts));

-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('1', '20220328', '13:00:00.00', 'Hola Pame, saludos', '1');
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('2', '20220328', '13:30:00.00', 'Feliz con tu Post', '2');
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('3', '20220328', '14:00:00.00', 'Hola Carlos, saludos', '6');
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('4', '20220328', '14:30:00.00', 'Saludos', '6');
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('5', '20220331', '15:00:00.00', 'y xq te borraron el Post?', '6');
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('6', '20220331', '15:30:00.00', 'Ojala no te lo borren de nuevo', '6');

-- 3. Crear un nuevo post para "Margarita". (1 Punto)
INSERT INTO post(id_posts, nom_user, fech_creac, contenido, descripc, titulo) VALUES('7', 'Margarita','20220331', 'Hola, este es mi primer post', 'Mar-Saludo1', 'MarP1');

-- 4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('7', '20220331', '13:00:00.00', 'Hola Margarita, saludos', '7');
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('8', '20220331', '14:00:00.00', 'Hola Margarita, wen Post', '7');
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('9', '20220331', '15:00:00.00', 'q bien saber de ti', '7');
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('10', '20220331', '16:00:00.00', 'Margaritaaaaaaaaaaaaaa', '7');
INSERT INTO comentarios(id_comments, fecha, hora, contenido, id_posts) VALUES('11', '20220331', '17:00:00.00', 'Hola, ya lo dijeron todo', '7');

