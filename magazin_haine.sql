--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2021-12-22 17:14:26

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16412)
-- Name: produse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produse (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(400),
    price numeric NOT NULL,
    imag character varying,
    category character varying[],
    size character varying,
    stock integer,
    added_on date,
    color character varying,
    materials character varying[],
    is_imported boolean DEFAULT false NOT NULL
);


ALTER TABLE public.produse OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16411)
-- Name: produse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.produse ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.produse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3307 (class 0 OID 16412)
-- Dependencies: 210
-- Data for Name: produse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (10, 'Fular in carouri', 'Fular in carouri rosu si negru', 80, 'fular_carouri.jpg', '{Accesorii}', 'S', 250, '2021-12-19', 'Rosu si negru', '{Bumbac}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (17, 'Rochie Model Floral', 'Rochie cu model floral pentru femei', 240, 'rochie.jpg', '{Rochii}', 'M', 1110, '2021-11-19', 'Alb', '{In}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (18, 'Fular', 'Fular albastru pentru femei', 100, 'fular.jpg', '{Accesorii}', 'M', 200, '2021-10-19', 'Albastru', '{Lana}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (19, 'Rochie', 'Rochie pentru femei', 220, 'rochie2.jpg', '{Rochii}', 'S', 2021, '2021-11-19', 'Alb', '{In}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (6, 'Tricou', 'Tricou cu maneca scurta alb pentru femei', 210, 'tricou_alb.jpg', '{"Tricouri si Maieuri"}', 'M', 200, '2021-12-19', 'Alb', '{Bumbac}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (7, 'Pulover', 'Pulover maro de vara pentru femei', 210, 'pulover.jpg', '{"Bluze si Pulovere"}', 'M', 200, '2021-12-13', 'Maro', '{"Fibra sintetica"}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (9, 'Pulover Turtle-neck', 'Pulover maro tip turtle-neck', 110, 'pulover_maro.jpg', '{"Bluze si Pulovere"}', 'S', 300, '2021-12-16', 'Maro', '{Bumbac}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (11, 'Geaca Denim', 'Geaca Denim albastra pentru femei', 180, 'geaca_blugi.jpg', '{"Hanorace si Geci"}', 'L', 320, '2021-12-19', 'Albastru', '{Denim}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (12, 'Pulover Split-color', 'Pulover in 2 culori pentru femei', 120, 'pulover_multicolor.jpg', '{"Bluze si Pulovere"}', 'S', 360, '2021-10-19', 'Roz si Grena', '{Bumbac}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (13, 'Palton', 'Palton rosu aprins pentru femei', 450, 'palton.jpg', '{"Hanorace si Geci"}', 'L', 125, '2021-12-19', 'Rosu', '{"Piele intoarsa",Piele}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (14, 'Palton', 'Palton pentru femei', 180, 'palton2.jpg', '{"Hanorace si Geci"}', 'M', 2000, '2021-12-19', 'Gri', '{Lana}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (15, 'Hanorac', 'Hanorac roz pentru femei', 150, 'hanorac.jpg', '{"Hanorace si Geci"}', 'S', 2500, '2021-12-19', 'Roz', '{Bumbac}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (16, 'Pulover', 'Pulover verde pentru femei', 220, 'pulover2.jpg', '{"Bluze si Pulovere"}', 'M', 2020, '2021-12-20', 'Verde', '{Tricot}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (2, 'Sapca', 'Sapca roz pentru femei', 60, 'sapca_roz.jpg', '{Accesorii}', 'M', 30, '2021-12-19', 'Roz', '{Textil}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (3, 'Jeans Rupti', 'Jeans rupti in genunchi pentru femei', 210, 'jeans_rupti_femei.jpg', '{Pantaloni}', 'M', 200, '2021-12-19', 'Albastru', '{Denim}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (4, 'Jeans', 'Jeans pentru femei', 200, 'jeans_rupti_femei2.jpg', '{Pantaloni}', 'M', 200, '2021-12-19', 'Albastru', '{Denim}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (5, 'Jeans', 'Jeans albastru deschis pentru femei', 210, 'jeans_deschisi.jpg', '{Pantaloni}', 'M', 200, '2021-12-19', 'Albastru Deschis', '{Denim}', false);
INSERT INTO public.produse (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (1, 'Hanorac NULL', 'Hanorac de barbati cu logo-ul NULL, 80% cotton', 120, 'hanorac_roz.jpg', '{"Hanorace si Geci"}', 'M', 100, '2021-12-19', 'Roz', '{cotton,textil}', true);


--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 209
-- Name: produse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produse_id_seq', 19, true);


--
-- TOC entry 3166 (class 2606 OID 16419)
-- Name: produse produse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produse
    ADD CONSTRAINT produse_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE produse; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.produse TO ivan;
GRANT ALL ON TABLE public.produse TO ivan334;


--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 209
-- Name: SEQUENCE produse_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.produse_id_seq TO ivan;
GRANT ALL ON SEQUENCE public.produse_id_seq TO ivan334;


-- Completed on 2021-12-22 17:14:26

--
-- PostgreSQL database dump complete
--

