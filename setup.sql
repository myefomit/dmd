--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authors (
    author_id integer DEFAULT nextval('author_id_seq'::regclass) NOT NULL,
    name character varying(255),
    surname character varying(255)
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: connection; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE connection (
    pub_id integer,
    author_id integer
);


ALTER TABLE public.connection OWNER TO postgres;

--
-- Name: keywords; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE keywords (
    pub_id integer,
    keywords character varying(255)
);


ALTER TABLE public.keywords OWNER TO postgres;

--
-- Name: pub_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pub_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pub_id_seq OWNER TO postgres;

--
-- Name: publications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE publications (
    pub_id integer DEFAULT nextval('pub_id_seq'::regclass) NOT NULL,
    title character varying(255),
    theme character varying(255),
    category character varying(255),
    journal character varying(255),
    link character varying(255)
);


ALTER TABLE public.publications OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('author_id_seq', 1, false);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authors (author_id, name, surname) FROM stdin;
\.


--
-- Data for Name: connection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY connection (pub_id, author_id) FROM stdin;
\.


--
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY keywords (pub_id, keywords) FROM stdin;
\.


--
-- Name: pub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pub_id_seq', 1, false);


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY publications (pub_id, title, theme, category, journal, link) FROM stdin;
\.


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: publications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (pub_id);


--
-- Name: connection_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY connection
    ADD CONSTRAINT connection_author_id_fkey FOREIGN KEY (author_id) REFERENCES authors(author_id);


--
-- Name: connection_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY connection
    ADD CONSTRAINT connection_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES publications(pub_id);


--
-- Name: keywords_pub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY keywords
    ADD CONSTRAINT keywords_pub_id_fkey FOREIGN KEY (pub_id) REFERENCES publications(pub_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

