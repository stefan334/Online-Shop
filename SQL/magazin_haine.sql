 -- Table: public.produse

 DROP TABLE IF EXISTS public.produse;

CREATE TABLE IF NOT EXISTS public.produse
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    description character varying(400) COLLATE pg_catalog."default",
    price numeric NOT NULL,
    imag character varying COLLATE pg_catalog."default",
    category character varying[] COLLATE pg_catalog."default",
    size character varying COLLATE pg_catalog."default",
    stock integer,
    added_on date,
    color character varying COLLATE pg_catalog."default",
    materials character varying[] COLLATE pg_catalog."default",
    is_imported boolean NOT NULL DEFAULT false,
    CONSTRAINT produse_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.produse
    OWNER to postgres;

CREATE USER ivan334 WITH ENCRYPTED PASSWORD 'stefan334';
GRANT ALL PRIVILEGES ON DATABASE magazin_haine TO ivan;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public to ivan;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO ivan;

INSERT INTO public.produse(
	name, description, price, imag, category, size, stock, added_on, color, materials)
	VALUES ('Jeans Rupti', 'Jeans rupti in genunchi pentru femei', 210, 'jeans_rupti_femei.jpg', '{Blugi}', 'M', 200, '12/19/2021', 'Albastru', '{Denim}'),
	('Jeans', 'Jeans pentru femei', 200, 'jeans_rupti_femei2.jpg', '{Blugi}', 'M', 200, '12/19/2021', 'Albastru', '{Denim}'),
	('Jeans', 'Jeans albastru deschis pentru femei', 210, 'jeans_deschisi.jpg', '{Blugi}', 'M', 200, '12/19/2021', 'Albastru Deschis', '{Denim}'),
	('Tricou', 'Tricou cu maneca scurta alb pentru femei', 210, 'tricou_alb.jpg', '{Tricouri si Maieuri}', 'M', 200, '12/19/2021', 'Alb', '{Bumbac}'),
	('Pulover', 'Pulover maro de vara pentru femei', 210, 'pulover.jpg', '{Bluze si Pulovere}', 'M', 200, '12/13/2021', 'Maro', '{Fibra sintetica}'),
	('Pulover Turtle-neck', 'Pulover maro tip turtle-neck', 110, 'pulover_maro.jpg', '{Bluze si Pulovere}', 'S', 300, '12/16/2021', 'Maro', '{Bumbac}'),
	('Fular in carouri', 'Fular in carouri rosu si negru', 80, 'fular_carouri.jpg', '{Accesorii}', 'S', 250, '12/19/2021', 'Rosu si negru', '{Bumbac}'),
	('Geaca Denim', 'Geaca Denim albastra pentru femei', 180, 'geaca_blugi.jpg', '{Hanorace si Geci}', 'L', 320, '12/19/2021', 'Albastru', '{Denim}'),
	('Pulover Split-color', 'Pulover in 2 culori pentru femei', 120, 'pulover_multicolor.jpg', '{Bluze si Pulovere}', 'S', 360, '10/19/2021', 'Roz si Grena', '{Bumbac}'),
	('Palton', 'Palton rosu aprins pentru femei', 450, 'palton.jpg', '{Hanorace si Geci}', 'L', 125, '12/19/2021', 'Rosu', '{Piele intoarsa, Piele}'),
	('Palton', 'Palton pentru femei', 180, 'palton2.jpg', '{Hanorace si Geci}', 'M', 2000, '12/19/2021', 'Gri', '{Lana}'),
	('Hanorac', 'Hanorac roz pentru femei', 150, 'hanorac.jpg', '{Hanorace si Geci}', 'S', 2500, '12/19/2021', 'Roz', '{Bumbac}'),
	('Pulover', 'Pulover verde pentru femei', 220, 'pulover2.jpg', '{Bluze si Pulovere}', 'M', 2020, '12/20/2021', 'Verde', '{Tricot}'),
	('Rochie Model Floral', 'Rochie cu model floral pentru femei', 240, 'rochie.jpg', '{Rochii}', 'M', 1110, '11/19/2021', 'Alb', '{In}'),
	('Fular', 'Fular albastru pentru femei', 100, 'fular.jpg', '{Accesorii}', 'M', 200, '10/19/2021', 'Albastru', '{Lana}'),
	('Rochie', 'Rochie pentru femei', 220, 'rochie2.jpg', '{Rochii}', 'S', 2021, '11/19/2021', 'Alb', '{In}');
