--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-27 12:47:19

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
-- TOC entry 203 (class 1255 OID 16423)
-- Name: changestatus(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.changestatus()
    LANGUAGE sql
    AS $$
UPDATE youcoders
SET is_accepted  = true
WHERE campus  = 'Youssoufia'
$$;


ALTER PROCEDURE public.changestatus() OWNER TO postgres;

--
-- TOC entry 206 (class 1255 OID 16427)
-- Name: countall(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.countall() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
n INTEGER;

BEGIN
SELECT COUNT(*) INTO n FROM youcoders;



return n;

END
$$;


ALTER FUNCTION public.countall() OWNER TO postgres;

--
-- TOC entry 205 (class 1255 OID 16425)
-- Name: emp_stamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.emp_stamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
       UPDATE youcoders SET is_accepted = false;
       RETURN NEW;
    END;
$$;


ALTER FUNCTION public.emp_stamp() OWNER TO postgres;

--
-- TOC entry 207 (class 1255 OID 16428)
-- Name: lasttg(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.lasttg() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
       UPDATE youcoders SET nbr_competence  = 15;
       RETURN NEW;
    END;
$$;


ALTER FUNCTION public.lasttg() OWNER TO postgres;

--
-- TOC entry 201 (class 1255 OID 16421)
-- Name: percetage(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.percetage(total integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
n INTEGER;
pe NUMERIC;
BEGIN
SELECT COUNT(*) INTO n FROM youcoders where campus='Safi' and classe = 'FEBE';

pe = (total * n)/100;

return pe;

END
$$;


ALTER FUNCTION public.percetage(total integer) OWNER TO postgres;

--
-- TOC entry 202 (class 1255 OID 16422)
-- Name: stsameref(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.stsameref(student character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
sClasse VARCHAR;
n INTEGER;

BEGIN
SELECT classe INTO sClasse FROM youcoders where full_name=student;

SELECT COUNT(*) INTO n FROM youcoders where classe=sClasse;




return n;

END
$$;


ALTER FUNCTION public.stsameref(student character varying) OWNER TO postgres;

--
-- TOC entry 204 (class 1255 OID 16424)
-- Name: updateclasse(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updateclasse()
    LANGUAGE sql
    AS $$
UPDATE youcoders
SET classe  = 'DATA BI'
WHERE nbr_competence=14 AND matricule LIKE '%2%'
$$;


ALTER PROCEDURE public.updateclasse() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 16415)
-- Name: youcoders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.youcoders (
    matricule character varying(4) NOT NULL,
    full_name character varying(15) NOT NULL,
    campus character varying(15) NOT NULL,
    classe character varying(15) NOT NULL,
    referentiel character varying(15) NOT NULL,
    nbr_competence numeric(5,0) DEFAULT 0,
    is_accepted boolean
);


ALTER TABLE public.youcoders OWNER TO postgres;

--
-- TOC entry 2990 (class 0 OID 16415)
-- Dependencies: 200
-- Data for Name: youcoders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.youcoders (matricule, full_name, campus, classe, referentiel, nbr_competence, is_accepted) FROM stdin;
P765	Mohammed ahmed	Safi	JEE	DWWM	15	f
P980	Don Reda	Safi	JEE	DWWM	15	f
P307	Zakaria zakaria	Safi	FEBE	CDA	15	f
P199	Omar omar	Safi	JEE	AI	15	f
P387	Houssam houssam	Safi	FEBE	CDA	15	f
P400	KAMAL BHF	Youssoufia	FEBE	CDA	15	f
P543	Salma Salma	Youssoufia	C#	AI	15	f
P566	Imane imane	Youssoufia	FEBE	CDA	15	f
P122	Amine amine	Safi	DATA BI	CDA	15	f
P202	Yassine yassine	Youssoufia	DATA BI	CDA	15	f
P286	HOMIR	SAFI	FEBE	CDA	15	f
P129	abdo	1	1	1	15	f
\.


--
-- TOC entry 2857 (class 2606 OID 16420)
-- Name: youcoders youcoders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youcoders
    ADD CONSTRAINT youcoders_pkey PRIMARY KEY (matricule);


--
-- TOC entry 2858 (class 2620 OID 16426)
-- Name: youcoders emp_stamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER emp_stamp AFTER INSERT ON public.youcoders FOR EACH ROW EXECUTE FUNCTION public.emp_stamp();


--
-- TOC entry 2859 (class 2620 OID 16429)
-- Name: youcoders lasttg; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER lasttg AFTER INSERT ON public.youcoders FOR EACH ROW EXECUTE FUNCTION public.lasttg();


-- Completed on 2021-04-27 12:47:19

--
-- PostgreSQL database dump complete
--

