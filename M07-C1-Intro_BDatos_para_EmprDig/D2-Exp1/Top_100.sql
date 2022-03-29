-- Desafío Evaluado 'Top 100'

-- 1. Crear una base de datos llamada películas. (1 Punto)
CREATE TABLE IF NOT EXISTS Peliculas (id_pelis serial, pelicula VARCHAR(100), agno_estreno integer, director VARCHAR(50), PRIMARY KEY (id_pelis));
CREATE TABLE IF NOT EXISTS Reparto (id_pelis integer NOT NULL, actor VARCHAR(50), FOREIGN KEY (id_pelis) REFERENCES Peliculas(id_pelis));

-- 2. Cargar ambos archivos a su tabla correspondiente. (1 Punto)
\copy Peliculas FROM 'C:\Users\cpbah\OneDrive\Escritorio\peliculas.csv' csv header;
SELECT * FROM Peliculas;

\copy Reparto FROM 'C:\Users\cpbah\OneDrive\Escritorio\reparto.csv' csv;
SELECT * FROM reparto;

-- 3. Obtener el ID de la película “Titanic”. (1 Punto)
SELECT id_pelis FROM Peliculas WHERE pelicula='Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic". (1 Puntos)
SELECT * FROM Reparto WHERE id_pelis='2';

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford. (2 Puntos)
-- SELECT * FROM Reparto WHERE actor='Harrison Ford';
SELECT COUNT (id_pelis) AS total_pelis FROM reparto WHERE actor='Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente. (1 punto)
SELECT * FROM Peliculas WHERE agno_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;
SELECT * FROM Peliculas WHERE agno_estreno >= 1990 AND agno_estreno <= 1999 ORDER BY pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”. (1 punto)
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM Peliculas GROUP BY pelicula;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.(2 punto)
SELECT MAX(LENGTH(pelicula)) FROM Peliculas;
