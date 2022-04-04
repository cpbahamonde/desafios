-- ** Desafío Guiado - Creando y analizando nuestro propio blog

-- 1. Crear base de datos llamada blog.

CREATE DATABASE Blog

-- *** Conectar BDatos 'Posts' ***
-- \c Blog

-- 2. Crear las tablas indicadas de acuerdo al modelo de datos.

CREATE TABLE IF NOT EXISTS Usuario
(	user_id SERIAL NOT NULL, 
	email VARCHAR, 
	PRIMARY KEY (user_id));

CREATE TABLE IF NOT EXISTS Post
(
	post_id SERIAL NOT NULL, 
	user_id INT NOT NULL, 
	titulo VARCHAR, 
	fecha DATE, 
	PRIMARY KEY (post_id),
	FOREIGN KEY (user_id) REFERENCES Usuario(user_id)
);

CREATE TABLE IF NOT EXISTS Comentario
(
	coment_id SERIAL NOT NULL, 
	user_id INT NOT NULL, 
	post_id INT NOT NULL, 
	texto VARCHAR, 
	fecha DATE, 
	PRIMARY KEY (coment_id),
	FOREIGN KEY (user_id) REFERENCES Usuario(user_id), 
	FOREIGN KEY (post_id) REFERENCES Post(post_id)
);

-- 3. Insertar los siguientes registros.

\copy Usuario FROM 'C:\Users\cpbah\OneDrive\Escritorio\usuarios.csv' csv header;
\copy Post FROM 'C:\Users\cpbah\OneDrive\Escritorio\posts.csv' csv header;
\copy Comentario FROM 'C:\Users\cpbah\OneDrive\Escritorio\comentarios.csv' csv header;

-- 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5.

SELECT Usuario.user_id AS ID_Usuario, email, Post.post_id AS ID_Post, titulo
FROM Usuario
JOIN Post ON Usuario.user_id = Post.user_id
WHERE Usuario.user_id = '5'

-- 5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com.

SELECT Usuario.user_id AS ID_Usuario, email, Comentario.coment_id AS ID_Comentario, texto, fecha
FROM Usuario
JOIN Comentario ON Usuario.user_id = Comentario.user_id
WHERE email != 'usuario06@hotmail.com'

-- 6. Listar los usuarios que no han publicado ningún post.

SELECT *
FROM Usuario
WHERE Usuario.user_id NOT IN
(SELECT Post.user_id
FROM Post)

-- 7. Listar todos los post con sus comentarios (incluyendo aquellos que no posee comentarios).
SELECT *
FROM Post
LEFT OUTER JOIN Comentario 
ON Post.post_id = Comentario.post_id
--ORDER BY Comentario.post_id ASC
ORDER BY Post.post_id ASC


-- 8. Listar todos los usuarios que hayan publicado un post en Junio.
SELECT DISTINCT *
FROM Usuario
INNER JOIN Post ON Usuario.user_id = Post.user_id
WHERE Post.fecha BETWEEN '2020-06-01' AND '2020-06-30'
ORDER BY Post.fecha

