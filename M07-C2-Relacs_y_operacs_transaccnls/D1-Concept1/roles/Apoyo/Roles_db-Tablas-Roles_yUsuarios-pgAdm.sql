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
