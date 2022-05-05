-- Parte 1 - Creación del modelo conceptual, lógico y físico

-- 1.1. Realizar el modelo conceptual, considerando las entidades y relaciones entre ellas. (1 Punto)
-- (R). Ver archivo 'biblioteca-Mod-Conceptual.pdf'

-- 1.2. Realizar el modelo lógico, considerando todas las entidades y las relaciones entre
-- 		ellas, los atributos, normalización y creación de tablas intermedias de ser necesario. (2 Puntos)
-- (R). Ver archivo 'biblioteca-Mod-Logico.pdf'

-- 1.3. Realizar el modelo físico, considerando la especificación de tablas y columnas,
-- 		además de las claves externas. (2 Puntos)
-- (R). Ver archivo 'biblioteca-Mod-Fisico.pdf' o para pgAdmin 'biblioteca-Mod-Fisico.pgadmin.pgerd'

-- Parte 2 - Creando el modelo en la base de datos

-- 2.1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas
-- 		definidas y sus atributos. (2 puntos).
-- (R). Ver archivo para pgAdmin 'biblioteca-Query-pgadmin-CreacTablas.sql'

-- 2.2. Se deben insertar los registros en las tablas correspondientes (1 punto).
-- (R). Ver archivo para pgAdmin 'biblioteca-Query-pgadmin-CargaDatos.sql'

-- 2.3. Realizar las siguientes consultas:

-- 2.3.a. Mostrar todos los libros que posean menos de 300 páginas. (0.5 puntos)

SELECT titulo, pag 
FROM Libros
WHERE pag < '300'
ORDER BY pag

-- 2.3.b. Mostrar todos los autores que hayan nacido después del 01-01-1970.(0.5 puntos)

SELECT nom_compl, anyo_nac 
FROM Autores 
WHERE anyo_nac >= '1970'
ORDER BY anyo_nac

-- 2.3.c. ¿Cuál es el libro más solicitado? (0.5 puntos).

SELECT isbn_libros, Libros.titulo, COUNT (isbn_libros) AS total_pedids
FROM Hist_prestms 
INNER JOIN Libros ON Hist_prestms.isbn_libros = Libros.isbn
GROUP BY isbn_libros,Libros.titulo
ORDER BY COUNT (isbn_libros) DESC LIMIT 1

-- 2.3.d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto
-- 		debería pagar cada usuario que entregue el préstamo después de 7 días.(0.5 puntos)

-- *** DETALLE POR PRESTAMO ***
SELECT Hist_prestms.id_prestm,rut_socios AS RUT, Socios.nom_compl AS Socio, Libros.titulo,precio AS "MultaXdia",dias_atraso AS "DiasAtrasado", monto AS "MontoMulta"
FROM Multas
JOIN Socios ON Multas.rut_socios = Socios.rut
JOIN Hist_prestms ON Multas.id_prestms = Hist_prestms.id_prestm
JOIN Libros ON Hist_prestms.isbn_libros = Libros.isbn
WHERE dias_atraso > 0
ORDER BY Hist_prestms.id_prestm 

-- *** RESUMEN POR SOCIO ***
SELECT rut_socios,Socios.nom_compl,precio AS "MultaXdia",SUM(dias_atraso) AS "DiasAtrasosAcum", SUM(monto) AS "MontoMulta"
FROM Multas
JOIN Socios ON Multas.rut_socios = Socios.rut
WHERE dias_atraso > 0
GROUP BY rut_socios,precio,Socios.nom_compl 
ORDER BY rut_socios 
