--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-07-04 12:30:04 COT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 176 (class 3079 OID 11645)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1940 (class 0 OID 0)
-- Dependencies: 176
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 17266)
-- Dependencies: 5
-- Name: countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    code character(3) NOT NULL,
    name character varying(50) NOT NULL,
    location point
);


--
-- TOC entry 161 (class 1259 OID 17264)
-- Dependencies: 162 5
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1941 (class 0 OID 0)
-- Dependencies: 161
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- TOC entry 168 (class 1259 OID 17306)
-- Dependencies: 5
-- Name: identifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE identifications (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    description character varying(50) NOT NULL
);


--
-- TOC entry 167 (class 1259 OID 17304)
-- Dependencies: 5 168
-- Name: identifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE identifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1942 (class 0 OID 0)
-- Dependencies: 167
-- Name: identifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE identifications_id_seq OWNED BY identifications.id;


--
-- TOC entry 166 (class 1259 OID 17291)
-- Dependencies: 5
-- Name: municipalities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE municipalities (
    id integer NOT NULL,
    code character(5) NOT NULL,
    name character varying(50) NOT NULL,
    location point,
    province_code character(2) NOT NULL
);


--
-- TOC entry 165 (class 1259 OID 17289)
-- Dependencies: 5 166
-- Name: municipalities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE municipalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1943 (class 0 OID 0)
-- Dependencies: 165
-- Name: municipalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE municipalities_id_seq OWNED BY municipalities.id;


--
-- TOC entry 175 (class 1259 OID 17363)
-- Dependencies: 5
-- Name: phone_provider; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE phone_provider (
    provider_id integer,
    phones_id integer
);


--
-- TOC entry 174 (class 1259 OID 17351)
-- Dependencies: 5
-- Name: phones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE phones (
    id integer NOT NULL,
    phone character varying(80) NOT NULL,
    phone_type integer
);


--
-- TOC entry 173 (class 1259 OID 17349)
-- Dependencies: 174 5
-- Name: phones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE phones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1944 (class 0 OID 0)
-- Dependencies: 173
-- Name: phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE phones_id_seq OWNED BY phones.id;


--
-- TOC entry 172 (class 1259 OID 17343)
-- Dependencies: 5
-- Name: phones_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE phones_type (
    id integer NOT NULL,
    name character varying(50)
);


--
-- TOC entry 171 (class 1259 OID 17341)
-- Dependencies: 5 172
-- Name: phones_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE phones_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1945 (class 0 OID 0)
-- Dependencies: 171
-- Name: phones_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE phones_type_id_seq OWNED BY phones_type.id;


--
-- TOC entry 170 (class 1259 OID 17314)
-- Dependencies: 5
-- Name: providers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE providers (
    id integer NOT NULL,
    name text NOT NULL,
    identification_id integer NOT NULL,
    identification character varying(50) NOT NULL,
    country_code character(3),
    municipality_code character varying(5),
    address text,
    email character varying(100),
    website character varying(100)
);


--
-- TOC entry 169 (class 1259 OID 17312)
-- Dependencies: 5 170
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1946 (class 0 OID 0)
-- Dependencies: 169
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE providers_id_seq OWNED BY providers.id;


--
-- TOC entry 164 (class 1259 OID 17276)
-- Dependencies: 5
-- Name: provinces; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE provinces (
    id integer NOT NULL,
    code character(2) NOT NULL,
    name character varying(50) NOT NULL,
    location point,
    country_code character(3)
);


--
-- TOC entry 163 (class 1259 OID 17274)
-- Dependencies: 5 164
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1947 (class 0 OID 0)
-- Dependencies: 163
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE provinces_id_seq OWNED BY provinces.id;


