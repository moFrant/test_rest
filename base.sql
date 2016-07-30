--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.20
-- Dumped by pg_dump version 9.4.5
-- Started on 2016-07-31 00:46:58 YEKT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2702 (class 1262 OID 32769)
-- Name: test; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_RU.UTF-8' LC_CTYPE = 'ru_RU.UTF-8';


\connect test

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 196 (class 3079 OID 12233)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2704 (class 0 OID 0)
-- Dependencies: 196
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 168 (class 1259 OID 33961)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- TOC entry 167 (class 1259 OID 33959)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 170 (class 1259 OID 33971)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 169 (class 1259 OID 33969)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 166 (class 1259 OID 33953)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- TOC entry 165 (class 1259 OID 33951)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 172 (class 1259 OID 33979)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 33989)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 173 (class 1259 OID 33987)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 171 (class 1259 OID 33977)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 176 (class 1259 OID 33997)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 175 (class 1259 OID 33995)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2710 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 179 (class 1259 OID 34092)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 34057)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- TOC entry 177 (class 1259 OID 34055)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2711 (class 0 OID 0)
-- Dependencies: 177
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 164 (class 1259 OID 33943)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- TOC entry 163 (class 1259 OID 33941)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2712 (class 0 OID 0)
-- Dependencies: 163
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 162 (class 1259 OID 33932)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- TOC entry 161 (class 1259 OID 33930)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2713 (class 0 OID 0)
-- Dependencies: 161
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 180 (class 1259 OID 34110)
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 34123)
-- Name: post_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE post_category (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 34121)
-- Name: post_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2714 (class 0 OID 0)
-- Dependencies: 181
-- Name: post_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_category_id_seq OWNED BY post_category.id;


--
-- TOC entry 184 (class 1259 OID 34131)
-- Name: post_country; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE post_country (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 34129)
-- Name: post_country_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2715 (class 0 OID 0)
-- Dependencies: 183
-- Name: post_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_country_id_seq OWNED BY post_country.id;


--
-- TOC entry 186 (class 1259 OID 34139)
-- Name: post_image; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE post_image (
    id integer NOT NULL,
    image_original character varying(100) NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 34137)
-- Name: post_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2716 (class 0 OID 0)
-- Dependencies: 185
-- Name: post_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_image_id_seq OWNED BY post_image.id;


--
-- TOC entry 187 (class 1259 OID 34145)
-- Name: post_modeluser; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE post_modeluser (
    user_ptr_id integer NOT NULL,
    sity_id integer NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 34179)
-- Name: post_modeluser_favorites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE post_modeluser_favorites (
    id integer NOT NULL,
    modeluser_id integer NOT NULL,
    post_id integer NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 34177)
-- Name: post_modeluser_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_modeluser_favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2717 (class 0 OID 0)
-- Dependencies: 194
-- Name: post_modeluser_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_modeluser_favorites_id_seq OWNED BY post_modeluser_favorites.id;


--
-- TOC entry 189 (class 1259 OID 34152)
-- Name: post_post; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE post_post (
    id integer NOT NULL,
    header character varying(30) NOT NULL,
    subheader character varying(30) NOT NULL,
    text text NOT NULL,
    date timestamp with time zone NOT NULL,
    date_edit timestamp with time zone NOT NULL,
    published boolean NOT NULL,
    category_id integer NOT NULL,
    user_id integer
);


--
-- TOC entry 188 (class 1259 OID 34150)
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2718 (class 0 OID 0)
-- Dependencies: 188
-- Name: post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_post_id_seq OWNED BY post_post.id;


--
-- TOC entry 191 (class 1259 OID 34163)
-- Name: post_post_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE post_post_images (
    id integer NOT NULL,
    post_id integer NOT NULL,
    image_id integer NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 34161)
-- Name: post_post_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_post_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2719 (class 0 OID 0)
-- Dependencies: 190
-- Name: post_post_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_post_images_id_seq OWNED BY post_post_images.id;


--
-- TOC entry 193 (class 1259 OID 34171)
-- Name: post_sity; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE post_sity (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    country_id integer NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 34169)
-- Name: post_sity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE post_sity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2720 (class 0 OID 0)
-- Dependencies: 192
-- Name: post_sity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE post_sity_id_seq OWNED BY post_sity.id;


