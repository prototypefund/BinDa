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
d98cf5ac-782c-46d4-a574-06eb76157310	2023-06-12 20:39:39.468058	2023-06-12 20:39:39.468058	Foo Bar	331dac72-9e2e-4677-a3fb-8cca168642be
5e62733c-dfa7-4ecb-9ad0-f5b954c9a799	2023-06-12 20:39:39.809877	2023-06-12 20:39:39.809877	create_get_update_group responsibles 0	\N
6ad9aa90-9a81-4ac1-b1c9-9eb31691eb13	2023-06-12 20:39:39.814157	2023-06-12 20:39:39.814157	create_get_update_group responsibles 1	\N
1317963c-3a0b-4186-af73-565da3e3e942	2023-06-12 20:39:39.825241	2023-06-12 20:39:39.825241	create_get_update_group participants 0	\N
1f631134-1661-4b32-900c-18688fd27734	2023-06-12 20:39:39.832577	2023-06-12 20:39:39.832577	create_get_update_group participants 1	\N
6ffe23da-02e1-4665-87ef-9687c5412fd1	2023-06-12 20:39:39.854597	2023-06-12 20:39:39.854597	create_get_update_group participants 2	\N
413b1a49-0fc2-4304-b4e8-c09557d106f4	2023-06-12 20:39:40.023544	2023-06-12 20:39:40.023544	create_get_update_happening responsibles 0	\N
dd90cd8b-a3b4-48a5-b6d3-db22d025e1df	2023-06-12 20:39:40.041482	2023-06-12 20:39:40.041482	create_get_update_happening responsibles 1	\N
bfdb972e-1d18-47bd-a8a9-4052f067d5b0	2023-06-12 20:39:40.209777	2023-06-12 20:39:40.209777	create_get_update_happening participants 0	\N
83b6a1d0-6efa-4613-b45e-64d515081a43	2023-06-12 20:39:40.214541	2023-06-12 20:39:40.214541	create_get_update_happening participants 1	\N
3bb95e73-0489-44d1-a312-179ac8b748d2	2023-06-12 20:39:40.219119	2023-06-12 20:39:40.219119	create_get_update_happening participants 2	\N
a186459d-a796-4354-93b2-8637ff970983	2023-06-12 20:39:40.582632	2023-06-12 20:39:40.630259	create_get_update_member	d0447f60-b841-4dd9-8fc1-355391f96ea4
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
71f01c6b-240e-403e-8529-0d4291b4a9c7	2023-06-12 20:39:39.439934	2023-06-12 20:39:39.439934	Sport	{"to": "2024-01-01T10:00:00Z", "bar": "foo", "foo": "bar", "from": "2024-01-01T08:00:00Z"}	\N
15ec6e74-6e4c-443d-9815-600507826953	2023-06-12 20:39:39.448242	2023-06-12 20:39:39.448242	Erdkunde	{"to": "2024-01-01T10:00:00Z", "from": "2024-01-01T09:00:00Z"}	\N
b420d752-e5d3-4a14-8216-5bc802082ee6	2023-06-12 20:39:40.212912	2023-06-12 20:39:40.212912	Happening A	{"to": "2024-01-01T10:00:00Z", "foo": "bar", "from": "2024-01-01T08:00:00Z"}	\N
8cba29e7-fa6e-44b6-98f8-4a99b6cb2b8f	2023-06-12 20:39:40.414406	2023-06-12 20:39:40.465111	create_get_update_happening happening 0	\N	\N
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
ab431806-760f-4979-a74f-30fc13270fb9	2023-06-12 20:39:39.861109	2023-06-12 20:39:39.907458	Team B
1175e395-2ce8-4501-99d7-20b0af796401	2023-06-12 20:39:40.386568	2023-06-12 20:39:40.386568	create_get_update_happening group 0
\.


--
-- Data for Name: groups_happenings; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.groups_happenings (id, created_at, updated_at, group_id, happening_id) FROM stdin;
1	2023-06-12 20:39:40.414406	2023-06-12 20:39:40.414406	1175e395-2ce8-4501-99d7-20b0af796401	8cba29e7-fa6e-44b6-98f8-4a99b6cb2b8f
\.


