

-- 3. Realizar las siguientes consultas:
-- 		a. Mostrar todos los libros que posean menos de 300 páginas. (0.5 puntos)

-- SELECT * FROM Libros ORDER BY pag
SELECT titulo, pag 
FROM Libros
WHERE pag < '300'
ORDER BY pag

-- 		b. Mostrar todos los autores que hayan nacido después del 01-01-1970.(0.5 puntos)

-- SELECT * FROM Autores ORDER BY anyo_nac
SELECT nom_compl, anyo_nac 
FROM Autores 
WHERE anyo_nac >= '1970'
ORDER BY anyo_nac

-- 		c. ¿Cuál es el libro más solicitado? (0.5 puntos).
-- SELECT * FROM Hist_prestms ORDER BY id_prestm

SELECT isbn_libros, Libros.titulo, COUNT (isbn_libros) AS total_pedids
FROM Hist_prestms 
INNER JOIN Libros ON Hist_prestms.isbn_libros = Libros.isbn
GROUP BY isbn_libros,Libros.titulo
ORDER BY COUNT (isbn_libros) DESC LIMIT 1


SELECT isbn_libros, Libros.titulo, COUNT (isbn_libros) AS total_pedids
FROM Hist_prestms 
JOIN Libros ON Hist_prestms.isbn_libros = Libros.isbn
GROUP BY isbn_libros,Libros.titulo
HAVING
MAX(isbn_libros) =
 (
	SELECT COUNT (isbn_libros) 
	FROM Hist_prestms 
	GROUP BY isbn_libros
	ORDER BY COUNT (isbn_libros) DESC LIMIT 1
					) 



-- 		d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto
-- 			debería pagar cada usuario que entregue el préstamo después de 7 días.(0.5 puntos)
-- SELECT * FROM Multas WHERE activa='YES'

-- Detalle por Prestamo
SELECT Hist_prestms.id_prestm,rut_socios AS RUT, Socios.nom_compl AS Socio, Libros.titulo,precio AS "MultaXdia",dias_atraso AS "DiasAtrasado", monto AS "MontoMulta"
FROM Multas
JOIN Socios ON Multas.rut_socios = Socios.rut
JOIN Hist_prestms ON Multas.id_prestms = Hist_prestms.id_prestm
JOIN Libros ON Hist_prestms.isbn_libros = Libros.isbn
WHERE dias_atraso > 0
ORDER BY Hist_prestms.id_prestm 

-- Resumen por Socio
SELECT rut_socios,Socios.nom_compl,precio AS "MultaXdia",SUM(dias_atraso) AS "DiasAtrasado", SUM(monto) AS "MontoMulta"
FROM Multas
JOIN Socios ON Multas.rut_socios = Socios.rut
WHERE dias_atraso > 0
GROUP BY rut_socios,precio,Socios.nom_compl 
ORDER BY rut_socios 


-- Replica de "HISTORIAL DE PRÉSTAMOS", pag 3 de 02_p_Prueba_-_Biblioteca.pdf

SELECT Socios.nom_compl AS "SOCIO",Libros.titulo AS "LIBRO", fech_ini AS "FECHA DEL PRESTAMO", fech_fin_real AS "FECHA DE LA DEVOLUCION" 
FROM Hist_prestms
JOIN Socios ON Socios.rut = rut_socio
JOIN Libros ON Libros.isbn = isbn_libros
