--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

SET default_with_oids = false;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: wendy
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    amount numeric(6,2) NOT NULL,
    memo text NOT NULL,
    created_on date DEFAULT now() NOT NULL,
    CONSTRAINT expenses_amount_check CHECK ((amount >= 0.01))
);


ALTER TABLE public.expenses OWNER TO wendy;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: wendy
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_id_seq OWNER TO wendy;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wendy
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: wendy
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: wendy
--

INSERT INTO public.expenses VALUES (3, 14.56, 'Pencils', '2020-05-01');
INSERT INTO public.expenses VALUES (4, 3.29, 'Coffee', '2020-05-01');
INSERT INTO public.expenses VALUES (5, 49.99, 'Text Editor', '2020-05-01');
INSERT INTO public.expenses VALUES (8, 3.59, 'more coffee', '2020-05-03');
INSERT INTO public.expenses VALUES (9, 3.59, 'More Coffee', '2020-05-03');
INSERT INTO public.expenses VALUES (10, 20.80, 'notebooks', '2020-05-04');
INSERT INTO public.expenses VALUES (11, 20.80, 'notebooks', '2020-05-04');


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wendy
--

SELECT pg_catalog.setval('public.expenses_id_seq', 11, true);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: wendy
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

