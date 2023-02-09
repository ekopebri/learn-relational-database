--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    game_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.users.game_id;


--
-- Name: users game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (17, 'user_1675959197952', 2, 987);
INSERT INTO public.users VALUES (3, 'user_1675958513502', 2, 301);
INSERT INTO public.users VALUES (16, 'user_1675959197953', 5, 921);
INSERT INTO public.users VALUES (1, 'EKO', 5, 1);
INSERT INTO public.users VALUES (2, 'user_1675958513503', 5, 111);
INSERT INTO public.users VALUES (5, 'user_1675958554128', 2, 392);
INSERT INTO public.users VALUES (4, 'user_1675958554129', 5, 105);
INSERT INTO public.users VALUES (19, 'user_1675959291418', 2, 588);
INSERT INTO public.users VALUES (7, 'user_1675958576795', 2, 746);
INSERT INTO public.users VALUES (18, 'user_1675959291419', 5, 447);
INSERT INTO public.users VALUES (6, 'user_1675958576796', 5, 635);
INSERT INTO public.users VALUES (9, 'user_1675958584227', 2, 698);
INSERT INTO public.users VALUES (21, 'user_1675959301823', 2, 90);
INSERT INTO public.users VALUES (8, 'user_1675958584228', 5, 402);
INSERT INTO public.users VALUES (20, 'user_1675959301824', 5, 438);
INSERT INTO public.users VALUES (11, 'user_1675958894448', 2, 824);
INSERT INTO public.users VALUES (10, 'user_1675958894449', 5, 893);
INSERT INTO public.users VALUES (23, 'user_1675959310569', 2, 990);
INSERT INTO public.users VALUES (13, 'user_1675959060359', 2, 434);
INSERT INTO public.users VALUES (12, 'user_1675959060360', 5, 447);
INSERT INTO public.users VALUES (22, 'user_1675959310570', 5, 204);
INSERT INTO public.users VALUES (15, 'user_1675959073681', 2, 611);
INSERT INTO public.users VALUES (14, 'user_1675959073682', 5, 810);
INSERT INTO public.users VALUES (25, 'user_1675959315048', 2, 849);
INSERT INTO public.users VALUES (24, 'user_1675959315049', 5, 788);
INSERT INTO public.users VALUES (27, 'user_1675959350546', 2, 689);
INSERT INTO public.users VALUES (26, 'user_1675959350547', 5, 430);
INSERT INTO public.users VALUES (29, 'user_1675959353997', 2, 138);
INSERT INTO public.users VALUES (28, 'user_1675959353998', 5, 283);
INSERT INTO public.users VALUES (31, 'user_1675959356647', 2, 29);
INSERT INTO public.users VALUES (30, 'user_1675959356648', 5, 488);
INSERT INTO public.users VALUES (33, 'user_1675959359411', 2, 573);
INSERT INTO public.users VALUES (32, 'user_1675959359412', 5, 765);
INSERT INTO public.users VALUES (35, 'user_1675959362723', 2, 282);
INSERT INTO public.users VALUES (34, 'user_1675959362724', 5, 708);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 35, true);


--
-- Name: users games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