--
-- Data for Name: member_is_to_group; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_is_to_group (id, created_at, updated_at, source_member_id, target_group_id, role) FROM stdin;
1	2023-06-12 20:39:39.861109	2023-06-12 20:39:39.861109	5e62733c-dfa7-4ecb-9ad0-f5b954c9a799	ab431806-760f-4979-a74f-30fc13270fb9	responsible
2	2023-06-12 20:39:39.861109	2023-06-12 20:39:39.861109	6ad9aa90-9a81-4ac1-b1c9-9eb31691eb13	ab431806-760f-4979-a74f-30fc13270fb9	responsible
3	2023-06-12 20:39:39.861109	2023-06-12 20:39:39.861109	1317963c-3a0b-4186-af73-565da3e3e942	ab431806-760f-4979-a74f-30fc13270fb9	participant
4	2023-06-12 20:39:39.861109	2023-06-12 20:39:39.861109	1f631134-1661-4b32-900c-18688fd27734	ab431806-760f-4979-a74f-30fc13270fb9	participant
5	2023-06-12 20:39:39.861109	2023-06-12 20:39:39.861109	6ffe23da-02e1-4665-87ef-9687c5412fd1	ab431806-760f-4979-a74f-30fc13270fb9	participant
6	2023-06-12 20:39:40.386568	2023-06-12 20:39:40.386568	413b1a49-0fc2-4304-b4e8-c09557d106f4	1175e395-2ce8-4501-99d7-20b0af796401	responsible
7	2023-06-12 20:39:40.386568	2023-06-12 20:39:40.386568	dd90cd8b-a3b4-48a5-b6d3-db22d025e1df	1175e395-2ce8-4501-99d7-20b0af796401	responsible
8	2023-06-12 20:39:40.386568	2023-06-12 20:39:40.386568	bfdb972e-1d18-47bd-a8a9-4052f067d5b0	1175e395-2ce8-4501-99d7-20b0af796401	participant
9	2023-06-12 20:39:40.386568	2023-06-12 20:39:40.386568	83b6a1d0-6efa-4613-b45e-64d515081a43	1175e395-2ce8-4501-99d7-20b0af796401	participant
10	2023-06-12 20:39:40.386568	2023-06-12 20:39:40.386568	3bb95e73-0489-44d1-a312-179ac8b748d2	1175e395-2ce8-4501-99d7-20b0af796401	participant
\.


--
-- Data for Name: member_is_to_happening; Type: TABLE DATA; Schema: public; Owner: sven
--

COPY public.member_is_to_happening (id, created_at, updated_at, source_member_id, target_happening_id, role) FROM stdin;
1	2023-06-12 20:39:39.468058	2023-06-12 20:39:39.468058	d98cf5ac-782c-46d4-a574-06eb76157310	71f01c6b-240e-403e-8529-0d4291b4a9c7	responsible
2	2023-06-12 20:39:39.468058	2023-06-12 20:39:39.468058	d98cf5ac-782c-46d4-a574-06eb76157310	15ec6e74-6e4c-443d-9815-600507826953	responsible
3	2023-06-12 20:39:40.414406	2023-06-12 20:39:40.414406	413b1a49-0fc2-4304-b4e8-c09557d106f4	8cba29e7-fa6e-44b6-98f8-4a99b6cb2b8f	responsible
4	2023-06-12 20:39:40.414406	2023-06-12 20:39:40.414406	dd90cd8b-a3b4-48a5-b6d3-db22d025e1df	8cba29e7-fa6e-44b6-98f8-4a99b6cb2b8f	responsible
5	2023-06-12 20:39:40.414406	2023-06-12 20:39:40.414406	bfdb972e-1d18-47bd-a8a9-4052f067d5b0	8cba29e7-fa6e-44b6-98f8-4a99b6cb2b8f	participant
6	2023-06-12 20:39:40.414406	2023-06-12 20:39:40.414406	83b6a1d0-6efa-4613-b45e-64d515081a43	8cba29e7-fa6e-44b6-98f8-4a99b6cb2b8f	participant
7	2023-06-12 20:39:40.414406	2023-06-12 20:39:40.414406	3bb95e73-0489-44d1-a312-179ac8b748d2	8cba29e7-fa6e-44b6-98f8-4a99b6cb2b8f	participant
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
m20220101_000001_create_table	1686602378
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
-- PostgreSQL database dump complete
--

