-- Desafío Evaluado
-- M07-Intro BDatos para EmprDig\2-Relacs y operacs transaccionls\D2\Experimnt
-- 02_d_Desafío_Evaluado_-_Entendiendo_cómo_se_comportan_nuestros_clientes
-- Database: BillJobs_ComportamClientes


-- Para cumplir los siguientes requerimientos, debes recordar tener desactivado el autocommit en tu base de datos.
\echo :AUTOCOMMIT  -- ON (default)
\set AUTOCOMMIT off


-- 1. Cargar el respaldo de la base de datos unidad2.sql. (2 Puntos)
DROP DATABASE IF EXISTS BillJobs_ComportamClientes;
CREATE DATABASE BillJobs_ComportamClientes;
\q
psql -U postgres BillJobs_ComportamClientes < "C:\Users\cpbah\OneDrive\Escritorio\unidad2.sql";


-- 2. El cliente usuario01 ha realizado la siguiente compra:
-- 	● producto: producto9.
-- 	● cantidad: 5.
-- 	● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este
-- requerimiento y luego consulta la tabla producto para validar si fue efectivamente
-- descontado en el stock. (3 Puntos)

DO $$
BEGIN
INSERT INTO compra(id, cliente_id, fecha) VALUES (DEFAULT, 1, CURRENT_DATE);
INSERT INTO detalle_compra(id, producto_id, compra_id, cantidad) VALUES (DEFAULT, 9, (SELECT MAX(id) FROM compra), 5);
UPDATE producto SET stock = stock - prod_cant WHERE id = 9; 
	EXCEPTION
		WHEN OTHERS THEN
		ROLLBACK;
		RETURN;
	COMMIT;
END $$;

--consulta la tabla producto para validar si fue efectivamente descontado en el stock.
SELECT * FROM producto where id = 9;
-- (R). CONFIRMADO - Stock de producto9 fue descontado OK


-- 3. El cliente usuario02 ha realizado la siguiente compra:
-- 	● producto: producto 1, producto 2, producto 8.
-- 	● cantidad: 3 de cada producto.
-- 	● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este
-- requerimiento y luego consulta la tabla producto para validar que si alguno de ellos
-- se queda sin stock, no se realice la compra. (3 Puntos)

DO $$
	BEGIN
		-- Compra producto 1
		INSERT INTO compra(id, cliente_id, fecha) VALUES (DEFAULT, 2, CURRENT_DATE);
		INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) 
							VALUES (DEFAULT, 1, (SELECT MAX(id) FROM compra), 3);
		UPDATE producto SET stock = stock - 3 WHERE id = 1;
		-- Compra producto 2
		INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) 
							VALUES (DEFAULT, 2, (SELECT MAX(id) FROM compra), 3);
		UPDATE producto SET stock = stock - 3 WHERE id = 2; 
		-- Compra producto 3
		INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) 
							VALUES (DEFAULT, 8, (SELECT MAX(id) FROM compra), 3);
		UPDATE producto SET stock = stock - 3 WHERE id = 8; 
		-- Valida transacciones
		EXCEPTION
			WHEN OTHERS THEN
			ROLLBACK;
			RETURN;
	COMMIT;
END $$;

-- consulta la tabla producto para validar si fue efectivamente descontado en el stock.
SELECT * FROM producto WHERE id = 1 OR id = 2 OR id = 8
-- (R). RECHAZADO - ya que el producto 8 NO tiene stock 

-- validar que no se realice la compra.
-- (R). CONFIRMADO - Compra no realizada, Registros descartados y Tablas (compra, detalle_compra) sin modificaciones 

-- 4. Realizar las siguientes consultas (2 Puntos):

-- a. Deshabilitar el AUTOCOMMIT .
\echo :AUTOCOMMIT  -- ON (default)
\set AUTOCOMMIT off

-- b. Insertar un nuevo cliente.
INSERT INTO cliente(id, nombre, email) VALUES (DEFAULT, 'usuario011', 'usuario011@microsoft.com');

-- c. Confirmar que fue agregado en la tabla cliente.
SELECT compra.id AS NumCompra, cliente.id AS CodCliente, cliente.nombre, detalle_compra.id AS NumDetallCompra, producto.descripcion, detalle_compra.cantidad, CAST(producto.precio AS MONEY),  CAST(producto.precio*detalle_compra.cantidad AS MONEY) AS Total
FROM compra 
INNER JOIN cliente 
ON compra.cliente_id = cliente.id
RIGHT JOIN detalle_compra 
ON compra.id = detalle_compra.compra_id
INNER JOIN producto
ON detalle_compra.producto_id = producto.id
; 
-- (R). CONFIRMADO - Registro agregado OK

-- d. Realizar un ROLLBACK.
ROLLBACK;

-- e. Confirmar que se restauró la información, sin considerar la inserción del punto b.
-- (R). CONFIRMADO - Registro descartado y Tabla clientes restaurada OK

-- f. Habilitar de nuevo el AUTOCOMMIT.
\echo :AUTOCOMMIT  -- ON (default)
\set AUTOCOMMIT on

   