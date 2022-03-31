-- "C:\Users\cpbah\OneDrive\Escritorio\"


-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.


CREATE TABLE IF NOT EXISTS Roles
(
    id_rol serial,
    nombre character varying,
    descripc text,
    PRIMARY KEY (id_rol)
);

CREATE TABLE IF NOT EXISTS Usuarios
(
    rut character varying,
    nombre character varying,
    fono character varying,
    email character varying,
    genero character varying,
    fech_nac date,
    id_rol integer,
	FOREIGN KEY(id_rol) REFERENCES Roles(id_rol)
);

\copy Roles  FROM 'C:\Users\cpbah\OneDrive\Escritorio\roles.csv' csv header;


\copy Usuarios FROM 'C:\Users\cpbah\OneDrive\Escritorio\usuarios.csv' csv header;

