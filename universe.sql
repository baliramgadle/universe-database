--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size numeric NOT NULL,
    composition text,
    is_hazardous boolean NOT NULL,
    discovered boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type text NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    number_of_stars integer,
    discovery_year integer
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    planet_type text NOT NULL,
    distance_from_earth numeric NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.4, 'Rock and Ice', true, true, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.4, 'Rock', false, true, 2);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512.4, 'Nickel-Iron', true, false, 3);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 434.6, 'Rock and Ice', false, true, 4);
INSERT INTO public.asteroid VALUES (5, 'Eugenia', 214.5, 'Carbonaceous', true, true, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 13000, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', true, 10000, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', true, 12000, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', false, 15000, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', false, 12000, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', false, 13000, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mercury Moon 1', 1, false, 4500);
INSERT INTO public.moon VALUES (2, 'Mercury Moon 2', 1, false, 4400);
INSERT INTO public.moon VALUES (3, 'Venus Moon 1', 2, false, 4600);
INSERT INTO public.moon VALUES (4, 'Venus Moon 2', 2, false, 4500);
INSERT INTO public.moon VALUES (5, 'Moon', 3, true, 4500);
INSERT INTO public.moon VALUES (6, 'Earth Moon 1', 3, false, 4200);
INSERT INTO public.moon VALUES (7, 'Phobos', 4, false, 4600);
INSERT INTO public.moon VALUES (8, 'Deimos', 4, false, 4500);
INSERT INTO public.moon VALUES (9, 'Sirius A Planet 1 Moon 1', 5, false, 3000);
INSERT INTO public.moon VALUES (10, 'Sirius A Planet 1 Moon 2', 5, false, 2900);
INSERT INTO public.moon VALUES (11, 'Sirius A Planet 2 Moon 1', 6, false, 3100);
INSERT INTO public.moon VALUES (12, 'Sirius A Planet 2 Moon 2', 6, false, 3050);
INSERT INTO public.moon VALUES (13, 'Proxima Centauri b Moon 1', 7, false, 4000);
INSERT INTO public.moon VALUES (14, 'Proxima Centauri b Moon 2', 7, false, 3900);
INSERT INTO public.moon VALUES (15, 'Proxima Centauri c Moon 1', 8, false, 4100);
INSERT INTO public.moon VALUES (16, 'Proxima Centauri c Moon 2', 8, false, 4050);
INSERT INTO public.moon VALUES (17, 'Alpha Andromedae Planet 1 Moon 1', 9, false, 8000);
INSERT INTO public.moon VALUES (18, 'Alpha Andromedae Planet 1 Moon 2', 9, false, 7900);
INSERT INTO public.moon VALUES (19, 'Alpha Andromedae Planet 2 Moon 1', 10, false, 8100);
INSERT INTO public.moon VALUES (20, 'Alpha Andromedae Planet 2 Moon 2', 10, false, 8050);
INSERT INTO public.moon VALUES (21, 'Beta Andromedae Planet 1 Moon 1', 11, false, 7000);
INSERT INTO public.moon VALUES (22, 'Beta Andromedae Planet 1 Moon 2', 11, false, 6900);
INSERT INTO public.moon VALUES (23, 'Beta Andromedae Planet 2 Moon 1', 12, false, 7100);
INSERT INTO public.moon VALUES (24, 'Beta Andromedae Planet 2 Moon 2', 12, false, 7050);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, true, 'Rocky', 0.39);
INSERT INTO public.planet VALUES (2, 'Venus', 1, true, 'Rocky', 0.72);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 'Rocky', 1.00);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 'Rocky', 1.52);
INSERT INTO public.planet VALUES (5, 'Sirius A Planet 1', 2, true, 'Gas Giant', 8.60);
INSERT INTO public.planet VALUES (6, 'Sirius A Planet 2', 2, true, 'Gas Giant', 8.65);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 3, true, 'Rocky', 4.24);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri c', 3, true, 'Ice Giant', 4.30);
INSERT INTO public.planet VALUES (9, 'Alpha Andromedae Planet 1', 4, true, 'Gas Giant', 2537000.00);
INSERT INTO public.planet VALUES (10, 'Alpha Andromedae Planet 2', 4, true, 'Ice Giant', 2537100.00);
INSERT INTO public.planet VALUES (11, 'Beta Andromedae Planet 1', 5, true, 'Rocky', 2537500.00);
INSERT INTO public.planet VALUES (12, 'Beta Andromedae Planet 2', 5, true, 'Gas Giant', 2537600.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 0.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, true, 8.60);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, true, 4.24);
INSERT INTO public.star VALUES (4, 'Alpha Andromedae', 2, true, 2537000.00);
INSERT INTO public.star VALUES (5, 'Beta Andromedae', 2, true, 2537500.00);
INSERT INTO public.star VALUES (6, 'Triangulum Star A', 3, true, 3012000.00);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

