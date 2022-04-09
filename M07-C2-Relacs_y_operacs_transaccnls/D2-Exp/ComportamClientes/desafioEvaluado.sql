-- Desafío Evaluado
-- M07-Intro BDatos para EmprDig\2-Relacs y operacs transaccionls\D2\Experimnt
-- 02_d_Desafío_Evaluado_-_Entendiendo_cómo_se_comportan_nuestros_clientes
-- Database: BillJobs_ComportamClientes

-- Para cumplir los siguientes requerimientos, debes recordar tener desactivado el autocommit en tu base de datos.
-- \echo :AUTOCOMMIT  -- ON (default)
-- \set AUTOCOMMIT off

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

-- **********************
-- delete from detalle_compra where id = 66;
--  select * from detalle_compra order by id desc
--  select * from detalle_compra order by id desc limit 2
 
 -- delete from compra where id = 45;
 -- select * from compra order by id desc
 -- select * from compra order by fecha desc limit 2

 -- select * from producto where id = 9
 -- p9=8
 -- update producto set stock = 8 where id = 9; 
 
 -- ROLLBACK
-- **********************

DO $$
DECLARE cliente_cod INTEGER :=1;
DECLARE prod_cod INTEGER :=9;
DECLARE prod_cant INTEGER :=5;

BEGIN
INSERT INTO compra(id, cliente_id, fecha) VALUES (DEFAULT, cliente_cod, CURRENT_DATE);
INSERT INTO detalle_compra(id, producto_id, compra_id, cantidad) VALUES (DEFAULT, prod_cod, (SELECT MAX(id) FROM compra), prod_cant);
UPDATE producto SET stock = stock - prod_cant WHERE id = prod_cod; 
	EXCEPTION
		WHEN OTHERS THEN
		RAISE INFO 'SQLSTATE = %', SQLSTATE;
		RAISE INFO 'SQLERRM = %', SQLERRM;
		ROLLBACK;
		RETURN;
	COMMIT;
END $$;
--consulta la tabla producto para validar si fue efectivamente descontado en el stock.
SELECT * FROM producto where id = 9;
-- (R). CONFIRMADO - Stock de producto9 fue descontado OK

-- 3. El cliente usuario02 ha realizado la siguiente compra:
-- ● producto: producto1, producto 2, producto 8.
-- ● cantidad: 3 de cada producto.
-- ● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este
-- requerimiento y luego consulta la tabla producto para validar que si alguno de ellos
-- se queda sin stock, no se realice la compra. (3 Puntos)


-- **********************
-- delete from detalle_compra where id = 69;
--  select * from detalle_compra order by id desc  -- ult=42
--  select * from detalle_compra order by id desc limit 2
 
 -- delete from compra where id = 48;
 -- select * from compra order by id desc  -- ult=32
 -- select * from compra order by fecha desc limit 2

 -- select * from producto where id = 1 or id = 2 or id = 8
 -- p1=6 p2=5  p8=0
 -- update producto set stock = 6 where id = 1; 
 -- update producto set stock = 5 where id = 2; 
 -- update producto set stock = 0 where id = 8; 
 
 -- ROLLBACK
 -- COMMIT
-- **********************

DO $$
DECLARE cliente_cod INTEGER :=2;
DECLARE prod_uno INTEGER :=1;
DECLARE prod_dos INTEGER :=2;
DECLARE prod_tres INTEGER :=8;
DECLARE prod_cant INTEGER :=3;

BEGIN
INSERT INTO compra(id, cliente_id, fecha) VALUES (DEFAULT, cliente_cod, CURRENT_DATE);
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) 
					VALUES (DEFAULT, prod_uno, (SELECT MAX(id) FROM compra), prod_cant);
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) 
					VALUES (DEFAULT, prod_dos, (SELECT MAX(id) FROM compra), prod_cant);
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) 
					VALUES (DEFAULT, prod_tres, (SELECT MAX(id) FROM compra), prod_cant);
UPDATE producto SET stock = stock - prod_cant WHERE id = prod_uno; 
UPDATE producto SET stock = stock - prod_cant WHERE id = prod_dos; 
UPDATE producto SET stock = stock - prod_cant WHERE id = prod_tres; 
	EXCEPTION
		WHEN OTHERS THEN
		RAISE INFO 'SQLSTATE = %', SQLSTATE;
		RAISE INFO 'SQLERRM = %', SQLERRM;
		ROLLBACK;
		RETURN;
	COMMIT;
END $$;
-- consulta la tabla producto para validar si fue efectivamente descontado en el stock.
SELECT * FROM producto WHERE id = 1 OR id = 2 OR id = 8
-- (R). RECHAZADO - ya que el producto8 NO tiene stock 

-- 4. Realizar las siguientes consultas (2 Puntos):

-- a. Deshabilitar el AUTOCOMMIT .
\echo :AUTOCOMMIT  -- ON (default)
\set AUTOCOMMIT off

-- b. Insertar un nuevo cliente.
--  select * from cliente order by id desc  -- ult=10
-- delete from cliente where id = 17;
INSERT INTO cliente(id, nombre, email) VALUES (DEFAULT, 'usuario011', 'usuario011@microsoft.com');

-- c. Confirmar que fue agregado en la tabla cliente.

-- **********************
-- delete from detalle_compra where id = 69;
--  select * from detalle_compra order by id desc  -- ult=42
--  select * from detalle_compra order by id desc limit 2
 
 -- delete from compra where id = 48;
 -- select * from compra order by cliente_id asc  -- ult=32
 -- select * from compra order by fecha desc limit 2
 
 -- select * from cliente

 -- select * from producto where id = 1 or id = 2 or id = 8
 -- p1=6 p2=5  p8=0
 -- update producto set stock = 6 where id = 1; 
 -- update producto set stock = 5 where id = 2; 
 -- update producto set stock = 0 where id = 8; 
 
 -- ROLLBACK
 -- COMMIT
-- **********************

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
\set AUTOCOMMIT off