--
-- TOC entry 2449 (class 2604 OID 33964)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2450 (class 2604 OID 33974)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2448 (class 2604 OID 33956)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2451 (class 2604 OID 33982)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2452 (class 2604 OID 33992)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2453 (class 2604 OID 34000)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2454 (class 2604 OID 34060)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2447 (class 2604 OID 33946)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2446 (class 2604 OID 33935)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2456 (class 2604 OID 34126)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_category ALTER COLUMN id SET DEFAULT nextval('post_category_id_seq'::regclass);


--
-- TOC entry 2457 (class 2604 OID 34134)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_country ALTER COLUMN id SET DEFAULT nextval('post_country_id_seq'::regclass);


--
-- TOC entry 2458 (class 2604 OID 34142)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_image ALTER COLUMN id SET DEFAULT nextval('post_image_id_seq'::regclass);


--
-- TOC entry 2462 (class 2604 OID 34182)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_modeluser_favorites ALTER COLUMN id SET DEFAULT nextval('post_modeluser_favorites_id_seq'::regclass);


--
-- TOC entry 2459 (class 2604 OID 34155)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_post ALTER COLUMN id SET DEFAULT nextval('post_post_id_seq'::regclass);


--
-- TOC entry 2460 (class 2604 OID 34166)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_post_images ALTER COLUMN id SET DEFAULT nextval('post_post_images_id_seq'::regclass);


--
-- TOC entry 2461 (class 2604 OID 34174)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY post_sity ALTER COLUMN id SET DEFAULT nextval('post_sity_id_seq'::regclass);


--
-- TOC entry 2670 (class 0 OID 33961)
-- Dependencies: 168
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2721 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2672 (class 0 OID 33971)
-- Dependencies: 170
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2722 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2668 (class 0 OID 33953)
-- Dependencies: 166
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add country', 7, 'add_country');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change country', 7, 'change_country');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete country', 7, 'delete_country');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add sity', 8, 'add_sity');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change sity', 8, 'change_sity');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete sity', 8, 'delete_sity');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add category', 9, 'add_category');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change category', 9, 'change_category');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete category', 9, 'delete_category');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add image', 10, 'add_image');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change image', 10, 'change_image');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete image', 10, 'delete_image');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add post', 11, 'add_post');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change post', 11, 'change_post');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete post', 11, 'delete_post');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add user', 12, 'add_modeluser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change user', 12, 'change_modeluser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete user', 12, 'delete_modeluser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add Token', 13, 'add_token');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change Token', 13, 'change_token');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete Token', 13, 'delete_token');


--
-- TOC entry 2723 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- TOC entry 2674 (class 0 OID 33979)
-- Dependencies: 172
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$24000$qA3NjXjy8v0c$1bcdhmyN8C1ouJofx8qyiXpd/s+Qedr9DDdtsOim+xI=', NULL, true, 'admin', '', '', 'mofrant@gmail.com', true, true, '2016-07-31 00:05:49.647046+03');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$24000$Jk9AMeieweMk$7RsmVwKwPjl6S2DCwgu9lFDeyPcxDnGmBFjDjczbbck=', NULL, false, 'user', '', '', 'mofrant@mail.ru', false, true, '2016-07-31 00:14:05.607707+03');


--
-- TOC entry 2676 (class 0 OID 33989)
-- Dependencies: 174
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2724 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2725 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- TOC entry 2678 (class 0 OID 33997)
-- Dependencies: 176
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2726 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2681 (class 0 OID 34092)
-- Dependencies: 179
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO authtoken_token (key, created, user_id) VALUES ('1639f4323171136ec72d9175c26567c994829cad', '2016-07-31 00:07:38.448677+03', 1);
INSERT INTO authtoken_token (key, created, user_id) VALUES ('b069b006e03ea0dfcb1486431e59c4745f6b3ec3', '2016-07-31 00:14:05.611239+03', 2);


--
-- TOC entry 2680 (class 0 OID 34057)
-- Dependencies: 178
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2727 (class 0 OID 0)
-- Dependencies: 177
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 2666 (class 0 OID 33943)
-- Dependencies: 164
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'post', 'country');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'post', 'sity');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'post', 'category');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'post', 'image');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'post', 'post');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'post', 'modeluser');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'authtoken', 'token');


