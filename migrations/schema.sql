--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: appointment_statuses; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.appointment_statuses (
    id integer NOT NULL,
    status_type character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.appointment_statuses OWNER TO jaquanjones;

--
-- Name: appointment_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: jaquanjones
--

CREATE SEQUENCE public.appointment_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_statuses_id_seq OWNER TO jaquanjones;

--
-- Name: appointment_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaquanjones
--

ALTER SEQUENCE public.appointment_statuses_id_seq OWNED BY public.appointment_statuses.id;


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    appointment_location character varying(255) DEFAULT ''::character varying NOT NULL,
    status_id integer NOT NULL,
    customer_id integer NOT NULL,
    business_id integer NOT NULL,
    service_id integer NOT NULL,
    service_details_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    scheduling_id integer NOT NULL
);


ALTER TABLE public.appointments OWNER TO jaquanjones;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: jaquanjones
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO jaquanjones;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaquanjones
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: businesses; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.businesses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    is_verified boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    business_name character varying(255) DEFAULT ''::character varying NOT NULL,
    has_physical_location boolean DEFAULT false NOT NULL,
    business_location character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.businesses OWNER TO jaquanjones;

--
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: jaquanjones
--

CREATE SEQUENCE public.businesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesses_id_seq OWNER TO jaquanjones;

--
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaquanjones
--

