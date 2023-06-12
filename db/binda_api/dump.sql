--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: absent_reason; Type: TYPE; Schema: public; Owner: sven
--

CREATE TYPE public.absent_reason AS ENUM (
    'ill',
    'holidays',
    'released',
    'late'
);


ALTER TYPE public.absent_reason OWNER TO sven;

--
-- Name: check_type; Type: TYPE; Schema: public; Owner: sven
--

CREATE TYPE public.check_type AS ENUM (
    'in',
    'out'
);


ALTER TYPE public.check_type OWNER TO sven;

--
-- Name: group_role; Type: TYPE; Schema: public; Owner: sven
--

CREATE TYPE public.group_role AS ENUM (
    'responsible',
    'participant'
);


ALTER TYPE public.group_role OWNER TO sven;

--
-- Name: happening_role; Type: TYPE; Schema: public; Owner: sven
--

CREATE TYPE public.happening_role AS ENUM (
    'responsible',
    'participant'
);


ALTER TYPE public.happening_role OWNER TO sven;

--
-- Name: member_notes_list_type; Type: TYPE; Schema: public; Owner: sven
--

CREATE TYPE public.member_notes_list_type AS ENUM (
    'member',
    'absent',
    'check_in_out'
);


ALTER TYPE public.member_notes_list_type OWNER TO sven;

--
-- Name: member_role; Type: TYPE; Schema: public; Owner: sven
--

CREATE TYPE public.member_role AS ENUM (
    'responsible'
);


ALTER TYPE public.member_role OWNER TO sven;

--
-- Name: update_updated_at(); Type: FUNCTION; Schema: public; Owner: sven
--

CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at() OWNER TO sven;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: absent; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.absent (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    member_id uuid NOT NULL,
    reason public.absent_reason NOT NULL,
    from_date timestamp without time zone NOT NULL,
    until_date timestamp without time zone NOT NULL,
    canceled boolean NOT NULL,
    member_notes_list_id integer NOT NULL,
    note text
);


ALTER TABLE public.absent OWNER TO sven;

--
-- Name: absent_member_notes_list_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.absent_member_notes_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.absent_member_notes_list_id_seq OWNER TO sven;

--
-- Name: absent_member_notes_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.absent_member_notes_list_id_seq OWNED BY public.absent.member_notes_list_id;


--
-- Name: check_in_out; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.check_in_out (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    member_id uuid NOT NULL,
    happening_id uuid NOT NULL,
    date timestamp without time zone NOT NULL,
    check_type public.check_type NOT NULL,
    delay_minutes smallint
);


ALTER TABLE public.check_in_out OWNER TO sven;

--
-- Name: check_in_out_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.check_in_out_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.check_in_out_id_seq OWNER TO sven;

