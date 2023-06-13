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
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.members (id, created_at, updated_at, name, keycloak_id) FROM stdin;
5ea3e1c1-3c15-4f35-85ca-33ba782c6814	2023-06-13 09:20:59.613736	2023-06-13 09:20:59.613736	Test Seki01	1115cbc8-cbb7-4250-ab00-2e2003a58f5b
2f00ea4f-50f7-48a4-ad8c-a5d657d551bd	2023-06-13 09:20:59.625859	2023-06-13 09:20:59.625859	Test User001	d26a3222-3c06-4d75-9f01-9b1c2a3d9e4f
9616b80c-4f0b-43f2-b246-5c29ca06644f	2023-06-13 09:20:59.619858	2023-06-13 09:20:59.881175	Test Teacher01	331dac72-9e2e-4677-a3fb-8cca168642be
0e0c0ff2-018e-41a3-a885-736479500931	2023-06-13 09:21:00.156437	2023-06-13 09:21:00.156437	create_get_update_group responsibles 0	\N
73a0b227-7bbf-40b0-8aa2-62a1dde4ba1d	2023-06-13 09:21:00.160546	2023-06-13 09:21:00.160546	create_get_update_group responsibles 1	\N
d8498b9c-04b0-4c5a-bd5e-f0b1a01ecc0e	2023-06-13 09:21:00.165031	2023-06-13 09:21:00.165031	create_get_update_group participants 0	\N
08719742-a5a9-4e84-8081-4417912cdc42	2023-06-13 09:21:00.169357	2023-06-13 09:21:00.169357	create_get_update_group participants 1	\N
94b44079-17bd-4c6f-9d69-e193c9edd7e7	2023-06-13 09:21:00.173244	2023-06-13 09:21:00.173244	create_get_update_group participants 2	\N
322dde07-bb64-4261-adf4-68c4a476bfb4	2023-06-13 09:21:00.282275	2023-06-13 09:21:00.282275	create_get_update_happening responsibles 0	\N
16172edd-11b7-4558-b9bb-2823fcde2ce2	2023-06-13 09:21:00.286777	2023-06-13 09:21:00.286777	create_get_update_happening responsibles 1	\N
080f84d4-b1a0-484e-b21b-3146c0404776	2023-06-13 09:21:00.29389	2023-06-13 09:21:00.29389	create_get_update_happening participants 0	\N
1a5504cf-83d3-4354-b7a6-57419936f778	2023-06-13 09:21:00.298561	2023-06-13 09:21:00.298561	create_get_update_happening participants 1	\N
e4a633a9-70b6-4ee7-8dff-473ccf950073	2023-06-13 09:21:00.303503	2023-06-13 09:21:00.303503	create_get_update_happening participants 2	\N
244b2bde-0e55-40d6-a970-529c3f3a6d11	2023-06-13 09:21:00.790679	2023-06-13 09:21:00.824659	create_get_update_member	fa290efd-3b75-4734-863a-b4acc396e540
\.


--
-- Data for Name: member_notes_list; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_notes_list (id, created_at, updated_at, member_id, type) FROM stdin;
\.


--
-- Data for Name: absent; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.absent (id, created_at, updated_at, member_id, reason, from_date, until_date, canceled, member_notes_list_id, note) FROM stdin;
\.


--
-- Data for Name: happenings; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.happenings (id, created_at, updated_at, name, props, checked_in_filter) FROM stdin;
0f1d141b-d727-4ab1-ac64-7b7a82fa5a7c	2023-06-13 09:20:59.730544	2023-06-13 09:20:59.730544	Sport	{"to": "2024-01-01T10:00:00Z", "bar": "foo", "foo": "bar", "from": "2024-01-01T08:00:00Z"}	\N
7789fe6d-52b5-4143-8c96-68fe381a08dc	2023-06-13 09:20:59.738565	2023-06-13 09:20:59.738565	Erdkunde	{"to": "2024-01-01T10:00:00Z", "from": "2024-01-01T09:00:00Z"}	\N
21b6c3b3-f077-42c0-b1f9-3e0358ffd67f	2023-06-13 09:21:00.288485	2023-06-13 09:21:00.288485	Happening A	{"to": "2024-01-01T10:00:00Z", "foo": "bar", "from": "2024-01-01T08:00:00Z"}	\N
838c5ebb-5e45-4083-b0ab-43a2617f670f	2023-06-13 09:21:00.414291	2023-06-13 09:21:00.559864	create_get_update_happening happening 0	\N	\N
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
3976c49d-e140-4db5-8711-a596c78d794c	2023-06-13 09:20:59.725502	2023-06-13 09:20:59.725502	Team A
c6f1c48d-2e1b-4585-a1f3-9e9a0b247da3	2023-06-13 09:21:00.177314	2023-06-13 09:21:00.211383	Team B
7f165471-f87e-4bca-a3be-15f1b0c14da9	2023-06-13 09:21:00.308183	2023-06-13 09:21:00.308183	create_get_update_happening group 0
\.