--
-- TOC entry 1893 (class 2604 OID 17269)
-- Dependencies: 161 162 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- TOC entry 1896 (class 2604 OID 17309)
-- Dependencies: 167 168 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY identifications ALTER COLUMN id SET DEFAULT nextval('identifications_id_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 17294)
-- Dependencies: 166 165 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY municipalities ALTER COLUMN id SET DEFAULT nextval('municipalities_id_seq'::regclass);


--
-- TOC entry 1899 (class 2604 OID 17354)
-- Dependencies: 173 174 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY phones ALTER COLUMN id SET DEFAULT nextval('phones_id_seq'::regclass);


--
-- TOC entry 1898 (class 2604 OID 17346)
-- Dependencies: 172 171 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY phones_type ALTER COLUMN id SET DEFAULT nextval('phones_type_id_seq'::regclass);


--
-- TOC entry 1897 (class 2604 OID 17317)
-- Dependencies: 169 170 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY providers ALTER COLUMN id SET DEFAULT nextval('providers_id_seq'::regclass);


--
-- TOC entry 1894 (class 2604 OID 17279)
-- Dependencies: 163 164 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY provinces ALTER COLUMN id SET DEFAULT nextval('provinces_id_seq'::regclass);


--
-- TOC entry 1901 (class 2606 OID 17273)
-- Dependencies: 162 162 1934
-- Name: countries_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- TOC entry 1903 (class 2606 OID 17271)
-- Dependencies: 162 162 1934
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (code);


--
-- TOC entry 1913 (class 2606 OID 17311)
-- Dependencies: 168 168 1934
-- Name: identifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY identifications
    ADD CONSTRAINT identifications_pkey PRIMARY KEY (id);


--
-- TOC entry 1909 (class 2606 OID 17296)
-- Dependencies: 166 166 1934
-- Name: municipalities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY municipalities
    ADD CONSTRAINT municipalities_pkey PRIMARY KEY (code);


--
-- TOC entry 1911 (class 2606 OID 17298)
-- Dependencies: 166 166 1934
-- Name: municipalities_province_code_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY municipalities
    ADD CONSTRAINT municipalities_province_code_key UNIQUE (province_code);


--
-- TOC entry 1923 (class 2606 OID 17356)
-- Dependencies: 174 174 1934
-- Name: phones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- TOC entry 1920 (class 2606 OID 17348)
-- Dependencies: 172 172 1934
-- Name: phones_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY phones_type
    ADD CONSTRAINT phones_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1916 (class 2606 OID 17324)
-- Dependencies: 170 170 1934
-- Name: providers_identification_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_identification_key UNIQUE (identification);


--
-- TOC entry 1918 (class 2606 OID 17322)
-- Dependencies: 170 170 1934
-- Name: providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- TOC entry 1905 (class 2606 OID 17283)
-- Dependencies: 164 164 1934
-- Name: provinces_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_name_key UNIQUE (name);


--
-- TOC entry 1907 (class 2606 OID 17281)
-- Dependencies: 164 164 1934
-- Name: provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (code);


--
-- TOC entry 1924 (class 1259 OID 17366)
-- Dependencies: 175 175 1934
-- Name: i_phone_provider; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_phone_provider ON phone_provider USING btree (provider_id, phones_id);


--
-- TOC entry 1921 (class 1259 OID 17362)
-- Dependencies: 174 1934
-- Name: i_phones; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_phones ON phones USING btree (phone);


--
-- TOC entry 1914 (class 1259 OID 17340)
-- Dependencies: 170 1934
-- Name: i_providers; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_providers ON providers USING btree (identification);


--
-- TOC entry 1926 (class 2606 OID 17299)
-- Dependencies: 1906 164 166 1934
-- Name: municipalities_province_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY municipalities
    ADD CONSTRAINT municipalities_province_code_fkey FOREIGN KEY (province_code) REFERENCES provinces(code) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1930 (class 2606 OID 17357)
-- Dependencies: 1919 172 174 1934
-- Name: phone_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY phones
    ADD CONSTRAINT phone_type_fk FOREIGN KEY (phone_type) REFERENCES phones_type(id);


--
-- TOC entry 1932 (class 2606 OID 17372)
-- Dependencies: 1922 175 174 1934
-- Name: phones_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY phone_provider
    ADD CONSTRAINT phones_id_fk FOREIGN KEY (phones_id) REFERENCES phones(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1931 (class 2606 OID 17367)
-- Dependencies: 175 1917 170 1934
-- Name: provider_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY phone_provider
    ADD CONSTRAINT provider_id_fk FOREIGN KEY (provider_id) REFERENCES providers(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1927 (class 2606 OID 17325)
-- Dependencies: 170 162 1902 1934
-- Name: providers_country_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_country_code_fkey FOREIGN KEY (country_code) REFERENCES countries(code);


--
-- TOC entry 1929 (class 2606 OID 17335)
-- Dependencies: 170 168 1912 1934
-- Name: providers_identification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_identification_id_fkey FOREIGN KEY (identification_id) REFERENCES identifications(id);


--
-- TOC entry 1928 (class 2606 OID 17330)
-- Dependencies: 170 166 1908 1934
-- Name: providers_municipality_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_municipality_code_fkey FOREIGN KEY (municipality_code) REFERENCES municipalities(code);


--
-- TOC entry 1925 (class 2606 OID 17284)
-- Dependencies: 1902 162 164 1934
-- Name: provinces_country_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_country_code_fkey FOREIGN KEY (country_code) REFERENCES countries(code) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1939 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-07-04 12:30:11 COT

--
-- PostgreSQL database dump complete
--

