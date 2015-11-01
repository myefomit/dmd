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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: article_authors; Type: TABLE; Schema: public; Owner: timofey; Tablespace: 
--

CREATE TABLE article_authors (
    id character varying(20),
    aid integer
);


ALTER TABLE article_authors OWNER TO timofey;

--
-- Name: article_categories; Type: TABLE; Schema: public; Owner: timofey; Tablespace: 
--

CREATE TABLE article_categories (
    id character varying(20),
    cid integer
);


ALTER TABLE article_categories OWNER TO timofey;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE articles (
    id character varying(20) NOT NULL,
    title character varying(255),
    year integer,
    link character varying(255),
    summary character varying(255),
    lexemes tsvector
);


ALTER TABLE articles OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE author_id_seq OWNER TO postgres;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authors (
    aid integer DEFAULT nextval('author_id_seq'::regclass) NOT NULL,
    name character varying(255)
);


ALTER TABLE authors OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_id_seq OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    cid integer DEFAULT nextval('category_id_seq'::regclass) NOT NULL,
    category character varying(255)
);


ALTER TABLE categories OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: timofey; Tablespace: 
--

CREATE TABLE users (
    login character varying(250) NOT NULL,
    password_hash text,
    is_admin boolean
);


ALTER TABLE users OWNER TO timofey;

--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (aid);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (cid);


--
-- Name: unique_author; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT unique_author UNIQUE (name);


--
-- Name: unique_category; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT unique_category UNIQUE (category);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: timofey; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (login);


--
-- Name: articles_lexemes_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX articles_lexemes_idx ON articles USING gin (lexemes);


--
-- Name: articles_year_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX articles_year_idx ON articles USING btree (year);


--
-- Name: authors_name_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX authors_name_idx ON authors USING btree (name);


--
-- Name: article_authors_aid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: timofey
--

ALTER TABLE ONLY article_authors
    ADD CONSTRAINT article_authors_aid_fkey FOREIGN KEY (aid) REFERENCES authors(aid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: article_authors_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: timofey
--

ALTER TABLE ONLY article_authors
    ADD CONSTRAINT article_authors_id_fkey FOREIGN KEY (id) REFERENCES articles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: article_categories_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: timofey
--

ALTER TABLE ONLY article_categories
    ADD CONSTRAINT article_categories_cid_fkey FOREIGN KEY (cid) REFERENCES categories(cid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: article_categories_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: timofey
--

ALTER TABLE ONLY article_categories
    ADD CONSTRAINT article_categories_id_fkey FOREIGN KEY (id) REFERENCES articles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: timofey
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM timofey;
GRANT ALL ON SCHEMA public TO timofey;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

