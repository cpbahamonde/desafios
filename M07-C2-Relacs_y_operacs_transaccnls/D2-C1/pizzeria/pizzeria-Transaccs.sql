-- 1. Crear una base de datos llamada “pizzeria”.
CREATE DATABASE pizzeria;

-- 2. Conectarse a la base de datos pizzeria.
\c pizzeria ;

-- 3. Crear 2 tablas llamadas “ventas” y “pizzas” con la siguiente estructura.
--							 ___________ _______ _______ _____________
-- 		Modelo de la tabla ventas: 	| cliente	| fecha | monto | pizza(FK)	|
--							 ___________ _______ _______ _____________
-- 		Modelo de la tabla pizzas: 	| id(PK)	| stock | costo | nombre	|
--							 ___________ _______ _______ _____________
-- 	La columna stock debe tener una restricción que diga que su valor debe ser mayor a 0.

CREATE TABLE pizzas(
	id INT,
	stock INT CHECK (stock >= 0.00),
	costo DECIMAL,
	nombre VARCHAR(25),
	PRIMARY KEY(id)
);

CREATE TABLE ventas(
	cliente VARCHAR(20),
	fecha DATE,
	monto DECIMAL,
	pizza INT,
	FOREIGN KEY (pizza) REFERENCES pizzas(id)
);

-- 4. Agregar 1 registro a la tabla “pizzas” seteando como stock inicial 0.
INSERT INTO pizzas (id, stock, costo, nombre) VALUES (1, 0, 12000,'Uhlalá');

-- 	Hasta este punto nuestra tabla “pizzas” va quedando de la siguiente manera.
--		____________ ___________ ___________ ___________
--		| id(PK)	| stock 	| costo	| nombre	|
--		____________ ___________ ___________ ___________
--		|	1	|   0		| 12000 	| Uhlalá	|
--		____________ ___________ ___________ ___________

-- 5. Realizar una transacción que registre una nueva pizza con un stock positivo mayor a 1.
BEGIN;
	INSERT INTO pizzas (id, stock, costo, nombre) VALUES (2, 2, 15000, 'Jamón a todo dar');
COMMIT;

-- 	Quedando ahora nuestra tabla de la siguiente manera.
--		____________ ___________ ___________ _______________________
--		|  id(PK)	| stock 	| costo	| nombre			|
--		____________ ___________ ___________ _______________________
--		|	1	|   	0	| 12000 	| Uhlalá			|
--		____________ ___________ ___________ _______________________
-- 		|   	2	|	2	| 15000	| Jamón a todo dar	|
--		____________ ___________ ___________ _______________________


-- 6. Realizar una transacción que registre una venta con la pizza con stock 0 
-- 	e intentar actualizar su stock restándole 1.
BEGIN;
	INSERT INTO ventas (cliente, fecha, monto, pizza) VALUES ('Dexter Gonzalez', '2020-02-02', 12000, 1);
	UPDATE pizzas SET stock = stock - 1 WHERE id = 1;
COMMIT;

-- 	Esto nos devolverá el siguiente error.
-- 	ERROR: el nuevo registro para la relación «pizzas» viola la restricción «check» «stock»

-- 7. Realizar una transacción que intente registrar 1 venta por cada pizza, guardando un SAVEPOINT
-- 	luego de la primera venta y volviendo a este punto si surge un error. 
-- 	Supongamos que se quiere realizar una venta de las 2 pizzas registradas pero solo 1 de ellas 
-- 	tiene stock, por lo que marcaremos un punto de guardado justo después de actualizar el stock 
-- 	de la pizza disponible y volviendo a este punto en el momento que recibimos un error.

BEGIN;
	INSERT INTO ventas (cliente, fecha, monto, pizza) VALUES ('Juan Bravo', '2020-02-02', 15000, 2);
	UPDATE pizzas SET stock = stock - 1 WHERE id = 2;
SAVEPOINT checkpoint;
	INSERT INTO ventas (cliente, fecha, monto, pizza) VALUES ('Utonio Ramirez', '2020-02-02', 12000, 1);
	UPDATE pizzas SET stock = stock - 1 WHERE id = 1;
-- 	Acá recibirás un error por intentar rebajar el stock de una pizza cuyo stock es 0
ROLLBACK TO checkpoint;
COMMIT;

--	Si revisamos la tabla de ventas veremos lo siguiente.
--		__________________ _________________ ___________ ______
--		| cliente		| fecha 		| monto	| pizza|
--		__________________ _________________ ___________ ______
--		| Juan Bravo	|   2020-02-02	| 15000	| 2	 |
--		__________________ _________________ ___________ ______


--	Comprobamos entonces que se registró esa venta sin problemas y si revisamos la tabla pizzas obtendremos lo sgte.
--		____________ ___________ ___________ _______________________
--		|  id(PK)	| stock 	| costo	| nombre			|
--		____________ ___________ ___________ _______________________
--		|	1	|   	0	| 12000 	| Uhlalá			|
--		____________ ___________ ___________ _______________________
-- 		|   	2	|	1	| 15000	| Jamón a todo dar	|
--		____________ ___________ ___________ _______________________

--	En donde confirmamos que se rebajó la pizza de id 2 pero por supuesto no cambió la pizza
--	de id 1 pues esta fue la que nos dió problemas en la transacción.

-- 8. Exportar la base de datos “pizzeria” como un archivo pizzeria.sql.
-- \q
pg_dump -U postgres pizzeria > "C:\Users\cpbah\OneDrive\Escritorio\pizzeria.respaldo.bck"

-- 9. Eliminar la base de datos “pizzeria”.
DROP DATABASE Pizzeria;

-- 10. Importar el archivo pizzeria.sql.
-- 	Deberíamos crear de nuevo la base de datos y posteriormente importar
--  	nuestro archivo pizzeria.sql, exportado en el paso 8
CREATE DATABASE pizzeria
$ sudo su - postgres
$ psql -U postgres pizzas < "C:\Users\cpbah\OneDrive\Escritorio\pizzderia.respaldo.bck"