ALTER SEQUENCE public.businesses_id_seq OWNED BY public.businesses.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    user_id integer NOT NULL,
    is_verified boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customers OWNER TO jaquanjones;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: jaquanjones
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO jaquanjones;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaquanjones
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: schedule_restrictions; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.schedule_restrictions (
    id integer NOT NULL,
    restriction_type character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.schedule_restrictions OWNER TO jaquanjones;

--
-- Name: schedule_restrictions_id_seq; Type: SEQUENCE; Schema: public; Owner: jaquanjones
--

CREATE SEQUENCE public.schedule_restrictions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedule_restrictions_id_seq OWNER TO jaquanjones;

--
-- Name: schedule_restrictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaquanjones
--

ALTER SEQUENCE public.schedule_restrictions_id_seq OWNED BY public.schedule_restrictions.id;


--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.schema_migration (
    version character varying(14) NOT NULL
);


ALTER TABLE public.schema_migration OWNER TO jaquanjones;

--
-- Name: service_restrictions; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.service_restrictions (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    appointment_id integer NOT NULL,
    service_id integer NOT NULL,
    restriction_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.service_restrictions OWNER TO jaquanjones;

--
-- Name: service_restrictions_id_seq; Type: SEQUENCE; Schema: public; Owner: jaquanjones
--

CREATE SEQUENCE public.service_restrictions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_restrictions_id_seq OWNER TO jaquanjones;

--
-- Name: service_restrictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaquanjones
--

ALTER SEQUENCE public.service_restrictions_id_seq OWNED BY public.service_restrictions.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.services (
    id integer NOT NULL,
    service_name character varying(255) DEFAULT ''::character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    business_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.services OWNER TO jaquanjones;

--
-- Name: services_details; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.services_details (
    id integer NOT NULL,
    service_sub_name character varying(255) DEFAULT ''::character varying NOT NULL,
    service_duration_minutes integer NOT NULL,
    service_price integer NOT NULL,
    service_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.services_details OWNER TO jaquanjones;

--
-- Name: services_details_id_seq; Type: SEQUENCE; Schema: public; Owner: jaquanjones
--

CREATE SEQUENCE public.services_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_details_id_seq OWNER TO jaquanjones;

--
-- Name: services_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaquanjones
--

ALTER SEQUENCE public.services_details_id_seq OWNED BY public.services_details.id;


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: jaquanjones
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO jaquanjones;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaquanjones
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jaquanjones
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(255) DEFAULT ''::character varying NOT NULL,
    last_name character varying(255) DEFAULT ''::character varying NOT NULL,
    phone character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(60) NOT NULL,
    access_level integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO jaquanjones;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jaquanjones
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jaquanjones;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaquanjones
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: appointment_statuses id; Type: DEFAULT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointment_statuses ALTER COLUMN id SET DEFAULT nextval('public.appointment_statuses_id_seq'::regclass);


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: businesses id; Type: DEFAULT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.businesses ALTER COLUMN id SET DEFAULT nextval('public.businesses_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: schedule_restrictions id; Type: DEFAULT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.schedule_restrictions ALTER COLUMN id SET DEFAULT nextval('public.schedule_restrictions_id_seq'::regclass);


--
-- Name: service_restrictions id; Type: DEFAULT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.service_restrictions ALTER COLUMN id SET DEFAULT nextval('public.service_restrictions_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: services_details id; Type: DEFAULT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.services_details ALTER COLUMN id SET DEFAULT nextval('public.services_details_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: appointment_statuses appointment_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointment_statuses
    ADD CONSTRAINT appointment_statuses_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: businesses businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: schedule_restrictions schedule_restrictions_pkey; Type: CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.schedule_restrictions
    ADD CONSTRAINT schedule_restrictions_pkey PRIMARY KEY (id);


--
-- Name: service_restrictions service_restrictions_pkey; Type: CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.service_restrictions
    ADD CONSTRAINT service_restrictions_pkey PRIMARY KEY (id);


--
-- Name: services_details services_details_pkey; Type: CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.services_details
    ADD CONSTRAINT services_details_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: appointments_business_id_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX appointments_business_id_idx ON public.appointments USING btree (business_id);


--
-- Name: appointments_customer_id_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX appointments_customer_id_idx ON public.appointments USING btree (customer_id);


--
-- Name: appointments_scheduling_id_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX appointments_scheduling_id_idx ON public.appointments USING btree (scheduling_id);


--
-- Name: appointments_start_date_end_date_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX appointments_start_date_end_date_idx ON public.appointments USING btree (start_date, end_date);


--
-- Name: appointments_start_time_end_time_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX appointments_start_time_end_time_idx ON public.appointments USING btree (start_time, end_time);


--
-- Name: schema_migration_version_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE UNIQUE INDEX schema_migration_version_idx ON public.schema_migration USING btree (version);


--
-- Name: service_restrictions_appointment_id_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX service_restrictions_appointment_id_idx ON public.service_restrictions USING btree (appointment_id);


--
-- Name: service_restrictions_restriction_id_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX service_restrictions_restriction_id_idx ON public.service_restrictions USING btree (restriction_id);


--
-- Name: service_restrictions_service_id_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX service_restrictions_service_id_idx ON public.service_restrictions USING btree (service_id);


--
-- Name: service_restrictions_start_date_end_date_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX service_restrictions_start_date_end_date_idx ON public.service_restrictions USING btree (start_date, end_date);


--
-- Name: service_restrictions_start_time_end_time_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE INDEX service_restrictions_start_time_end_time_idx ON public.service_restrictions USING btree (start_time, end_time);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: jaquanjones
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: appointments appointments_appointment_statuses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_appointment_statuses_id_fk FOREIGN KEY (status_id) REFERENCES public.appointment_statuses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: appointments appointments_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: appointments appointments_customers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_customers_id_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: appointments appointments_service_restrictions_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_service_restrictions_id_fk FOREIGN KEY (scheduling_id) REFERENCES public.service_restrictions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: appointments appointments_services_details_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_services_details_id_fk FOREIGN KEY (service_details_id) REFERENCES public.services_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: appointments appointments_services_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_services_id_fk FOREIGN KEY (service_id) REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: businesses businesses_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: customers customers_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: service_restrictions service_restrictions_schedule_restrictions_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.service_restrictions
    ADD CONSTRAINT service_restrictions_schedule_restrictions_id_fk FOREIGN KEY (restriction_id) REFERENCES public.schedule_restrictions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: service_restrictions service_restrictions_services_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.service_restrictions
    ADD CONSTRAINT service_restrictions_services_id_fk FOREIGN KEY (service_id) REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: services services_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: services_details services_details_services_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: jaquanjones
--

ALTER TABLE ONLY public.services_details
    ADD CONSTRAINT services_details_services_id_fk FOREIGN KEY (service_id) REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

