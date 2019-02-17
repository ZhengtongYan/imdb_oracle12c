--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 11.1

--
-- Name: aka_name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE aka_name (
    id integer NOT NULL,
    person_id integer NOT NULL,
    name varchar(4000),
    imdb_index varchar(3),
    name_pcode_cf varchar(11),
    name_pcode_nf varchar(11),
    surname_pcode varchar(11),
    md5sum varchar(65)
);


--
-- Name: aka_title; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE aka_title (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    title varchar(4000),
    imdb_index varchar(4),
    kind_id integer NOT NULL,
    production_year integer,
    phonetic_code varchar(5),
    episode_of_id integer,
    season_nr integer,
    episode_nr integer,
    note varchar(72),
    md5sum varchar(32)
);


--
-- Name: cast_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cast_info (
    id integer NOT NULL,
    person_id integer NOT NULL,
    movie_id integer NOT NULL,
    person_role_id integer,
    note varchar(4000),
    nr_order integer,
    role_id integer NOT NULL
);


--
-- Name: char_name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE char_name (
    id integer NOT NULL,
    name varchar(4000) NOT NULL,
    imdb_index varchar(2),
    imdb_id integer,
    name_pcode_nf varchar(5),
    surname_pcode varchar(5),
    md5sum varchar(32)
);


--
-- Name: comp_cast_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE comp_cast_type (
    id integer NOT NULL,
    kind varchar(32) NOT NULL
);


--
-- Name: company_name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE company_name (
    id integer NOT NULL,
    name varchar(4000) NOT NULL,
    country_code varchar(6),
    imdb_id integer,
    name_pcode_nf varchar(5),
    name_pcode_sf varchar(5),
    md5sum varchar(32)
);


--
-- Name: company_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE company_type (
    id integer NOT NULL,
    kind varchar(32)
);


--
-- Name: complete_cast; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE complete_cast (
    id integer NOT NULL,
    movie_id integer,
    subject_id integer NOT NULL,
    status_id integer NOT NULL
);


--
-- Name: info_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE info_type (
    id integer NOT NULL,
    info varchar(32) NOT NULL
);


--
-- Name: keyword; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE keyword (
    id integer NOT NULL,
    keyword varchar(4000) NOT NULL,
    phonetic_code varchar(5)
);


--
-- Name: kind_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kind_type (
    id integer NOT NULL,
    kind varchar(15)
);


--
-- Name: link_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE link_type (
    id integer NOT NULL,
    link varchar(32) NOT NULL
);


--
-- Name: m_movie_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE m_movie_info (
    id integer,
    movie_id integer,
    info_type_id integer,
    minfo integer,
    info varchar(4000)
);


--
-- Name: movie_companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE movie_companies (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    company_id integer NOT NULL,
    company_type_id integer NOT NULL,
    note varchar(4000)
);


--
-- Name: movie_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE movie_info (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    info_type_id integer NOT NULL,
    info varchar(4000) NOT NULL,
    note varchar(4000)
);


--
-- Name: movie_info_idx; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE movie_info_idx (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    info_type_id integer NOT NULL,
    info varchar(4000) NOT NULL,
    note varchar(4000)
);


--
-- Name: movie_keyword; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE movie_keyword (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    keyword_id integer NOT NULL
);


--
-- Name: movie_link; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE movie_link (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    linked_movie_id integer NOT NULL,
    link_type_id integer NOT NULL
);


--
-- Name: name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE name (
    id integer NOT NULL,
    name varchar(4000) NOT NULL,
    imdb_index varchar(9),
    imdb_id integer,
    gender varchar(1),
    name_pcode_cf varchar(5),
    name_pcode_nf varchar(5),
    surname_pcode varchar(5),
    md5sum varchar(32)
);


--
-- Name: person_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE person_info (
    id integer NOT NULL,
    person_id integer NOT NULL,
    info_type_id integer NOT NULL,
    info varchar(4000) NOT NULL,
    note varchar(4000)
);


--
-- Name: role_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role_type (
    id integer NOT NULL,
    role varchar(32) NOT NULL
);


--
-- Name: title; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE title (
    id integer NOT NULL,
    title varchar(4000) NOT NULL,
    imdb_index varchar(5),
    kind_id integer NOT NULL,
    production_year integer,
    imdb_id integer,
    phonetic_code varchar(5),
    episode_of_id integer,
    season_nr integer,
    episode_nr integer,
    series_years varchar(49),
    md5sum varchar(32)
);


--
-- PostgreSQL database dump complete
--





CREATE INDEX company_id_movie_companies ON movie_companies (company_id);

CREATE INDEX company_type_id_movie_companies ON movie_companies (company_type_id);

CREATE INDEX info_type_id_movie_info ON movie_info (info_type_id);

CREATE INDEX info_type_id_movie_info_idx ON movie_info_idx (info_type_id);

CREATE INDEX info_type_id_person_info ON person_info (info_type_id);

CREATE INDEX keyword_id_movie_keyword ON movie_keyword (keyword_id);

CREATE INDEX kind_id_aka_title ON aka_title (kind_id);

CREATE INDEX kind_id_title ON title (kind_id);

CREATE INDEX link_type_id_movie_link ON movie_link (link_type_id);

CREATE INDEX linked_movie_id_movie_link ON movie_link (linked_movie_id);

CREATE INDEX movie_id_aka_title ON aka_title (movie_id);

CREATE INDEX movie_id_cast_info ON cast_info (movie_id);

CREATE INDEX movie_id_complete_cast ON complete_cast (movie_id);

CREATE INDEX movie_id_movie_companies ON movie_companies (movie_id);

CREATE INDEX movie_id_movie_info ON movie_info (movie_id);

CREATE INDEX movie_id_movie_info_idx ON movie_info_idx (movie_id);

CREATE INDEX movie_id_movie_keyword ON movie_keyword (movie_id);

CREATE INDEX movie_id_movie_link ON movie_link (movie_id);

CREATE INDEX person_id_aka_name ON aka_name (person_id);

CREATE INDEX person_id_cast_info ON cast_info (person_id);

CREATE INDEX person_id_person_info ON person_info (person_id);

CREATE INDEX person_role_id_cast_info ON cast_info (person_role_id);

CREATE INDEX role_id_cast_info ON cast_info (role_id);





















