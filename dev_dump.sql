--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: admins; Type: TABLE; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO saurabh;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: saurabh
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO saurabh;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saurabh
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE TABLE blogs (
    id integer NOT NULL,
    title character varying(255),
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO saurabh;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: saurabh
--

CREATE SEQUENCE blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO saurabh;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saurabh
--

ALTER SEQUENCE blogs_id_seq OWNED BY blogs.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    commenter character varying(255),
    body text,
    blog_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying(255)
);


ALTER TABLE public.comments OWNER TO saurabh;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: saurabh
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO saurabh;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saurabh
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE TABLE contacts (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    message text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO saurabh;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: saurabh
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO saurabh;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saurabh
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO saurabh;

--
-- Name: users; Type: TABLE; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying(255),
    name character varying(255),
    provider character varying(255),
    uid character varying(255),
    oauth_token character varying(255),
    oauth_expires_at timestamp without time zone,
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(255)
);


ALTER TABLE public.users OWNER TO saurabh;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: saurabh
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO saurabh;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saurabh
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: welcomes; Type: TABLE; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE TABLE welcomes (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.welcomes OWNER TO saurabh;

--
-- Name: welcomes_id_seq; Type: SEQUENCE; Schema: public; Owner: saurabh
--

CREATE SEQUENCE welcomes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.welcomes_id_seq OWNER TO saurabh;

--
-- Name: welcomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saurabh
--

ALTER SEQUENCE welcomes_id_seq OWNED BY welcomes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: saurabh
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: saurabh
--

ALTER TABLE ONLY blogs ALTER COLUMN id SET DEFAULT nextval('blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: saurabh
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: saurabh
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: saurabh
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: saurabh
--

ALTER TABLE ONLY welcomes ALTER COLUMN id SET DEFAULT nextval('welcomes_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: saurabh
--

COPY admins (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saurabh
--

SELECT pg_catalog.setval('admins_id_seq', 1, false);


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: saurabh
--

COPY blogs (id, title, content, created_at, updated_at) FROM stdin;
10	Feedback	Please comment with your valuable feedbacks :)	2014-03-05 17:56:15.248814	2014-03-05 17:56:15.248814
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saurabh
--

SELECT pg_catalog.setval('blogs_id_seq', 10, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: saurabh
--

COPY comments (id, commenter, body, blog_id, created_at, updated_at, email) FROM stdin;
1	Sachin Bhat	Great Site! Simple and easy to use interface!	10	2014-03-05 18:00:26.05578	2014-03-05 18:00:26.05578	\N
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saurabh
--

SELECT pg_catalog.setval('comments_id_seq', 3, true);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: saurabh
--

COPY contacts (id, name, email, message, created_at, updated_at) FROM stdin;
1	rashmi	rashmijain@a.b	r u insane?	2014-02-27 12:48:35.711139	2014-02-27 12:48:35.711139
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saurabh
--

SELECT pg_catalog.setval('contacts_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: saurabh
--

COPY schema_migrations (version) FROM stdin;
20140219190327
20140220064212
20140220162346
20140220164658
20140220170008
20140222153027
20140224123858
20140226172150
20140228163629
20140306114632
20140306180257
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: saurabh
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, type, name, provider, uid, oauth_token, oauth_expires_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) FROM stdin;
16	me@saurabhj.net	$2a$10$9VxHsGe28pDOBZa52kuIxOZW2SC4JjzBgm4/blBINy5sD1rFSdQku	\N	\N	\N	0	\N	\N	\N	\N	2014-03-05 11:28:41.884805	2014-03-08 05:22:07.085724	Admin	Saurabh	\N	\N	\N	\N	\N	2014-03-08 05:22:07.084765	2014-03-08 05:22:07.08457	\N
18	u@saurabhj.net	$2a$10$vnQUnrDzRN6PucOUxN5Fo.yFuloTEJlQ1a83kEdZ8HsgmhNowc1Hu	\N	\N	\N	0	\N	\N	\N	\N	2014-03-05 11:28:42.155878	2014-03-08 05:22:07.09559	\N	User	\N	\N	\N	\N	\N	2014-03-08 05:22:07.09486	2014-03-08 05:22:07.094739	\N
19	demo@app.com	$2a$10$Qe7l2ZjYtrjUTXSyFsjNfe/9.ys6g0aYrcFxzShTczNP13Hdf4HcG	\N	\N	\N	1	2014-03-05 11:31:04.54428	2014-03-05 11:31:04.54428	14.139.34.2	14.139.34.2	2014-03-05 11:31:04.537768	2014-03-08 05:22:07.099087	\N	User	\N	\N	\N	\N	\N	2014-03-08 05:22:07.098485	2014-03-08 05:22:07.098405	\N
24	nikhilgarg94@yahoo.com	$2a$10$rWtqKp5.Fe9SxCN8llmdVOyCWk/eg3YyyoWwiwMf2im2WMeX5XcPm	\N	\N	\N	1	2014-03-06 06:26:40.926732	2014-03-06 06:26:40.926732	14.139.34.2	14.139.34.2	2014-03-06 06:26:40.920226	2014-03-08 05:22:07.102567	\N	Nikhil Garg	facebook	1774733744	CAAIbAAHZBPXUBAM5zfu0UTXHuK7W6vUnGTvv7PLZBngjCvVIt5qZCouxhRkGmhmKDYdBVmKyGMi1OADKrmsNkbYOQEqToka0vw5YExshjPGgjVQMJOn34ZAd5chpJ925JC5tx3Q8HNb3exWZAwMT39j66JLuAjHzVNAWXX0f6ID8ndmES9KADRKmZAOtO5PXQZD	2014-03-06 07:59:56	\N	2014-03-08 05:22:07.101958	2014-03-08 05:22:07.101877	\N
26	sunilskj@yahoo.com	$2a$10$oxQ860w0wTbRGw0V6fIlzuGSv6smxK2TexfbwdOaZjf6VE7wFO2/m	\N	\N	\N	1	2014-03-06 16:19:22.211281	2014-03-06 16:19:22.211281	120.57.150.242	120.57.150.242	2014-03-06 16:19:22.166834	2014-03-08 05:22:07.10621	\N	Sunil Jain	facebook	100001384447754	CAAIbAAHZBPXUBABifn91v53NVHW9ZCR6dECHsv9H87WUlMT3noybhrKQOYbU2ugsZClcfqlC1O9ZBtwHktZCmpyvanVdXtJ91A5VZCPuLR1Wmv7NMz6SSzzhpOoHVatDsxDrEBIKXI0ZB4mnFMYqx5WzJ9OnVKRIv48vsOeqRauzVUd4h8ZAEZAZCQNCM63ZBleGLEZD	2014-05-05 16:19:20	\N	2014-03-08 05:22:07.105525	2014-03-08 05:22:07.105439	\N
20	bhatssash@gmail.com	$2a$10$GEIb7I..8Xp49jMS7hJaZef0pcjJMuPWXZPft7cPiTe6ltD2/AQoi	\N	\N	\N	2	2014-03-05 17:57:43.003781	2014-03-05 17:53:07.850754	14.139.34.2	14.139.34.2	2014-03-05 17:53:07.841977	2014-03-08 05:22:07.11158	\N	Sachin Bhat	facebook	100000561606535	CAAIbAAHZBPXUBAMQVNU0N2QXKGLXdaZA8EHzZCQvuD7mQqlbArRLrGaE34U8Ayssu0BFBEcxoeKTjZCknz7MGL31tNwaPo4w25Sj3FhZCCmwJof2vrx0tZAG6LBzEgwDPexxPlhGVyAuyqdpjMpCA8JZCO2xhiCmdRmqUBIwe0IqeQEF8zFjVpsbl5gTHXx6XAZD	2014-03-05 18:59:56	\N	2014-03-08 05:22:07.110912	2014-03-08 05:22:07.110782	\N
21	mohitpalwal93@gmail.com	$2a$10$/hw2Vkb.2jpOkNKWbVo7m.YHgDDJ3IhgguNyTixQdm1tyafto44N6	\N	\N	\N	1	2014-03-05 20:00:04.130892	2014-03-05 20:00:04.130892	14.139.34.2	14.139.34.2	2014-03-05 20:00:04.113564	2014-03-08 05:22:07.115851	\N	Mohit Sharma	facebook	100002753950709	CAAIbAAHZBPXUBALX5fFpImgLavaDnKWFwuZBzZC4DAYLtbMxAzZC1EFUVDXlFuwunlTfZCDBwOFVMOEP4xG4mqhsKBFN7VflAwSAspM25FRTZAmaCZB5JIcnAG5w1q9JRjy7pKINZCe8POu0q9psRstzZAd4WgvQgfZAscCKrjNZA6RRvik2vg6Yzrrpkfm0tfnULoZD	2014-05-04 19:59:58	\N	2014-03-08 05:22:07.115106	2014-03-08 05:22:07.115001	\N
15	c@saurabhj.net	$2a$10$jWGhc7n0n/JnYftPTmZA6eJiqNr65zXONunFW9HXp8.3JT6C2GSs2	\N	\N	\N	3	2014-03-08 05:21:03.544607	2014-03-05 17:54:54.645665	14.139.34.2	14.139.34.2	2014-03-05 11:28:41.726102	2014-03-08 05:22:07.124009	Admin	Saurabh	\N	\N	\N	\N	\N	2014-03-08 05:22:07.123059	2014-03-08 05:22:07.12277	\N
17	user@saurabhj.net	$2a$10$bdkt6ato0En9ItXRU1c6XOZ8Upz4po/zxPpNyhw0eyMMwo0Y5kgRS	\N	\N	\N	1	2014-03-08 05:22:23.974091	2014-03-08 05:22:23.974091	14.139.34.2	14.139.34.2	2014-03-05 11:28:42.021605	2014-03-08 05:22:23.975932	\N	User	\N	\N	\N	\N	\N	2014-03-08 05:22:07.089412	2014-03-08 05:22:07.089269	\N
28	umang94@gmail.com	$2a$10$xMnjU04qzzeTsBTzap6Gi.W3twf0KcVoHcFdJCVWs70OBnyAae1Li	\N	\N	\N	0	\N	\N	\N	\N	2014-03-08 05:55:57.915607	2014-03-08 05:55:57.915607	\N	User	\N	\N	\N	\N	ea6e37f08af7923700c98ba0d1922f4953a88452fc154022f31d65a5020db69b	\N	2014-03-08 05:55:57.900976	\N
29	saurabhggn.94@gmail.com	$2a$10$1yIbYvBGXqcEgw2ox9FrOOxM6o/N8WIKU0OapU0wZcqBm0JRQluaK	\N	\N	\N	0	\N	\N	\N	\N	2014-03-08 06:01:19.396513	2014-03-08 06:01:19.396513	\N	User	\N	\N	\N	\N	62c6e7af44cb721ef0af28e7febf1f0954e60423548ba3c8a6ca91f166d9ffbc	\N	2014-03-08 06:01:19.396261	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saurabh
--

SELECT pg_catalog.setval('users_id_seq', 29, true);


--
-- Data for Name: welcomes; Type: TABLE DATA; Schema: public; Owner: saurabh
--

COPY welcomes (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: welcomes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saurabh
--

SELECT pg_catalog.setval('welcomes_id_seq', 1, false);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: saurabh; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: saurabh; Tablespace: 
--

ALTER TABLE ONLY blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: saurabh; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: saurabh; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: saurabh; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: welcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: saurabh; Tablespace: 
--

ALTER TABLE ONLY welcomes
    ADD CONSTRAINT welcomes_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_blog_id; Type: INDEX; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE INDEX index_comments_on_blog_id ON comments USING btree (blog_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: saurabh; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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

