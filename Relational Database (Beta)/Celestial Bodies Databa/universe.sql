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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: creature; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.creature (
    creature_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.creature OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.creature_creature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creature_creature_id_seq OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.creature_creature_id_seq OWNED BY public.creature.creature_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    size integer,
    age_in_millions_of_year integer,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    size integer,
    distance_from_earth numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_year integer,
    size integer,
    distance_from_earth numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_year integer,
    size integer,
    distance_from_earth numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: creature creature_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature ALTER COLUMN creature_id SET DEFAULT nextval('public.creature_creature_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: creature; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.creature VALUES (1, 'c1', NULL);
INSERT INTO public.creature VALUES (2, 'c2', NULL);
INSERT INTO public.creature VALUES (3, 'c3', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'g1', NULL, false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'g2', NULL, true, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'g3', NULL, true, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'g4', NULL, true, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'g5', NULL, false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'g6', NULL, true, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'm1', NULL, false, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'm2', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'm3', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'm4', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'm5', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'm6', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'm7', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'm8', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'm9', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'm10', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'm11', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'm12', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'm13', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'm14', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'm15', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'm16', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'm17', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'm18', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'm19', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'm20', NULL, true, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'p1', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'p2', NULL, false, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (3, 'p3', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'p4', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'p5', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'p6', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'p7', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'p8', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'p9', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'p10', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'p11', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'p12', NULL, true, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 's1', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 's3', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 's4', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 's5', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 's6', NULL, true, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'g2', NULL, false, NULL, NULL, NULL, 4);


--
-- Name: creature_creature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.creature_creature_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 3, true);


--
-- Name: creature creature_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_name_key UNIQUE (name);


--
-- Name: creature creature_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_pkey PRIMARY KEY (creature_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