--
-- Data for Name: groups_happenings; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.groups_happenings (id, created_at, updated_at, group_id, happening_id) FROM stdin;
1	2023-06-13 09:20:59.730544	2023-06-13 09:20:59.730544	3976c49d-e140-4db5-8711-a596c78d794c	0f1d141b-d727-4ab1-ac64-7b7a82fa5a7c
2	2023-06-13 09:20:59.738565	2023-06-13 09:20:59.738565	3976c49d-e140-4db5-8711-a596c78d794c	7789fe6d-52b5-4143-8c96-68fe381a08dc
3	2023-06-13 09:21:00.414291	2023-06-13 09:21:00.414291	7f165471-f87e-4bca-a3be-15f1b0c14da9	838c5ebb-5e45-4083-b0ab-43a2617f670f
\.


--
-- Data for Name: member_is_to_group; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_is_to_group (id, created_at, updated_at, source_member_id, target_group_id, role) FROM stdin;
1	2023-06-13 09:21:00.177314	2023-06-13 09:21:00.177314	0e0c0ff2-018e-41a3-a885-736479500931	c6f1c48d-2e1b-4585-a1f3-9e9a0b247da3	responsible
2	2023-06-13 09:21:00.177314	2023-06-13 09:21:00.177314	73a0b227-7bbf-40b0-8aa2-62a1dde4ba1d	c6f1c48d-2e1b-4585-a1f3-9e9a0b247da3	responsible
3	2023-06-13 09:21:00.177314	2023-06-13 09:21:00.177314	d8498b9c-04b0-4c5a-bd5e-f0b1a01ecc0e	c6f1c48d-2e1b-4585-a1f3-9e9a0b247da3	participant
4	2023-06-13 09:21:00.177314	2023-06-13 09:21:00.177314	08719742-a5a9-4e84-8081-4417912cdc42	c6f1c48d-2e1b-4585-a1f3-9e9a0b247da3	participant
5	2023-06-13 09:21:00.177314	2023-06-13 09:21:00.177314	94b44079-17bd-4c6f-9d69-e193c9edd7e7	c6f1c48d-2e1b-4585-a1f3-9e9a0b247da3	participant
6	2023-06-13 09:21:00.308183	2023-06-13 09:21:00.308183	322dde07-bb64-4261-adf4-68c4a476bfb4	7f165471-f87e-4bca-a3be-15f1b0c14da9	responsible
7	2023-06-13 09:21:00.308183	2023-06-13 09:21:00.308183	16172edd-11b7-4558-b9bb-2823fcde2ce2	7f165471-f87e-4bca-a3be-15f1b0c14da9	responsible
8	2023-06-13 09:21:00.308183	2023-06-13 09:21:00.308183	080f84d4-b1a0-484e-b21b-3146c0404776	7f165471-f87e-4bca-a3be-15f1b0c14da9	participant
9	2023-06-13 09:21:00.308183	2023-06-13 09:21:00.308183	1a5504cf-83d3-4354-b7a6-57419936f778	7f165471-f87e-4bca-a3be-15f1b0c14da9	participant
10	2023-06-13 09:21:00.308183	2023-06-13 09:21:00.308183	e4a633a9-70b6-4ee7-8dff-473ccf950073	7f165471-f87e-4bca-a3be-15f1b0c14da9	participant
\.


--
-- Data for Name: member_is_to_happening; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_is_to_happening (id, created_at, updated_at, source_member_id, target_happening_id, role) FROM stdin;
1	2023-06-13 09:20:59.881175	2023-06-13 09:20:59.881175	9616b80c-4f0b-43f2-b246-5c29ca06644f	7789fe6d-52b5-4143-8c96-68fe381a08dc	responsible
2	2023-06-13 09:20:59.881175	2023-06-13 09:20:59.881175	9616b80c-4f0b-43f2-b246-5c29ca06644f	0f1d141b-d727-4ab1-ac64-7b7a82fa5a7c	responsible
3	2023-06-13 09:21:00.414291	2023-06-13 09:21:00.414291	322dde07-bb64-4261-adf4-68c4a476bfb4	838c5ebb-5e45-4083-b0ab-43a2617f670f	responsible
4	2023-06-13 09:21:00.414291	2023-06-13 09:21:00.414291	16172edd-11b7-4558-b9bb-2823fcde2ce2	838c5ebb-5e45-4083-b0ab-43a2617f670f	responsible
5	2023-06-13 09:21:00.414291	2023-06-13 09:21:00.414291	080f84d4-b1a0-484e-b21b-3146c0404776	838c5ebb-5e45-4083-b0ab-43a2617f670f	participant
6	2023-06-13 09:21:00.414291	2023-06-13 09:21:00.414291	1a5504cf-83d3-4354-b7a6-57419936f778	838c5ebb-5e45-4083-b0ab-43a2617f670f	participant
7	2023-06-13 09:21:00.414291	2023-06-13 09:21:00.414291	e4a633a9-70b6-4ee7-8dff-473ccf950073	838c5ebb-5e45-4083-b0ab-43a2617f670f	participant
\.


--
-- Data for Name: member_is_to_member; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_is_to_member (id, created_at, updated_at, source_member_id, target_member_id, role) FROM stdin;
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
m20220101_000001_create_table	1686648057
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

SELECT pg_catalog.setval('public.groups_happenings_id_seq', 3, true);


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
-- PostgreSQL database dump complete
--

