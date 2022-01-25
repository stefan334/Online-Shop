--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-26 00:46:50

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

--
-- TOC entry 830 (class 1247 OID 24577)
-- Name: roluri; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.roluri AS ENUM (
    'admin',
    'moderator',
    'comun'
);


ALTER TYPE public.roluri OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 24658)
-- Name: accesari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accesari (
    id integer NOT NULL,
    ip character varying(100) NOT NULL,
    user_id integer,
    pagina character varying(500) NOT NULL,
    data_accesare timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.accesari OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24657)
-- Name: accesari_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accesari_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accesari_id_seq OWNER TO postgres;

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 213
-- Name: accesari_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accesari_id_seq OWNED BY public.accesari.id;


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
-- TOC entry 212 (class 1259 OID 24643)
-- Name: utilizatori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilizatori (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    nume character varying(100) NOT NULL,
    prenume character varying(100) NOT NULL,
    parola character varying(500) NOT NULL,
    rol public.roluri DEFAULT 'comun'::public.roluri NOT NULL,
    email character varying(100) NOT NULL,
    culoare_chat character varying(50) DEFAULT 'black'::character varying NOT NULL,
    data_adaugare timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    cod character varying(200),
    confirmat_mail boolean DEFAULT false,
    tema_site character varying(50),
    imagine character varying(50)
);


ALTER TABLE public.utilizatori OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24642)
-- Name: utilizatori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilizatori_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilizatori_id_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 211
-- Name: utilizatori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilizatori_id_seq OWNED BY public.utilizatori.id;


--
-- TOC entry 3183 (class 2604 OID 24661)
-- Name: accesari id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accesari ALTER COLUMN id SET DEFAULT nextval('public.accesari_id_seq'::regclass);


--
-- TOC entry 3178 (class 2604 OID 24646)
-- Name: utilizatori id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizatori ALTER COLUMN id SET DEFAULT nextval('public.utilizatori_id_seq'::regclass);


--
-- TOC entry 3338 (class 0 OID 24658)
-- Dependencies: 214
-- Data for Name: accesari; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11706, '::1', NULL, '/Resources/Images/favicon.png', '2022-01-26 00:57:42.776302');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11707, '::1', NULL, '/Resources/Images/background1.jpg', '2022-01-26 00:57:48.711952');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11708, '::1', NULL, '/', '2022-01-26 00:57:48.875655');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11709, '::1', NULL, '/Resources/Css/style.css', '2022-01-26 00:57:49.501847');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11710, '::1', NULL, '/Resources/Css/galerie_animata.css', '2022-01-26 00:57:49.506949');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11711, '::ffff:127.0.0.1', NULL, '/Resources/Images/background1.jpg', '2022-01-26 00:57:49.655628');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11712, '::1', NULL, '/Resources/Images/Galerie/hanorac_negru.jpg', '2022-01-26 00:57:49.659672');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11713, '::1', NULL, '/Resources/Images/Galerie/sapca_roz.jpg', '2022-01-26 00:57:49.663195');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11714, '::1', NULL, '/Resources/Images/Galerie/jeans_barbati.jpg', '2022-01-26 00:57:49.666277');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11715, '::1', NULL, '/Resources/Images/Galerie/camasa.jpg', '2022-01-26 00:57:49.670668');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11716, '::ffff:127.0.0.1', NULL, '/Resources/Images/Galerie/camasa_flori.jpg', '2022-01-26 00:57:49.672124');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11717, '::1', NULL, '/Resources/Images/Galerie/camasa_imprimeu.jpg', '2022-01-26 00:57:49.674714');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11718, '::1', NULL, '/Resources/Images/Galerie/geaca_blugi.jpg', '2022-01-26 00:57:49.675343');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11719, '::1', NULL, '/Resources/Images/Galerie/palton_maro.jpg', '2022-01-26 00:57:49.676095');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11720, '::1', NULL, '/Resources/Images/Galerie/pulover_galben.jpg', '2022-01-26 00:57:49.676726');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11721, '::1', NULL, '/Resources/Images/shopping.jpg', '2022-01-26 00:57:49.677276');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11722, '::1', NULL, '/Resources/Images/favicon.png', '2022-01-26 00:57:49.691233');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11723, '::1', NULL, '/Resources/Tracks/captionRo.vtt', '2022-01-26 00:57:49.71144');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11724, '::1', NULL, '/Resources/Images/favicon.png', '2022-01-26 00:57:51.41332');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11725, '::1', NULL, '/Resources/Images/background1.jpg', '2022-01-26 00:57:55.842247');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11726, '::1', NULL, '/inregistrare', '2022-01-26 01:09:35.342174');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11727, '::1', NULL, '/Resources/Css/style.css', '2022-01-26 01:09:35.460332');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11728, '::1', NULL, '/Resources/js/inregistrare.js', '2022-01-26 01:09:35.466469');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11729, '::1', NULL, '/Resources/Images/background_reg.jpg', '2022-01-26 01:09:35.604493');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11730, '::1', NULL, '/Resources/Images/favicon.png', '2022-01-26 01:09:35.606461');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11731, '::1', NULL, '/inreg', '2022-01-26 01:09:49.574917');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11732, '::1', NULL, '/Resources/Css/style.css', '2022-01-26 01:09:49.676432');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11733, '::1', NULL, '/Resources/js/inregistrare.js', '2022-01-26 01:09:49.681382');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11734, '::1', NULL, '/Resources/Images/background_reg.jpg', '2022-01-26 01:09:49.775155');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) VALUES (11735, '::1', NULL, '/Resources/Images/favicon.png', '2022-01-26 01:09:49.807017');


