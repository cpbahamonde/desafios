-- Creacion BDatos
-- DROP DATABASE IF EXISTS Biblioteca;
-- CREATE DATABASE Biblioteca; 

-- Creacion Tablas
CREATE TABLE IF NOT EXISTS public.Socios
(
    rut character varying(12),
    nom_compl character varying,
    direccion character varying,
    fono character varying,
    PRIMARY KEY (rut)
);

CREATE TABLE IF NOT EXISTS public.Libros
(
    isbn character varying(17) NOT NULL,
    pag character varying,
    titulo character varying,
    PRIMARY KEY (isbn)
);

CREATE TABLE IF NOT EXISTS public.Autores
(
    id_autor numeric NOT NULL,
    nom_compl character varying,
    tipo_autor character varying,
    anyo_nac numeric(4),
    anyo_fall numeric(4),
    isbn_libros character varying(17),
    CONSTRAINT "Autores(isbn_libro) -> Libros(isbn)" 
    FOREIGN KEY (isbn_libros)
    REFERENCES public.Libros (isbn) 
);

CREATE TABLE IF NOT EXISTS public.Hist_prestms
(
    id_prestm serial NOT NULL,
    fech_ini date,
    fech_fin_estim date,
    fech_fin_real date,
    rut_socio character varying(12),
    isbn_libros character varying(17),
    PRIMARY KEY (id_prestm),
    CONSTRAINT "Hist_prestms(rut_socio) -> Socios(rut)" 
    FOREIGN KEY (rut_socio)
    REFERENCES public.Socios (rut),
    CONSTRAINT "Hist_prestms(isbn_libros) -> Libros(isbn)" 
    FOREIGN KEY (isbn_libros)
    REFERENCES public.Libros (isbn)
);

CREATE TABLE IF NOT EXISTS public.Multas
(
    id_multa serial NOT NULL,
    activa character varying(3) NOT NULL,
    precio numeric,
    dias_atraso numeric,
    monto numeric,
    rut_socios character varying(12),
    id_prestms integer,
    CONSTRAINT "Multas(rut_socio) -> Socios(rut)" 
    FOREIGN KEY (rut_socios)
    REFERENCES public.Socios (rut),
    CONSTRAINT "Multas(id_prestms) -> Hist_prestms(id_prestms)" 
    FOREIGN KEY (id_prestms)
    REFERENCES public.Hist_prestms (id_prestm)
);