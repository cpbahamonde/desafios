-- La información consultada proviene de “INFORMATION_SCHEMA.COLUMNS” 
-- y este comando SQL nos entrega detalles de nuestros modelos. 
-- Puede ser ejecutado dentro de cualquier base de datos.


SELECT
	t1.TABLE_NAME AS tabla_nombre,
	t1.COLUMN_NAME AS columna_nombre,
	t1.ORDINAL_POSITION AS position,
	t1.IS_NULLABLE AS nulo,
	t1.DATA_TYPE AS tipo_dato,
	COALESCE(t1.NUMERIC_PRECISION,
	t1.CHARACTER_MAXIMUM_LENGTH) AS longitud
FROM
	INFORMATION_SCHEMA.COLUMNS t1
WHERE
	t1.TABLE_SCHEMA = 'public'
ORDER BY
	t1.TABLE_NAME;