--
-- Name: check_in_out_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.check_in_out_id_seq OWNED BY public.check_in_out.id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.contact (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    member_id uuid NOT NULL,
    type text NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.contact OWNER TO sven;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO sven;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.groups (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.groups OWNER TO sven;

--
-- Name: groups_happenings; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.groups_happenings (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    group_id uuid NOT NULL,
    happening_id uuid NOT NULL
);


ALTER TABLE public.groups_happenings OWNER TO sven;

--
-- Name: groups_happenings_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.groups_happenings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_happenings_id_seq OWNER TO sven;

--
-- Name: groups_happenings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.groups_happenings_id_seq OWNED BY public.groups_happenings.id;


--
-- Name: happenings; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.happenings (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name text NOT NULL,
    props jsonb,
    checked_in_filter bytea
);


ALTER TABLE public.happenings OWNER TO sven;

--
-- Name: member_is_to_group; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.member_is_to_group (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    source_member_id uuid NOT NULL,
    target_group_id uuid NOT NULL,
    role public.group_role NOT NULL
);


ALTER TABLE public.member_is_to_group OWNER TO sven;

--
-- Name: member_is_to_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.member_is_to_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_is_to_group_id_seq OWNER TO sven;

--
-- Name: member_is_to_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.member_is_to_group_id_seq OWNED BY public.member_is_to_group.id;


--
-- Name: member_is_to_happening; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.member_is_to_happening (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    source_member_id uuid NOT NULL,
    target_happening_id uuid NOT NULL,
    role public.happening_role NOT NULL
);


ALTER TABLE public.member_is_to_happening OWNER TO sven;

--
-- Name: member_is_to_happening_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.member_is_to_happening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_is_to_happening_id_seq OWNER TO sven;

--
-- Name: member_is_to_happening_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.member_is_to_happening_id_seq OWNED BY public.member_is_to_happening.id;


--
-- Name: member_is_to_member; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.member_is_to_member (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    source_member_id uuid NOT NULL,
    target_member_id uuid NOT NULL,
    role public.member_role NOT NULL
);


ALTER TABLE public.member_is_to_member OWNER TO sven;

--
-- Name: member_is_to_member_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.member_is_to_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_is_to_member_id_seq OWNER TO sven;

--
-- Name: member_is_to_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.member_is_to_member_id_seq OWNED BY public.member_is_to_member.id;


--
-- Name: member_notes_list; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.member_notes_list (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    member_id uuid NOT NULL,
    type public.member_notes_list_type NOT NULL
);


ALTER TABLE public.member_notes_list OWNER TO sven;

--
-- Name: member_notes_list_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.member_notes_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_notes_list_id_seq OWNER TO sven;

--
-- Name: member_notes_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.member_notes_list_id_seq OWNED BY public.member_notes_list.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.members (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name text NOT NULL,
    keycloak_id uuid
);


ALTER TABLE public.members OWNER TO sven;

--
-- Name: notes; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    note text NOT NULL,
    author_member_id uuid NOT NULL,
    member_notes_list_id integer NOT NULL
);


ALTER TABLE public.notes OWNER TO sven;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO sven;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: notes_member_notes_list_id_seq; Type: SEQUENCE; Schema: public; Owner: sven
--

CREATE SEQUENCE public.notes_member_notes_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_member_notes_list_id_seq OWNER TO sven;

--
-- Name: notes_member_notes_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sven
--

ALTER SEQUENCE public.notes_member_notes_list_id_seq OWNED BY public.notes.member_notes_list_id;


--
-- Name: seaql_migrations; Type: TABLE; Schema: public; Owner: sven
--

CREATE TABLE public.seaql_migrations (
    version character varying NOT NULL,
    applied_at bigint NOT NULL
);


ALTER TABLE public.seaql_migrations OWNER TO sven;

--
-- Name: absent member_notes_list_id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.absent ALTER COLUMN member_notes_list_id SET DEFAULT nextval('public.absent_member_notes_list_id_seq'::regclass);


--
-- Name: check_in_out id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.check_in_out ALTER COLUMN id SET DEFAULT nextval('public.check_in_out_id_seq'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- Name: groups_happenings id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.groups_happenings ALTER COLUMN id SET DEFAULT nextval('public.groups_happenings_id_seq'::regclass);


--
-- Name: member_is_to_group id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_group ALTER COLUMN id SET DEFAULT nextval('public.member_is_to_group_id_seq'::regclass);


--
-- Name: member_is_to_happening id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_happening ALTER COLUMN id SET DEFAULT nextval('public.member_is_to_happening_id_seq'::regclass);


--
-- Name: member_is_to_member id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_member ALTER COLUMN id SET DEFAULT nextval('public.member_is_to_member_id_seq'::regclass);


--
-- Name: member_notes_list id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_notes_list ALTER COLUMN id SET DEFAULT nextval('public.member_notes_list_id_seq'::regclass);


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Name: notes member_notes_list_id; Type: DEFAULT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.notes ALTER COLUMN member_notes_list_id SET DEFAULT nextval('public.notes_member_notes_list_id_seq'::regclass);


--
-- Data for Name: absent; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.absent (id, created_at, updated_at, member_id, reason, from_date, until_date, canceled, member_notes_list_id, note) FROM stdin;
\.


--
-- Data for Name: check_in_out; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.check_in_out (id, created_at, updated_at, member_id, happening_id, date, check_type, delay_minutes) FROM stdin;
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.contact (id, created_at, updated_at, member_id, type, value) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.groups (id, created_at, updated_at, name) FROM stdin;
c7c73c4f-102a-4f8a-90aa-c3cff73ed36c	2023-06-12 20:05:48.755862	2023-06-12 20:05:48.801641	Team B
afb9f819-cb30-4b32-891c-58447dbc3072	2023-06-12 20:05:49.401327	2023-06-12 20:05:49.401327	create_get_update_happening group 0
\.


--
-- Data for Name: groups_happenings; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.groups_happenings (id, created_at, updated_at, group_id, happening_id) FROM stdin;
1	2023-06-12 20:05:49.413915	2023-06-12 20:05:49.413915	afb9f819-cb30-4b32-891c-58447dbc3072	a75a6aa3-ff21-4153-a0e8-b31a1a2149fe
\.


--
-- Data for Name: happenings; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.happenings (id, created_at, updated_at, name, props, checked_in_filter) FROM stdin;
0687a78d-8032-4b67-856b-e8b4ef8575e2	2023-06-12 20:05:48.200039	2023-06-12 20:05:48.200039	Sport	{"to": "2024-01-01T10:00:00Z", "bar": "foo", "foo": "bar", "from": "2024-01-01T08:00:00Z"}	\N
7fe0c7af-1f9c-4256-b0a9-09cd0bf77378	2023-06-12 20:05:48.493504	2023-06-12 20:05:48.493504	Erdkunde	{"to": "2024-01-01T10:00:00Z", "from": "2024-01-01T09:00:00Z"}	\N
da799474-2143-4581-88c7-b2ec8c937271	2023-06-12 20:05:49.130275	2023-06-12 20:05:49.130275	Happening A	{"to": "2024-01-01T10:00:00Z", "foo": "bar", "from": "2024-01-01T08:00:00Z"}	\N
a75a6aa3-ff21-4153-a0e8-b31a1a2149fe	2023-06-12 20:05:49.413915	2023-06-12 20:05:49.485869	create_get_update_happening happening 0	\N	\N
\.


--
-- Data for Name: member_is_to_group; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_is_to_group (id, created_at, updated_at, source_member_id, target_group_id, role) FROM stdin;
1	2023-06-12 20:05:48.755862	2023-06-12 20:05:48.755862	e0cb64c2-5c90-4bb0-99f5-9de3f32e5454	c7c73c4f-102a-4f8a-90aa-c3cff73ed36c	responsible
2	2023-06-12 20:05:48.755862	2023-06-12 20:05:48.755862	90fd0c01-97f4-4b91-9de8-31ca51e7af7b	c7c73c4f-102a-4f8a-90aa-c3cff73ed36c	responsible
3	2023-06-12 20:05:48.755862	2023-06-12 20:05:48.755862	ee2a233b-b622-49b1-ad83-f69411af110e	c7c73c4f-102a-4f8a-90aa-c3cff73ed36c	participant
4	2023-06-12 20:05:48.755862	2023-06-12 20:05:48.755862	24544f39-3189-497b-b2c0-734906428313	c7c73c4f-102a-4f8a-90aa-c3cff73ed36c	participant
5	2023-06-12 20:05:48.755862	2023-06-12 20:05:48.755862	b36038fa-c5b7-43e9-a718-e9f815d30c13	c7c73c4f-102a-4f8a-90aa-c3cff73ed36c	participant
6	2023-06-12 20:05:49.401327	2023-06-12 20:05:49.401327	33144d91-5a73-4a06-8ba7-adf40361d689	afb9f819-cb30-4b32-891c-58447dbc3072	responsible
7	2023-06-12 20:05:49.401327	2023-06-12 20:05:49.401327	c0d11758-7d88-4a6f-8270-c99744c8e216	afb9f819-cb30-4b32-891c-58447dbc3072	responsible
8	2023-06-12 20:05:49.401327	2023-06-12 20:05:49.401327	f2f779a9-33f3-462d-8275-6172f926c569	afb9f819-cb30-4b32-891c-58447dbc3072	participant
9	2023-06-12 20:05:49.401327	2023-06-12 20:05:49.401327	92f1e455-4d53-4156-877f-09a7c7847c64	afb9f819-cb30-4b32-891c-58447dbc3072	participant
10	2023-06-12 20:05:49.401327	2023-06-12 20:05:49.401327	7699d08b-48a7-41d1-8d5d-46963591d760	afb9f819-cb30-4b32-891c-58447dbc3072	participant
\.


--
-- Data for Name: member_is_to_happening; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_is_to_happening (id, created_at, updated_at, source_member_id, target_happening_id, role) FROM stdin;
1	2023-06-12 20:05:48.500761	2023-06-12 20:05:48.500761	41c7237c-5497-4e03-8050-3ef7896a21cc	0687a78d-8032-4b67-856b-e8b4ef8575e2	responsible
2	2023-06-12 20:05:48.500761	2023-06-12 20:05:48.500761	41c7237c-5497-4e03-8050-3ef7896a21cc	7fe0c7af-1f9c-4256-b0a9-09cd0bf77378	responsible
3	2023-06-12 20:05:49.413915	2023-06-12 20:05:49.413915	33144d91-5a73-4a06-8ba7-adf40361d689	a75a6aa3-ff21-4153-a0e8-b31a1a2149fe	responsible
4	2023-06-12 20:05:49.413915	2023-06-12 20:05:49.413915	c0d11758-7d88-4a6f-8270-c99744c8e216	a75a6aa3-ff21-4153-a0e8-b31a1a2149fe	responsible
5	2023-06-12 20:05:49.413915	2023-06-12 20:05:49.413915	f2f779a9-33f3-462d-8275-6172f926c569	a75a6aa3-ff21-4153-a0e8-b31a1a2149fe	participant
6	2023-06-12 20:05:49.413915	2023-06-12 20:05:49.413915	92f1e455-4d53-4156-877f-09a7c7847c64	a75a6aa3-ff21-4153-a0e8-b31a1a2149fe	participant
7	2023-06-12 20:05:49.413915	2023-06-12 20:05:49.413915	7699d08b-48a7-41d1-8d5d-46963591d760	a75a6aa3-ff21-4153-a0e8-b31a1a2149fe	participant
\.


--
-- Data for Name: member_is_to_member; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_is_to_member (id, created_at, updated_at, source_member_id, target_member_id, role) FROM stdin;
\.


--
-- Data for Name: member_notes_list; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_notes_list (id, created_at, updated_at, member_id, type) FROM stdin;
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.members (id, created_at, updated_at, name, keycloak_id) FROM stdin;
41c7237c-5497-4e03-8050-3ef7896a21cc	2023-06-12 20:05:48.500761	2023-06-12 20:05:48.500761	Foo Bar	331dac72-9e2e-4677-a3fb-8cca168642be
e0cb64c2-5c90-4bb0-99f5-9de3f32e5454	2023-06-12 20:05:48.696767	2023-06-12 20:05:48.696767	create_get_update_group responsibles 0	\N
90fd0c01-97f4-4b91-9de8-31ca51e7af7b	2023-06-12 20:05:48.703915	2023-06-12 20:05:48.703915	create_get_update_group responsibles 1	\N
ee2a233b-b622-49b1-ad83-f69411af110e	2023-06-12 20:05:48.724063	2023-06-12 20:05:48.724063	create_get_update_group participants 0	\N
24544f39-3189-497b-b2c0-734906428313	2023-06-12 20:05:48.73017	2023-06-12 20:05:48.73017	create_get_update_group participants 1	\N
b36038fa-c5b7-43e9-a718-e9f815d30c13	2023-06-12 20:05:48.746545	2023-06-12 20:05:48.746545	create_get_update_group participants 2	\N
33144d91-5a73-4a06-8ba7-adf40361d689	2023-06-12 20:05:49.139288	2023-06-12 20:05:49.139288	create_get_update_happening responsibles 0	\N
c0d11758-7d88-4a6f-8270-c99744c8e216	2023-06-12 20:05:49.376366	2023-06-12 20:05:49.376366	create_get_update_happening responsibles 1	\N
f2f779a9-33f3-462d-8275-6172f926c569	2023-06-12 20:05:49.382285	2023-06-12 20:05:49.382285	create_get_update_happening participants 0	\N
92f1e455-4d53-4156-877f-09a7c7847c64	2023-06-12 20:05:49.390028	2023-06-12 20:05:49.390028	create_get_update_happening participants 1	\N
7699d08b-48a7-41d1-8d5d-46963591d760	2023-06-12 20:05:49.39509	2023-06-12 20:05:49.39509	create_get_update_happening participants 2	\N
f9f00434-0aa7-4bd6-9d63-ee95e4d22a67	2023-06-12 20:05:49.608297	2023-06-12 20:05:49.658065	create_get_update_member	24b7d8be-6d57-4a83-85f5-519b25380a67
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.notes (id, created_at, updated_at, note, author_member_id, member_notes_list_id) FROM stdin;
\.


--
-- Data for Name: seaql_migrations; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.seaql_migrations (version, applied_at) FROM stdin;
m20220101_000001_create_table	1686600342
\.


--
-- Name: absent_member_notes_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.absent_member_notes_list_id_seq', 1, false);


--
-- Name: check_in_out_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.check_in_out_id_seq', 1, false);


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.contact_id_seq', 1, false);


--
-- Name: groups_happenings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.groups_happenings_id_seq', 1, true);


--
-- Name: member_is_to_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.member_is_to_group_id_seq', 10, true);


--
-- Name: member_is_to_happening_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.member_is_to_happening_id_seq', 7, true);


--
-- Name: member_is_to_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.member_is_to_member_id_seq', 1, false);


--
-- Name: member_notes_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.member_notes_list_id_seq', 1, false);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, false);


--
-- Name: notes_member_notes_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sven
--

SELECT pg_catalog.setval('public.notes_member_notes_list_id_seq', 1, false);


--
-- Name: absent absent_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.absent
    ADD CONSTRAINT absent_pkey PRIMARY KEY (id);


--
-- Name: check_in_out check_in_out_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.check_in_out
    ADD CONSTRAINT check_in_out_pkey PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: groups_happenings groups_happenings_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.groups_happenings
    ADD CONSTRAINT groups_happenings_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: happenings happenings_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.happenings
    ADD CONSTRAINT happenings_pkey PRIMARY KEY (id);


--
-- Name: member_is_to_group member_is_to_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_group
    ADD CONSTRAINT member_is_to_group_pkey PRIMARY KEY (id);


--
-- Name: member_is_to_happening member_is_to_happening_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_happening
    ADD CONSTRAINT member_is_to_happening_pkey PRIMARY KEY (id);


--
-- Name: member_is_to_member member_is_to_member_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_member
    ADD CONSTRAINT member_is_to_member_pkey PRIMARY KEY (id);


--
-- Name: member_notes_list member_notes_list_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_notes_list
    ADD CONSTRAINT member_notes_list_pkey PRIMARY KEY (id);


--
-- Name: members members_keycloak_id_key; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_keycloak_id_key UNIQUE (keycloak_id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: seaql_migrations seaql_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.seaql_migrations
    ADD CONSTRAINT seaql_migrations_pkey PRIMARY KEY (version);


--
-- Name: absent trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.absent FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: check_in_out trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.check_in_out FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: contact trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.contact FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: groups trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.groups FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: groups_happenings trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.groups_happenings FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: happenings trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.happenings FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: member_is_to_group trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.member_is_to_group FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: member_is_to_happening trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.member_is_to_happening FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: member_is_to_member trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.member_is_to_member FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: member_notes_list trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.member_notes_list FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: members trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.members FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: notes trigger_update_timestamp; Type: TRIGGER; Schema: public; Owner: sven
--

CREATE TRIGGER trigger_update_timestamp BEFORE UPDATE ON public.notes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: absent absent_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.absent
    ADD CONSTRAINT absent_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- Name: absent absent_member_notes_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.absent
    ADD CONSTRAINT absent_member_notes_list_id_fkey FOREIGN KEY (member_notes_list_id) REFERENCES public.member_notes_list(id);


--
-- Name: check_in_out check_in_out_happening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.check_in_out
    ADD CONSTRAINT check_in_out_happening_id_fkey FOREIGN KEY (happening_id) REFERENCES public.happenings(id);


--
-- Name: check_in_out check_in_out_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.check_in_out
    ADD CONSTRAINT check_in_out_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- Name: contact contact_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- Name: groups_happenings groups_happenings_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.groups_happenings
    ADD CONSTRAINT groups_happenings_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: groups_happenings groups_happenings_happening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.groups_happenings
    ADD CONSTRAINT groups_happenings_happening_id_fkey FOREIGN KEY (happening_id) REFERENCES public.happenings(id);


--
-- Name: member_is_to_group member_is_to_group_source_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_group
    ADD CONSTRAINT member_is_to_group_source_member_id_fkey FOREIGN KEY (source_member_id) REFERENCES public.members(id);


--
-- Name: member_is_to_group member_is_to_group_target_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_group
    ADD CONSTRAINT member_is_to_group_target_group_id_fkey FOREIGN KEY (target_group_id) REFERENCES public.groups(id);


--
-- Name: member_is_to_happening member_is_to_happening_source_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_happening
    ADD CONSTRAINT member_is_to_happening_source_member_id_fkey FOREIGN KEY (source_member_id) REFERENCES public.members(id);


--
-- Name: member_is_to_happening member_is_to_happening_target_happening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_happening
    ADD CONSTRAINT member_is_to_happening_target_happening_id_fkey FOREIGN KEY (target_happening_id) REFERENCES public.happenings(id);


--
-- Name: member_is_to_member member_is_to_member_source_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_member
    ADD CONSTRAINT member_is_to_member_source_member_id_fkey FOREIGN KEY (source_member_id) REFERENCES public.members(id);


--
-- Name: member_is_to_member member_is_to_member_target_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_is_to_member
    ADD CONSTRAINT member_is_to_member_target_member_id_fkey FOREIGN KEY (target_member_id) REFERENCES public.members(id);


--
-- Name: member_notes_list member_notes_list_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.member_notes_list
    ADD CONSTRAINT member_notes_list_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- Name: notes notes_author_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_author_member_id_fkey FOREIGN KEY (author_member_id) REFERENCES public.members(id);


--
-- Name: notes notes_member_notes_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sven
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_member_notes_list_id_fkey FOREIGN KEY (member_notes_list_id) REFERENCES public.member_notes_list(id);


--
-- PostgreSQL database dump complete
--