--
-- TOC entry 2728 (class 0 OID 0)
-- Dependencies: 163
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- TOC entry 2664 (class 0 OID 33932)
-- Dependencies: 162
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2016-07-31 00:05:23.673879+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2016-07-31 00:05:23.778594+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2016-07-31 00:05:23.805597+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2016-07-31 00:05:23.820459+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2016-07-31 00:05:23.853202+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2016-07-31 00:05:23.876353+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0003_alter_user_email_max_length', '2016-07-31 00:05:23.905483+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0004_alter_user_username_opts', '2016-07-31 00:05:23.928112+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0005_alter_user_last_login_null', '2016-07-31 00:05:23.941045+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0006_require_contenttypes_0002', '2016-07-31 00:05:23.943025+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2016-07-31 00:05:23.95405+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'authtoken', '0001_initial', '2016-07-31 00:05:23.978265+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'authtoken', '0002_auto_20160226_1747', '2016-07-31 00:05:24.073106+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'sessions', '0001_initial', '2016-07-31 00:05:24.090792+03');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'post', '0001_initial', '2016-07-31 00:09:05.673764+03');


--
-- TOC entry 2729 (class 0 OID 0)
-- Dependencies: 161
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- TOC entry 2682 (class 0 OID 34110)
-- Dependencies: 180
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2684 (class 0 OID 34123)
-- Dependencies: 182
-- Data for Name: post_category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO post_category (id, name) VALUES (1, 'Новости');


--
-- TOC entry 2730 (class 0 OID 0)
-- Dependencies: 181
-- Name: post_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_category_id_seq', 1, true);


--
-- TOC entry 2686 (class 0 OID 34131)
-- Dependencies: 184
-- Data for Name: post_country; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO post_country (id, name) VALUES (1, 'Российская Федерация');


--
-- TOC entry 2731 (class 0 OID 0)
-- Dependencies: 183
-- Name: post_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_country_id_seq', 1, true);


--
-- TOC entry 2688 (class 0 OID 34139)
-- Dependencies: 186
-- Data for Name: post_image; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO post_image (id, image_original) VALUES (1, 'post_image/images.jpg');
INSERT INTO post_image (id, image_original) VALUES (2, 'post_image/121691_N6AuMaf.jpg');
INSERT INTO post_image (id, image_original) VALUES (3, 'post_image/image_5.jpg');


--
-- TOC entry 2732 (class 0 OID 0)
-- Dependencies: 185
-- Name: post_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_image_id_seq', 3, true);


--
-- TOC entry 2689 (class 0 OID 34145)
-- Dependencies: 187
-- Data for Name: post_modeluser; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO post_modeluser (user_ptr_id, sity_id) VALUES (2, 1);


--
-- TOC entry 2697 (class 0 OID 34179)
-- Dependencies: 195
-- Data for Name: post_modeluser_favorites; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO post_modeluser_favorites (id, modeluser_id, post_id) VALUES (1, 2, 1);
INSERT INTO post_modeluser_favorites (id, modeluser_id, post_id) VALUES (2, 2, 2);


--
-- TOC entry 2733 (class 0 OID 0)
-- Dependencies: 194
-- Name: post_modeluser_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_modeluser_favorites_id_seq', 2, true);


--
-- TOC entry 2691 (class 0 OID 34152)
-- Dependencies: 189
-- Data for Name: post_post; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO post_post (id, header, subheader, text, date, date_edit, published, category_id, user_id) VALUES (2, 'Заголовок', 'Подзаголовок', 'Что-то очень важное', '2016-07-31 00:31:34.313115+03', '2016-07-31 00:37:23.294847+03', false, 1, 1);
INSERT INTO post_post (id, header, subheader, text, date, date_edit, published, category_id, user_id) VALUES (1, 'Заголовок', 'Подзаголовок', 'Что-то очень важное', '2016-07-31 00:30:45.917861+03', '2016-07-31 00:54:38.503365+03', false, 1, 2);


--
-- TOC entry 2734 (class 0 OID 0)
-- Dependencies: 188
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_post_id_seq', 3, true);


--
-- TOC entry 2693 (class 0 OID 34163)
-- Dependencies: 191
-- Data for Name: post_post_images; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO post_post_images (id, post_id, image_id) VALUES (1, 1, 1);
INSERT INTO post_post_images (id, post_id, image_id) VALUES (2, 1, 2);


--
-- TOC entry 2735 (class 0 OID 0)
-- Dependencies: 190
-- Name: post_post_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_post_images_id_seq', 3, true);


--
-- TOC entry 2695 (class 0 OID 34171)
-- Dependencies: 193
-- Data for Name: post_sity; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO post_sity (id, name, country_id) VALUES (1, 'Кунгур', 1);


--
-- TOC entry 2736 (class 0 OID 0)
-- Dependencies: 192
-- Name: post_sity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('post_sity_id_seq', 1, true);


-- Completed on 2016-07-31 00:47:28 YEKT

--
-- PostgreSQL database dump complete
--