--
-- TOC entry 3334 (class 0 OID 16412)
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
-- TOC entry 3336 (class 0 OID 24643)
-- Dependencies: 212
-- Data for Name: utilizatori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (11, 'test1', 'Gogulescu', 'Gogu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'profprofprof007@gmail.com', 'black', '2022-01-25 17:30:56.636449', '1643124656634nHnmlWlSujAXh1d4qbZnvXNMZDkvR9KAhSyX9L9SnjE7', true, NULL, './poze_uploadate/test1/poza');
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (12, 'test2', 'Gogulescu', 'Gogu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'profprofprof007@gmail.com', 'black', '2022-01-25 17:33:17.349393', '1643124797348eJUkdwE3dOeFCxN2TFNJcP75HrxpIuHj9FyFY6nPIO6AEwPkQlW', true, NULL, './Resources/poze_uploadate/test2/poza.jpg');
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (3, 'prof50771', 'Gogulescu', 'Gogu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-24 03:19:25.335998', '1642987165334uGKgZn8ei39AoWbSrEr24AbiulnwmXgTuaNGz8K5hiAKIBkWSO0', true, NULL, NULL);
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (5, 'prof13749', 'Gogulescu', 'Gogu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'cora02022003@gmail.com', 'black', '2022-01-24 03:25:32.590852', '1642987532589Hstaso5vKI113DhVPM7cNgthnVO4SRK6reFC4lqT2yAG', false, NULL, NULL);
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (6, 'prof57672', 'Gogulescu', 'Gogu', '95e66894cc269db7d5839db351a6d063c3367078cd82614999941bb34539db7f', 'comun', 'stefan.ivan334@gmail.com', 'blue', '2022-01-24 13:05:45.467949', '1643022345467CNTs0p8KI7LgrQCiiA2pFp6S3rlcYoRtV7YFOunqhzi', true, NULL, NULL);
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (7, '444', 'Stefan', 'Ivan', '9ab1002d236723fbbb741e5edec989b9c3d2145edd30d66817dd8de2fec60d5b', 'admin', 'profprofprof007@gmail.com', 'black', '2022-01-24 13:08:25.991418', '1643022505990cskZz7g6U1T1GhOlTSHdENnVsV2bVGz1hNf64iMtSn0', true, NULL, NULL);
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (8, 'stefan334', 'Ivan', 'Stefan-Alexandru', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'admin', 'stefan.ivan334@gmail.com', 'black', '2022-01-24 13:11:35.955017', '1643022695954PQHIrBqazc0Jp00h0w8kqOzTfca7LpEiNuBaJ9BIZHe3GVWOBy4', true, NULL, './Resources/poze_uploadate/stefan334/poza.jpg');
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (13, 'admin', 'Admin', 'Admin', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-25 20:26:30.185136', '1643135190183U8W7wBLmJqJ9cvGVoG8RvFDtM4sgNaCmiHCbDBAwKE', false, NULL, './poze_uploadate/admin/poza.jpg');
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (14, 'admin1', 'ADMIN', 'Admin', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-25 20:28:17.725804', '164313529772419XWpKwjPzerUK6jFW6CNT1AJWLQnJtachfsmlnBfmNsgeDBsBh', false, NULL, './poze_uploadate/admin1/poza.jpg');
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (1, 'prof13223', 'Gogulescu', 'Gogu', '87872cf52f05d9261c645b6460316a74da1e03e773fbefd36ea1a21804fa8dc9', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-24 03:05:08.387532', 'lUilnuXHJp0t8BEdkjzJn7y2SmKg50a5dQx8uR15jRggl7g9sfb1ITAaxVwRohEC0aEIGKeRjQy4kA6AgMYsr7IlfK7IKQRMkT5s', true, NULL, NULL);
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (9, 'theo', 'Georgescu', 'Theodora', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'theogeorg@gmail.com', 'black', '2022-01-25 17:22:22.390365', '1643124142389kYfLolb17K4j8h9XYSeSxz0e2AMKZvuYjW609ECmmHeYoNzc1Q', true, NULL, NULL);
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (10, 'theutzzz', 'Georgescu', 'Theo', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'theodorageorg@gmail.com', 'black', '2022-01-25 17:25:41.080717', '1643124341079DNPhvhCH9U2NVF4NwRgPRJ2NZQfoySxNbe86T68ugDZx3ZwLbU', true, NULL, NULL);
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (15, 'admin2', 'Admin', 'Goguleanu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-25 20:29:12.363047', '1643135352361xeL2UnFECwSVbOLVkxjGr66iDWEvj00Ei9l5qGG6Qmb9D', true, NULL, '/Resources/poze_uploadate/admin2/poza.jpg');


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 213
-- Name: accesari_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accesari_id_seq', 11735, true);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 209
-- Name: produse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produse_id_seq', 19, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 211
-- Name: utilizatori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilizatori_id_seq', 15, true);


--
-- TOC entry 3192 (class 2606 OID 24666)
-- Name: accesari accesari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accesari
    ADD CONSTRAINT accesari_pkey PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 16419)
-- Name: produse produse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produse
    ADD CONSTRAINT produse_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 24654)
-- Name: utilizatori utilizatori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT utilizatori_pkey PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 24656)
-- Name: utilizatori utilizatori_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT utilizatori_username_key UNIQUE (username);


--
-- TOC entry 3193 (class 2606 OID 24667)
-- Name: accesari accesari_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accesari
    ADD CONSTRAINT accesari_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.utilizatori(id);


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE accesari; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.accesari TO ivan;
GRANT ALL ON TABLE public.accesari TO ivan334;


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 213
-- Name: SEQUENCE accesari_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.accesari_id_seq TO ivan334;


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE produse; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.produse TO ivan;
GRANT ALL ON TABLE public.produse TO ivan334;


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 209
-- Name: SEQUENCE produse_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.produse_id_seq TO ivan;
GRANT ALL ON SEQUENCE public.produse_id_seq TO ivan334;


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE utilizatori; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.utilizatori TO ivan;
GRANT ALL ON TABLE public.utilizatori TO ivan334;


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 211
-- Name: SEQUENCE utilizatori_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.utilizatori_id_seq TO ivan334;


-- Completed on 2022-01-26 00:46:50

--
-- PostgreSQL database dump complete
--

