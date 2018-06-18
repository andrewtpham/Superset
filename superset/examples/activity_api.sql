--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

-- Started on 2018-05-31 13:09:55 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 19212)
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 419 (class 1259 OID 19134)
-- Name: appointment_appointment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.appointment_appointment (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    type character varying(50)[] NOT NULL,
    address character varying(100) NOT NULL,
    notes character varying(500),
    owner_id integer NOT NULL,
    contact_uuid character varying(36),
    invitee_uuids uuid[],
    organization_uuid uuid
);


ALTER TABLE public.appointment_appointment OWNER TO root;

--
-- TOC entry 418 (class 1259 OID 19132)
-- Name: appointment_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.appointment_appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_appointment_id_seq OWNER TO root;

--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 418
-- Name: appointment_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.appointment_appointment_id_seq OWNED BY public.appointment_appointment.id;


--
-- TOC entry 421 (class 1259 OID 19153)
-- Name: appointment_appointment_workflowlevel2; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.appointment_appointment_workflowlevel2 (
    id integer NOT NULL,
    appointment_id integer NOT NULL,
    workflowlevel2_id integer NOT NULL
);


ALTER TABLE public.appointment_appointment_workflowlevel2 OWNER TO root;

--
-- TOC entry 420 (class 1259 OID 19151)
-- Name: appointment_appointment_workflowlevel2_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.appointment_appointment_workflowlevel2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_appointment_workflowlevel2_id_seq OWNER TO root;

--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 420
-- Name: appointment_appointment_workflowlevel2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.appointment_appointment_workflowlevel2_id_seq OWNED BY public.appointment_appointment_workflowlevel2.id;


--
-- TOC entry 193 (class 1259 OID 16417)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- TOC entry 192 (class 1259 OID 16415)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 192
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 195 (class 1259 OID 16427)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- TOC entry 194 (class 1259 OID 16425)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 194
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 191 (class 1259 OID 16409)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- TOC entry 190 (class 1259 OID 16407)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 190
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 197 (class 1259 OID 16435)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO root;

--
-- TOC entry 199 (class 1259 OID 16445)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO root;

--
-- TOC entry 198 (class 1259 OID 16443)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO root;

--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 198
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 196 (class 1259 OID 16433)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO root;

--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 196
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 201 (class 1259 OID 16453)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO root;

--
-- TOC entry 200 (class 1259 OID 16451)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO root;

--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 422 (class 1259 OID 19193)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO root;

--
-- TOC entry 424 (class 1259 OID 19338)
-- Name: contact_contact; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.contact_contact (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    last_name character varying(50) NOT NULL,
    title character varying(2),
    contact_type character varying(30),
    customer_type character varying(30),
    company character varying(100),
    addresses public.hstore[],
    emails public.hstore[],
    phones public.hstore[],
    notes text,
    user_id integer NOT NULL,
    organization_uuid character varying(36),
    workflowlevel1_uuids character varying(36)[] NOT NULL,
    workflowlevel2_uuids character varying(36)[],
    uuid uuid NOT NULL
);


ALTER TABLE public.contact_contact OWNER TO root;

--
-- TOC entry 423 (class 1259 OID 19336)
-- Name: contact_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.contact_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_contact_id_seq OWNER TO root;

--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 423
-- Name: contact_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.contact_contact_id_seq OWNED BY public.contact_contact.id;


--
-- TOC entry 203 (class 1259 OID 16513)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- TOC entry 202 (class 1259 OID 16511)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 189 (class 1259 OID 16399)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- TOC entry 188 (class 1259 OID 16397)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 187 (class 1259 OID 16388)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- TOC entry 186 (class 1259 OID 16386)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO root;

--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 485 (class 1259 OID 20885)
-- Name: django_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- TOC entry 205 (class 1259 OID 16538)
-- Name: django_site; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO root;

--
-- TOC entry 204 (class 1259 OID 16536)
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO root;

--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- TOC entry 428 (class 1259 OID 19405)
-- Name: formlibrary_beneficiary; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_beneficiary (
    id integer NOT NULL,
    beneficiary_name character varying(255),
    father_name character varying(255),
    age integer,
    gender character varying(255),
    signature boolean NOT NULL,
    remarks character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    site_id integer
);


ALTER TABLE public.formlibrary_beneficiary OWNER TO root;

--
-- TOC entry 446 (class 1259 OID 19523)
-- Name: formlibrary_beneficiary_distribution; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_beneficiary_distribution (
    id integer NOT NULL,
    beneficiary_id integer NOT NULL,
    distribution_id integer NOT NULL
);


ALTER TABLE public.formlibrary_beneficiary_distribution OWNER TO root;

--
-- TOC entry 445 (class 1259 OID 19521)
-- Name: formlibrary_beneficiary_distribution_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_beneficiary_distribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_beneficiary_distribution_id_seq OWNER TO root;

--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 445
-- Name: formlibrary_beneficiary_distribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_beneficiary_distribution_id_seq OWNED BY public.formlibrary_beneficiary_distribution.id;


--
-- TOC entry 427 (class 1259 OID 19403)
-- Name: formlibrary_beneficiary_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_beneficiary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_beneficiary_id_seq OWNER TO root;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 427
-- Name: formlibrary_beneficiary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_beneficiary_id_seq OWNED BY public.formlibrary_beneficiary.id;


--
-- TOC entry 448 (class 1259 OID 19531)
-- Name: formlibrary_beneficiary_training; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_beneficiary_training (
    id integer NOT NULL,
    beneficiary_id integer NOT NULL,
    trainingattendance_id integer NOT NULL
);


ALTER TABLE public.formlibrary_beneficiary_training OWNER TO root;

--
-- TOC entry 447 (class 1259 OID 19529)
-- Name: formlibrary_beneficiary_training_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_beneficiary_training_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_beneficiary_training_id_seq OWNER TO root;

--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 447
-- Name: formlibrary_beneficiary_training_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_beneficiary_training_id_seq OWNED BY public.formlibrary_beneficiary_training.id;


--
-- TOC entry 450 (class 1259 OID 19539)
-- Name: formlibrary_beneficiary_workflowlevel1; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_beneficiary_workflowlevel1 (
    id integer NOT NULL,
    beneficiary_id integer NOT NULL,
    workflowlevel1_id integer NOT NULL
);


ALTER TABLE public.formlibrary_beneficiary_workflowlevel1 OWNER TO root;

--
-- TOC entry 449 (class 1259 OID 19537)
-- Name: formlibrary_beneficiary_workflowlevel1_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_beneficiary_workflowlevel1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_beneficiary_workflowlevel1_id_seq OWNER TO root;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 449
-- Name: formlibrary_beneficiary_workflowlevel1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_beneficiary_workflowlevel1_id_seq OWNED BY public.formlibrary_beneficiary_workflowlevel1.id;


--
-- TOC entry 430 (class 1259 OID 19416)
-- Name: formlibrary_binaryfield; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_binaryfield (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    data bytea NOT NULL
);


ALTER TABLE public.formlibrary_binaryfield OWNER TO root;

--
-- TOC entry 429 (class 1259 OID 19414)
-- Name: formlibrary_binaryfield_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_binaryfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_binaryfield_id_seq OWNER TO root;

--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 429
-- Name: formlibrary_binaryfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_binaryfield_id_seq OWNED BY public.formlibrary_binaryfield.id;


--
-- TOC entry 432 (class 1259 OID 19427)
-- Name: formlibrary_customform; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_customform (
    id integer NOT NULL,
    name character varying(255),
    description text,
    validations character varying(500),
    fields jsonb,
    is_public boolean NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL,
    created_by_id integer,
    form_uuid character varying(255) NOT NULL,
    silo_id integer NOT NULL,
    workflowlevel1_id integer,
    status character varying(15)
);


ALTER TABLE public.formlibrary_customform OWNER TO root;

--
-- TOC entry 431 (class 1259 OID 19425)
-- Name: formlibrary_customform_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_customform_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_customform_id_seq OWNER TO root;

--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 431
-- Name: formlibrary_customform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_customform_id_seq OWNED BY public.formlibrary_customform.id;


--
-- TOC entry 434 (class 1259 OID 19438)
-- Name: formlibrary_customformfield; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_customformfield (
    id integer NOT NULL,
    name character varying(255),
    label character varying(255),
    validations character varying(500),
    "order" integer NOT NULL,
    required boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    type_id integer NOT NULL
);


ALTER TABLE public.formlibrary_customformfield OWNER TO root;

--
-- TOC entry 433 (class 1259 OID 19436)
-- Name: formlibrary_customformfield_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_customformfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_customformfield_id_seq OWNER TO root;

--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 433
-- Name: formlibrary_customformfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_customformfield_id_seq OWNED BY public.formlibrary_customformfield.id;


--
-- TOC entry 436 (class 1259 OID 19449)
-- Name: formlibrary_distribution; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_distribution (
    id integer NOT NULL,
    distribution_name character varying(255) NOT NULL,
    distribution_implementer character varying(255),
    reporting_period character varying(255),
    total_beneficiaries_received_input integer,
    distribution_location character varying(255),
    input_type_distributed character varying(255),
    distributor_name_and_affiliation character varying(255),
    distributor_contact_number character varying(255),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    form_filled_by character varying(255),
    form_filled_by_position character varying(255),
    form_filled_by_contact_num character varying(255),
    form_filled_date character varying(255),
    form_verified_by character varying(255),
    form_verified_by_position character varying(255),
    form_verified_by_contact_num character varying(255),
    form_verified_date character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    distribution_indicator_id integer,
    office_code_id integer,
    province_id integer,
    workflowlevel1_id integer,
    workflowlevel2_id integer
);


ALTER TABLE public.formlibrary_distribution OWNER TO root;

--
-- TOC entry 444 (class 1259 OID 19507)
-- Name: formlibrary_distribution_disaggregation_value; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_distribution_disaggregation_value (
    id integer NOT NULL,
    distribution_id integer NOT NULL,
    disaggregationvalue_id integer NOT NULL
);


ALTER TABLE public.formlibrary_distribution_disaggregation_value OWNER TO root;

--
-- TOC entry 443 (class 1259 OID 19505)
-- Name: formlibrary_distribution_disaggregation_value_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_distribution_disaggregation_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_distribution_disaggregation_value_id_seq OWNER TO root;

--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 443
-- Name: formlibrary_distribution_disaggregation_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_distribution_disaggregation_value_id_seq OWNED BY public.formlibrary_distribution_disaggregation_value.id;


--
-- TOC entry 435 (class 1259 OID 19447)
-- Name: formlibrary_distribution_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_distribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_distribution_id_seq OWNER TO root;

--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 435
-- Name: formlibrary_distribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_distribution_id_seq OWNED BY public.formlibrary_distribution.id;


--
-- TOC entry 438 (class 1259 OID 19460)
-- Name: formlibrary_fieldtype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_fieldtype (
    id integer NOT NULL,
    name character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone
);


ALTER TABLE public.formlibrary_fieldtype OWNER TO root;

--
-- TOC entry 437 (class 1259 OID 19458)
-- Name: formlibrary_fieldtype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_fieldtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_fieldtype_id_seq OWNER TO root;

--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 437
-- Name: formlibrary_fieldtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_fieldtype_id_seq OWNED BY public.formlibrary_fieldtype.id;


--
-- TOC entry 440 (class 1259 OID 19468)
-- Name: formlibrary_trainingattendance; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_trainingattendance (
    id integer NOT NULL,
    training_name character varying(255) NOT NULL,
    implementer character varying(255),
    reporting_period character varying(255),
    total_participants integer,
    location character varying(255),
    community character varying(255),
    training_duration character varying(255),
    start_date character varying(255),
    end_date character varying(255),
    trainer_name character varying(255),
    trainer_contact_num character varying(255),
    form_filled_by character varying(255),
    form_filled_by_contact_num character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    training_indicator_id integer,
    workflowlevel1_id integer,
    workflowlevel2_id integer
);


ALTER TABLE public.formlibrary_trainingattendance OWNER TO root;

--
-- TOC entry 442 (class 1259 OID 19479)
-- Name: formlibrary_trainingattendance_disaggregation_value; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.formlibrary_trainingattendance_disaggregation_value (
    id integer NOT NULL,
    trainingattendance_id integer NOT NULL,
    disaggregationvalue_id integer NOT NULL
);


ALTER TABLE public.formlibrary_trainingattendance_disaggregation_value OWNER TO root;

--
-- TOC entry 441 (class 1259 OID 19477)
-- Name: formlibrary_trainingattendance_disaggregation_value_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_trainingattendance_disaggregation_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_trainingattendance_disaggregation_value_id_seq OWNER TO root;

--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 441
-- Name: formlibrary_trainingattendance_disaggregation_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_trainingattendance_disaggregation_value_id_seq OWNED BY public.formlibrary_trainingattendance_disaggregation_value.id;


--
-- TOC entry 439 (class 1259 OID 19466)
-- Name: formlibrary_trainingattendance_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.formlibrary_trainingattendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formlibrary_trainingattendance_id_seq OWNER TO root;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 439
-- Name: formlibrary_trainingattendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.formlibrary_trainingattendance_id_seq OWNED BY public.formlibrary_trainingattendance.id;


--
-- TOC entry 452 (class 1259 OID 19712)
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.guardian_groupobjectpermission OWNER TO root;

--
-- TOC entry 451 (class 1259 OID 19710)
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardian_groupobjectpermission_id_seq OWNER TO root;

--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 451
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.guardian_groupobjectpermission_id_seq OWNED BY public.guardian_groupobjectpermission.id;


--
-- TOC entry 454 (class 1259 OID 19720)
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.guardian_userobjectpermission OWNER TO root;

--
-- TOC entry 453 (class 1259 OID 19718)
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardian_userobjectpermission_id_seq OWNER TO root;

--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 453
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.guardian_userobjectpermission_id_seq OWNED BY public.guardian_userobjectpermission.id;


--
-- TOC entry 426 (class 1259 OID 19397)
-- Name: health_check_db_testmodel; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.health_check_db_testmodel (
    id integer NOT NULL,
    title character varying(128) NOT NULL
);


ALTER TABLE public.health_check_db_testmodel OWNER TO root;

--
-- TOC entry 425 (class 1259 OID 19395)
-- Name: health_check_db_testmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.health_check_db_testmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.health_check_db_testmodel_id_seq OWNER TO root;

--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 425
-- Name: health_check_db_testmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.health_check_db_testmodel_id_seq OWNED BY public.health_check_db_testmodel.id;


--
-- TOC entry 207 (class 1259 OID 16549)
-- Name: indicators_collecteddata; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_collecteddata (
    id integer NOT NULL,
    data_uuid character varying(255) NOT NULL,
    achieved numeric(20,2) NOT NULL,
    description text,
    date_collected timestamp with time zone,
    comment text,
    update_count_tola_table boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    approved_by_id integer,
    evidence_id integer,
    indicator_id integer NOT NULL,
    periodic_target_id integer,
    tola_table_id integer,
    workflowlevel1_id integer,
    workflowlevel2_id integer,
    created_by_id integer
);


ALTER TABLE public.indicators_collecteddata OWNER TO root;

--
-- TOC entry 472 (class 1259 OID 19878)
-- Name: indicators_collecteddata_disaggregation_value; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_collecteddata_disaggregation_value (
    id integer NOT NULL,
    collecteddata_id integer NOT NULL,
    disaggregationvalue_id integer NOT NULL
);


ALTER TABLE public.indicators_collecteddata_disaggregation_value OWNER TO root;

--
-- TOC entry 471 (class 1259 OID 19876)
-- Name: indicators_collecteddata_disaggregation_value_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_collecteddata_disaggregation_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_collecteddata_disaggregation_value_id_seq OWNER TO root;

--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 471
-- Name: indicators_collecteddata_disaggregation_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_collecteddata_disaggregation_value_id_seq OWNED BY public.indicators_collecteddata_disaggregation_value.id;


--
-- TOC entry 206 (class 1259 OID 16547)
-- Name: indicators_collecteddata_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_collecteddata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_collecteddata_id_seq OWNER TO root;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 206
-- Name: indicators_collecteddata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_collecteddata_id_seq OWNED BY public.indicators_collecteddata.id;


--
-- TOC entry 474 (class 1259 OID 19886)
-- Name: indicators_collecteddata_site; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_collecteddata_site (
    id integer NOT NULL,
    collecteddata_id integer NOT NULL,
    siteprofile_id integer NOT NULL
);


ALTER TABLE public.indicators_collecteddata_site OWNER TO root;

--
-- TOC entry 473 (class 1259 OID 19884)
-- Name: indicators_collecteddata_site_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_collecteddata_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_collecteddata_site_id_seq OWNER TO root;

--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 473
-- Name: indicators_collecteddata_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_collecteddata_site_id_seq OWNED BY public.indicators_collecteddata_site.id;


--
-- TOC entry 209 (class 1259 OID 16562)
-- Name: indicators_disaggregationlabel; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_disaggregationlabel (
    id integer NOT NULL,
    label character varying(765) NOT NULL,
    customsort integer,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    disaggregation_type_id integer NOT NULL
);


ALTER TABLE public.indicators_disaggregationlabel OWNER TO root;

--
-- TOC entry 208 (class 1259 OID 16560)
-- Name: indicators_disaggregationlabel_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_disaggregationlabel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_disaggregationlabel_id_seq OWNER TO root;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 208
-- Name: indicators_disaggregationlabel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_disaggregationlabel_id_seq OWNED BY public.indicators_disaggregationlabel.id;


--
-- TOC entry 211 (class 1259 OID 16573)
-- Name: indicators_disaggregationtype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_disaggregationtype (
    id integer NOT NULL,
    disaggregation_type character varying(135) NOT NULL,
    description character varying(765) NOT NULL,
    standard boolean NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.indicators_disaggregationtype OWNER TO root;

--
-- TOC entry 210 (class 1259 OID 16571)
-- Name: indicators_disaggregationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_disaggregationtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_disaggregationtype_id_seq OWNER TO root;

--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 210
-- Name: indicators_disaggregationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_disaggregationtype_id_seq OWNED BY public.indicators_disaggregationtype.id;


--
-- TOC entry 213 (class 1259 OID 16584)
-- Name: indicators_disaggregationvalue; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_disaggregationvalue (
    id integer NOT NULL,
    value character varying(765) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    disaggregation_label_id integer NOT NULL
);


ALTER TABLE public.indicators_disaggregationvalue OWNER TO root;

--
-- TOC entry 212 (class 1259 OID 16582)
-- Name: indicators_disaggregationvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_disaggregationvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_disaggregationvalue_id_seq OWNER TO root;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 212
-- Name: indicators_disaggregationvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_disaggregationvalue_id_seq OWNED BY public.indicators_disaggregationvalue.id;


--
-- TOC entry 215 (class 1259 OID 16595)
-- Name: indicators_externalservice; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_externalservice (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    service_url character varying(765) NOT NULL,
    feed_url character varying(765) NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.indicators_externalservice OWNER TO root;

--
-- TOC entry 214 (class 1259 OID 16593)
-- Name: indicators_externalservice_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_externalservice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_externalservice_id_seq OWNER TO root;

--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 214
-- Name: indicators_externalservice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_externalservice_id_seq OWNED BY public.indicators_externalservice.id;


--
-- TOC entry 217 (class 1259 OID 16606)
-- Name: indicators_externalservicerecord; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_externalservicerecord (
    id integer NOT NULL,
    full_url character varying(765) NOT NULL,
    record_id character varying(765) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    external_service_id integer
);


ALTER TABLE public.indicators_externalservicerecord OWNER TO root;

--
-- TOC entry 216 (class 1259 OID 16604)
-- Name: indicators_externalservicerecord_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_externalservicerecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_externalservicerecord_id_seq OWNER TO root;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 216
-- Name: indicators_externalservicerecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_externalservicerecord_id_seq OWNED BY public.indicators_externalservicerecord.id;


--
-- TOC entry 219 (class 1259 OID 16617)
-- Name: indicators_frequency; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_frequency (
    id integer NOT NULL,
    frequency character varying(135) NOT NULL,
    description character varying(765) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    numdays integer NOT NULL,
    organization_id integer NOT NULL,
    CONSTRAINT indicators_frequency_numdays_check CHECK ((numdays >= 0))
);


ALTER TABLE public.indicators_frequency OWNER TO root;

--
-- TOC entry 218 (class 1259 OID 16615)
-- Name: indicators_frequency_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_frequency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_frequency_id_seq OWNER TO root;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 218
-- Name: indicators_frequency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_frequency_id_seq OWNED BY public.indicators_frequency.id;


--
-- TOC entry 221 (class 1259 OID 16629)
-- Name: indicators_historicalcollecteddata; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_historicalcollecteddata (
    id integer NOT NULL,
    data_uuid character varying(255) NOT NULL,
    achieved numeric(20,2) NOT NULL,
    description text,
    date_collected timestamp with time zone,
    comment text,
    update_count_tola_table boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    approved_by_id integer,
    evidence_id integer,
    history_user_id integer,
    indicator_id integer,
    periodic_target_id integer,
    tola_table_id integer,
    workflowlevel1_id integer,
    workflowlevel2_id integer,
    created_by_id integer
);


ALTER TABLE public.indicators_historicalcollecteddata OWNER TO root;

--
-- TOC entry 220 (class 1259 OID 16627)
-- Name: indicators_historicalcollecteddata_history_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_historicalcollecteddata_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_historicalcollecteddata_history_id_seq OWNER TO root;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 220
-- Name: indicators_historicalcollecteddata_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_historicalcollecteddata_history_id_seq OWNED BY public.indicators_historicalcollecteddata.history_id;


--
-- TOC entry 223 (class 1259 OID 16640)
-- Name: indicators_historicalindicator; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_historicalindicator (
    id integer NOT NULL,
    indicator_uuid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    number character varying(255),
    source character varying(255),
    definition text,
    justification text,
    unit_of_measure character varying(135),
    baseline character varying(255),
    lop_target numeric(20,2) NOT NULL,
    rationale_for_target text,
    means_of_verification character varying(255),
    data_collection_method character varying(255),
    data_points text,
    responsible_person character varying(255),
    method_of_analysis character varying(255),
    information_use character varying(255),
    quality_assurance text,
    data_issues text,
    indicator_changes text,
    comments text,
    key_performance_indicator boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    notes text,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    approval_submitted_by_id integer,
    approved_by_id integer,
    data_collection_frequency_id integer,
    external_service_record_id integer,
    history_user_id integer,
    level_id integer,
    reporting_frequency_id integer,
    sector_id integer,
    created_by_id integer
);


ALTER TABLE public.indicators_historicalindicator OWNER TO root;

--
-- TOC entry 222 (class 1259 OID 16638)
-- Name: indicators_historicalindicator_history_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_historicalindicator_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_historicalindicator_history_id_seq OWNER TO root;

--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 222
-- Name: indicators_historicalindicator_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_historicalindicator_history_id_seq OWNED BY public.indicators_historicalindicator.history_id;


--
-- TOC entry 225 (class 1259 OID 16651)
-- Name: indicators_indicator; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_indicator (
    id integer NOT NULL,
    indicator_uuid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    number character varying(255),
    source character varying(255),
    definition text,
    justification text,
    unit_of_measure character varying(135),
    baseline character varying(255),
    lop_target numeric(20,2) NOT NULL,
    rationale_for_target text,
    means_of_verification character varying(255),
    data_collection_method character varying(255),
    data_points text,
    responsible_person character varying(255),
    method_of_analysis character varying(255),
    information_use character varying(255),
    quality_assurance text,
    data_issues text,
    indicator_changes text,
    comments text,
    key_performance_indicator boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    notes text,
    approval_submitted_by_id integer,
    approved_by_id integer,
    data_collection_frequency_id integer,
    external_service_record_id integer,
    level_id integer,
    reporting_frequency_id integer,
    sector_id integer,
    created_by_id integer
);


ALTER TABLE public.indicators_indicator OWNER TO root;

--
-- TOC entry 460 (class 1259 OID 19805)
-- Name: indicators_indicator_disaggregation; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_indicator_disaggregation (
    id integer NOT NULL,
    indicator_id integer NOT NULL,
    disaggregationtype_id integer NOT NULL
);


ALTER TABLE public.indicators_indicator_disaggregation OWNER TO root;

--
-- TOC entry 459 (class 1259 OID 19803)
-- Name: indicators_indicator_disaggregation_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_indicator_disaggregation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_indicator_disaggregation_id_seq OWNER TO root;

--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 459
-- Name: indicators_indicator_disaggregation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_indicator_disaggregation_id_seq OWNED BY public.indicators_indicator_disaggregation.id;


--
-- TOC entry 224 (class 1259 OID 16649)
-- Name: indicators_indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_indicator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_indicator_id_seq OWNER TO root;

--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 224
-- Name: indicators_indicator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_indicator_id_seq OWNED BY public.indicators_indicator.id;


--
-- TOC entry 462 (class 1259 OID 19813)
-- Name: indicators_indicator_indicator_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_indicator_indicator_type (
    id integer NOT NULL,
    indicator_id integer NOT NULL,
    indicatortype_id integer NOT NULL
);


ALTER TABLE public.indicators_indicator_indicator_type OWNER TO root;

--
-- TOC entry 461 (class 1259 OID 19811)
-- Name: indicators_indicator_indicator_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_indicator_indicator_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_indicator_indicator_type_id_seq OWNER TO root;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 461
-- Name: indicators_indicator_indicator_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_indicator_indicator_type_id_seq OWNED BY public.indicators_indicator_indicator_type.id;


--
-- TOC entry 464 (class 1259 OID 19821)
-- Name: indicators_indicator_objectives; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_indicator_objectives (
    id integer NOT NULL,
    indicator_id integer NOT NULL,
    objective_id integer NOT NULL
);


ALTER TABLE public.indicators_indicator_objectives OWNER TO root;

--
-- TOC entry 463 (class 1259 OID 19819)
-- Name: indicators_indicator_objectives_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_indicator_objectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_indicator_objectives_id_seq OWNER TO root;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 463
-- Name: indicators_indicator_objectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_indicator_objectives_id_seq OWNED BY public.indicators_indicator_objectives.id;


--
-- TOC entry 466 (class 1259 OID 19829)
-- Name: indicators_indicator_strategic_objectives; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_indicator_strategic_objectives (
    id integer NOT NULL,
    indicator_id integer NOT NULL,
    strategicobjective_id integer NOT NULL
);


ALTER TABLE public.indicators_indicator_strategic_objectives OWNER TO root;

--
-- TOC entry 465 (class 1259 OID 19827)
-- Name: indicators_indicator_strategic_objectives_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_indicator_strategic_objectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_indicator_strategic_objectives_id_seq OWNER TO root;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 465
-- Name: indicators_indicator_strategic_objectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_indicator_strategic_objectives_id_seq OWNED BY public.indicators_indicator_strategic_objectives.id;


--
-- TOC entry 468 (class 1259 OID 19837)
-- Name: indicators_indicator_sub_sector; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_indicator_sub_sector (
    id integer NOT NULL,
    indicator_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.indicators_indicator_sub_sector OWNER TO root;

--
-- TOC entry 467 (class 1259 OID 19835)
-- Name: indicators_indicator_sub_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_indicator_sub_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_indicator_sub_sector_id_seq OWNER TO root;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 467
-- Name: indicators_indicator_sub_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_indicator_sub_sector_id_seq OWNED BY public.indicators_indicator_sub_sector.id;


--
-- TOC entry 470 (class 1259 OID 19845)
-- Name: indicators_indicator_workflowlevel1; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_indicator_workflowlevel1 (
    id integer NOT NULL,
    indicator_id integer NOT NULL,
    workflowlevel1_id integer NOT NULL
);


ALTER TABLE public.indicators_indicator_workflowlevel1 OWNER TO root;

--
-- TOC entry 469 (class 1259 OID 19843)
-- Name: indicators_indicator_workflowlevel1_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_indicator_workflowlevel1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_indicator_workflowlevel1_id_seq OWNER TO root;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 469
-- Name: indicators_indicator_workflowlevel1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_indicator_workflowlevel1_id_seq OWNED BY public.indicators_indicator_workflowlevel1.id;


--
-- TOC entry 227 (class 1259 OID 16664)
-- Name: indicators_indicatortype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_indicatortype (
    id integer NOT NULL,
    indicator_type character varying(135) NOT NULL,
    description text NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.indicators_indicatortype OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 16662)
-- Name: indicators_indicatortype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_indicatortype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_indicatortype_id_seq OWNER TO root;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 226
-- Name: indicators_indicatortype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_indicatortype_id_seq OWNED BY public.indicators_indicatortype.id;


--
-- TOC entry 229 (class 1259 OID 16675)
-- Name: indicators_level; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_level (
    id integer NOT NULL,
    name character varying(135) NOT NULL,
    sort integer NOT NULL,
    parent_id integer NOT NULL,
    global_default boolean NOT NULL,
    description text NOT NULL,
    color character varying(135) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer,
    organization_id integer,
    workflowlevel1_id integer,
    created_by_id integer
);


ALTER TABLE public.indicators_level OWNER TO root;

--
-- TOC entry 228 (class 1259 OID 16673)
-- Name: indicators_level_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_level_id_seq OWNER TO root;

--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 228
-- Name: indicators_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_level_id_seq OWNED BY public.indicators_level.id;


--
-- TOC entry 231 (class 1259 OID 16686)
-- Name: indicators_objective; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_objective (
    id integer NOT NULL,
    name character varying(135) NOT NULL,
    description text NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    workflowlevel1_id integer,
    created_by_id integer
);


ALTER TABLE public.indicators_objective OWNER TO root;

--
-- TOC entry 230 (class 1259 OID 16684)
-- Name: indicators_objective_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_objective_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_objective_id_seq OWNER TO root;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 230
-- Name: indicators_objective_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_objective_id_seq OWNED BY public.indicators_objective.id;


--
-- TOC entry 233 (class 1259 OID 16697)
-- Name: indicators_periodictarget; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_periodictarget (
    id integer NOT NULL,
    period character varying(255),
    target numeric(20,2) NOT NULL,
    customsort integer,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    indicator_id integer NOT NULL
);


ALTER TABLE public.indicators_periodictarget OWNER TO root;

--
-- TOC entry 232 (class 1259 OID 16695)
-- Name: indicators_periodictarget_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_periodictarget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_periodictarget_id_seq OWNER TO root;

--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 232
-- Name: indicators_periodictarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_periodictarget_id_seq OWNED BY public.indicators_periodictarget.id;


--
-- TOC entry 235 (class 1259 OID 16705)
-- Name: indicators_reportingperiod; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_reportingperiod (
    id integer NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    frequency_id integer NOT NULL,
    organization_id integer NOT NULL
);


ALTER TABLE public.indicators_reportingperiod OWNER TO root;

--
-- TOC entry 234 (class 1259 OID 16703)
-- Name: indicators_reportingperiod_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_reportingperiod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_reportingperiod_id_seq OWNER TO root;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 234
-- Name: indicators_reportingperiod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_reportingperiod_id_seq OWNED BY public.indicators_reportingperiod.id;


--
-- TOC entry 237 (class 1259 OID 16713)
-- Name: indicators_strategicobjective; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_strategicobjective (
    id integer NOT NULL,
    name character varying(135) NOT NULL,
    description text NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer,
    organization_id integer
);


ALTER TABLE public.indicators_strategicobjective OWNER TO root;

--
-- TOC entry 236 (class 1259 OID 16711)
-- Name: indicators_strategicobjective_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_strategicobjective_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_strategicobjective_id_seq OWNER TO root;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 236
-- Name: indicators_strategicobjective_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_strategicobjective_id_seq OWNED BY public.indicators_strategicobjective.id;


--
-- TOC entry 239 (class 1259 OID 16724)
-- Name: indicators_tolatable; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_tolatable (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    table_id integer,
    remote_owner character varying(255),
    url character varying(255) NOT NULL,
    unique_count integer,
    count_column_name_1 character varying(255),
    count_column_name_2 character varying(255),
    column_sum integer,
    column_avg integer,
    refresh_interval integer,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL,
    owner_id integer
);


ALTER TABLE public.indicators_tolatable OWNER TO root;

--
-- TOC entry 456 (class 1259 OID 19768)
-- Name: indicators_tolatable_country; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_tolatable_country (
    id integer NOT NULL,
    tolatable_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.indicators_tolatable_country OWNER TO root;

--
-- TOC entry 455 (class 1259 OID 19766)
-- Name: indicators_tolatable_country_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_tolatable_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_tolatable_country_id_seq OWNER TO root;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 455
-- Name: indicators_tolatable_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_tolatable_country_id_seq OWNED BY public.indicators_tolatable_country.id;


--
-- TOC entry 238 (class 1259 OID 16722)
-- Name: indicators_tolatable_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_tolatable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_tolatable_id_seq OWNER TO root;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 238
-- Name: indicators_tolatable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_tolatable_id_seq OWNED BY public.indicators_tolatable.id;


--
-- TOC entry 458 (class 1259 OID 19784)
-- Name: indicators_tolatable_workflowlevel1; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.indicators_tolatable_workflowlevel1 (
    id integer NOT NULL,
    tolatable_id integer NOT NULL,
    workflowlevel1_id integer NOT NULL
);


ALTER TABLE public.indicators_tolatable_workflowlevel1 OWNER TO root;

--
-- TOC entry 457 (class 1259 OID 19782)
-- Name: indicators_tolatable_workflowlevel1_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.indicators_tolatable_workflowlevel1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_tolatable_workflowlevel1_id_seq OWNER TO root;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 457
-- Name: indicators_tolatable_workflowlevel1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.indicators_tolatable_workflowlevel1_id_seq OWNED BY public.indicators_tolatable_workflowlevel1.id;


--
-- TOC entry 479 (class 1259 OID 20650)
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO root;

--
-- TOC entry 476 (class 1259 OID 20508)
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO root;

--
-- TOC entry 480 (class 1259 OID 20689)
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO root;

--
-- TOC entry 475 (class 1259 OID 20495)
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.oauth2_provider_application (
    id bigint DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO root;

--
-- TOC entry 481 (class 1259 OID 20755)
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO root;

--
-- TOC entry 477 (class 1259 OID 20519)
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO root;

--
-- TOC entry 482 (class 1259 OID 20775)
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO root;

--
-- TOC entry 478 (class 1259 OID 20530)
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO root;

--
-- TOC entry 484 (class 1259 OID 20879)
-- Name: search_searchindexlog; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.search_searchindexlog (
    id integer NOT NULL,
    create_date timestamp with time zone,
    document_count integer NOT NULL
);


ALTER TABLE public.search_searchindexlog OWNER TO root;

--
-- TOC entry 483 (class 1259 OID 20877)
-- Name: search_searchindexlog_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.search_searchindexlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.search_searchindexlog_id_seq OWNER TO root;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 483
-- Name: search_searchindexlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.search_searchindexlog_id_seq OWNED BY public.search_searchindexlog.id;


--
-- TOC entry 487 (class 1259 OID 20897)
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO root;

--
-- TOC entry 486 (class 1259 OID 20895)
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO root;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 486
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- TOC entry 489 (class 1259 OID 20908)
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO root;

--
-- TOC entry 488 (class 1259 OID 20906)
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO root;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 488
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- TOC entry 491 (class 1259 OID 20916)
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO root;

--
-- TOC entry 490 (class 1259 OID 20914)
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO root;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 490
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- TOC entry 495 (class 1259 OID 20959)
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO root;

--
-- TOC entry 494 (class 1259 OID 20957)
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO root;

--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 494
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- TOC entry 493 (class 1259 OID 20924)
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO root;

--
-- TOC entry 492 (class 1259 OID 20922)
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO root;

--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 492
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- TOC entry 241 (class 1259 OID 16749)
-- Name: workflow_adminlevelfour; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_adminlevelfour (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    adminlevelthree_id integer,
    adminleveltwo_id integer
);


ALTER TABLE public.workflow_adminlevelfour OWNER TO root;

--
-- TOC entry 240 (class 1259 OID 16747)
-- Name: workflow_adminlevelfour_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_adminlevelfour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_adminlevelfour_id_seq OWNER TO root;

--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 240
-- Name: workflow_adminlevelfour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_adminlevelfour_id_seq OWNED BY public.workflow_adminlevelfour.id;


--
-- TOC entry 243 (class 1259 OID 16757)
-- Name: workflow_adminlevelone; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_adminlevelone (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer NOT NULL
);


ALTER TABLE public.workflow_adminlevelone OWNER TO root;

--
-- TOC entry 242 (class 1259 OID 16755)
-- Name: workflow_adminlevelone_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_adminlevelone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_adminlevelone_id_seq OWNER TO root;

--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 242
-- Name: workflow_adminlevelone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_adminlevelone_id_seq OWNED BY public.workflow_adminlevelone.id;


--
-- TOC entry 245 (class 1259 OID 16765)
-- Name: workflow_adminlevelthree; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_adminlevelthree (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    adminleveltwo_id integer
);


ALTER TABLE public.workflow_adminlevelthree OWNER TO root;

--
-- TOC entry 244 (class 1259 OID 16763)
-- Name: workflow_adminlevelthree_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_adminlevelthree_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_adminlevelthree_id_seq OWNER TO root;

--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 244
-- Name: workflow_adminlevelthree_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_adminlevelthree_id_seq OWNED BY public.workflow_adminlevelthree.id;


--
-- TOC entry 247 (class 1259 OID 16773)
-- Name: workflow_adminleveltwo; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_adminleveltwo (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    adminlevelone_id integer NOT NULL
);


ALTER TABLE public.workflow_adminleveltwo OWNER TO root;

--
-- TOC entry 246 (class 1259 OID 16771)
-- Name: workflow_adminleveltwo_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_adminleveltwo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_adminleveltwo_id_seq OWNER TO root;

--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 246
-- Name: workflow_adminleveltwo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_adminleveltwo_id_seq OWNED BY public.workflow_adminleveltwo.id;


--
-- TOC entry 249 (class 1259 OID 16781)
-- Name: workflow_approvaltype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_approvaltype (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.workflow_approvaltype OWNER TO root;

--
-- TOC entry 248 (class 1259 OID 16779)
-- Name: workflow_approvaltype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_approvaltype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_approvaltype_id_seq OWNER TO root;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 248
-- Name: workflow_approvaltype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_approvaltype_id_seq OWNED BY public.workflow_approvaltype.id;


--
-- TOC entry 251 (class 1259 OID 16789)
-- Name: workflow_approvalworkflow; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_approvalworkflow (
    id integer NOT NULL,
    note text,
    date_assigned timestamp with time zone,
    date_approved timestamp with time zone,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    status character varying(50) NOT NULL,
    section character varying(50) NOT NULL,
    approval_type_id integer NOT NULL,
    assigned_to_id integer NOT NULL,
    requested_from_id integer NOT NULL,
    created_by_id integer
);


ALTER TABLE public.workflow_approvalworkflow OWNER TO root;

--
-- TOC entry 250 (class 1259 OID 16787)
-- Name: workflow_approvalworkflow_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_approvalworkflow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_approvalworkflow_id_seq OWNER TO root;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 250
-- Name: workflow_approvalworkflow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_approvalworkflow_id_seq OWNED BY public.workflow_approvalworkflow.id;


--
-- TOC entry 253 (class 1259 OID 16800)
-- Name: workflow_award; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_award (
    id integer NOT NULL,
    name character varying(100),
    amount integer NOT NULL,
    status character varying(50) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    award_currency_id integer,
    currency_id integer,
    organization_id integer NOT NULL
);


ALTER TABLE public.workflow_award OWNER TO root;

--
-- TOC entry 405 (class 1259 OID 17560)
-- Name: workflow_award_countries; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_award_countries (
    id integer NOT NULL,
    award_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.workflow_award_countries OWNER TO root;

--
-- TOC entry 404 (class 1259 OID 17558)
-- Name: workflow_award_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_award_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_award_countries_id_seq OWNER TO root;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 404
-- Name: workflow_award_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_award_countries_id_seq OWNED BY public.workflow_award_countries.id;


--
-- TOC entry 407 (class 1259 OID 17568)
-- Name: workflow_award_donors; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_award_donors (
    id integer NOT NULL,
    award_id integer NOT NULL,
    stakeholder_id integer NOT NULL
);


ALTER TABLE public.workflow_award_donors OWNER TO root;

--
-- TOC entry 406 (class 1259 OID 17566)
-- Name: workflow_award_donors_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_award_donors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_award_donors_id_seq OWNER TO root;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 406
-- Name: workflow_award_donors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_award_donors_id_seq OWNED BY public.workflow_award_donors.id;


--
-- TOC entry 252 (class 1259 OID 16798)
-- Name: workflow_award_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_award_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_award_id_seq OWNER TO root;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 252
-- Name: workflow_award_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_award_id_seq OWNED BY public.workflow_award.id;


--
-- TOC entry 255 (class 1259 OID 16808)
-- Name: workflow_budget; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_budget (
    id integer NOT NULL,
    contributor character varying(135),
    account_code character varying(135),
    cost_center character varying(135),
    donor_code character varying(135),
    description_of_contribution character varying(255),
    proposed_value numeric(12,2) NOT NULL,
    actual_value numeric(12,2) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    donor_currency_id integer,
    local_currency_id integer,
    workflowlevel2_id integer,
    created_by_id integer
);


ALTER TABLE public.workflow_budget OWNER TO root;

--
-- TOC entry 254 (class 1259 OID 16806)
-- Name: workflow_budget_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_budget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_budget_id_seq OWNER TO root;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 254
-- Name: workflow_budget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_budget_id_seq OWNED BY public.workflow_budget.id;


--
-- TOC entry 257 (class 1259 OID 16819)
-- Name: workflow_checklist; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_checklist (
    id integer NOT NULL,
    name character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer,
    owner_id integer,
    workflowlevel2_id integer
);


ALTER TABLE public.workflow_checklist OWNER TO root;

--
-- TOC entry 256 (class 1259 OID 16817)
-- Name: workflow_checklist_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_checklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_checklist_id_seq OWNER TO root;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 256
-- Name: workflow_checklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_checklist_id_seq OWNED BY public.workflow_checklist.id;


--
-- TOC entry 259 (class 1259 OID 16827)
-- Name: workflow_checklistitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_checklistitem (
    id integer NOT NULL,
    item character varying(255) NOT NULL,
    in_file boolean NOT NULL,
    not_applicable boolean NOT NULL,
    global_item boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    checklist_id integer NOT NULL,
    owner_id integer
);


ALTER TABLE public.workflow_checklistitem OWNER TO root;

--
-- TOC entry 258 (class 1259 OID 16825)
-- Name: workflow_checklistitem_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_checklistitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_checklistitem_id_seq OWNER TO root;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 258
-- Name: workflow_checklistitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_checklistitem_id_seq OWNED BY public.workflow_checklistitem.id;


--
-- TOC entry 261 (class 1259 OID 16835)
-- Name: workflow_codedfield; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_codedfield (
    id integer NOT NULL,
    name character varying(255),
    label character varying(255),
    is_required boolean NOT NULL,
    is_universal boolean NOT NULL,
    type character varying(255),
    default_value character varying(255),
    api_url character varying(255),
    api_token character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.workflow_codedfield OWNER TO root;

--
-- TOC entry 260 (class 1259 OID 16833)
-- Name: workflow_codedfield_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_codedfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_codedfield_id_seq OWNER TO root;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 260
-- Name: workflow_codedfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_codedfield_id_seq OWNED BY public.workflow_codedfield.id;


--
-- TOC entry 401 (class 1259 OID 17544)
-- Name: workflow_codedfield_workflowlevel1; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_codedfield_workflowlevel1 (
    id integer NOT NULL,
    codedfield_id integer NOT NULL,
    workflowlevel1_id integer NOT NULL
);


ALTER TABLE public.workflow_codedfield_workflowlevel1 OWNER TO root;

--
-- TOC entry 400 (class 1259 OID 17542)
-- Name: workflow_codedfield_workflowlevel1_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_codedfield_workflowlevel1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_codedfield_workflowlevel1_id_seq OWNER TO root;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 400
-- Name: workflow_codedfield_workflowlevel1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_codedfield_workflowlevel1_id_seq OWNED BY public.workflow_codedfield_workflowlevel1.id;


--
-- TOC entry 403 (class 1259 OID 17552)
-- Name: workflow_codedfield_workflowlevel2; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_codedfield_workflowlevel2 (
    id integer NOT NULL,
    codedfield_id integer NOT NULL,
    workflowlevel2_id integer NOT NULL
);


ALTER TABLE public.workflow_codedfield_workflowlevel2 OWNER TO root;

--
-- TOC entry 402 (class 1259 OID 17550)
-- Name: workflow_codedfield_workflowlevel2_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_codedfield_workflowlevel2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_codedfield_workflowlevel2_id_seq OWNER TO root;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 402
-- Name: workflow_codedfield_workflowlevel2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_codedfield_workflowlevel2_id_seq OWNED BY public.workflow_codedfield_workflowlevel2.id;


--
-- TOC entry 263 (class 1259 OID 16846)
-- Name: workflow_codedfieldvalues; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_codedfieldvalues (
    id integer NOT NULL,
    value character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    coded_field_id integer NOT NULL,
    workflowlevel2_id integer
);


ALTER TABLE public.workflow_codedfieldvalues OWNER TO root;

--
-- TOC entry 262 (class 1259 OID 16844)
-- Name: workflow_codedfieldvalues_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_codedfieldvalues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_codedfieldvalues_id_seq OWNER TO root;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 262
-- Name: workflow_codedfieldvalues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_codedfieldvalues_id_seq OWNED BY public.workflow_codedfieldvalues.id;


--
-- TOC entry 265 (class 1259 OID 16854)
-- Name: workflow_contact; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_contact (
    id integer NOT NULL,
    name character varying(255),
    title character varying(255),
    city character varying(255),
    address text,
    email character varying(255),
    phone character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer NOT NULL,
    organization_id integer,
    workflowlevel1_id integer
);


ALTER TABLE public.workflow_contact OWNER TO root;

--
-- TOC entry 264 (class 1259 OID 16852)
-- Name: workflow_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_contact_id_seq OWNER TO root;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 264
-- Name: workflow_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_contact_id_seq OWNED BY public.workflow_contact.id;


--
-- TOC entry 267 (class 1259 OID 16865)
-- Name: workflow_country; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_country (
    id integer NOT NULL,
    country character varying(255) NOT NULL,
    code character varying(4) NOT NULL,
    description text NOT NULL,
    latitude character varying(255),
    longitude character varying(255),
    zoom integer NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone
);


ALTER TABLE public.workflow_country OWNER TO root;

--
-- TOC entry 266 (class 1259 OID 16863)
-- Name: workflow_country_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_country_id_seq OWNER TO root;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 266
-- Name: workflow_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_country_id_seq OWNED BY public.workflow_country.id;


--
-- TOC entry 269 (class 1259 OID 16876)
-- Name: workflow_currency; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_currency (
    id integer NOT NULL,
    source_currency character varying(255) NOT NULL,
    target_currency character varying(255) NOT NULL,
    current_rate integer,
    conversion_date timestamp with time zone,
    create_date timestamp with time zone,
    edit_date timestamp with time zone
);


ALTER TABLE public.workflow_currency OWNER TO root;

--
-- TOC entry 268 (class 1259 OID 16874)
-- Name: workflow_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_currency_id_seq OWNER TO root;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 268
-- Name: workflow_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_currency_id_seq OWNED BY public.workflow_currency.id;


--
-- TOC entry 411 (class 1259 OID 18823)
-- Name: workflow_dashboard; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_dashboard (
    id integer NOT NULL,
    name character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    user_id integer NOT NULL,
    public character varying(5)
);


ALTER TABLE public.workflow_dashboard OWNER TO root;

--
-- TOC entry 410 (class 1259 OID 18821)
-- Name: workflow_dashboard_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_dashboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_dashboard_id_seq OWNER TO root;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 410
-- Name: workflow_dashboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_dashboard_id_seq OWNED BY public.workflow_dashboard.id;


--
-- TOC entry 413 (class 1259 OID 18831)
-- Name: workflow_dashboard_share; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_dashboard_share (
    id integer NOT NULL,
    dashboard_id integer NOT NULL,
    tolauser_id integer NOT NULL
);


ALTER TABLE public.workflow_dashboard_share OWNER TO root;

--
-- TOC entry 412 (class 1259 OID 18829)
-- Name: workflow_dashboard_share_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_dashboard_share_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_dashboard_share_id_seq OWNER TO root;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 412
-- Name: workflow_dashboard_share_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_dashboard_share_id_seq OWNED BY public.workflow_dashboard_share.id;


--
-- TOC entry 417 (class 1259 OID 18850)
-- Name: workflow_dashboard_widgets; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_dashboard_widgets (
    id integer NOT NULL,
    dashboard_id integer NOT NULL,
    widget_id integer NOT NULL
);


ALTER TABLE public.workflow_dashboard_widgets OWNER TO root;

--
-- TOC entry 416 (class 1259 OID 18848)
-- Name: workflow_dashboard_widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_dashboard_widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_dashboard_widgets_id_seq OWNER TO root;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 416
-- Name: workflow_dashboard_widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_dashboard_widgets_id_seq OWNED BY public.workflow_dashboard_widgets.id;


--
-- TOC entry 271 (class 1259 OID 16887)
-- Name: workflow_documentation; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_documentation (
    id integer NOT NULL,
    document_uuid character varying(255) NOT NULL,
    name character varying(255),
    url character varying(255),
    description character varying(255),
    file_field character varying(100),
    file_type character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    workflowlevel1_id integer NOT NULL,
    workflowlevel2_id integer,
    created_by_id integer
);


ALTER TABLE public.workflow_documentation OWNER TO root;

--
-- TOC entry 270 (class 1259 OID 16885)
-- Name: workflow_documentation_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_documentation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_documentation_id_seq OWNER TO root;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 270
-- Name: workflow_documentation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_documentation_id_seq OWNED BY public.workflow_documentation.id;


--
-- TOC entry 273 (class 1259 OID 16900)
-- Name: workflow_formguidance; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_formguidance (
    id integer NOT NULL,
    form character varying(135),
    guidance_link character varying(200),
    guidance text,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.workflow_formguidance OWNER TO root;

--
-- TOC entry 272 (class 1259 OID 16898)
-- Name: workflow_formguidance_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_formguidance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_formguidance_id_seq OWNER TO root;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 272
-- Name: workflow_formguidance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_formguidance_id_seq OWNED BY public.workflow_formguidance.id;


--
-- TOC entry 275 (class 1259 OID 16911)
-- Name: workflow_fundcode; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_fundcode (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.workflow_fundcode OWNER TO root;

--
-- TOC entry 274 (class 1259 OID 16909)
-- Name: workflow_fundcode_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_fundcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_fundcode_id_seq OWNER TO root;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 274
-- Name: workflow_fundcode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_fundcode_id_seq OWNED BY public.workflow_fundcode.id;


--
-- TOC entry 277 (class 1259 OID 16919)
-- Name: workflow_historicalbudget; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_historicalbudget (
    id integer NOT NULL,
    contributor character varying(135),
    account_code character varying(135),
    cost_center character varying(135),
    donor_code character varying(135),
    description_of_contribution character varying(255),
    proposed_value numeric(12,2) NOT NULL,
    actual_value numeric(12,2) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    donor_currency_id integer,
    history_user_id integer,
    local_currency_id integer,
    workflowlevel2_id integer,
    created_by_id integer
);


ALTER TABLE public.workflow_historicalbudget OWNER TO root;

--
-- TOC entry 276 (class 1259 OID 16917)
-- Name: workflow_historicalbudget_history_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_historicalbudget_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_historicalbudget_history_id_seq OWNER TO root;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 276
-- Name: workflow_historicalbudget_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_historicalbudget_history_id_seq OWNED BY public.workflow_historicalbudget.history_id;


--
-- TOC entry 279 (class 1259 OID 16930)
-- Name: workflow_historicalissueregister; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_historicalissueregister (
    id integer NOT NULL,
    name character varying(255),
    type character varying(135),
    impact character varying(255),
    rating character varying(255),
    status integer,
    cause character varying(255),
    date_opened timestamp with time zone,
    date_resolved timestamp with time zone,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    assigned_id integer,
    history_user_id integer,
    organization_id integer,
    workflowlevel2_id integer
);


ALTER TABLE public.workflow_historicalissueregister OWNER TO root;

--
-- TOC entry 278 (class 1259 OID 16928)
-- Name: workflow_historicalissueregister_history_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_historicalissueregister_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_historicalissueregister_history_id_seq OWNER TO root;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 278
-- Name: workflow_historicalissueregister_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_historicalissueregister_history_id_seq OWNED BY public.workflow_historicalissueregister.history_id;


--
-- TOC entry 281 (class 1259 OID 16941)
-- Name: workflow_historicalriskregister; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_historicalriskregister (
    id integer NOT NULL,
    name character varying(255),
    type character varying(135),
    impact character varying(255),
    likelihood character varying(255),
    rating character varying(255),
    status integer,
    category character varying(255),
    contingency_plan character varying(255),
    mitigation_plan character varying(255),
    post_mitigation_status character varying(255),
    action_by timestamp with time zone,
    action_when timestamp with time zone,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    history_user_id integer,
    workflowlevel2_id integer
);


ALTER TABLE public.workflow_historicalriskregister OWNER TO root;

--
-- TOC entry 280 (class 1259 OID 16939)
-- Name: workflow_historicalriskregister_history_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_historicalriskregister_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_historicalriskregister_history_id_seq OWNER TO root;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 280
-- Name: workflow_historicalriskregister_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_historicalriskregister_history_id_seq OWNED BY public.workflow_historicalriskregister.history_id;


--
-- TOC entry 283 (class 1259 OID 16952)
-- Name: workflow_historicalsiteprofile; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_historicalsiteprofile (
    id integer NOT NULL,
    site_uuid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    contact_leader character varying(255),
    date_of_firstcontact timestamp with time zone,
    contact_number character varying(255),
    num_members character varying(255),
    info_source character varying(255),
    total_num_households integer,
    avg_household_size numeric(25,14),
    total_population integer,
    total_male integer,
    total_female integer,
    total_land integer,
    total_agricultural_land integer,
    total_rainfed_land integer,
    total_horticultural_land integer,
    total_literate_peoples integer,
    literate_males integer,
    literate_females integer,
    literacy_rate integer,
    populations_owning_land integer,
    avg_landholding_size numeric(25,14) NOT NULL,
    households_owning_livestock integer,
    animal_type character varying(255),
    latitude numeric(25,16) NOT NULL,
    longitude numeric(25,16) NOT NULL,
    status boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    admin_level_three_id integer,
    classify_land_id integer,
    country_id integer,
    district_id integer,
    history_user_id integer,
    office_id integer,
    province_id integer,
    type_id integer,
    village_id integer,
    organization_id integer,
    created_by_id integer
);


ALTER TABLE public.workflow_historicalsiteprofile OWNER TO root;

--
-- TOC entry 282 (class 1259 OID 16950)
-- Name: workflow_historicalsiteprofile_history_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_historicalsiteprofile_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_historicalsiteprofile_history_id_seq OWNER TO root;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 282
-- Name: workflow_historicalsiteprofile_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_historicalsiteprofile_history_id_seq OWNED BY public.workflow_historicalsiteprofile.history_id;


--
-- TOC entry 285 (class 1259 OID 16963)
-- Name: workflow_historicalworkflowlevel2; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_historicalworkflowlevel2 (
    id integer NOT NULL,
    level2_uuid character varying(255) NOT NULL,
    parent_workflowlevel2 integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    short_name character varying(20),
    staff_responsible_id integer,
    effect_or_impact text,
    expected_start_date timestamp with time zone,
    expected_end_date timestamp with time zone,
    total_estimated_budget numeric(12,2) NOT NULL,
    justification_background text,
    risks_assumptions text,
    description_of_government_involvement text,
    description_of_community_involvement text,
    actual_start_date timestamp with time zone,
    actual_end_date timestamp with time zone,
    actual_duration character varying(255),
    actual_cost numeric(20,2) NOT NULL,
    total_cost numeric(12,2) NOT NULL,
    capacity_built text,
    quality_assured text,
    issues_and_challenges text,
    lessons_learned text,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    status character varying(50) NOT NULL,
    progress character varying(50) NOT NULL,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    donor_currency_id integer,
    history_user_id integer,
    local_currency_id integer,
    milestone_id integer,
    office_id integer,
    sector_id integer,
    workflowlevel1_id integer,
    created_by_id integer,
    address public.hstore,
    notes text,
    site_instructions text,
    type character varying(50)
);


ALTER TABLE public.workflow_historicalworkflowlevel2 OWNER TO root;

--
-- TOC entry 284 (class 1259 OID 16961)
-- Name: workflow_historicalworkflowlevel2_history_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_historicalworkflowlevel2_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_historicalworkflowlevel2_history_id_seq OWNER TO root;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 284
-- Name: workflow_historicalworkflowlevel2_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_historicalworkflowlevel2_history_id_seq OWNED BY public.workflow_historicalworkflowlevel2.history_id;


--
-- TOC entry 287 (class 1259 OID 16974)
-- Name: workflow_industry; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_industry (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    create_date timestamp with time zone,
    edit_date timestamp with time zone
);


ALTER TABLE public.workflow_industry OWNER TO root;

--
-- TOC entry 286 (class 1259 OID 16972)
-- Name: workflow_industry_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_industry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_industry_id_seq OWNER TO root;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 286
-- Name: workflow_industry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_industry_id_seq OWNED BY public.workflow_industry.id;


--
-- TOC entry 289 (class 1259 OID 16985)
-- Name: workflow_internationalization; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_internationalization (
    id integer NOT NULL,
    language character varying(100),
    language_file jsonb NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone
);


ALTER TABLE public.workflow_internationalization OWNER TO root;

--
-- TOC entry 288 (class 1259 OID 16983)
-- Name: workflow_internationalization_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_internationalization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_internationalization_id_seq OWNER TO root;

--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 288
-- Name: workflow_internationalization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_internationalization_id_seq OWNED BY public.workflow_internationalization.id;


--
-- TOC entry 291 (class 1259 OID 16996)
-- Name: workflow_issueregister; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_issueregister (
    id integer NOT NULL,
    name character varying(255),
    type character varying(135),
    impact character varying(255),
    rating character varying(255),
    status integer,
    cause character varying(255),
    date_opened timestamp with time zone,
    date_resolved timestamp with time zone,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    assigned_id integer,
    organization_id integer,
    workflowlevel2_id integer
);


ALTER TABLE public.workflow_issueregister OWNER TO root;

--
-- TOC entry 290 (class 1259 OID 16994)
-- Name: workflow_issueregister_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_issueregister_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_issueregister_id_seq OWNER TO root;

--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 290
-- Name: workflow_issueregister_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_issueregister_id_seq OWNED BY public.workflow_issueregister.id;


--
-- TOC entry 293 (class 1259 OID 17007)
-- Name: workflow_landtype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_landtype (
    id integer NOT NULL,
    classify_land character varying(100) NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.workflow_landtype OWNER TO root;

--
-- TOC entry 292 (class 1259 OID 17005)
-- Name: workflow_landtype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_landtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_landtype_id_seq OWNER TO root;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 292
-- Name: workflow_landtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_landtype_id_seq OWNED BY public.workflow_landtype.id;


--
-- TOC entry 295 (class 1259 OID 17015)
-- Name: workflow_milestone; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_milestone (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    milestone_start_date timestamp with time zone,
    milestone_end_date timestamp with time zone,
    is_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer,
    created_by_id integer
);


ALTER TABLE public.workflow_milestone OWNER TO root;

--
-- TOC entry 294 (class 1259 OID 17013)
-- Name: workflow_milestone_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_milestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_milestone_id_seq OWNER TO root;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 294
-- Name: workflow_milestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_milestone_id_seq OWNED BY public.workflow_milestone.id;


--
-- TOC entry 297 (class 1259 OID 17026)
-- Name: workflow_office; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_office (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer NOT NULL
);


ALTER TABLE public.workflow_office OWNER TO root;

--
-- TOC entry 296 (class 1259 OID 17024)
-- Name: workflow_office_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_office_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_office_id_seq OWNER TO root;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 296
-- Name: workflow_office_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_office_id_seq OWNED BY public.workflow_office.id;


--
-- TOC entry 299 (class 1259 OID 17037)
-- Name: workflow_organization; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_organization (
    id integer NOT NULL,
    organization_uuid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    organization_url character varying(255),
    level_1_label character varying(255) NOT NULL,
    level_2_label character varying(255) NOT NULL,
    level_3_label character varying(255) NOT NULL,
    level_4_label character varying(255) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    chargebee_subscription_id character varying(50),
    chargebee_used_seats integer,
    oauth_domains character varying(255)[],
    currency_format character varying(50) NOT NULL,
    date_format character varying(50) NOT NULL,
    default_currency_id integer,
    allow_budget_decimal boolean NOT NULL
);


ALTER TABLE public.workflow_organization OWNER TO root;

--
-- TOC entry 298 (class 1259 OID 17035)
-- Name: workflow_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_organization_id_seq OWNER TO root;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 298
-- Name: workflow_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_organization_id_seq OWNED BY public.workflow_organization.id;


--
-- TOC entry 301 (class 1259 OID 17050)
-- Name: workflow_organization_industry; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_organization_industry (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    industry_id integer NOT NULL
);


ALTER TABLE public.workflow_organization_industry OWNER TO root;

--
-- TOC entry 300 (class 1259 OID 17048)
-- Name: workflow_organization_industry_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_organization_industry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_organization_industry_id_seq OWNER TO root;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 300
-- Name: workflow_organization_industry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_organization_industry_id_seq OWNED BY public.workflow_organization_industry.id;


--
-- TOC entry 399 (class 1259 OID 17510)
-- Name: workflow_organization_sector; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_organization_sector (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.workflow_organization_sector OWNER TO root;

--
-- TOC entry 398 (class 1259 OID 17508)
-- Name: workflow_organization_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_organization_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_organization_sector_id_seq OWNER TO root;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 398
-- Name: workflow_organization_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_organization_sector_id_seq OWNED BY public.workflow_organization_sector.id;


--
-- TOC entry 303 (class 1259 OID 17058)
-- Name: workflow_partner; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_partner (
    id integer NOT NULL,
    partners_uuid character varying(255) NOT NULL,
    name character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer,
    organization_id integer NOT NULL,
    type_id integer
);


ALTER TABLE public.workflow_partner OWNER TO root;

--
-- TOC entry 305 (class 1259 OID 17071)
-- Name: workflow_partner_approval; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_partner_approval (
    id integer NOT NULL,
    partner_id integer NOT NULL,
    approvalworkflow_id integer NOT NULL
);


ALTER TABLE public.workflow_partner_approval OWNER TO root;

--
-- TOC entry 304 (class 1259 OID 17069)
-- Name: workflow_partner_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_partner_approval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_partner_approval_id_seq OWNER TO root;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 304
-- Name: workflow_partner_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_partner_approval_id_seq OWNED BY public.workflow_partner_approval.id;


--
-- TOC entry 307 (class 1259 OID 17079)
-- Name: workflow_partner_contact; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_partner_contact (
    id integer NOT NULL,
    partner_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.workflow_partner_contact OWNER TO root;

--
-- TOC entry 306 (class 1259 OID 17077)
-- Name: workflow_partner_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_partner_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_partner_contact_id_seq OWNER TO root;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 306
-- Name: workflow_partner_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_partner_contact_id_seq OWNED BY public.workflow_partner_contact.id;


--
-- TOC entry 302 (class 1259 OID 17056)
-- Name: workflow_partner_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_partner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_partner_id_seq OWNER TO root;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 302
-- Name: workflow_partner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_partner_id_seq OWNED BY public.workflow_partner.id;


--
-- TOC entry 395 (class 1259 OID 17494)
-- Name: workflow_partner_sectors; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_partner_sectors (
    id integer NOT NULL,
    partner_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.workflow_partner_sectors OWNER TO root;

--
-- TOC entry 394 (class 1259 OID 17492)
-- Name: workflow_partner_sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_partner_sectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_partner_sectors_id_seq OWNER TO root;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 394
-- Name: workflow_partner_sectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_partner_sectors_id_seq OWNED BY public.workflow_partner_sectors.id;


--
-- TOC entry 397 (class 1259 OID 17502)
-- Name: workflow_partner_workflowlevel1; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_partner_workflowlevel1 (
    id integer NOT NULL,
    partner_id integer NOT NULL,
    workflowlevel1_id integer NOT NULL
);


ALTER TABLE public.workflow_partner_workflowlevel1 OWNER TO root;

--
-- TOC entry 396 (class 1259 OID 17500)
-- Name: workflow_partner_workflowlevel1_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_partner_workflowlevel1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_partner_workflowlevel1_id_seq OWNER TO root;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 396
-- Name: workflow_partner_workflowlevel1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_partner_workflowlevel1_id_seq OWNED BY public.workflow_partner_workflowlevel1.id;


--
-- TOC entry 309 (class 1259 OID 17087)
-- Name: workflow_portfolio; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_portfolio (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    is_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer
);


ALTER TABLE public.workflow_portfolio OWNER TO root;

--
-- TOC entry 311 (class 1259 OID 17098)
-- Name: workflow_portfolio_country; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_portfolio_country (
    id integer NOT NULL,
    portfolio_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.workflow_portfolio_country OWNER TO root;

--
-- TOC entry 310 (class 1259 OID 17096)
-- Name: workflow_portfolio_country_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_portfolio_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_portfolio_country_id_seq OWNER TO root;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 310
-- Name: workflow_portfolio_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_portfolio_country_id_seq OWNED BY public.workflow_portfolio_country.id;


--
-- TOC entry 308 (class 1259 OID 17085)
-- Name: workflow_portfolio_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_portfolio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_portfolio_id_seq OWNER TO root;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 308
-- Name: workflow_portfolio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_portfolio_id_seq OWNED BY public.workflow_portfolio.id;


--
-- TOC entry 497 (class 1259 OID 21045)
-- Name: workflow_product; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    reference_id character varying(255),
    create_date timestamp with time zone NOT NULL,
    edit_date timestamp with time zone NOT NULL,
    workflowlevel2_id integer NOT NULL
);


ALTER TABLE public.workflow_product OWNER TO root;

--
-- TOC entry 496 (class 1259 OID 21043)
-- Name: workflow_product_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_product_id_seq OWNER TO root;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 496
-- Name: workflow_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_product_id_seq OWNED BY public.workflow_product.id;


--
-- TOC entry 313 (class 1259 OID 17106)
-- Name: workflow_profiletype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_profiletype (
    id integer NOT NULL,
    profile character varying(255) NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.workflow_profiletype OWNER TO root;

--
-- TOC entry 312 (class 1259 OID 17104)
-- Name: workflow_profiletype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_profiletype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_profiletype_id_seq OWNER TO root;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 312
-- Name: workflow_profiletype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_profiletype_id_seq OWNED BY public.workflow_profiletype.id;


--
-- TOC entry 315 (class 1259 OID 17114)
-- Name: workflow_projecttype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_projecttype (
    id integer NOT NULL,
    name character varying(135) NOT NULL,
    description character varying(765) NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.workflow_projecttype OWNER TO root;

--
-- TOC entry 314 (class 1259 OID 17112)
-- Name: workflow_projecttype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_projecttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_projecttype_id_seq OWNER TO root;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 314
-- Name: workflow_projecttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_projecttype_id_seq OWNED BY public.workflow_projecttype.id;


--
-- TOC entry 317 (class 1259 OID 17125)
-- Name: workflow_riskregister; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_riskregister (
    id integer NOT NULL,
    name character varying(255),
    type character varying(135),
    impact character varying(255),
    likelihood character varying(255),
    rating character varying(255),
    status integer,
    category character varying(255),
    contingency_plan character varying(255),
    mitigation_plan character varying(255),
    post_mitigation_status character varying(255),
    action_by timestamp with time zone,
    action_when timestamp with time zone,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    workflowlevel2_id integer
);


ALTER TABLE public.workflow_riskregister OWNER TO root;

--
-- TOC entry 316 (class 1259 OID 17123)
-- Name: workflow_riskregister_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_riskregister_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_riskregister_id_seq OWNER TO root;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 316
-- Name: workflow_riskregister_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_riskregister_id_seq OWNED BY public.workflow_riskregister.id;


--
-- TOC entry 319 (class 1259 OID 17136)
-- Name: workflow_sector; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_sector (
    id integer NOT NULL,
    sector character varying(255) NOT NULL,
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL,
    created_by_id integer
);


ALTER TABLE public.workflow_sector OWNER TO root;

--
-- TOC entry 318 (class 1259 OID 17134)
-- Name: workflow_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_sector_id_seq OWNER TO root;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 318
-- Name: workflow_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_sector_id_seq OWNED BY public.workflow_sector.id;


--
-- TOC entry 321 (class 1259 OID 17144)
-- Name: workflow_sectorrelated; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_sectorrelated (
    id integer NOT NULL,
    "order" integer NOT NULL,
    org_order integer NOT NULL,
    organization_id integer NOT NULL,
    sector_id integer NOT NULL,
    sector_related_id integer NOT NULL,
    CONSTRAINT workflow_sectorrelated_order_check CHECK (("order" >= 0)),
    CONSTRAINT workflow_sectorrelated_org_order_check CHECK ((org_order >= 0))
);


ALTER TABLE public.workflow_sectorrelated OWNER TO root;

--
-- TOC entry 320 (class 1259 OID 17142)
-- Name: workflow_sectorrelated_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_sectorrelated_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_sectorrelated_id_seq OWNER TO root;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 320
-- Name: workflow_sectorrelated_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_sectorrelated_id_seq OWNED BY public.workflow_sectorrelated.id;


--
-- TOC entry 323 (class 1259 OID 17154)
-- Name: workflow_siteprofile; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_siteprofile (
    id integer NOT NULL,
    site_uuid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    contact_leader character varying(255),
    date_of_firstcontact timestamp with time zone,
    contact_number character varying(255),
    num_members character varying(255),
    info_source character varying(255),
    total_num_households integer,
    avg_household_size numeric(25,14),
    total_population integer,
    total_male integer,
    total_female integer,
    total_land integer,
    total_agricultural_land integer,
    total_rainfed_land integer,
    total_horticultural_land integer,
    total_literate_peoples integer,
    literate_males integer,
    literate_females integer,
    literacy_rate integer,
    populations_owning_land integer,
    avg_landholding_size numeric(25,14) NOT NULL,
    households_owning_livestock integer,
    animal_type character varying(255),
    latitude numeric(25,16) NOT NULL,
    longitude numeric(25,16) NOT NULL,
    status boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    admin_level_three_id integer,
    classify_land_id integer,
    country_id integer NOT NULL,
    district_id integer,
    office_id integer,
    province_id integer,
    type_id integer,
    village_id integer,
    organization_id integer,
    created_by_id integer
);


ALTER TABLE public.workflow_siteprofile OWNER TO root;

--
-- TOC entry 325 (class 1259 OID 17167)
-- Name: workflow_siteprofile_approval; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_siteprofile_approval (
    id integer NOT NULL,
    siteprofile_id integer NOT NULL,
    approvalworkflow_id integer NOT NULL
);


ALTER TABLE public.workflow_siteprofile_approval OWNER TO root;

--
-- TOC entry 324 (class 1259 OID 17165)
-- Name: workflow_siteprofile_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_siteprofile_approval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_siteprofile_approval_id_seq OWNER TO root;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 324
-- Name: workflow_siteprofile_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_siteprofile_approval_id_seq OWNED BY public.workflow_siteprofile_approval.id;


--
-- TOC entry 322 (class 1259 OID 17152)
-- Name: workflow_siteprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_siteprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_siteprofile_id_seq OWNER TO root;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 322
-- Name: workflow_siteprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_siteprofile_id_seq OWNED BY public.workflow_siteprofile.id;


--
-- TOC entry 409 (class 1259 OID 18758)
-- Name: workflow_siteprofile_workflowlevel1; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_siteprofile_workflowlevel1 (
    id integer NOT NULL,
    siteprofile_id integer NOT NULL,
    workflowlevel1_id integer NOT NULL
);


ALTER TABLE public.workflow_siteprofile_workflowlevel1 OWNER TO root;

--
-- TOC entry 408 (class 1259 OID 18756)
-- Name: workflow_siteprofile_workflowlevel1_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_siteprofile_workflowlevel1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_siteprofile_workflowlevel1_id_seq OWNER TO root;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 408
-- Name: workflow_siteprofile_workflowlevel1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_siteprofile_workflowlevel1_id_seq OWNED BY public.workflow_siteprofile_workflowlevel1.id;


--
-- TOC entry 327 (class 1259 OID 17175)
-- Name: workflow_stakeholder; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_stakeholder (
    id integer NOT NULL,
    stakeholder_uuid character varying(255) NOT NULL,
    name character varying(255),
    role character varying(255),
    contribution character varying(255),
    stakeholder_register boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer,
    formal_relationship_document_id integer,
    organization_id integer NOT NULL,
    type_id integer,
    vetting_document_id integer,
    created_by_id integer
);


ALTER TABLE public.workflow_stakeholder OWNER TO root;

--
-- TOC entry 329 (class 1259 OID 17188)
-- Name: workflow_stakeholder_approval; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_stakeholder_approval (
    id integer NOT NULL,
    stakeholder_id integer NOT NULL,
    approvalworkflow_id integer NOT NULL
);


ALTER TABLE public.workflow_stakeholder_approval OWNER TO root;

--
-- TOC entry 328 (class 1259 OID 17186)
-- Name: workflow_stakeholder_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_stakeholder_approval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_stakeholder_approval_id_seq OWNER TO root;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 328
-- Name: workflow_stakeholder_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_stakeholder_approval_id_seq OWNED BY public.workflow_stakeholder_approval.id;


--
-- TOC entry 331 (class 1259 OID 17196)
-- Name: workflow_stakeholder_contact; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_stakeholder_contact (
    id integer NOT NULL,
    stakeholder_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.workflow_stakeholder_contact OWNER TO root;

--
-- TOC entry 330 (class 1259 OID 17194)
-- Name: workflow_stakeholder_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_stakeholder_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_stakeholder_contact_id_seq OWNER TO root;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 330
-- Name: workflow_stakeholder_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_stakeholder_contact_id_seq OWNED BY public.workflow_stakeholder_contact.id;


--
-- TOC entry 326 (class 1259 OID 17173)
-- Name: workflow_stakeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_stakeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_stakeholder_id_seq OWNER TO root;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 326
-- Name: workflow_stakeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_stakeholder_id_seq OWNED BY public.workflow_stakeholder.id;


--
-- TOC entry 333 (class 1259 OID 17204)
-- Name: workflow_stakeholder_sectors; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_stakeholder_sectors (
    id integer NOT NULL,
    stakeholder_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.workflow_stakeholder_sectors OWNER TO root;

--
-- TOC entry 332 (class 1259 OID 17202)
-- Name: workflow_stakeholder_sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_stakeholder_sectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_stakeholder_sectors_id_seq OWNER TO root;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 332
-- Name: workflow_stakeholder_sectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_stakeholder_sectors_id_seq OWNED BY public.workflow_stakeholder_sectors.id;


--
-- TOC entry 393 (class 1259 OID 17486)
-- Name: workflow_stakeholder_workflowlevel1; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_stakeholder_workflowlevel1 (
    id integer NOT NULL,
    stakeholder_id integer NOT NULL,
    workflowlevel1_id integer NOT NULL
);


ALTER TABLE public.workflow_stakeholder_workflowlevel1 OWNER TO root;

--
-- TOC entry 392 (class 1259 OID 17484)
-- Name: workflow_stakeholder_workflowlevel1_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_stakeholder_workflowlevel1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_stakeholder_workflowlevel1_id_seq OWNER TO root;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 392
-- Name: workflow_stakeholder_workflowlevel1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_stakeholder_workflowlevel1_id_seq OWNED BY public.workflow_stakeholder_workflowlevel1.id;


--
-- TOC entry 335 (class 1259 OID 17212)
-- Name: workflow_stakeholdertype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_stakeholdertype (
    id integer NOT NULL,
    name character varying(255),
    default_global boolean NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    organization_id integer NOT NULL
);


ALTER TABLE public.workflow_stakeholdertype OWNER TO root;

--
-- TOC entry 334 (class 1259 OID 17210)
-- Name: workflow_stakeholdertype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_stakeholdertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_stakeholdertype_id_seq OWNER TO root;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 334
-- Name: workflow_stakeholdertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_stakeholdertype_id_seq OWNED BY public.workflow_stakeholdertype.id;


--
-- TOC entry 337 (class 1259 OID 17220)
-- Name: workflow_tolabookmarks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_tolabookmarks (
    id integer NOT NULL,
    name character varying(255),
    bookmark_url character varying(255),
    filter character varying(255),
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    user_id integer NOT NULL,
    workflowlevel1_id integer
);


ALTER TABLE public.workflow_tolabookmarks OWNER TO root;

--
-- TOC entry 336 (class 1259 OID 17218)
-- Name: workflow_tolabookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_tolabookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tolabookmarks_id_seq OWNER TO root;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 336
-- Name: workflow_tolabookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_tolabookmarks_id_seq OWNED BY public.workflow_tolabookmarks.id;


--
-- TOC entry 339 (class 1259 OID 17231)
-- Name: workflow_tolasites; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_tolasites (
    id integer NOT NULL,
    name character varying(255),
    agency_name character varying(255),
    agency_url character varying(255),
    tola_report_url character varying(255),
    tola_tables_url character varying(255),
    front_end_url character varying(255),
    tola_tables_user character varying(255),
    tola_tables_token character varying(255),
    privacy_disclaimer text,
    created timestamp with time zone,
    updated timestamp with time zone,
    site_id integer NOT NULL,
    whitelisted_domains text
);


ALTER TABLE public.workflow_tolasites OWNER TO root;

--
-- TOC entry 338 (class 1259 OID 17229)
-- Name: workflow_tolasites_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_tolasites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tolasites_id_seq OWNER TO root;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 338
-- Name: workflow_tolasites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_tolasites_id_seq OWNED BY public.workflow_tolasites.id;


--
-- TOC entry 341 (class 1259 OID 17242)
-- Name: workflow_tolauser; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_tolauser (
    id integer NOT NULL,
    tola_user_uuid character varying(255) NOT NULL,
    title character varying(3),
    name character varying(100),
    employee_number integer,
    position_description character varying(255),
    contact_info character varying(255),
    tables_api_token character varying(255),
    activity_api_token character varying(255),
    privacy_disclaimer_accepted boolean NOT NULL,
    filter jsonb,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer,
    organization_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.workflow_tolauser OWNER TO root;

--
-- TOC entry 343 (class 1259 OID 17257)
-- Name: workflow_tolauser_countries; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_tolauser_countries (
    id integer NOT NULL,
    tolauser_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.workflow_tolauser_countries OWNER TO root;

--
-- TOC entry 342 (class 1259 OID 17255)
-- Name: workflow_tolauser_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_tolauser_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tolauser_countries_id_seq OWNER TO root;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 342
-- Name: workflow_tolauser_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_tolauser_countries_id_seq OWNED BY public.workflow_tolauser_countries.id;


--
-- TOC entry 340 (class 1259 OID 17240)
-- Name: workflow_tolauser_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_tolauser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tolauser_id_seq OWNER TO root;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 340
-- Name: workflow_tolauser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_tolauser_id_seq OWNED BY public.workflow_tolauser.id;


--
-- TOC entry 345 (class 1259 OID 17265)
-- Name: workflow_tolauserfilter; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_tolauserfilter (
    id integer NOT NULL,
    start_date_filter date,
    end_date_filter date,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    user_id integer NOT NULL
);


ALTER TABLE public.workflow_tolauserfilter OWNER TO root;

--
-- TOC entry 347 (class 1259 OID 17273)
-- Name: workflow_tolauserfilter_country_filter; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_tolauserfilter_country_filter (
    id integer NOT NULL,
    tolauserfilter_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.workflow_tolauserfilter_country_filter OWNER TO root;

--
-- TOC entry 346 (class 1259 OID 17271)
-- Name: workflow_tolauserfilter_country_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_tolauserfilter_country_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tolauserfilter_country_filter_id_seq OWNER TO root;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 346
-- Name: workflow_tolauserfilter_country_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_tolauserfilter_country_filter_id_seq OWNED BY public.workflow_tolauserfilter_country_filter.id;


--
-- TOC entry 344 (class 1259 OID 17263)
-- Name: workflow_tolauserfilter_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_tolauserfilter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tolauserfilter_id_seq OWNER TO root;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 344
-- Name: workflow_tolauserfilter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_tolauserfilter_id_seq OWNED BY public.workflow_tolauserfilter.id;


--
-- TOC entry 349 (class 1259 OID 17281)
-- Name: workflow_tolauserfilter_sector_filter; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_tolauserfilter_sector_filter (
    id integer NOT NULL,
    tolauserfilter_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.workflow_tolauserfilter_sector_filter OWNER TO root;

--
-- TOC entry 348 (class 1259 OID 17279)
-- Name: workflow_tolauserfilter_sector_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_tolauserfilter_sector_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tolauserfilter_sector_filter_id_seq OWNER TO root;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 348
-- Name: workflow_tolauserfilter_sector_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_tolauserfilter_sector_filter_id_seq OWNED BY public.workflow_tolauserfilter_sector_filter.id;


--
-- TOC entry 389 (class 1259 OID 17470)
-- Name: workflow_tolauserfilter_workflowlevel1_filter; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_tolauserfilter_workflowlevel1_filter (
    id integer NOT NULL,
    tolauserfilter_id integer NOT NULL,
    workflowlevel1_id integer NOT NULL
);


ALTER TABLE public.workflow_tolauserfilter_workflowlevel1_filter OWNER TO root;

--
-- TOC entry 388 (class 1259 OID 17468)
-- Name: workflow_tolauserfilter_workflowlevel1_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_tolauserfilter_workflowlevel1_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tolauserfilter_workflowlevel1_filter_id_seq OWNER TO root;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 388
-- Name: workflow_tolauserfilter_workflowlevel1_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_tolauserfilter_workflowlevel1_filter_id_seq OWNED BY public.workflow_tolauserfilter_workflowlevel1_filter.id;


--
-- TOC entry 391 (class 1259 OID 17478)
-- Name: workflow_tolauserfilter_workflowlevel2_filter; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_tolauserfilter_workflowlevel2_filter (
    id integer NOT NULL,
    tolauserfilter_id integer NOT NULL,
    workflowlevel2_id integer NOT NULL
);


ALTER TABLE public.workflow_tolauserfilter_workflowlevel2_filter OWNER TO root;

--
-- TOC entry 390 (class 1259 OID 17476)
-- Name: workflow_tolauserfilter_workflowlevel2_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_tolauserfilter_workflowlevel2_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tolauserfilter_workflowlevel2_filter_id_seq OWNER TO root;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 390
-- Name: workflow_tolauserfilter_workflowlevel2_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_tolauserfilter_workflowlevel2_filter_id_seq OWNED BY public.workflow_tolauserfilter_workflowlevel2_filter.id;


--
-- TOC entry 415 (class 1259 OID 18839)
-- Name: workflow_widget; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_widget (
    id integer NOT NULL,
    w integer,
    h integer,
    x integer,
    y integer,
    "xSm" integer,
    "ySm" integer,
    "xMd" integer,
    "yMd" integer,
    "xLg" integer,
    "yLg" integer,
    "xXl" integer,
    "yXl" integer,
    drag_and_drop boolean NOT NULL,
    resizable boolean NOT NULL,
    title character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    data jsonb,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    changed boolean NOT NULL
);


ALTER TABLE public.workflow_widget OWNER TO root;

--
-- TOC entry 414 (class 1259 OID 18837)
-- Name: workflow_widget_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_widget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_widget_id_seq OWNER TO root;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 414
-- Name: workflow_widget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_widget_id_seq OWNED BY public.workflow_widget.id;


--
-- TOC entry 351 (class 1259 OID 17289)
-- Name: workflow_workflowlevel1; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1 (
    id integer NOT NULL,
    level1_uuid character varying(255) NOT NULL,
    unique_id character varying(255),
    name character varying(255) NOT NULL,
    funding_status character varying(255) NOT NULL,
    cost_center character varying(255),
    description text,
    public_dashboard boolean NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    sort integer NOT NULL,
    organization_id integer,
    portfolio_id integer
);


ALTER TABLE public.workflow_workflowlevel1 OWNER TO root;

--
-- TOC entry 353 (class 1259 OID 17302)
-- Name: workflow_workflowlevel1_award; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1_award (
    id integer NOT NULL,
    workflowlevel1_id integer NOT NULL,
    award_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel1_award OWNER TO root;

--
-- TOC entry 352 (class 1259 OID 17300)
-- Name: workflow_workflowlevel1_award_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1_award_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1_award_id_seq OWNER TO root;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 352
-- Name: workflow_workflowlevel1_award_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1_award_id_seq OWNED BY public.workflow_workflowlevel1_award.id;


--
-- TOC entry 355 (class 1259 OID 17310)
-- Name: workflow_workflowlevel1_country; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1_country (
    id integer NOT NULL,
    workflowlevel1_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel1_country OWNER TO root;

--
-- TOC entry 354 (class 1259 OID 17308)
-- Name: workflow_workflowlevel1_country_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1_country_id_seq OWNER TO root;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 354
-- Name: workflow_workflowlevel1_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1_country_id_seq OWNED BY public.workflow_workflowlevel1_country.id;


--
-- TOC entry 357 (class 1259 OID 17318)
-- Name: workflow_workflowlevel1_fund_code; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1_fund_code (
    id integer NOT NULL,
    workflowlevel1_id integer NOT NULL,
    fundcode_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel1_fund_code OWNER TO root;

--
-- TOC entry 356 (class 1259 OID 17316)
-- Name: workflow_workflowlevel1_fund_code_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1_fund_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1_fund_code_id_seq OWNER TO root;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 356
-- Name: workflow_workflowlevel1_fund_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1_fund_code_id_seq OWNED BY public.workflow_workflowlevel1_fund_code.id;


--
-- TOC entry 350 (class 1259 OID 17287)
-- Name: workflow_workflowlevel1_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1_id_seq OWNER TO root;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 350
-- Name: workflow_workflowlevel1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1_id_seq OWNED BY public.workflow_workflowlevel1.id;


--
-- TOC entry 359 (class 1259 OID 17326)
-- Name: workflow_workflowlevel1_milestone; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1_milestone (
    id integer NOT NULL,
    workflowlevel1_id integer NOT NULL,
    milestone_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel1_milestone OWNER TO root;

--
-- TOC entry 358 (class 1259 OID 17324)
-- Name: workflow_workflowlevel1_milestone_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1_milestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1_milestone_id_seq OWNER TO root;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 358
-- Name: workflow_workflowlevel1_milestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1_milestone_id_seq OWNED BY public.workflow_workflowlevel1_milestone.id;


--
-- TOC entry 361 (class 1259 OID 17334)
-- Name: workflow_workflowlevel1_sector; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1_sector (
    id integer NOT NULL,
    workflowlevel1_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel1_sector OWNER TO root;

--
-- TOC entry 360 (class 1259 OID 17332)
-- Name: workflow_workflowlevel1_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1_sector_id_seq OWNER TO root;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 360
-- Name: workflow_workflowlevel1_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1_sector_id_seq OWNED BY public.workflow_workflowlevel1_sector.id;


--
-- TOC entry 363 (class 1259 OID 17342)
-- Name: workflow_workflowlevel1_sub_sector; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1_sub_sector (
    id integer NOT NULL,
    workflowlevel1_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel1_sub_sector OWNER TO root;

--
-- TOC entry 362 (class 1259 OID 17340)
-- Name: workflow_workflowlevel1_sub_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1_sub_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1_sub_sector_id_seq OWNER TO root;

--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 362
-- Name: workflow_workflowlevel1_sub_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1_sub_sector_id_seq OWNED BY public.workflow_workflowlevel1_sub_sector.id;


--
-- TOC entry 365 (class 1259 OID 17350)
-- Name: workflow_workflowlevel1_user_access; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1_user_access (
    id integer NOT NULL,
    workflowlevel1_id integer NOT NULL,
    tolauser_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel1_user_access OWNER TO root;

--
-- TOC entry 364 (class 1259 OID 17348)
-- Name: workflow_workflowlevel1_user_access_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1_user_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1_user_access_id_seq OWNER TO root;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 364
-- Name: workflow_workflowlevel1_user_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1_user_access_id_seq OWNED BY public.workflow_workflowlevel1_user_access.id;


--
-- TOC entry 367 (class 1259 OID 17358)
-- Name: workflow_workflowlevel1sector; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1sector (
    id integer NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    sort integer NOT NULL,
    sector_id integer,
    workflowlevel1_id integer
);


ALTER TABLE public.workflow_workflowlevel1sector OWNER TO root;

--
-- TOC entry 366 (class 1259 OID 17356)
-- Name: workflow_workflowlevel1sector_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1sector_id_seq OWNER TO root;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 366
-- Name: workflow_workflowlevel1sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1sector_id_seq OWNED BY public.workflow_workflowlevel1sector.id;


--
-- TOC entry 369 (class 1259 OID 17366)
-- Name: workflow_workflowlevel1sector_sub_sector; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel1sector_sub_sector (
    id integer NOT NULL,
    workflowlevel1sector_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel1sector_sub_sector OWNER TO root;

--
-- TOC entry 368 (class 1259 OID 17364)
-- Name: workflow_workflowlevel1sector_sub_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel1sector_sub_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel1sector_sub_sector_id_seq OWNER TO root;

--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 368
-- Name: workflow_workflowlevel1sector_sub_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel1sector_sub_sector_id_seq OWNED BY public.workflow_workflowlevel1sector_sub_sector.id;


--
-- TOC entry 371 (class 1259 OID 17374)
-- Name: workflow_workflowlevel2; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel2 (
    id integer NOT NULL,
    level2_uuid character varying(255) NOT NULL,
    parent_workflowlevel2 integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    short_name character varying(20),
    staff_responsible_id integer,
    effect_or_impact text,
    expected_start_date timestamp with time zone,
    expected_end_date timestamp with time zone,
    total_estimated_budget numeric(12,2) NOT NULL,
    justification_background text,
    risks_assumptions text,
    description_of_government_involvement text,
    description_of_community_involvement text,
    actual_start_date timestamp with time zone,
    actual_end_date timestamp with time zone,
    actual_duration character varying(255),
    actual_cost numeric(20,2) NOT NULL,
    total_cost numeric(12,2) NOT NULL,
    capacity_built text,
    quality_assured text,
    issues_and_challenges text,
    lessons_learned text,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    status character varying(50) NOT NULL,
    progress character varying(50) NOT NULL,
    donor_currency_id integer,
    local_currency_id integer,
    milestone_id integer,
    office_id integer,
    sector_id integer,
    workflowlevel1_id integer NOT NULL,
    created_by_id integer,
    address public.hstore,
    notes text,
    site_instructions text,
    type character varying(50)
);


ALTER TABLE public.workflow_workflowlevel2 OWNER TO root;

--
-- TOC entry 373 (class 1259 OID 17387)
-- Name: workflow_workflowlevel2_approval; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel2_approval (
    id integer NOT NULL,
    workflowlevel2_id integer NOT NULL,
    approvalworkflow_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel2_approval OWNER TO root;

--
-- TOC entry 372 (class 1259 OID 17385)
-- Name: workflow_workflowlevel2_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel2_approval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel2_approval_id_seq OWNER TO root;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 372
-- Name: workflow_workflowlevel2_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel2_approval_id_seq OWNED BY public.workflow_workflowlevel2_approval.id;


--
-- TOC entry 370 (class 1259 OID 17372)
-- Name: workflow_workflowlevel2_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel2_id_seq OWNER TO root;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 370
-- Name: workflow_workflowlevel2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel2_id_seq OWNED BY public.workflow_workflowlevel2.id;


--
-- TOC entry 375 (class 1259 OID 17395)
-- Name: workflow_workflowlevel2_indicators; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel2_indicators (
    id integer NOT NULL,
    workflowlevel2_id integer NOT NULL,
    indicator_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel2_indicators OWNER TO root;

--
-- TOC entry 374 (class 1259 OID 17393)
-- Name: workflow_workflowlevel2_indicators_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel2_indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel2_indicators_id_seq OWNER TO root;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 374
-- Name: workflow_workflowlevel2_indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel2_indicators_id_seq OWNED BY public.workflow_workflowlevel2_indicators.id;


--
-- TOC entry 377 (class 1259 OID 17403)
-- Name: workflow_workflowlevel2_site; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel2_site (
    id integer NOT NULL,
    workflowlevel2_id integer NOT NULL,
    siteprofile_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel2_site OWNER TO root;

--
-- TOC entry 376 (class 1259 OID 17401)
-- Name: workflow_workflowlevel2_site_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel2_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel2_site_id_seq OWNER TO root;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 376
-- Name: workflow_workflowlevel2_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel2_site_id_seq OWNED BY public.workflow_workflowlevel2_site.id;


--
-- TOC entry 379 (class 1259 OID 17411)
-- Name: workflow_workflowlevel2_stakeholder; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel2_stakeholder (
    id integer NOT NULL,
    workflowlevel2_id integer NOT NULL,
    stakeholder_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel2_stakeholder OWNER TO root;

--
-- TOC entry 378 (class 1259 OID 17409)
-- Name: workflow_workflowlevel2_stakeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel2_stakeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel2_stakeholder_id_seq OWNER TO root;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 378
-- Name: workflow_workflowlevel2_stakeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel2_stakeholder_id_seq OWNED BY public.workflow_workflowlevel2_stakeholder.id;


--
-- TOC entry 381 (class 1259 OID 17419)
-- Name: workflow_workflowlevel2_sub_sector; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel2_sub_sector (
    id integer NOT NULL,
    workflowlevel2_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowlevel2_sub_sector OWNER TO root;

--
-- TOC entry 380 (class 1259 OID 17417)
-- Name: workflow_workflowlevel2_sub_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel2_sub_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel2_sub_sector_id_seq OWNER TO root;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 380
-- Name: workflow_workflowlevel2_sub_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel2_sub_sector_id_seq OWNED BY public.workflow_workflowlevel2_sub_sector.id;


--
-- TOC entry 383 (class 1259 OID 17427)
-- Name: workflow_workflowlevel2sort; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowlevel2sort (
    id integer NOT NULL,
    workflowlevel2_id integer NOT NULL,
    sort_array jsonb,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    workflowlevel1_id integer,
    workflowlevel2_parent_id_id integer
);


ALTER TABLE public.workflow_workflowlevel2sort OWNER TO root;

--
-- TOC entry 382 (class 1259 OID 17425)
-- Name: workflow_workflowlevel2sort_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowlevel2sort_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowlevel2sort_id_seq OWNER TO root;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 382
-- Name: workflow_workflowlevel2sort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowlevel2sort_id_seq OWNED BY public.workflow_workflowlevel2sort.id;


--
-- TOC entry 385 (class 1259 OID 17451)
-- Name: workflow_workflowmodules; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowmodules (
    id integer NOT NULL,
    modules character varying(50) NOT NULL,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    workflowlevel2_id integer NOT NULL
);


ALTER TABLE public.workflow_workflowmodules OWNER TO root;

--
-- TOC entry 384 (class 1259 OID 17449)
-- Name: workflow_workflowmodules_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowmodules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowmodules_id_seq OWNER TO root;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 384
-- Name: workflow_workflowmodules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowmodules_id_seq OWNED BY public.workflow_workflowmodules.id;


--
-- TOC entry 387 (class 1259 OID 17459)
-- Name: workflow_workflowteam; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workflow_workflowteam (
    id integer NOT NULL,
    salary character varying(255),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    status character varying(255),
    budget_limit integer,
    create_date timestamp with time zone,
    edit_date timestamp with time zone,
    country_id integer,
    partner_org_id integer,
    role_id integer,
    workflow_user_id integer,
    workflowlevel1_id integer
);


ALTER TABLE public.workflow_workflowteam OWNER TO root;

--
-- TOC entry 386 (class 1259 OID 17457)
-- Name: workflow_workflowteam_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.workflow_workflowteam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_workflowteam_id_seq OWNER TO root;

--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 386
-- Name: workflow_workflowteam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.workflow_workflowteam_id_seq OWNED BY public.workflow_workflowteam.id;


--
-- TOC entry 3221 (class 2604 OID 19137)
-- Name: appointment_appointment id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointment_appointment ALTER COLUMN id SET DEFAULT nextval('public.appointment_appointment_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 19156)
-- Name: appointment_appointment_workflowlevel2 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointment_appointment_workflowlevel2 ALTER COLUMN id SET DEFAULT nextval('public.appointment_appointment_workflowlevel2_id_seq'::regclass);


--
-- TOC entry 3104 (class 2604 OID 16420)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3105 (class 2604 OID 16430)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3103 (class 2604 OID 16412)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3106 (class 2604 OID 16438)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3107 (class 2604 OID 16448)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3108 (class 2604 OID 16456)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 19341)
-- Name: contact_contact id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contact_contact ALTER COLUMN id SET DEFAULT nextval('public.contact_contact_id_seq'::regclass);


--
-- TOC entry 3109 (class 2604 OID 16516)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3102 (class 2604 OID 16402)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3101 (class 2604 OID 16391)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3111 (class 2604 OID 16541)
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 19408)
-- Name: formlibrary_beneficiary id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_beneficiary_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 19526)
-- Name: formlibrary_beneficiary_distribution id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_distribution ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_beneficiary_distribution_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 19534)
-- Name: formlibrary_beneficiary_training id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_training ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_beneficiary_training_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 19542)
-- Name: formlibrary_beneficiary_workflowlevel1 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_workflowlevel1 ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_beneficiary_workflowlevel1_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 19419)
-- Name: formlibrary_binaryfield id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_binaryfield ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_binaryfield_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 19430)
-- Name: formlibrary_customform id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_customform ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_customform_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 19441)
-- Name: formlibrary_customformfield id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_customformfield ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_customformfield_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 19452)
-- Name: formlibrary_distribution id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_distribution_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 19510)
-- Name: formlibrary_distribution_disaggregation_value id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution_disaggregation_value ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_distribution_disaggregation_value_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 19463)
-- Name: formlibrary_fieldtype id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_fieldtype ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_fieldtype_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 19471)
-- Name: formlibrary_trainingattendance id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_trainingattendance_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 19482)
-- Name: formlibrary_trainingattendance_disaggregation_value id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance_disaggregation_value ALTER COLUMN id SET DEFAULT nextval('public.formlibrary_trainingattendance_disaggregation_value_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 19715)
-- Name: guardian_groupobjectpermission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('public.guardian_groupobjectpermission_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 19723)
-- Name: guardian_userobjectpermission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('public.guardian_userobjectpermission_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 19400)
-- Name: health_check_db_testmodel id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.health_check_db_testmodel ALTER COLUMN id SET DEFAULT nextval('public.health_check_db_testmodel_id_seq'::regclass);


--
-- TOC entry 3112 (class 2604 OID 16552)
-- Name: indicators_collecteddata id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata ALTER COLUMN id SET DEFAULT nextval('public.indicators_collecteddata_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 19881)
-- Name: indicators_collecteddata_disaggregation_value id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_disaggregation_value ALTER COLUMN id SET DEFAULT nextval('public.indicators_collecteddata_disaggregation_value_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 19889)
-- Name: indicators_collecteddata_site id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_site ALTER COLUMN id SET DEFAULT nextval('public.indicators_collecteddata_site_id_seq'::regclass);


--
-- TOC entry 3113 (class 2604 OID 16565)
-- Name: indicators_disaggregationlabel id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_disaggregationlabel ALTER COLUMN id SET DEFAULT nextval('public.indicators_disaggregationlabel_id_seq'::regclass);


--
-- TOC entry 3114 (class 2604 OID 16576)
-- Name: indicators_disaggregationtype id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_disaggregationtype ALTER COLUMN id SET DEFAULT nextval('public.indicators_disaggregationtype_id_seq'::regclass);


--
-- TOC entry 3115 (class 2604 OID 16587)
-- Name: indicators_disaggregationvalue id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_disaggregationvalue ALTER COLUMN id SET DEFAULT nextval('public.indicators_disaggregationvalue_id_seq'::regclass);


--
-- TOC entry 3116 (class 2604 OID 16598)
-- Name: indicators_externalservice id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_externalservice ALTER COLUMN id SET DEFAULT nextval('public.indicators_externalservice_id_seq'::regclass);


--
-- TOC entry 3117 (class 2604 OID 16609)
-- Name: indicators_externalservicerecord id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_externalservicerecord ALTER COLUMN id SET DEFAULT nextval('public.indicators_externalservicerecord_id_seq'::regclass);


--
-- TOC entry 3118 (class 2604 OID 16620)
-- Name: indicators_frequency id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_frequency ALTER COLUMN id SET DEFAULT nextval('public.indicators_frequency_id_seq'::regclass);


--
-- TOC entry 3120 (class 2604 OID 16632)
-- Name: indicators_historicalcollecteddata history_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_historicalcollecteddata ALTER COLUMN history_id SET DEFAULT nextval('public.indicators_historicalcollecteddata_history_id_seq'::regclass);


--
-- TOC entry 3121 (class 2604 OID 16643)
-- Name: indicators_historicalindicator history_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_historicalindicator ALTER COLUMN history_id SET DEFAULT nextval('public.indicators_historicalindicator_history_id_seq'::regclass);


--
-- TOC entry 3122 (class 2604 OID 16654)
-- Name: indicators_indicator id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator ALTER COLUMN id SET DEFAULT nextval('public.indicators_indicator_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 19808)
-- Name: indicators_indicator_disaggregation id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_disaggregation ALTER COLUMN id SET DEFAULT nextval('public.indicators_indicator_disaggregation_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 19816)
-- Name: indicators_indicator_indicator_type id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_indicator_type ALTER COLUMN id SET DEFAULT nextval('public.indicators_indicator_indicator_type_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 19824)
-- Name: indicators_indicator_objectives id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_objectives ALTER COLUMN id SET DEFAULT nextval('public.indicators_indicator_objectives_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 19832)
-- Name: indicators_indicator_strategic_objectives id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_strategic_objectives ALTER COLUMN id SET DEFAULT nextval('public.indicators_indicator_strategic_objectives_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 19840)
-- Name: indicators_indicator_sub_sector id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_sub_sector ALTER COLUMN id SET DEFAULT nextval('public.indicators_indicator_sub_sector_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 19848)
-- Name: indicators_indicator_workflowlevel1 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_workflowlevel1 ALTER COLUMN id SET DEFAULT nextval('public.indicators_indicator_workflowlevel1_id_seq'::regclass);


--
-- TOC entry 3123 (class 2604 OID 16667)
-- Name: indicators_indicatortype id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicatortype ALTER COLUMN id SET DEFAULT nextval('public.indicators_indicatortype_id_seq'::regclass);


--
-- TOC entry 3124 (class 2604 OID 16678)
-- Name: indicators_level id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_level ALTER COLUMN id SET DEFAULT nextval('public.indicators_level_id_seq'::regclass);


--
-- TOC entry 3125 (class 2604 OID 16689)
-- Name: indicators_objective id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_objective ALTER COLUMN id SET DEFAULT nextval('public.indicators_objective_id_seq'::regclass);


--
-- TOC entry 3126 (class 2604 OID 16700)
-- Name: indicators_periodictarget id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_periodictarget ALTER COLUMN id SET DEFAULT nextval('public.indicators_periodictarget_id_seq'::regclass);


--
-- TOC entry 3127 (class 2604 OID 16708)
-- Name: indicators_reportingperiod id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_reportingperiod ALTER COLUMN id SET DEFAULT nextval('public.indicators_reportingperiod_id_seq'::regclass);


--
-- TOC entry 3128 (class 2604 OID 16716)
-- Name: indicators_strategicobjective id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_strategicobjective ALTER COLUMN id SET DEFAULT nextval('public.indicators_strategicobjective_id_seq'::regclass);


--
-- TOC entry 3129 (class 2604 OID 16727)
-- Name: indicators_tolatable id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable ALTER COLUMN id SET DEFAULT nextval('public.indicators_tolatable_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 19771)
-- Name: indicators_tolatable_country id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_country ALTER COLUMN id SET DEFAULT nextval('public.indicators_tolatable_country_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 19787)
-- Name: indicators_tolatable_workflowlevel1 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_workflowlevel1 ALTER COLUMN id SET DEFAULT nextval('public.indicators_tolatable_workflowlevel1_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 20882)
-- Name: search_searchindexlog id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.search_searchindexlog ALTER COLUMN id SET DEFAULT nextval('public.search_searchindexlog_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 20900)
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 20911)
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 20919)
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 20962)
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 20927)
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- TOC entry 3130 (class 2604 OID 16752)
-- Name: workflow_adminlevelfour id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelfour ALTER COLUMN id SET DEFAULT nextval('public.workflow_adminlevelfour_id_seq'::regclass);


--
-- TOC entry 3131 (class 2604 OID 16760)
-- Name: workflow_adminlevelone id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelone ALTER COLUMN id SET DEFAULT nextval('public.workflow_adminlevelone_id_seq'::regclass);


--
-- TOC entry 3132 (class 2604 OID 16768)
-- Name: workflow_adminlevelthree id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelthree ALTER COLUMN id SET DEFAULT nextval('public.workflow_adminlevelthree_id_seq'::regclass);


--
-- TOC entry 3133 (class 2604 OID 16776)
-- Name: workflow_adminleveltwo id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminleveltwo ALTER COLUMN id SET DEFAULT nextval('public.workflow_adminleveltwo_id_seq'::regclass);


--
-- TOC entry 3134 (class 2604 OID 16784)
-- Name: workflow_approvaltype id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_approvaltype ALTER COLUMN id SET DEFAULT nextval('public.workflow_approvaltype_id_seq'::regclass);


--
-- TOC entry 3135 (class 2604 OID 16792)
-- Name: workflow_approvalworkflow id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_approvalworkflow ALTER COLUMN id SET DEFAULT nextval('public.workflow_approvalworkflow_id_seq'::regclass);


--
-- TOC entry 3136 (class 2604 OID 16803)
-- Name: workflow_award id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award ALTER COLUMN id SET DEFAULT nextval('public.workflow_award_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 17563)
-- Name: workflow_award_countries id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_countries ALTER COLUMN id SET DEFAULT nextval('public.workflow_award_countries_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 17571)
-- Name: workflow_award_donors id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_donors ALTER COLUMN id SET DEFAULT nextval('public.workflow_award_donors_id_seq'::regclass);


--
-- TOC entry 3137 (class 2604 OID 16811)
-- Name: workflow_budget id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_budget ALTER COLUMN id SET DEFAULT nextval('public.workflow_budget_id_seq'::regclass);


--
-- TOC entry 3138 (class 2604 OID 16822)
-- Name: workflow_checklist id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_checklist ALTER COLUMN id SET DEFAULT nextval('public.workflow_checklist_id_seq'::regclass);


--
-- TOC entry 3139 (class 2604 OID 16830)
-- Name: workflow_checklistitem id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_checklistitem ALTER COLUMN id SET DEFAULT nextval('public.workflow_checklistitem_id_seq'::regclass);


--
-- TOC entry 3140 (class 2604 OID 16838)
-- Name: workflow_codedfield id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield ALTER COLUMN id SET DEFAULT nextval('public.workflow_codedfield_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 17547)
-- Name: workflow_codedfield_workflowlevel1 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel1 ALTER COLUMN id SET DEFAULT nextval('public.workflow_codedfield_workflowlevel1_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 17555)
-- Name: workflow_codedfield_workflowlevel2 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel2 ALTER COLUMN id SET DEFAULT nextval('public.workflow_codedfield_workflowlevel2_id_seq'::regclass);


--
-- TOC entry 3141 (class 2604 OID 16849)
-- Name: workflow_codedfieldvalues id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfieldvalues ALTER COLUMN id SET DEFAULT nextval('public.workflow_codedfieldvalues_id_seq'::regclass);


--
-- TOC entry 3142 (class 2604 OID 16857)
-- Name: workflow_contact id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_contact ALTER COLUMN id SET DEFAULT nextval('public.workflow_contact_id_seq'::regclass);


--
-- TOC entry 3143 (class 2604 OID 16868)
-- Name: workflow_country id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_country ALTER COLUMN id SET DEFAULT nextval('public.workflow_country_id_seq'::regclass);


--
-- TOC entry 3144 (class 2604 OID 16879)
-- Name: workflow_currency id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_currency ALTER COLUMN id SET DEFAULT nextval('public.workflow_currency_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 18826)
-- Name: workflow_dashboard id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard ALTER COLUMN id SET DEFAULT nextval('public.workflow_dashboard_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 18834)
-- Name: workflow_dashboard_share id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_share ALTER COLUMN id SET DEFAULT nextval('public.workflow_dashboard_share_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 18853)
-- Name: workflow_dashboard_widgets id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_widgets ALTER COLUMN id SET DEFAULT nextval('public.workflow_dashboard_widgets_id_seq'::regclass);


--
-- TOC entry 3145 (class 2604 OID 16890)
-- Name: workflow_documentation id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_documentation ALTER COLUMN id SET DEFAULT nextval('public.workflow_documentation_id_seq'::regclass);


--
-- TOC entry 3146 (class 2604 OID 16903)
-- Name: workflow_formguidance id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_formguidance ALTER COLUMN id SET DEFAULT nextval('public.workflow_formguidance_id_seq'::regclass);


--
-- TOC entry 3147 (class 2604 OID 16914)
-- Name: workflow_fundcode id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_fundcode ALTER COLUMN id SET DEFAULT nextval('public.workflow_fundcode_id_seq'::regclass);


--
-- TOC entry 3148 (class 2604 OID 16922)
-- Name: workflow_historicalbudget history_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalbudget ALTER COLUMN history_id SET DEFAULT nextval('public.workflow_historicalbudget_history_id_seq'::regclass);


--
-- TOC entry 3149 (class 2604 OID 16933)
-- Name: workflow_historicalissueregister history_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalissueregister ALTER COLUMN history_id SET DEFAULT nextval('public.workflow_historicalissueregister_history_id_seq'::regclass);


--
-- TOC entry 3150 (class 2604 OID 16944)
-- Name: workflow_historicalriskregister history_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalriskregister ALTER COLUMN history_id SET DEFAULT nextval('public.workflow_historicalriskregister_history_id_seq'::regclass);


--
-- TOC entry 3151 (class 2604 OID 16955)
-- Name: workflow_historicalsiteprofile history_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalsiteprofile ALTER COLUMN history_id SET DEFAULT nextval('public.workflow_historicalsiteprofile_history_id_seq'::regclass);


--
-- TOC entry 3152 (class 2604 OID 16966)
-- Name: workflow_historicalworkflowlevel2 history_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalworkflowlevel2 ALTER COLUMN history_id SET DEFAULT nextval('public.workflow_historicalworkflowlevel2_history_id_seq'::regclass);


--
-- TOC entry 3153 (class 2604 OID 16977)
-- Name: workflow_industry id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_industry ALTER COLUMN id SET DEFAULT nextval('public.workflow_industry_id_seq'::regclass);


--
-- TOC entry 3154 (class 2604 OID 16988)
-- Name: workflow_internationalization id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_internationalization ALTER COLUMN id SET DEFAULT nextval('public.workflow_internationalization_id_seq'::regclass);


--
-- TOC entry 3155 (class 2604 OID 16999)
-- Name: workflow_issueregister id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_issueregister ALTER COLUMN id SET DEFAULT nextval('public.workflow_issueregister_id_seq'::regclass);


--
-- TOC entry 3156 (class 2604 OID 17010)
-- Name: workflow_landtype id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_landtype ALTER COLUMN id SET DEFAULT nextval('public.workflow_landtype_id_seq'::regclass);


--
-- TOC entry 3157 (class 2604 OID 17018)
-- Name: workflow_milestone id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_milestone ALTER COLUMN id SET DEFAULT nextval('public.workflow_milestone_id_seq'::regclass);


--
-- TOC entry 3158 (class 2604 OID 17029)
-- Name: workflow_office id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_office ALTER COLUMN id SET DEFAULT nextval('public.workflow_office_id_seq'::regclass);


--
-- TOC entry 3159 (class 2604 OID 17040)
-- Name: workflow_organization id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization ALTER COLUMN id SET DEFAULT nextval('public.workflow_organization_id_seq'::regclass);


--
-- TOC entry 3160 (class 2604 OID 17053)
-- Name: workflow_organization_industry id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_industry ALTER COLUMN id SET DEFAULT nextval('public.workflow_organization_industry_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 17513)
-- Name: workflow_organization_sector id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_sector ALTER COLUMN id SET DEFAULT nextval('public.workflow_organization_sector_id_seq'::regclass);


--
-- TOC entry 3161 (class 2604 OID 17061)
-- Name: workflow_partner id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner ALTER COLUMN id SET DEFAULT nextval('public.workflow_partner_id_seq'::regclass);


--
-- TOC entry 3162 (class 2604 OID 17074)
-- Name: workflow_partner_approval id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_approval ALTER COLUMN id SET DEFAULT nextval('public.workflow_partner_approval_id_seq'::regclass);


--
-- TOC entry 3163 (class 2604 OID 17082)
-- Name: workflow_partner_contact id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_contact ALTER COLUMN id SET DEFAULT nextval('public.workflow_partner_contact_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 17497)
-- Name: workflow_partner_sectors id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_sectors ALTER COLUMN id SET DEFAULT nextval('public.workflow_partner_sectors_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 17505)
-- Name: workflow_partner_workflowlevel1 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_workflowlevel1 ALTER COLUMN id SET DEFAULT nextval('public.workflow_partner_workflowlevel1_id_seq'::regclass);


--
-- TOC entry 3164 (class 2604 OID 17090)
-- Name: workflow_portfolio id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_portfolio ALTER COLUMN id SET DEFAULT nextval('public.workflow_portfolio_id_seq'::regclass);


--
-- TOC entry 3165 (class 2604 OID 17101)
-- Name: workflow_portfolio_country id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_portfolio_country ALTER COLUMN id SET DEFAULT nextval('public.workflow_portfolio_country_id_seq'::regclass);


--
-- TOC entry 3260 (class 2604 OID 21048)
-- Name: workflow_product id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_product ALTER COLUMN id SET DEFAULT nextval('public.workflow_product_id_seq'::regclass);


--
-- TOC entry 3166 (class 2604 OID 17109)
-- Name: workflow_profiletype id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_profiletype ALTER COLUMN id SET DEFAULT nextval('public.workflow_profiletype_id_seq'::regclass);


--
-- TOC entry 3167 (class 2604 OID 17117)
-- Name: workflow_projecttype id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_projecttype ALTER COLUMN id SET DEFAULT nextval('public.workflow_projecttype_id_seq'::regclass);


--
-- TOC entry 3168 (class 2604 OID 17128)
-- Name: workflow_riskregister id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_riskregister ALTER COLUMN id SET DEFAULT nextval('public.workflow_riskregister_id_seq'::regclass);


--
-- TOC entry 3169 (class 2604 OID 17139)
-- Name: workflow_sector id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_sector ALTER COLUMN id SET DEFAULT nextval('public.workflow_sector_id_seq'::regclass);


--
-- TOC entry 3170 (class 2604 OID 17147)
-- Name: workflow_sectorrelated id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_sectorrelated ALTER COLUMN id SET DEFAULT nextval('public.workflow_sectorrelated_id_seq'::regclass);


--
-- TOC entry 3173 (class 2604 OID 17157)
-- Name: workflow_siteprofile id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile ALTER COLUMN id SET DEFAULT nextval('public.workflow_siteprofile_id_seq'::regclass);


--
-- TOC entry 3174 (class 2604 OID 17170)
-- Name: workflow_siteprofile_approval id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_approval ALTER COLUMN id SET DEFAULT nextval('public.workflow_siteprofile_approval_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 18761)
-- Name: workflow_siteprofile_workflowlevel1 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_workflowlevel1 ALTER COLUMN id SET DEFAULT nextval('public.workflow_siteprofile_workflowlevel1_id_seq'::regclass);


--
-- TOC entry 3175 (class 2604 OID 17178)
-- Name: workflow_stakeholder id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder ALTER COLUMN id SET DEFAULT nextval('public.workflow_stakeholder_id_seq'::regclass);


--
-- TOC entry 3176 (class 2604 OID 17191)
-- Name: workflow_stakeholder_approval id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_approval ALTER COLUMN id SET DEFAULT nextval('public.workflow_stakeholder_approval_id_seq'::regclass);


--
-- TOC entry 3177 (class 2604 OID 17199)
-- Name: workflow_stakeholder_contact id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_contact ALTER COLUMN id SET DEFAULT nextval('public.workflow_stakeholder_contact_id_seq'::regclass);


--
-- TOC entry 3178 (class 2604 OID 17207)
-- Name: workflow_stakeholder_sectors id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_sectors ALTER COLUMN id SET DEFAULT nextval('public.workflow_stakeholder_sectors_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 17489)
-- Name: workflow_stakeholder_workflowlevel1 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_workflowlevel1 ALTER COLUMN id SET DEFAULT nextval('public.workflow_stakeholder_workflowlevel1_id_seq'::regclass);


--
-- TOC entry 3179 (class 2604 OID 17215)
-- Name: workflow_stakeholdertype id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholdertype ALTER COLUMN id SET DEFAULT nextval('public.workflow_stakeholdertype_id_seq'::regclass);


--
-- TOC entry 3180 (class 2604 OID 17223)
-- Name: workflow_tolabookmarks id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolabookmarks ALTER COLUMN id SET DEFAULT nextval('public.workflow_tolabookmarks_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 17234)
-- Name: workflow_tolasites id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolasites ALTER COLUMN id SET DEFAULT nextval('public.workflow_tolasites_id_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 17245)
-- Name: workflow_tolauser id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser ALTER COLUMN id SET DEFAULT nextval('public.workflow_tolauser_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 17260)
-- Name: workflow_tolauser_countries id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser_countries ALTER COLUMN id SET DEFAULT nextval('public.workflow_tolauser_countries_id_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 17268)
-- Name: workflow_tolauserfilter id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter ALTER COLUMN id SET DEFAULT nextval('public.workflow_tolauserfilter_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 17276)
-- Name: workflow_tolauserfilter_country_filter id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_country_filter ALTER COLUMN id SET DEFAULT nextval('public.workflow_tolauserfilter_country_filter_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 17284)
-- Name: workflow_tolauserfilter_sector_filter id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_sector_filter ALTER COLUMN id SET DEFAULT nextval('public.workflow_tolauserfilter_sector_filter_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 17473)
-- Name: workflow_tolauserfilter_workflowlevel1_filter id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel1_filter ALTER COLUMN id SET DEFAULT nextval('public.workflow_tolauserfilter_workflowlevel1_filter_id_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 17481)
-- Name: workflow_tolauserfilter_workflowlevel2_filter id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel2_filter ALTER COLUMN id SET DEFAULT nextval('public.workflow_tolauserfilter_workflowlevel2_filter_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 18842)
-- Name: workflow_widget id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_widget ALTER COLUMN id SET DEFAULT nextval('public.workflow_widget_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 17292)
-- Name: workflow_workflowlevel1 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1 ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 17305)
-- Name: workflow_workflowlevel1_award id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_award ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1_award_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 17313)
-- Name: workflow_workflowlevel1_country id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_country ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1_country_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 17321)
-- Name: workflow_workflowlevel1_fund_code id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_fund_code ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1_fund_code_id_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 17329)
-- Name: workflow_workflowlevel1_milestone id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_milestone ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1_milestone_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 17337)
-- Name: workflow_workflowlevel1_sector id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sector ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1_sector_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 17345)
-- Name: workflow_workflowlevel1_sub_sector id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sub_sector ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1_sub_sector_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 17353)
-- Name: workflow_workflowlevel1_user_access id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_user_access ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1_user_access_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 17361)
-- Name: workflow_workflowlevel1sector id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1sector ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1sector_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 17369)
-- Name: workflow_workflowlevel1sector_sub_sector id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1sector_sub_sector ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel1sector_sub_sector_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 17377)
-- Name: workflow_workflowlevel2 id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2 ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel2_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 17390)
-- Name: workflow_workflowlevel2_approval id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_approval ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel2_approval_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 17398)
-- Name: workflow_workflowlevel2_indicators id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_indicators ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel2_indicators_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 17406)
-- Name: workflow_workflowlevel2_site id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_site ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel2_site_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 17414)
-- Name: workflow_workflowlevel2_stakeholder id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_stakeholder ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel2_stakeholder_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 17422)
-- Name: workflow_workflowlevel2_sub_sector id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_sub_sector ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel2_sub_sector_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 17430)
-- Name: workflow_workflowlevel2sort id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2sort ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowlevel2sort_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 17454)
-- Name: workflow_workflowmodules id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowmodules ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowmodules_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 17462)
-- Name: workflow_workflowteam id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowteam ALTER COLUMN id SET DEFAULT nextval('public.workflow_workflowteam_id_seq'::regclass);


--
-- TOC entry 4756 (class 0 OID 19134)
-- Dependencies: 419
-- Data for Name: appointment_appointment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.appointment_appointment (id, name, start_date, end_date, type, address, notes, owner_id, contact_uuid, invitee_uuids, organization_uuid) FROM stdin;
\.


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 418
-- Name: appointment_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.appointment_appointment_id_seq', 1, false);


--
-- TOC entry 4758 (class 0 OID 19153)
-- Dependencies: 421
-- Data for Name: appointment_appointment_workflowlevel2; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.appointment_appointment_workflowlevel2 (id, appointment_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 420
-- Name: appointment_appointment_workflowlevel2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.appointment_appointment_workflowlevel2_id_seq', 1, false);


--
-- TOC entry 4530 (class 0 OID 16417)
-- Dependencies: 193
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group (id, name) FROM stdin;
1	ViewOnly
2	OrgAdmin
3	ProgramAdmin
4	ProgramTeam
\.


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 192
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 4532 (class 0 OID 16427)
-- Dependencies: 195
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 194
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 4528 (class 0 OID 16409)
-- Dependencies: 191
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add group object permission	8	add_groupobjectpermission
23	Can change group object permission	8	change_groupobjectpermission
24	Can delete group object permission	8	delete_groupobjectpermission
25	Can add user object permission	9	add_userobjectpermission
26	Can change user object permission	9	change_userobjectpermission
27	Can delete user object permission	9	delete_userobjectpermission
28	Can add Token	10	add_token
29	Can change Token	10	change_token
30	Can delete Token	10	delete_token
31	Can add code	11	add_code
32	Can change code	11	change_code
33	Can delete code	11	delete_code
34	Can add user social auth	12	add_usersocialauth
35	Can change user social auth	12	change_usersocialauth
36	Can delete user social auth	12	delete_usersocialauth
37	Can add partial	13	add_partial
38	Can change partial	13	change_partial
39	Can delete partial	13	delete_partial
40	Can add nonce	14	add_nonce
41	Can change nonce	14	change_nonce
42	Can delete nonce	14	delete_nonce
43	Can add association	15	add_association
44	Can change association	15	change_association
45	Can delete association	15	delete_association
46	Can add refresh token	16	add_refreshtoken
47	Can change refresh token	16	change_refreshtoken
48	Can delete refresh token	16	delete_refreshtoken
49	Can add grant	17	add_grant
50	Can change grant	17	change_grant
51	Can delete grant	17	delete_grant
52	Can add access token	18	add_accesstoken
53	Can change access token	18	change_accesstoken
54	Can delete access token	18	delete_accesstoken
55	Can add application	19	add_application
56	Can change application	19	change_application
57	Can delete application	19	delete_application
58	Can add training attendance	20	add_trainingattendance
59	Can change training attendance	20	change_trainingattendance
60	Can delete training attendance	20	delete_trainingattendance
61	Can add field type	21	add_fieldtype
62	Can change field type	21	change_fieldtype
63	Can delete field type	21	delete_fieldtype
64	Can add custom form	22	add_customform
65	Can change custom form	22	change_customform
66	Can delete custom form	22	delete_customform
67	Can add custom form field	23	add_customformfield
68	Can change custom form field	23	change_customformfield
69	Can delete custom form field	23	delete_customformfield
70	Can add distribution	24	add_distribution
71	Can change distribution	24	change_distribution
72	Can delete distribution	24	delete_distribution
73	Can add beneficiary	25	add_beneficiary
74	Can change beneficiary	25	change_beneficiary
75	Can delete beneficiary	25	delete_beneficiary
76	Can add binary field	26	add_binaryfield
77	Can change binary field	26	change_binaryfield
78	Can delete binary field	26	delete_binaryfield
79	Can add Workflow Level 1 Sector	27	add_workflowlevel1sector
80	Can change Workflow Level 1 Sector	27	change_workflowlevel1sector
81	Can delete Workflow Level 1 Sector	27	delete_workflowlevel1sector
82	Can add historical risk register	28	add_historicalriskregister
83	Can change historical risk register	28	change_historicalriskregister
84	Can delete historical risk register	28	delete_historicalriskregister
85	Can add workflow modules	29	add_workflowmodules
86	Can change workflow modules	29	change_workflowmodules
87	Can delete workflow modules	29	delete_workflowmodules
88	Can add industry	30	add_industry
89	Can change industry	30	change_industry
90	Can delete industry	30	delete_industry
91	Can add Admin Boundary 2	31	add_adminleveltwo
92	Can change Admin Boundary 2	31	change_adminleveltwo
93	Can delete Admin Boundary 2	31	delete_adminleveltwo
94	Can add land type	32	add_landtype
95	Can change land type	32	change_landtype
96	Can delete land type	32	delete_landtype
97	Can add profile type	33	add_profiletype
98	Can change profile type	33	change_profiletype
99	Can delete profile type	33	delete_profiletype
100	Can add historical Workflow Level 2	34	add_historicalworkflowlevel2
101	Can change historical Workflow Level 2	34	change_historicalworkflowlevel2
102	Can delete historical Workflow Level 2	34	delete_historicalworkflowlevel2
103	Can add Admin Boundary 4	35	add_adminlevelfour
104	Can change Admin Boundary 4	35	change_adminlevelfour
105	Can delete Admin Boundary 4	35	delete_adminlevelfour
106	Can add coded field values	36	add_codedfieldvalues
107	Can change coded field values	36	change_codedfieldvalues
108	Can delete coded field values	36	delete_codedfieldvalues
109	Can add milestone	37	add_milestone
110	Can change milestone	37	change_milestone
111	Can delete milestone	37	delete_milestone
112	Can add country	38	add_country
113	Can change country	38	change_country
114	Can delete country	38	delete_country
115	Can add fund code	39	add_fundcode
116	Can change fund code	39	change_fundcode
117	Can delete fund code	39	delete_fundcode
118	Can add partner	40	add_partner
119	Can change partner	40	change_partner
120	Can delete partner	40	delete_partner
121	Can add Tola Site	41	add_tolasites
122	Can change Tola Site	41	change_tolasites
123	Can delete Tola Site	41	delete_tolasites
124	Can add coded field	42	add_codedfield
125	Can change coded field	42	change_codedfield
126	Can delete coded field	42	delete_codedfield
127	Can add dashboard	43	add_dashboard
128	Can change dashboard	43	change_dashboard
129	Can delete dashboard	43	delete_dashboard
130	Can add internationalization	44	add_internationalization
131	Can change internationalization	44	change_internationalization
132	Can delete internationalization	44	delete_internationalization
133	Can add site profile	45	add_siteprofile
134	Can change site profile	45	change_siteprofile
135	Can delete site profile	45	delete_siteprofile
136	Can add documentation	46	add_documentation
137	Can change documentation	46	change_documentation
138	Can delete documentation	46	delete_documentation
139	Can add tola user	47	add_tolauser
140	Can change tola user	47	change_tolauser
141	Can delete tola user	47	delete_tolauser
142	Can add organization	48	add_organization
143	Can change organization	48	change_organization
144	Can delete organization	48	delete_organization
145	Can add widget	49	add_widget
146	Can change widget	49	change_widget
147	Can delete widget	49	delete_widget
148	Can add historical issue register	50	add_historicalissueregister
149	Can change historical issue register	50	change_historicalissueregister
150	Can delete historical issue register	50	delete_historicalissueregister
151	Can add sector related	51	add_sectorrelated
152	Can change sector related	51	change_sectorrelated
153	Can delete sector related	51	delete_sectorrelated
154	Can add tola user filter	52	add_tolauserfilter
155	Can change tola user filter	52	change_tolauserfilter
156	Can delete tola user filter	52	delete_tolauserfilter
157	Can add award	53	add_award
158	Can change award	53	change_award
159	Can delete award	53	delete_award
160	Can add Workflow Level 1	54	add_workflowlevel1
161	Can change Workflow Level 1	54	change_workflowlevel1
162	Can delete Workflow Level 1	54	delete_workflowlevel1
163	Can add risk register	55	add_riskregister
164	Can change risk register	55	change_riskregister
165	Can delete risk register	55	delete_riskregister
166	Can add approval workflow	56	add_approvalworkflow
167	Can change approval workflow	56	change_approvalworkflow
168	Can delete approval workflow	56	delete_approvalworkflow
169	Can add Workflow Level 2	57	add_workflowlevel2
170	Can change Workflow Level 2	57	change_workflowlevel2
171	Can delete Workflow Level 2	57	delete_workflowlevel2
172	Can approve initiation	57	can_approve
173	Can add form guidance	58	add_formguidance
174	Can change form guidance	58	change_formguidance
175	Can delete form guidance	58	delete_formguidance
176	Can add Admin Boundary 1	59	add_adminlevelone
177	Can change Admin Boundary 1	59	change_adminlevelone
178	Can delete Admin Boundary 1	59	delete_adminlevelone
179	Can add stakeholder	60	add_stakeholder
180	Can change stakeholder	60	change_stakeholder
181	Can delete stakeholder	60	delete_stakeholder
182	Can add stakeholder type	61	add_stakeholdertype
183	Can change stakeholder type	61	change_stakeholdertype
184	Can delete stakeholder type	61	delete_stakeholdertype
185	Can add sector	62	add_sector
186	Can change sector	62	change_sector
187	Can delete sector	62	delete_sector
188	Can add currency	63	add_currency
189	Can change currency	63	change_currency
190	Can delete currency	63	delete_currency
191	Can add issue register	64	add_issueregister
192	Can change issue register	64	change_issueregister
193	Can delete issue register	64	delete_issueregister
194	Can add Workflow Team	65	add_workflowteam
195	Can change Workflow Team	65	change_workflowteam
196	Can delete Workflow Team	65	delete_workflowteam
197	Can add budget	66	add_budget
198	Can change budget	66	change_budget
199	Can delete budget	66	delete_budget
200	Can add checklist	67	add_checklist
201	Can change checklist	67	change_checklist
202	Can delete checklist	67	delete_checklist
203	Can add historical site profile	68	add_historicalsiteprofile
204	Can change historical site profile	68	change_historicalsiteprofile
205	Can delete historical site profile	68	delete_historicalsiteprofile
206	Can add Workflow Level 2 Sort	69	add_workflowlevel2sort
207	Can change Workflow Level 2 Sort	69	change_workflowlevel2sort
208	Can delete Workflow Level 2 Sort	69	delete_workflowlevel2sort
209	Can add historical budget	70	add_historicalbudget
210	Can change historical budget	70	change_historicalbudget
211	Can delete historical budget	70	delete_historicalbudget
212	Can add Admin Boundary 3	71	add_adminlevelthree
213	Can change Admin Boundary 3	71	change_adminlevelthree
214	Can delete Admin Boundary 3	71	delete_adminlevelthree
215	Can add contact	72	add_contact
216	Can change contact	72	change_contact
217	Can delete contact	72	delete_contact
218	Can add product	73	add_product
219	Can change product	73	change_product
220	Can delete product	73	delete_product
221	Can add tola bookmarks	74	add_tolabookmarks
222	Can change tola bookmarks	74	change_tolabookmarks
223	Can delete tola bookmarks	74	delete_tolabookmarks
224	Can add checklist item	75	add_checklistitem
225	Can change checklist item	75	change_checklistitem
226	Can delete checklist item	75	delete_checklistitem
227	Can add portfolio	76	add_portfolio
228	Can change portfolio	76	change_portfolio
229	Can delete portfolio	76	delete_portfolio
230	Can add project type	77	add_projecttype
231	Can change project type	77	change_projecttype
232	Can delete project type	77	delete_projecttype
233	Can add approval type	78	add_approvaltype
234	Can change approval type	78	change_approvaltype
235	Can delete approval type	78	delete_approvaltype
236	Can add office	79	add_office
237	Can change office	79	change_office
238	Can delete office	79	delete_office
239	Can add Report Tola User	47	add_tolauserproxy
240	Can change Report Tola User	47	change_tolauserproxy
241	Can delete Report Tola User	47	delete_tolauserproxy
242	Can add disaggregation value	81	add_disaggregationvalue
243	Can change disaggregation value	81	change_disaggregationvalue
244	Can delete disaggregation value	81	delete_disaggregationvalue
245	Can add periodic target	82	add_periodictarget
246	Can change periodic target	82	change_periodictarget
247	Can delete periodic target	82	delete_periodictarget
248	Can add external service	83	add_externalservice
249	Can change external service	83	change_externalservice
250	Can delete external service	83	delete_externalservice
251	Can add historical collected data	84	add_historicalcollecteddata
252	Can change historical collected data	84	change_historicalcollecteddata
253	Can delete historical collected data	84	delete_historicalcollecteddata
254	Can add level	85	add_level
255	Can change level	85	change_level
256	Can delete level	85	delete_level
257	Can add historical indicator	86	add_historicalindicator
258	Can change historical indicator	86	change_historicalindicator
259	Can delete historical indicator	86	delete_historicalindicator
260	Can add objective	87	add_objective
261	Can change objective	87	change_objective
262	Can delete objective	87	delete_objective
263	Can add indicator	88	add_indicator
264	Can change indicator	88	change_indicator
265	Can delete indicator	88	delete_indicator
266	View Indicator Model	88	view_indicator
267	Can add external service record	89	add_externalservicerecord
268	Can change external service record	89	change_externalservicerecord
269	Can delete external service record	89	delete_externalservicerecord
270	Can add frequency	90	add_frequency
271	Can change frequency	90	change_frequency
272	Can delete frequency	90	delete_frequency
273	Can add reporting period	91	add_reportingperiod
274	Can change reporting period	91	change_reportingperiod
275	Can delete reporting period	91	delete_reportingperiod
276	Can add indicator type	92	add_indicatortype
277	Can change indicator type	92	change_indicatortype
278	Can delete indicator type	92	delete_indicatortype
279	Can add strategic objective	93	add_strategicobjective
280	Can change strategic objective	93	change_strategicobjective
281	Can delete strategic objective	93	delete_strategicobjective
282	Can add tola table	94	add_tolatable
283	Can change tola table	94	change_tolatable
284	Can delete tola table	94	delete_tolatable
285	Can add disaggregation label	95	add_disaggregationlabel
286	Can change disaggregation label	95	change_disaggregationlabel
287	Can delete disaggregation label	95	delete_disaggregationlabel
288	Can add disaggregation type	96	add_disaggregationtype
289	Can change disaggregation type	96	change_disaggregationtype
290	Can delete disaggregation type	96	delete_disaggregationtype
291	Can add collected data	97	add_collecteddata
292	Can change collected data	97	change_collecteddata
293	Can delete collected data	97	delete_collecteddata
294	Can add search index log	98	add_searchindexlog
295	Can change search index log	98	change_searchindexlog
296	Can delete search index log	98	delete_searchindexlog
297	Can add test model	99	add_testmodel
298	Can change test model	99	change_testmodel
299	Can delete test model	99	delete_testmodel
300	Can add contact	100	add_contact
301	Can change contact	100	change_contact
302	Can delete contact	100	delete_contact
303	Can add appointment	101	add_appointment
304	Can change appointment	101	change_appointment
305	Can delete appointment	101	delete_appointment
\.


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 190
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 330, true);


--
-- TOC entry 4534 (class 0 OID 16435)
-- Dependencies: 197
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	!JZbZCg7GOOLyCCaGfgaGG9F31mPxEfcjm3ZVQFer	\N	f	AnonymousUser				f	t	2018-05-31 12:56:52.581857+00
34		\N	f	andrewham	Andrew	Ham	andrewham@testenv.com	f	t	2018-05-31 12:59:41.937615+00
35		\N	f	ninettededikari	Ninette	Dedikari	ninettededikari@testenv.com	f	t	2018-05-31 12:59:41.945864+00
\.


--
-- TOC entry 4536 (class 0 OID 16445)
-- Dependencies: 199
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 198
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 196
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 35, true);


--
-- TOC entry 4538 (class 0 OID 16453)
-- Dependencies: 201
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 4759 (class 0 OID 19193)
-- Dependencies: 422
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- TOC entry 4761 (class 0 OID 19338)
-- Dependencies: 424
-- Data for Name: contact_contact; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.contact_contact (id, first_name, middle_name, last_name, title, contact_type, customer_type, company, addresses, emails, phones, notes, user_id, organization_uuid, workflowlevel1_uuids, workflowlevel2_uuids, uuid) FROM stdin;
\.


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 423
-- Name: contact_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.contact_contact_id_seq', 1, false);


--
-- TOC entry 4540 (class 0 OID 16513)
-- Dependencies: 203
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 4526 (class 0 OID 16399)
-- Dependencies: 189
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	guardian	groupobjectpermission
9	guardian	userobjectpermission
10	authtoken	token
11	social_django	code
12	social_django	usersocialauth
13	social_django	partial
14	social_django	nonce
15	social_django	association
16	oauth2_provider	refreshtoken
17	oauth2_provider	grant
18	oauth2_provider	accesstoken
19	oauth2_provider	application
20	formlibrary	trainingattendance
21	formlibrary	fieldtype
22	formlibrary	customform
23	formlibrary	customformfield
24	formlibrary	distribution
25	formlibrary	beneficiary
26	formlibrary	binaryfield
27	workflow	workflowlevel1sector
28	workflow	historicalriskregister
29	workflow	workflowmodules
30	workflow	industry
31	workflow	adminleveltwo
32	workflow	landtype
33	workflow	profiletype
34	workflow	historicalworkflowlevel2
35	workflow	adminlevelfour
36	workflow	codedfieldvalues
37	workflow	milestone
38	workflow	country
39	workflow	fundcode
40	workflow	partner
41	workflow	tolasites
42	workflow	codedfield
43	workflow	dashboard
44	workflow	internationalization
45	workflow	siteprofile
46	workflow	documentation
47	workflow	tolauser
48	workflow	organization
49	workflow	widget
50	workflow	historicalissueregister
51	workflow	sectorrelated
52	workflow	tolauserfilter
53	workflow	award
54	workflow	workflowlevel1
55	workflow	riskregister
56	workflow	approvalworkflow
57	workflow	workflowlevel2
58	workflow	formguidance
59	workflow	adminlevelone
60	workflow	stakeholder
61	workflow	stakeholdertype
62	workflow	sector
63	workflow	currency
64	workflow	issueregister
65	workflow	workflowteam
66	workflow	budget
67	workflow	checklist
68	workflow	historicalsiteprofile
69	workflow	workflowlevel2sort
70	workflow	historicalbudget
71	workflow	adminlevelthree
72	workflow	contact
73	workflow	product
74	workflow	tolabookmarks
75	workflow	checklistitem
76	workflow	portfolio
77	workflow	projecttype
78	workflow	approvaltype
79	workflow	office
80	workflow	tolauserproxy
81	indicators	disaggregationvalue
82	indicators	periodictarget
83	indicators	externalservice
84	indicators	historicalcollecteddata
85	indicators	level
86	indicators	historicalindicator
87	indicators	objective
88	indicators	indicator
89	indicators	externalservicerecord
90	indicators	frequency
91	indicators	reportingperiod
92	indicators	indicatortype
93	indicators	strategicobjective
94	indicators	tolatable
95	indicators	disaggregationlabel
96	indicators	disaggregationtype
97	indicators	collecteddata
98	search	searchindexlog
99	db	testmodel
100	contact	contact
101	appointment	appointment
\.


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 132, true);


--
-- TOC entry 4524 (class 0 OID 16388)
-- Dependencies: 187
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-05-31 12:47:58.957737+00
2	auth	0001_initial	2018-05-31 12:47:59.135623+00
3	admin	0001_initial	2018-05-31 12:47:59.188222+00
4	admin	0002_logentry_remove_auto_add	2018-05-31 12:47:59.220715+00
5	sites	0001_initial	2018-05-31 12:47:59.243994+00
6	sites	0002_alter_domain_unique	2018-05-31 12:47:59.26242+00
7	indicators	0001_initial	2018-05-31 12:47:59.5777+00
8	contenttypes	0002_remove_content_type_name	2018-05-31 12:47:59.690486+00
9	auth	0002_alter_permission_name_max_length	2018-05-31 12:47:59.704583+00
10	auth	0003_alter_user_email_max_length	2018-05-31 12:47:59.726756+00
11	auth	0004_alter_user_username_opts	2018-05-31 12:47:59.756562+00
12	auth	0005_alter_user_last_login_null	2018-05-31 12:47:59.797943+00
13	auth	0006_require_contenttypes_0002	2018-05-31 12:47:59.819264+00
14	auth	0007_alter_validators_add_error_messages	2018-05-31 12:47:59.851008+00
15	auth	0008_alter_user_username_max_length	2018-05-31 12:47:59.887646+00
16	workflow	0001_initial	2018-05-31 12:48:19.505524+00
17	workflow	0002_auto_20171024_0208	2018-05-31 12:48:19.983339+00
18	workflow	0003_auto_20171101_0151	2018-05-31 12:48:23.202741+00
19	workflow	0004_auto_20171109_0242	2018-05-31 12:48:25.475823+00
20	workflow	0005_siteprofile_workflowlevel1	2018-05-31 12:48:25.721891+00
21	workflow	0006_auto_20171122_0105	2018-05-31 12:48:26.249661+00
22	workflow	0007_auto_20171204_0203	2018-05-31 12:48:27.695827+00
23	workflow	0008_tolasites_whitelisted_domains	2018-05-31 12:48:27.71578+00
24	workflow	0009_auto_20180109_0626	2018-05-31 12:48:28.031341+00
25	workflow	0010_auto_20180109_0650	2018-05-31 12:48:28.343861+00
26	workflow	0011_auto_20180110_0509	2018-05-31 12:48:28.556452+00
27	workflow	0012_widget_changed	2018-05-31 12:48:28.581618+00
28	workflow	0013_auto_20180122_1057	2018-05-31 12:48:28.757699+00
29	workflow	0014_organization_oauth_domains	2018-05-31 12:48:28.90194+00
30	workflow	0015_auto_20180214_2128	2018-05-31 12:48:29.372288+00
31	workflow	0016_auto_20180209_0529	2018-05-31 12:49:52.939841+00
32	workflow	0017_auto_20180226_0031	2018-05-31 12:49:54.008069+00
33	appointment	0001_initial	2018-05-31 12:49:54.595895+00
34	appointment	0002_appointment_contact_uuid	2018-05-31 12:49:55.90963+00
35	appointment	0003_appointment_invitee_uuids	2018-05-31 12:49:56.591602+00
36	appointment	0004_remove_appointment_users	2018-05-31 12:49:57.388621+00
37	appointment	0005_appointment_organization_uuid	2018-05-31 12:49:57.529636+00
38	authtoken	0001_initial	2018-05-31 12:49:57.676757+00
39	authtoken	0002_auto_20160226_1747	2018-05-31 12:49:58.054323+00
40	contact	0001_initial	2018-05-31 12:49:58.426237+00
41	contact	0002_auto_20180306_1650	2018-05-31 12:49:59.0655+00
42	contact	0003_auto_20180307_1714	2018-05-31 12:49:59.230402+00
43	contact	0004_auto_20180315_1439	2018-05-31 12:49:59.476166+00
44	contact	0005_auto_20180404_1043	2018-05-31 12:49:59.683674+00
45	contact	0006_contact_uuid	2018-05-31 12:49:59.917825+00
46	contact	0007_auto_20180419_1437	2018-05-31 12:50:00.221087+00
47	contact	0008_remove_contact_faxes	2018-05-31 12:50:00.697711+00
48	health_check_db	0001_initial	2018-05-31 12:50:00.845527+00
49	formlibrary	0001_initial	2018-05-31 12:50:02.140916+00
50	formlibrary	0002_auto_20171019_0107	2018-05-31 12:50:02.758143+00
51	formlibrary	0003_auto_20171019_0107	2018-05-31 12:50:07.921892+00
52	formlibrary	0004_customform_created_by	2018-05-31 12:50:08.178504+00
53	formlibrary	0005_auto_20171204_0203	2018-05-31 12:50:09.053486+00
54	formlibrary	0006_auto_20171206_0942	2018-05-31 12:50:09.555334+00
55	formlibrary	0007_customform_status	2018-05-31 12:50:10.07077+00
56	guardian	0001_initial	2018-05-31 12:50:13.580477+00
57	indicators	0002_auto_20171019_0107	2018-05-31 12:54:12.802888+00
58	indicators	0003_auto_20171101_0151	2018-05-31 12:54:18.088093+00
59	indicators	0004_auto_20180204_2219	2018-05-31 12:54:20.579632+00
60	indicators	0005_auto_20180211_0410	2018-05-31 12:56:39.851074+00
61	indicators	0006_auto_20180226_0031	2018-05-31 12:56:41.009131+00
62	oauth2_provider	0001_initial	2018-05-31 12:56:42.18289+00
63	oauth2_provider	0002_08_updates	2018-05-31 12:56:42.638664+00
64	oauth2_provider	0003_auto_20160316_1503	2018-05-31 12:56:42.829472+00
65	oauth2_provider	0004_auto_20160525_1623	2018-05-31 12:56:43.483614+00
66	oauth2_provider	0005_auto_20170514_1141	2018-05-31 12:56:45.946725+00
67	search	0001_initial	2018-05-31 12:56:46.257377+00
68	sessions	0001_initial	2018-05-31 12:56:46.284088+00
69	default	0001_initial	2018-05-31 12:56:46.692023+00
70	social_auth	0001_initial	2018-05-31 12:56:46.695057+00
71	default	0002_add_related_name	2018-05-31 12:56:46.886588+00
72	social_auth	0002_add_related_name	2018-05-31 12:56:46.889885+00
73	default	0003_alter_email_max_length	2018-05-31 12:56:46.912903+00
74	social_auth	0003_alter_email_max_length	2018-05-31 12:56:46.940477+00
75	default	0004_auto_20160423_0400	2018-05-31 12:56:47.073932+00
76	social_auth	0004_auto_20160423_0400	2018-05-31 12:56:47.077194+00
77	social_auth	0005_auto_20160727_2333	2018-05-31 12:56:47.100209+00
78	social_django	0006_partial	2018-05-31 12:56:47.13077+00
79	social_django	0007_code_timestamp	2018-05-31 12:56:47.174721+00
80	social_django	0008_partial_timestamp	2018-05-31 12:56:47.212529+00
81	workflow	0018_auto_20180302_0814	2018-05-31 12:56:48.739212+00
82	workflow	0019_auto_20180309_0423	2018-05-31 12:56:49.098696+00
83	workflow	0020_product	2018-05-31 12:56:49.726658+00
84	workflow	0021_auto_20180323_0215	2018-05-31 12:56:51.908342+00
85	workflow	0022_organization_allow_budget_decimal	2018-05-31 12:56:52.12665+00
86	db	0001_initial	2018-05-31 12:56:52.133676+00
87	social_django	0003_alter_email_max_length	2018-05-31 12:56:52.137506+00
88	social_django	0004_auto_20160423_0400	2018-05-31 12:56:52.141488+00
89	social_django	0002_add_related_name	2018-05-31 12:56:52.145208+00
90	social_django	0005_auto_20160727_2333	2018-05-31 12:56:52.149214+00
91	social_django	0001_initial	2018-05-31 12:56:52.15305+00
\.


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 122, true);


--
-- TOC entry 4822 (class 0 OID 20885)
-- Dependencies: 485
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 4542 (class 0 OID 16538)
-- Dependencies: 205
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_site (id, domain, name) FROM stdin;
1	toladata.io	API
\.


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- TOC entry 4765 (class 0 OID 19405)
-- Dependencies: 428
-- Data for Name: formlibrary_beneficiary; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_beneficiary (id, beneficiary_name, father_name, age, gender, signature, remarks, create_date, edit_date, site_id) FROM stdin;
\.


--
-- TOC entry 4783 (class 0 OID 19523)
-- Dependencies: 446
-- Data for Name: formlibrary_beneficiary_distribution; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_beneficiary_distribution (id, beneficiary_id, distribution_id) FROM stdin;
\.


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 445
-- Name: formlibrary_beneficiary_distribution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_beneficiary_distribution_id_seq', 1, false);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 427
-- Name: formlibrary_beneficiary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_beneficiary_id_seq', 1, false);


--
-- TOC entry 4785 (class 0 OID 19531)
-- Dependencies: 448
-- Data for Name: formlibrary_beneficiary_training; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_beneficiary_training (id, beneficiary_id, trainingattendance_id) FROM stdin;
\.


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 447
-- Name: formlibrary_beneficiary_training_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_beneficiary_training_id_seq', 1, false);


--
-- TOC entry 4787 (class 0 OID 19539)
-- Dependencies: 450
-- Data for Name: formlibrary_beneficiary_workflowlevel1; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_beneficiary_workflowlevel1 (id, beneficiary_id, workflowlevel1_id) FROM stdin;
\.


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 449
-- Name: formlibrary_beneficiary_workflowlevel1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_beneficiary_workflowlevel1_id_seq', 1, false);


--
-- TOC entry 4767 (class 0 OID 19416)
-- Dependencies: 430
-- Data for Name: formlibrary_binaryfield; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_binaryfield (id, name, data) FROM stdin;
\.


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 429
-- Name: formlibrary_binaryfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_binaryfield_id_seq', 1, false);


--
-- TOC entry 4769 (class 0 OID 19427)
-- Dependencies: 432
-- Data for Name: formlibrary_customform; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_customform (id, name, description, validations, fields, is_public, default_global, create_date, edit_date, organization_id, created_by_id, form_uuid, silo_id, workflowlevel1_id, status) FROM stdin;
\.


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 431
-- Name: formlibrary_customform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_customform_id_seq', 1, false);


--
-- TOC entry 4771 (class 0 OID 19438)
-- Dependencies: 434
-- Data for Name: formlibrary_customformfield; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_customformfield (id, name, label, validations, "order", required, create_date, edit_date, type_id) FROM stdin;
\.


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 433
-- Name: formlibrary_customformfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_customformfield_id_seq', 1, false);


--
-- TOC entry 4773 (class 0 OID 19449)
-- Dependencies: 436
-- Data for Name: formlibrary_distribution; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_distribution (id, distribution_name, distribution_implementer, reporting_period, total_beneficiaries_received_input, distribution_location, input_type_distributed, distributor_name_and_affiliation, distributor_contact_number, start_date, end_date, form_filled_by, form_filled_by_position, form_filled_by_contact_num, form_filled_date, form_verified_by, form_verified_by_position, form_verified_by_contact_num, form_verified_date, create_date, edit_date, distribution_indicator_id, office_code_id, province_id, workflowlevel1_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 4781 (class 0 OID 19507)
-- Dependencies: 444
-- Data for Name: formlibrary_distribution_disaggregation_value; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_distribution_disaggregation_value (id, distribution_id, disaggregationvalue_id) FROM stdin;
\.


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 443
-- Name: formlibrary_distribution_disaggregation_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_distribution_disaggregation_value_id_seq', 1, false);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 435
-- Name: formlibrary_distribution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_distribution_id_seq', 1, false);


--
-- TOC entry 4775 (class 0 OID 19460)
-- Dependencies: 438
-- Data for Name: formlibrary_fieldtype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_fieldtype (id, name, create_date, edit_date) FROM stdin;
\.


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 437
-- Name: formlibrary_fieldtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_fieldtype_id_seq', 1, false);


--
-- TOC entry 4777 (class 0 OID 19468)
-- Dependencies: 440
-- Data for Name: formlibrary_trainingattendance; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_trainingattendance (id, training_name, implementer, reporting_period, total_participants, location, community, training_duration, start_date, end_date, trainer_name, trainer_contact_num, form_filled_by, form_filled_by_contact_num, create_date, edit_date, training_indicator_id, workflowlevel1_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 4779 (class 0 OID 19479)
-- Dependencies: 442
-- Data for Name: formlibrary_trainingattendance_disaggregation_value; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.formlibrary_trainingattendance_disaggregation_value (id, trainingattendance_id, disaggregationvalue_id) FROM stdin;
\.


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 441
-- Name: formlibrary_trainingattendance_disaggregation_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_trainingattendance_disaggregation_value_id_seq', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 439
-- Name: formlibrary_trainingattendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.formlibrary_trainingattendance_id_seq', 1, false);


--
-- TOC entry 4789 (class 0 OID 19712)
-- Dependencies: 452
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 451
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.guardian_groupobjectpermission_id_seq', 1, false);


--
-- TOC entry 4791 (class 0 OID 19720)
-- Dependencies: 454
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
\.


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 453
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.guardian_userobjectpermission_id_seq', 1, false);


--
-- TOC entry 4763 (class 0 OID 19397)
-- Dependencies: 426
-- Data for Name: health_check_db_testmodel; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.health_check_db_testmodel (id, title) FROM stdin;
\.


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 425
-- Name: health_check_db_testmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.health_check_db_testmodel_id_seq', 1, false);


--
-- TOC entry 4544 (class 0 OID 16549)
-- Dependencies: 207
-- Data for Name: indicators_collecteddata; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_collecteddata (id, data_uuid, achieved, description, date_collected, comment, update_count_tola_table, create_date, edit_date, approved_by_id, evidence_id, indicator_id, periodic_target_id, tola_table_id, workflowlevel1_id, workflowlevel2_id, created_by_id) FROM stdin;
1	39021e05-8dc1-47ba-bc8a-d29bae222f3c	500.00	\N	\N	\N	f	2018-05-31 12:59:42.5561+00	2018-05-31 12:59:42.556113+00	\N	\N	1	1	\N	3	\N	35
2	ea9b6dca-aad0-459a-89cb-2c1970df7e84	500.00	\N	\N	\N	f	2018-05-31 12:59:42.572317+00	2018-05-31 12:59:42.57233+00	\N	\N	1	2	\N	3	\N	35
3	7f0a4a21-71df-4567-8687-98a82c6fbbcb	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.577722+00	2018-05-31 12:59:42.577735+00	\N	\N	1	3	\N	3	\N	35
4	067b1c95-4e5e-4334-b949-bee019a84f46	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.582796+00	2018-05-31 12:59:42.582809+00	\N	\N	1	5	\N	3	\N	35
5	ca18745c-6465-4300-b57c-e6a29453ab04	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.588518+00	2018-05-31 12:59:42.588531+00	\N	\N	1	4	\N	3	\N	35
6	9ab3454a-0f0c-405a-8ba3-609578c020a3	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.593704+00	2018-05-31 12:59:42.593716+00	\N	\N	1	6	\N	3	\N	35
7	9986eb18-6d3d-460d-a803-e39831a38a09	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.598895+00	2018-05-31 12:59:42.598908+00	\N	\N	1	6	\N	3	\N	35
8	d5734d28-b57a-4a30-bb89-aed76b2819b1	500.00	\N	\N	\N	f	2018-05-31 12:59:42.604282+00	2018-05-31 12:59:42.604294+00	\N	\N	12	8	\N	3	\N	35
9	8b95e8dd-6dfa-403c-b16f-392b4cbdfd42	500.00	\N	\N	\N	f	2018-05-31 12:59:42.60947+00	2018-05-31 12:59:42.609483+00	\N	\N	12	9	\N	3	\N	35
10	d84555f2-5282-405e-a6a3-d4cb6c503923	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.61457+00	2018-05-31 12:59:42.614583+00	\N	\N	12	10	\N	3	\N	35
11	e755b99f-602e-47ba-bf06-3783e4b2ca03	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.62008+00	2018-05-31 12:59:42.620092+00	\N	\N	12	11	\N	3	\N	35
12	07181839-4c6a-40a8-a4d7-08ce549aec4b	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.625839+00	2018-05-31 12:59:42.625852+00	\N	\N	12	12	\N	3	\N	35
13	71ee1f8d-d11c-4f71-bd33-00ce4fc68d24	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.631244+00	2018-05-31 12:59:42.631257+00	\N	\N	12	13	\N	3	\N	35
14	f381b89e-7e34-4010-b9e4-ce41f544dd5d	500.00	\N	\N	\N	f	2018-05-31 12:59:42.636582+00	2018-05-31 12:59:42.636595+00	\N	\N	12	14	\N	3	\N	35
15	2d0daf6f-3b93-4747-9320-0a4a73e10845	65.00	\N	\N	\N	f	2018-05-31 12:59:42.641739+00	2018-05-31 12:59:42.641752+00	\N	\N	2	7	\N	3	\N	35
16	bdf29040-a21f-4b18-bc19-dc9f928cccf3	78.00	\N	\N	\N	f	2018-05-31 12:59:42.647221+00	2018-05-31 12:59:42.647233+00	\N	\N	3	15	\N	3	\N	35
17	92bef851-7854-4a2a-93f0-e7c48c3df5c6	75.00	\N	\N	\N	f	2018-05-31 12:59:42.65312+00	2018-05-31 12:59:42.653132+00	\N	\N	7	16	\N	3	\N	35
18	89b09b71-7c32-4357-bea3-0d6c24363496	100.00	\N	\N	\N	f	2018-05-31 12:59:42.658846+00	2018-05-31 12:59:42.658859+00	\N	\N	7	17	\N	3	\N	35
19	9199f344-03ed-40ce-8ce4-ce04fef6c25e	100.00	\N	\N	\N	f	2018-05-31 12:59:42.664525+00	2018-05-31 12:59:42.664538+00	\N	\N	7	18	\N	3	\N	35
20	d3520a88-e891-4478-90d2-d240821e1090	90.00	\N	\N	\N	f	2018-05-31 12:59:42.670187+00	2018-05-31 12:59:42.6702+00	\N	\N	7	19	\N	3	\N	35
21	52d5dedf-72be-496d-9fe4-c6861241a2fa	125.00	\N	\N	\N	f	2018-05-31 12:59:42.676062+00	2018-05-31 12:59:42.676075+00	\N	\N	7	20	\N	3	\N	35
22	2497b720-19ee-4139-bdb2-d1591fef904b	50.00	\N	\N	\N	f	2018-05-31 12:59:42.682074+00	2018-05-31 12:59:42.682087+00	\N	\N	7	21	\N	3	\N	35
23	6151ac31-7f5b-4ad2-8250-5b85f028fbfd	55.00	\N	\N	\N	f	2018-05-31 12:59:42.687939+00	2018-05-31 12:59:42.687952+00	\N	\N	4	22	\N	3	\N	35
24	9007a98b-f97f-4a9c-b11d-7a2c31f8f155	4.50	\N	\N	\N	f	2018-05-31 12:59:42.694232+00	2018-05-31 12:59:42.694315+00	\N	\N	9	34	\N	3	\N	35
25	025dfe10-c9f2-4ae5-b81c-4814855afe90	500.00	\N	\N	\N	f	2018-05-31 12:59:42.700012+00	2018-05-31 12:59:42.700024+00	\N	\N	5	23	\N	3	\N	35
26	4fb50d0b-b1de-413b-a38e-cc3a605ff139	500.00	\N	\N	\N	f	2018-05-31 12:59:42.70618+00	2018-05-31 12:59:42.706193+00	\N	\N	5	24	\N	3	\N	35
27	b6e9c944-1b84-4704-8610-0d7a586b9419	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.711928+00	2018-05-31 12:59:42.711941+00	\N	\N	5	25	\N	3	\N	35
28	1da9d4a1-1329-4373-99b9-561c18be7a4f	300.00	\N	\N	\N	f	2018-05-31 12:59:42.717703+00	2018-05-31 12:59:42.717715+00	\N	\N	5	26	\N	3	\N	35
29	46f8f4cd-5bfb-49f7-9233-6d216d54eabd	55.00	\N	\N	\N	f	2018-05-31 12:59:42.723222+00	2018-05-31 12:59:42.723235+00	\N	\N	6	27	\N	3	\N	35
30	541649ae-0eb4-4b00-afba-b94cbd38c9cf	1.00	\N	\N	\N	f	2018-05-31 12:59:42.729337+00	2018-05-31 12:59:42.72935+00	\N	\N	8	28	\N	3	\N	35
31	34f3f283-e31f-4e4e-9a78-e4107d91e800	2.00	\N	\N	\N	f	2018-05-31 12:59:42.735174+00	2018-05-31 12:59:42.735186+00	\N	\N	8	29	\N	3	\N	35
32	e1a70822-9049-48e5-bdef-8b72749d975a	3.00	\N	\N	\N	f	2018-05-31 12:59:42.740872+00	2018-05-31 12:59:42.740884+00	\N	\N	8	30	\N	3	\N	35
33	488b9787-84b1-45cc-a46a-4d0e279bc253	2.00	\N	\N	\N	f	2018-05-31 12:59:42.746681+00	2018-05-31 12:59:42.746693+00	\N	\N	8	31	\N	3	\N	35
34	70f6469d-1c52-4ee9-a7cc-f5d002556277	1.00	\N	\N	\N	f	2018-05-31 12:59:42.752597+00	2018-05-31 12:59:42.75261+00	\N	\N	8	32	\N	3	\N	35
35	ec4b14b0-326a-4e71-8459-0042b2c18df2	1.00	\N	\N	\N	f	2018-05-31 12:59:42.75898+00	2018-05-31 12:59:42.758993+00	\N	\N	8	33	\N	3	\N	35
36	a0878014-e38f-42fc-b49d-1acdc05a6126	2500.00	\N	\N	\N	f	2018-05-31 12:59:42.765386+00	2018-05-31 12:59:42.765399+00	\N	\N	10	35	\N	3	\N	35
37	8a827bb7-03fc-4124-8fb0-dd182df63ccc	2000.00	\N	\N	\N	f	2018-05-31 12:59:42.770691+00	2018-05-31 12:59:42.770703+00	\N	\N	10	36	\N	3	\N	35
38	675b920a-1e7a-45b6-8318-1b8bf085ef2b	2500.00	\N	\N	\N	f	2018-05-31 12:59:42.775928+00	2018-05-31 12:59:42.775942+00	\N	\N	11	37	\N	3	\N	35
39	d09143fa-2908-40b6-808d-792217554882	2000.00	\N	\N	\N	f	2018-05-31 12:59:42.781155+00	2018-05-31 12:59:42.781168+00	\N	\N	11	38	\N	3	\N	35
40	f47b4f71-187c-4da4-9d9a-8f3dc5d042cc	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.786615+00	2018-05-31 12:59:42.786627+00	\N	\N	13	\N	\N	6	\N	35
41	44751d8a-f389-4ca9-8609-2fcafb40efc7	23000.00	\N	\N	\N	f	2018-05-31 12:59:42.78892+00	2018-05-31 12:59:42.788932+00	\N	\N	14	\N	\N	6	\N	35
42	5d590580-e4e2-4a4c-84ce-e2ddf7e7c047	3700.00	\N	\N	\N	f	2018-05-31 12:59:42.791207+00	2018-05-31 12:59:42.791219+00	\N	\N	15	\N	\N	6	\N	35
43	5649edb7-4c65-4fed-9ae8-295d07346093	125000.00	\N	\N	\N	f	2018-05-31 12:59:42.793444+00	2018-05-31 12:59:42.793456+00	\N	\N	16	\N	\N	6	\N	35
44	e5696afc-08ad-4bac-94af-dcf1b829c26b	500.00	\N	\N	\N	f	2018-05-31 12:59:42.798705+00	2018-05-31 12:59:42.798718+00	\N	\N	13	\N	\N	6	\N	35
45	ed4e9bb3-704f-4aa7-ae6f-a3cd47b34f2e	2300.00	\N	\N	\N	f	2018-05-31 12:59:42.801344+00	2018-05-31 12:59:42.801357+00	\N	\N	13	\N	\N	6	\N	35
46	9b3ac5c9-052b-4778-a9e1-c5833e9e78f3	700.00	\N	\N	\N	f	2018-05-31 12:59:42.806472+00	2018-05-31 12:59:42.806485+00	\N	\N	13	\N	\N	6	\N	35
\.


--
-- TOC entry 4809 (class 0 OID 19878)
-- Dependencies: 472
-- Data for Name: indicators_collecteddata_disaggregation_value; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_collecteddata_disaggregation_value (id, collecteddata_id, disaggregationvalue_id) FROM stdin;
\.


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 471
-- Name: indicators_collecteddata_disaggregation_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_collecteddata_disaggregation_value_id_seq', 1, false);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 206
-- Name: indicators_collecteddata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_collecteddata_id_seq', 1, false);


--
-- TOC entry 4811 (class 0 OID 19886)
-- Dependencies: 474
-- Data for Name: indicators_collecteddata_site; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_collecteddata_site (id, collecteddata_id, siteprofile_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	5
7	7	1
8	8	1
9	9	2
10	10	3
11	11	4
12	12	5
13	13	2
14	14	1
15	15	2
16	16	1
17	17	1
18	18	2
19	19	3
20	20	4
21	21	5
22	22	2
23	23	2
24	24	1
25	24	2
26	24	3
27	24	4
28	24	5
29	25	1
30	26	2
31	27	3
32	28	4
33	29	2
34	30	1
35	31	2
36	32	3
37	33	4
38	34	2
39	35	1
40	36	2
41	37	2
42	38	1
43	39	2
44	40	6
45	44	6
46	46	7
\.


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 473
-- Name: indicators_collecteddata_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_collecteddata_site_id_seq', 46, true);


--
-- TOC entry 4546 (class 0 OID 16562)
-- Dependencies: 209
-- Data for Name: indicators_disaggregationlabel; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_disaggregationlabel (id, label, customsort, create_date, edit_date, disaggregation_type_id) FROM stdin;
\.


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 208
-- Name: indicators_disaggregationlabel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_disaggregationlabel_id_seq', 1, false);


--
-- TOC entry 4548 (class 0 OID 16573)
-- Dependencies: 211
-- Data for Name: indicators_disaggregationtype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_disaggregationtype (id, disaggregation_type, description, standard, default_global, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 210
-- Name: indicators_disaggregationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_disaggregationtype_id_seq', 1, false);


--
-- TOC entry 4550 (class 0 OID 16584)
-- Dependencies: 213
-- Data for Name: indicators_disaggregationvalue; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_disaggregationvalue (id, value, create_date, edit_date, disaggregation_label_id) FROM stdin;
\.


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 212
-- Name: indicators_disaggregationvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_disaggregationvalue_id_seq', 1, false);


--
-- TOC entry 4552 (class 0 OID 16595)
-- Dependencies: 215
-- Data for Name: indicators_externalservice; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_externalservice (id, name, service_url, feed_url, default_global, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 214
-- Name: indicators_externalservice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_externalservice_id_seq', 1, false);


--
-- TOC entry 4554 (class 0 OID 16606)
-- Dependencies: 217
-- Data for Name: indicators_externalservicerecord; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_externalservicerecord (id, full_url, record_id, create_date, edit_date, external_service_id) FROM stdin;
\.


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 216
-- Name: indicators_externalservicerecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_externalservicerecord_id_seq', 1, false);


--
-- TOC entry 4556 (class 0 OID 16617)
-- Dependencies: 219
-- Data for Name: indicators_frequency; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_frequency (id, frequency, description, create_date, edit_date, numdays, organization_id) FROM stdin;
1	Quarterly	Quarterly	2018-05-31 12:59:42.368644+00	2018-05-31 12:59:42.368655+00	0	1
2	Monthly	Monthly	2018-05-31 12:59:42.371277+00	2018-05-31 12:59:42.37129+00	0	1
3	Semi Annual	Semi Annual	2018-05-31 12:59:42.371965+00	2018-05-31 12:59:42.371976+00	0	1
4	Annual	Annual	2018-05-31 12:59:42.372572+00	2018-05-31 12:59:42.372583+00	0	1
5	Baseline, Endline	Baseline, Endline	2018-05-31 12:59:42.373307+00	2018-05-31 12:59:42.373318+00	0	1
6	Weekly	Weekly	2018-05-31 12:59:42.37394+00	2018-05-31 12:59:42.37395+00	0	1
7	Baseline, midline, endline	Baseline, midline, endline	2018-05-31 12:59:42.374532+00	2018-05-31 12:59:42.374542+00	0	1
8	Bi-weekly	Bi-weekly	2018-05-31 12:59:42.375113+00	2018-05-31 12:59:42.375123+00	0	1
9	Monthly, Quarterly, Annually	Monthly, Quarterly, Annually	2018-05-31 12:59:42.37569+00	2018-05-31 12:59:42.375701+00	0	1
10	End of cycle	End of cycle	2018-05-31 12:59:42.376334+00	2018-05-31 12:59:42.376344+00	0	1
\.


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 218
-- Name: indicators_frequency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_frequency_id_seq', 1, false);


--
-- TOC entry 4558 (class 0 OID 16629)
-- Dependencies: 221
-- Data for Name: indicators_historicalcollecteddata; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_historicalcollecteddata (id, data_uuid, achieved, description, date_collected, comment, update_count_tola_table, create_date, edit_date, history_id, history_date, history_change_reason, history_type, approved_by_id, evidence_id, history_user_id, indicator_id, periodic_target_id, tola_table_id, workflowlevel1_id, workflowlevel2_id, created_by_id) FROM stdin;
1	39021e05-8dc1-47ba-bc8a-d29bae222f3c	500.00	\N	\N	\N	f	2018-05-31 12:59:42.5561+00	2018-05-31 12:59:42.556113+00	1	2018-05-31 12:59:42.562823+00	\N	+	\N	\N	\N	1	1	\N	3	\N	35
2	ea9b6dca-aad0-459a-89cb-2c1970df7e84	500.00	\N	\N	\N	f	2018-05-31 12:59:42.572317+00	2018-05-31 12:59:42.57233+00	2	2018-05-31 12:59:42.573172+00	\N	+	\N	\N	\N	1	2	\N	3	\N	35
3	7f0a4a21-71df-4567-8687-98a82c6fbbcb	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.577722+00	2018-05-31 12:59:42.577735+00	3	2018-05-31 12:59:42.578537+00	\N	+	\N	\N	\N	1	3	\N	3	\N	35
4	067b1c95-4e5e-4334-b949-bee019a84f46	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.582796+00	2018-05-31 12:59:42.582809+00	4	2018-05-31 12:59:42.583602+00	\N	+	\N	\N	\N	1	5	\N	3	\N	35
5	ca18745c-6465-4300-b57c-e6a29453ab04	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.588518+00	2018-05-31 12:59:42.588531+00	5	2018-05-31 12:59:42.589365+00	\N	+	\N	\N	\N	1	4	\N	3	\N	35
6	9ab3454a-0f0c-405a-8ba3-609578c020a3	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.593704+00	2018-05-31 12:59:42.593716+00	6	2018-05-31 12:59:42.594538+00	\N	+	\N	\N	\N	1	6	\N	3	\N	35
7	9986eb18-6d3d-460d-a803-e39831a38a09	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.598895+00	2018-05-31 12:59:42.598908+00	7	2018-05-31 12:59:42.599707+00	\N	+	\N	\N	\N	1	6	\N	3	\N	35
8	d5734d28-b57a-4a30-bb89-aed76b2819b1	500.00	\N	\N	\N	f	2018-05-31 12:59:42.604282+00	2018-05-31 12:59:42.604294+00	8	2018-05-31 12:59:42.60512+00	\N	+	\N	\N	\N	12	8	\N	3	\N	35
9	8b95e8dd-6dfa-403c-b16f-392b4cbdfd42	500.00	\N	\N	\N	f	2018-05-31 12:59:42.60947+00	2018-05-31 12:59:42.609483+00	9	2018-05-31 12:59:42.610329+00	\N	+	\N	\N	\N	12	9	\N	3	\N	35
10	d84555f2-5282-405e-a6a3-d4cb6c503923	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.61457+00	2018-05-31 12:59:42.614583+00	10	2018-05-31 12:59:42.61542+00	\N	+	\N	\N	\N	12	10	\N	3	\N	35
11	e755b99f-602e-47ba-bf06-3783e4b2ca03	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.62008+00	2018-05-31 12:59:42.620092+00	11	2018-05-31 12:59:42.62091+00	\N	+	\N	\N	\N	12	11	\N	3	\N	35
12	07181839-4c6a-40a8-a4d7-08ce549aec4b	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.625839+00	2018-05-31 12:59:42.625852+00	12	2018-05-31 12:59:42.62674+00	\N	+	\N	\N	\N	12	12	\N	3	\N	35
13	71ee1f8d-d11c-4f71-bd33-00ce4fc68d24	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.631244+00	2018-05-31 12:59:42.631257+00	13	2018-05-31 12:59:42.632082+00	\N	+	\N	\N	\N	12	13	\N	3	\N	35
14	f381b89e-7e34-4010-b9e4-ce41f544dd5d	500.00	\N	\N	\N	f	2018-05-31 12:59:42.636582+00	2018-05-31 12:59:42.636595+00	14	2018-05-31 12:59:42.637466+00	\N	+	\N	\N	\N	12	14	\N	3	\N	35
15	2d0daf6f-3b93-4747-9320-0a4a73e10845	65.00	\N	\N	\N	f	2018-05-31 12:59:42.641739+00	2018-05-31 12:59:42.641752+00	15	2018-05-31 12:59:42.642559+00	\N	+	\N	\N	\N	2	7	\N	3	\N	35
16	bdf29040-a21f-4b18-bc19-dc9f928cccf3	78.00	\N	\N	\N	f	2018-05-31 12:59:42.647221+00	2018-05-31 12:59:42.647233+00	16	2018-05-31 12:59:42.648056+00	\N	+	\N	\N	\N	3	15	\N	3	\N	35
17	92bef851-7854-4a2a-93f0-e7c48c3df5c6	75.00	\N	\N	\N	f	2018-05-31 12:59:42.65312+00	2018-05-31 12:59:42.653132+00	17	2018-05-31 12:59:42.654051+00	\N	+	\N	\N	\N	7	16	\N	3	\N	35
18	89b09b71-7c32-4357-bea3-0d6c24363496	100.00	\N	\N	\N	f	2018-05-31 12:59:42.658846+00	2018-05-31 12:59:42.658859+00	18	2018-05-31 12:59:42.659732+00	\N	+	\N	\N	\N	7	17	\N	3	\N	35
19	9199f344-03ed-40ce-8ce4-ce04fef6c25e	100.00	\N	\N	\N	f	2018-05-31 12:59:42.664525+00	2018-05-31 12:59:42.664538+00	19	2018-05-31 12:59:42.665413+00	\N	+	\N	\N	\N	7	18	\N	3	\N	35
20	d3520a88-e891-4478-90d2-d240821e1090	90.00	\N	\N	\N	f	2018-05-31 12:59:42.670187+00	2018-05-31 12:59:42.6702+00	20	2018-05-31 12:59:42.671107+00	\N	+	\N	\N	\N	7	19	\N	3	\N	35
21	52d5dedf-72be-496d-9fe4-c6861241a2fa	125.00	\N	\N	\N	f	2018-05-31 12:59:42.676062+00	2018-05-31 12:59:42.676075+00	21	2018-05-31 12:59:42.677099+00	\N	+	\N	\N	\N	7	20	\N	3	\N	35
22	2497b720-19ee-4139-bdb2-d1591fef904b	50.00	\N	\N	\N	f	2018-05-31 12:59:42.682074+00	2018-05-31 12:59:42.682087+00	22	2018-05-31 12:59:42.68305+00	\N	+	\N	\N	\N	7	21	\N	3	\N	35
23	6151ac31-7f5b-4ad2-8250-5b85f028fbfd	55.00	\N	\N	\N	f	2018-05-31 12:59:42.687939+00	2018-05-31 12:59:42.687952+00	23	2018-05-31 12:59:42.688883+00	\N	+	\N	\N	\N	4	22	\N	3	\N	35
24	9007a98b-f97f-4a9c-b11d-7a2c31f8f155	4.50	\N	\N	\N	f	2018-05-31 12:59:42.694232+00	2018-05-31 12:59:42.694315+00	24	2018-05-31 12:59:42.695256+00	\N	+	\N	\N	\N	9	34	\N	3	\N	35
25	025dfe10-c9f2-4ae5-b81c-4814855afe90	500.00	\N	\N	\N	f	2018-05-31 12:59:42.700012+00	2018-05-31 12:59:42.700024+00	25	2018-05-31 12:59:42.701188+00	\N	+	\N	\N	\N	5	23	\N	3	\N	35
26	4fb50d0b-b1de-413b-a38e-cc3a605ff139	500.00	\N	\N	\N	f	2018-05-31 12:59:42.70618+00	2018-05-31 12:59:42.706193+00	26	2018-05-31 12:59:42.707117+00	\N	+	\N	\N	\N	5	24	\N	3	\N	35
27	b6e9c944-1b84-4704-8610-0d7a586b9419	1000.00	\N	\N	\N	f	2018-05-31 12:59:42.711928+00	2018-05-31 12:59:42.711941+00	27	2018-05-31 12:59:42.712885+00	\N	+	\N	\N	\N	5	25	\N	3	\N	35
28	1da9d4a1-1329-4373-99b9-561c18be7a4f	300.00	\N	\N	\N	f	2018-05-31 12:59:42.717703+00	2018-05-31 12:59:42.717715+00	28	2018-05-31 12:59:42.718592+00	\N	+	\N	\N	\N	5	26	\N	3	\N	35
29	46f8f4cd-5bfb-49f7-9233-6d216d54eabd	55.00	\N	\N	\N	f	2018-05-31 12:59:42.723222+00	2018-05-31 12:59:42.723235+00	29	2018-05-31 12:59:42.724113+00	\N	+	\N	\N	\N	6	27	\N	3	\N	35
30	541649ae-0eb4-4b00-afba-b94cbd38c9cf	1.00	\N	\N	\N	f	2018-05-31 12:59:42.729337+00	2018-05-31 12:59:42.72935+00	30	2018-05-31 12:59:42.730285+00	\N	+	\N	\N	\N	8	28	\N	3	\N	35
31	34f3f283-e31f-4e4e-9a78-e4107d91e800	2.00	\N	\N	\N	f	2018-05-31 12:59:42.735174+00	2018-05-31 12:59:42.735186+00	31	2018-05-31 12:59:42.736126+00	\N	+	\N	\N	\N	8	29	\N	3	\N	35
32	e1a70822-9049-48e5-bdef-8b72749d975a	3.00	\N	\N	\N	f	2018-05-31 12:59:42.740872+00	2018-05-31 12:59:42.740884+00	32	2018-05-31 12:59:42.741805+00	\N	+	\N	\N	\N	8	30	\N	3	\N	35
33	488b9787-84b1-45cc-a46a-4d0e279bc253	2.00	\N	\N	\N	f	2018-05-31 12:59:42.746681+00	2018-05-31 12:59:42.746693+00	33	2018-05-31 12:59:42.747622+00	\N	+	\N	\N	\N	8	31	\N	3	\N	35
34	70f6469d-1c52-4ee9-a7cc-f5d002556277	1.00	\N	\N	\N	f	2018-05-31 12:59:42.752597+00	2018-05-31 12:59:42.75261+00	34	2018-05-31 12:59:42.753561+00	\N	+	\N	\N	\N	8	32	\N	3	\N	35
35	ec4b14b0-326a-4e71-8459-0042b2c18df2	1.00	\N	\N	\N	f	2018-05-31 12:59:42.75898+00	2018-05-31 12:59:42.758993+00	35	2018-05-31 12:59:42.759947+00	\N	+	\N	\N	\N	8	33	\N	3	\N	35
36	a0878014-e38f-42fc-b49d-1acdc05a6126	2500.00	\N	\N	\N	f	2018-05-31 12:59:42.765386+00	2018-05-31 12:59:42.765399+00	36	2018-05-31 12:59:42.766215+00	\N	+	\N	\N	\N	10	35	\N	3	\N	35
37	8a827bb7-03fc-4124-8fb0-dd182df63ccc	2000.00	\N	\N	\N	f	2018-05-31 12:59:42.770691+00	2018-05-31 12:59:42.770703+00	37	2018-05-31 12:59:42.771523+00	\N	+	\N	\N	\N	10	36	\N	3	\N	35
38	675b920a-1e7a-45b6-8318-1b8bf085ef2b	2500.00	\N	\N	\N	f	2018-05-31 12:59:42.775928+00	2018-05-31 12:59:42.775942+00	38	2018-05-31 12:59:42.776838+00	\N	+	\N	\N	\N	11	37	\N	3	\N	35
39	d09143fa-2908-40b6-808d-792217554882	2000.00	\N	\N	\N	f	2018-05-31 12:59:42.781155+00	2018-05-31 12:59:42.781168+00	39	2018-05-31 12:59:42.78223+00	\N	+	\N	\N	\N	11	38	\N	3	\N	35
40	f47b4f71-187c-4da4-9d9a-8f3dc5d042cc	1500.00	\N	\N	\N	f	2018-05-31 12:59:42.786615+00	2018-05-31 12:59:42.786627+00	40	2018-05-31 12:59:42.787427+00	\N	+	\N	\N	\N	13	\N	\N	6	\N	35
41	44751d8a-f389-4ca9-8609-2fcafb40efc7	23000.00	\N	\N	\N	f	2018-05-31 12:59:42.78892+00	2018-05-31 12:59:42.788932+00	41	2018-05-31 12:59:42.789728+00	\N	+	\N	\N	\N	14	\N	\N	6	\N	35
42	5d590580-e4e2-4a4c-84ce-e2ddf7e7c047	3700.00	\N	\N	\N	f	2018-05-31 12:59:42.791207+00	2018-05-31 12:59:42.791219+00	42	2018-05-31 12:59:42.791977+00	\N	+	\N	\N	\N	15	\N	\N	6	\N	35
43	5649edb7-4c65-4fed-9ae8-295d07346093	125000.00	\N	\N	\N	f	2018-05-31 12:59:42.793444+00	2018-05-31 12:59:42.793456+00	43	2018-05-31 12:59:42.794229+00	\N	+	\N	\N	\N	16	\N	\N	6	\N	35
44	e5696afc-08ad-4bac-94af-dcf1b829c26b	500.00	\N	\N	\N	f	2018-05-31 12:59:42.798705+00	2018-05-31 12:59:42.798718+00	44	2018-05-31 12:59:42.799582+00	\N	+	\N	\N	\N	13	\N	\N	6	\N	35
45	ed4e9bb3-704f-4aa7-ae6f-a3cd47b34f2e	2300.00	\N	\N	\N	f	2018-05-31 12:59:42.801344+00	2018-05-31 12:59:42.801357+00	45	2018-05-31 12:59:42.80216+00	\N	+	\N	\N	\N	13	\N	\N	6	\N	35
46	9b3ac5c9-052b-4778-a9e1-c5833e9e78f3	700.00	\N	\N	\N	f	2018-05-31 12:59:42.806472+00	2018-05-31 12:59:42.806485+00	46	2018-05-31 12:59:42.80728+00	\N	+	\N	\N	\N	13	\N	\N	6	\N	35
\.


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 220
-- Name: indicators_historicalcollecteddata_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_historicalcollecteddata_history_id_seq', 46, true);


--
-- TOC entry 4560 (class 0 OID 16640)
-- Dependencies: 223
-- Data for Name: indicators_historicalindicator; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_historicalindicator (id, indicator_uuid, name, number, source, definition, justification, unit_of_measure, baseline, lop_target, rationale_for_target, means_of_verification, data_collection_method, data_points, responsible_person, method_of_analysis, information_use, quality_assurance, data_issues, indicator_changes, comments, key_performance_indicator, create_date, edit_date, notes, history_id, history_date, history_change_reason, history_type, approval_submitted_by_id, approved_by_id, data_collection_frequency_id, external_service_record_id, history_user_id, level_id, reporting_frequency_id, sector_id, created_by_id) FROM stdin;
1	095588af-d2e4-4d54-923a-2e7674b8f129	# of individuals in a need of humanitarian assistance	1	\N	\N	\N	\N	\N	7500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.377233+00	2018-05-31 12:59:42.377244+00	\N	1	2018-05-31 12:59:42.380901+00	\N	+	\N	\N	\N	\N	\N	1	\N	\N	35
1	095588af-d2e4-4d54-923a-2e7674b8f129	# of individuals in a need of humanitarian assistance	1	\N	\N	\N	\N	\N	7500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.377233+00	2018-05-31 12:59:42.393884+00	\N	2	2018-05-31 12:59:42.395521+00	\N	~	\N	\N	\N	\N	\N	1	\N	\N	35
2	9f7bb067-eec8-45bc-ace0-adcd3118c8c5	% of injured community members who make full recovery	1.1	\N	\N	\N	\N	\N	70.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.397357+00	2018-05-31 12:59:42.397369+00	\N	3	2018-05-31 12:59:42.398241+00	\N	+	\N	\N	\N	\N	\N	2	\N	\N	35
2	9f7bb067-eec8-45bc-ace0-adcd3118c8c5	% of injured community members who make full recovery	1.1	\N	\N	\N	\N	\N	70.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.397357+00	2018-05-31 12:59:42.401206+00	\N	4	2018-05-31 12:59:42.402399+00	\N	~	\N	\N	\N	\N	\N	2	\N	\N	35
3	42338d8f-d565-4c70-8300-287639382f1c	% of mobile medical units who have adequate supply of emergency medical kits	2.1	\N	\N	\N	\N	\N	80.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.404046+00	2018-05-31 12:59:42.404058+00	\N	5	2018-05-31 12:59:42.405014+00	\N	+	\N	\N	\N	\N	\N	3	\N	\N	35
3	42338d8f-d565-4c70-8300-287639382f1c	% of mobile medical units who have adequate supply of emergency medical kits	2.1	\N	\N	\N	\N	\N	80.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.404046+00	2018-05-31 12:59:42.408332+00	\N	6	2018-05-31 12:59:42.409548+00	\N	~	\N	\N	\N	\N	\N	3	\N	\N	35
4	19045656-f772-42fa-85dd-c32561c6617b	% of respondents who know 3 of 5 critical times to wash hands	3.1	\N	\N	\N	\N	\N	75.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.411206+00	2018-05-31 12:59:42.411217+00	\N	7	2018-05-31 12:59:42.412089+00	\N	+	\N	\N	\N	\N	\N	4	\N	\N	35
4	19045656-f772-42fa-85dd-c32561c6617b	% of respondents who know 3 of 5 critical times to wash hands	3.1	\N	\N	\N	\N	\N	75.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.411206+00	2018-05-31 12:59:42.415036+00	\N	8	2018-05-31 12:59:42.416417+00	\N	~	\N	\N	\N	\N	\N	4	\N	\N	35
5	3ab5b2ac-4c7b-45fd-801d-6d629c0f763d	# of medical kits provided to partner mobile medical units	2.1.1	\N	\N	\N	\N	\N	2500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.41811+00	2018-05-31 12:59:42.418122+00	\N	9	2018-05-31 12:59:42.419209+00	\N	+	\N	\N	\N	\N	\N	5	\N	\N	35
5	3ab5b2ac-4c7b-45fd-801d-6d629c0f763d	# of medical kits provided to partner mobile medical units	2.1.1	\N	\N	\N	\N	\N	2500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.41811+00	2018-05-31 12:59:42.422202+00	\N	10	2018-05-31 12:59:42.4238+00	\N	~	\N	\N	\N	\N	\N	5	\N	\N	35
6	8e188c2d-5c1c-496d-8fba-e11425eac5ba	% of emergency medical kits distributed within two weeks of identification of critical need	2.1.2	\N	\N	\N	\N	\N	60.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.425751+00	2018-05-31 12:59:42.425762+00	\N	11	2018-05-31 12:59:42.426693+00	\N	+	\N	\N	\N	\N	\N	5	\N	\N	35
6	8e188c2d-5c1c-496d-8fba-e11425eac5ba	% of emergency medical kits distributed within two weeks of identification of critical need	2.1.2	\N	\N	\N	\N	\N	60.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.425751+00	2018-05-31 12:59:42.429851+00	\N	12	2018-05-31 12:59:42.431068+00	\N	~	\N	\N	\N	\N	\N	5	\N	\N	35
7	774bd89a-21b4-437c-8c1a-c39b149cecdc	# of beneficiaries treated	2.2.1	\N	\N	\N	\N	\N	500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.433332+00	2018-05-31 12:59:42.433345+00	\N	13	2018-05-31 12:59:42.434305+00	\N	+	\N	\N	\N	\N	\N	3	\N	\N	35
7	774bd89a-21b4-437c-8c1a-c39b149cecdc	# of beneficiaries treated	2.2.1	\N	\N	\N	\N	\N	500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.433332+00	2018-05-31 12:59:42.437444+00	\N	14	2018-05-31 12:59:42.438843+00	\N	~	\N	\N	\N	\N	\N	3	\N	\N	35
8	961cce62-8e92-4a25-8df5-b962149225fb	# of locations set up by mobile medical units	2.2.2	\N	\N	\N	\N	\N	10.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.440556+00	2018-05-31 12:59:42.440569+00	\N	15	2018-05-31 12:59:42.441428+00	\N	+	\N	\N	\N	\N	\N	6	\N	\N	35
8	961cce62-8e92-4a25-8df5-b962149225fb	# of locations set up by mobile medical units	2.2.2	\N	\N	\N	\N	\N	10.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.440556+00	2018-05-31 12:59:42.444426+00	\N	16	2018-05-31 12:59:42.445677+00	\N	~	\N	\N	\N	\N	\N	6	\N	\N	35
9	ebdd6b0e-6d80-4db9-8ce6-034d0c45e012	# of days mobile medical units spent at each location	2.2.3	\N	\N	\N	\N	\N	5.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.447511+00	2018-05-31 12:59:42.447523+00	\N	17	2018-05-31 12:59:42.448412+00	\N	+	\N	\N	\N	\N	\N	6	\N	\N	35
9	ebdd6b0e-6d80-4db9-8ce6-034d0c45e012	# of days mobile medical units spent at each location	2.2.3	\N	\N	\N	\N	\N	5.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.447511+00	2018-05-31 12:59:42.451397+00	\N	18	2018-05-31 12:59:42.45266+00	\N	~	\N	\N	\N	\N	\N	6	\N	\N	35
10	588d7a3e-56d1-4c30-808b-4eedcd8c7d1d	# of people receiving hygiene promotion	3.1.1	\N	\N	\N	\N	\N	5000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.454684+00	2018-05-31 12:59:42.454696+00	\N	19	2018-05-31 12:59:42.455589+00	\N	+	\N	\N	\N	\N	\N	7	\N	\N	35
10	588d7a3e-56d1-4c30-808b-4eedcd8c7d1d	# of people receiving hygiene promotion	3.1.1	\N	\N	\N	\N	\N	5000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.454684+00	2018-05-31 12:59:42.458678+00	\N	20	2018-05-31 12:59:42.459898+00	\N	~	\N	\N	\N	\N	\N	7	\N	\N	35
11	bcbf0be7-cb24-4fd5-930f-221eda36e680	# of people receiving household water quality education	3.2.1	\N	\N	\N	\N	\N	5000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.461576+00	2018-05-31 12:59:42.461588+00	\N	21	2018-05-31 12:59:42.462441+00	\N	+	\N	\N	\N	\N	\N	8	\N	\N	35
11	bcbf0be7-cb24-4fd5-930f-221eda36e680	# of people receiving household water quality education	3.2.1	\N	\N	\N	\N	\N	5000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.461576+00	2018-05-31 12:59:42.465476+00	\N	22	2018-05-31 12:59:42.466755+00	\N	~	\N	\N	\N	\N	\N	8	\N	\N	35
12	4ec21944-ddb8-49ba-8108-be2daf8862ab	# of individuals in acute need of humanitarian assistance	1	\N	\N	\N	\N	\N	7500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.46899+00	2018-05-31 12:59:42.469004+00	\N	23	2018-05-31 12:59:42.470032+00	\N	+	\N	\N	\N	\N	\N	8	\N	44	35
12	4ec21944-ddb8-49ba-8108-be2daf8862ab	# of individuals in acute need of humanitarian assistance	1	\N	\N	\N	\N	\N	7500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.46899+00	2018-05-31 12:59:42.47342+00	\N	24	2018-05-31 12:59:42.474686+00	\N	~	\N	\N	\N	\N	\N	8	\N	44	35
13	1e7944ac-2310-4733-a2a8-42258edc5903	Anzahl aktive Initiativen	\N	\N	\N	\N	\N	\N	5500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.476533+00	2018-05-31 12:59:42.476546+00	\N	25	2018-05-31 12:59:42.477543+00	\N	+	\N	\N	\N	\N	\N	9	9	\N	35
13	1e7944ac-2310-4733-a2a8-42258edc5903	Anzahl aktive Initiativen	\N	\N	\N	\N	\N	\N	5500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.476533+00	2018-05-31 12:59:42.480644+00	\N	26	2018-05-31 12:59:42.481942+00	\N	~	\N	\N	\N	\N	\N	9	9	\N	35
14	44c80ac1-6367-4d19-892b-b17046f6f235	Anzahl Schulungen	5000	\N	\N	\N	\N	\N	50000.00	\N	\N	\N	\N	\N	Questionnaire	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.483704+00	2018-05-31 12:59:42.483717+00	\N	27	2018-05-31 12:59:42.484618+00	\N	+	\N	\N	\N	\N	\N	13	9	\N	35
14	44c80ac1-6367-4d19-892b-b17046f6f235	Anzahl Schulungen	5000	\N	\N	\N	\N	\N	50000.00	\N	\N	\N	\N	\N	Questionnaire	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.483704+00	2018-05-31 12:59:42.487805+00	\N	28	2018-05-31 12:59:42.489074+00	\N	~	\N	\N	\N	\N	\N	13	9	\N	35
15	db3f60a7-f275-4a6b-9648-795c8569955a	Ideenwerkstätten	\N	\N	\N	\N	\N	\N	15000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.491018+00	2018-05-31 12:59:42.491032+00	\N	29	2018-05-31 12:59:42.492012+00	\N	+	\N	\N	\N	\N	\N	12	9	\N	35
15	db3f60a7-f275-4a6b-9648-795c8569955a	Ideenwerkstätten	\N	\N	\N	\N	\N	\N	15000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.491018+00	2018-05-31 12:59:42.495181+00	\N	30	2018-05-31 12:59:42.496508+00	\N	~	\N	\N	\N	\N	\N	12	9	\N	35
16	9b4b1bf9-30da-4fe2-925c-dc84e6b53501	Anzahl direkt erreichter Kinder	\N	\N	\N	\N	\N	\N	250000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.498265+00	2018-05-31 12:59:42.498278+00	\N	31	2018-05-31 12:59:42.499171+00	\N	+	1	\N	\N	\N	\N	9	9	\N	35
16	9b4b1bf9-30da-4fe2-925c-dc84e6b53501	Anzahl direkt erreichter Kinder	\N	\N	\N	\N	\N	\N	250000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.498265+00	2018-05-31 12:59:42.503626+00	\N	32	2018-05-31 12:59:42.505563+00	\N	~	1	\N	\N	\N	\N	9	9	\N	35
17	c837b1ee-4dac-4229-95d8-1e96fda62efc	Mehrsprachige Informationsmaterialien (10 Sprachen)	\N	\N	\N	\N	\N	\N	600000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.507544+00	2018-05-31 12:59:42.507556+00	\N	33	2018-05-31 12:59:42.508467+00	\N	+	1	\N	\N	\N	\N	11	9	11	35
17	c837b1ee-4dac-4229-95d8-1e96fda62efc	Mehrsprachige Informationsmaterialien (10 Sprachen)	\N	\N	\N	\N	\N	\N	600000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.507544+00	2018-05-31 12:59:42.511546+00	\N	34	2018-05-31 12:59:42.512815+00	\N	~	1	\N	\N	\N	\N	11	9	11	35
\.


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 222
-- Name: indicators_historicalindicator_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_historicalindicator_history_id_seq', 34, true);


--
-- TOC entry 4562 (class 0 OID 16651)
-- Dependencies: 225
-- Data for Name: indicators_indicator; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_indicator (id, indicator_uuid, name, number, source, definition, justification, unit_of_measure, baseline, lop_target, rationale_for_target, means_of_verification, data_collection_method, data_points, responsible_person, method_of_analysis, information_use, quality_assurance, data_issues, indicator_changes, comments, key_performance_indicator, create_date, edit_date, notes, approval_submitted_by_id, approved_by_id, data_collection_frequency_id, external_service_record_id, level_id, reporting_frequency_id, sector_id, created_by_id) FROM stdin;
1	095588af-d2e4-4d54-923a-2e7674b8f129	# of individuals in a need of humanitarian assistance	1	\N	\N	\N	\N	\N	7500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.377233+00	2018-05-31 12:59:42.393884+00	\N	\N	\N	\N	\N	1	\N	\N	35
2	9f7bb067-eec8-45bc-ace0-adcd3118c8c5	% of injured community members who make full recovery	1.1	\N	\N	\N	\N	\N	70.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.397357+00	2018-05-31 12:59:42.401206+00	\N	\N	\N	\N	\N	2	\N	\N	35
3	42338d8f-d565-4c70-8300-287639382f1c	% of mobile medical units who have adequate supply of emergency medical kits	2.1	\N	\N	\N	\N	\N	80.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.404046+00	2018-05-31 12:59:42.408332+00	\N	\N	\N	\N	\N	3	\N	\N	35
4	19045656-f772-42fa-85dd-c32561c6617b	% of respondents who know 3 of 5 critical times to wash hands	3.1	\N	\N	\N	\N	\N	75.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.411206+00	2018-05-31 12:59:42.415036+00	\N	\N	\N	\N	\N	4	\N	\N	35
5	3ab5b2ac-4c7b-45fd-801d-6d629c0f763d	# of medical kits provided to partner mobile medical units	2.1.1	\N	\N	\N	\N	\N	2500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.41811+00	2018-05-31 12:59:42.422202+00	\N	\N	\N	\N	\N	5	\N	\N	35
6	8e188c2d-5c1c-496d-8fba-e11425eac5ba	% of emergency medical kits distributed within two weeks of identification of critical need	2.1.2	\N	\N	\N	\N	\N	60.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.425751+00	2018-05-31 12:59:42.429851+00	\N	\N	\N	\N	\N	5	\N	\N	35
7	774bd89a-21b4-437c-8c1a-c39b149cecdc	# of beneficiaries treated	2.2.1	\N	\N	\N	\N	\N	500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.433332+00	2018-05-31 12:59:42.437444+00	\N	\N	\N	\N	\N	3	\N	\N	35
8	961cce62-8e92-4a25-8df5-b962149225fb	# of locations set up by mobile medical units	2.2.2	\N	\N	\N	\N	\N	10.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.440556+00	2018-05-31 12:59:42.444426+00	\N	\N	\N	\N	\N	6	\N	\N	35
9	ebdd6b0e-6d80-4db9-8ce6-034d0c45e012	# of days mobile medical units spent at each location	2.2.3	\N	\N	\N	\N	\N	5.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.447511+00	2018-05-31 12:59:42.451397+00	\N	\N	\N	\N	\N	6	\N	\N	35
10	588d7a3e-56d1-4c30-808b-4eedcd8c7d1d	# of people receiving hygiene promotion	3.1.1	\N	\N	\N	\N	\N	5000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.454684+00	2018-05-31 12:59:42.458678+00	\N	\N	\N	\N	\N	7	\N	\N	35
11	bcbf0be7-cb24-4fd5-930f-221eda36e680	# of people receiving household water quality education	3.2.1	\N	\N	\N	\N	\N	5000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.461576+00	2018-05-31 12:59:42.465476+00	\N	\N	\N	\N	\N	8	\N	\N	35
12	4ec21944-ddb8-49ba-8108-be2daf8862ab	# of individuals in acute need of humanitarian assistance	1	\N	\N	\N	\N	\N	7500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.46899+00	2018-05-31 12:59:42.47342+00	\N	\N	\N	\N	\N	8	\N	44	35
13	1e7944ac-2310-4733-a2a8-42258edc5903	Anzahl aktive Initiativen	\N	\N	\N	\N	\N	\N	5500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.476533+00	2018-05-31 12:59:42.480644+00	\N	\N	\N	\N	\N	9	9	\N	35
14	44c80ac1-6367-4d19-892b-b17046f6f235	Anzahl Schulungen	5000	\N	\N	\N	\N	\N	50000.00	\N	\N	\N	\N	\N	Questionnaire	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.483704+00	2018-05-31 12:59:42.487805+00	\N	\N	\N	\N	\N	13	9	\N	35
15	db3f60a7-f275-4a6b-9648-795c8569955a	Ideenwerkstätten	\N	\N	\N	\N	\N	\N	15000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.491018+00	2018-05-31 12:59:42.495181+00	\N	\N	\N	\N	\N	12	9	\N	35
16	9b4b1bf9-30da-4fe2-925c-dc84e6b53501	Anzahl direkt erreichter Kinder	\N	\N	\N	\N	\N	\N	250000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	2018-05-31 12:59:42.498265+00	2018-05-31 12:59:42.503626+00	\N	1	\N	\N	\N	9	9	\N	35
17	c837b1ee-4dac-4229-95d8-1e96fda62efc	Mehrsprachige Informationsmaterialien (10 Sprachen)	\N	\N	\N	\N	\N	\N	600000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2018-05-31 12:59:42.507544+00	2018-05-31 12:59:42.511546+00	\N	1	\N	\N	\N	11	9	11	35
\.


--
-- TOC entry 4797 (class 0 OID 19805)
-- Dependencies: 460
-- Data for Name: indicators_indicator_disaggregation; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_indicator_disaggregation (id, indicator_id, disaggregationtype_id) FROM stdin;
\.


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 459
-- Name: indicators_indicator_disaggregation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_indicator_disaggregation_id_seq', 1, false);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 224
-- Name: indicators_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_indicator_id_seq', 1, false);


--
-- TOC entry 4799 (class 0 OID 19813)
-- Dependencies: 462
-- Data for Name: indicators_indicator_indicator_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_indicator_indicator_type (id, indicator_id, indicatortype_id) FROM stdin;
\.


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 461
-- Name: indicators_indicator_indicator_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_indicator_indicator_type_id_seq', 1, false);


--
-- TOC entry 4801 (class 0 OID 19821)
-- Dependencies: 464
-- Data for Name: indicators_indicator_objectives; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_indicator_objectives (id, indicator_id, objective_id) FROM stdin;
\.


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 463
-- Name: indicators_indicator_objectives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_indicator_objectives_id_seq', 1, false);


--
-- TOC entry 4803 (class 0 OID 19829)
-- Dependencies: 466
-- Data for Name: indicators_indicator_strategic_objectives; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_indicator_strategic_objectives (id, indicator_id, strategicobjective_id) FROM stdin;
\.


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 465
-- Name: indicators_indicator_strategic_objectives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_indicator_strategic_objectives_id_seq', 1, false);


--
-- TOC entry 4805 (class 0 OID 19837)
-- Dependencies: 468
-- Data for Name: indicators_indicator_sub_sector; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_indicator_sub_sector (id, indicator_id, sector_id) FROM stdin;
\.


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 467
-- Name: indicators_indicator_sub_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_indicator_sub_sector_id_seq', 1, false);


--
-- TOC entry 4807 (class 0 OID 19845)
-- Dependencies: 470
-- Data for Name: indicators_indicator_workflowlevel1; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_indicator_workflowlevel1 (id, indicator_id, workflowlevel1_id) FROM stdin;
1	1	3
2	2	3
3	3	3
4	4	3
5	5	3
6	6	3
7	7	3
8	8	3
9	9	3
10	10	3
11	11	3
12	12	3
13	13	6
14	14	6
15	15	6
16	16	6
17	17	6
\.


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 469
-- Name: indicators_indicator_workflowlevel1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_indicator_workflowlevel1_id_seq', 17, true);


--
-- TOC entry 4564 (class 0 OID 16664)
-- Dependencies: 227
-- Data for Name: indicators_indicatortype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_indicatortype (id, indicator_type, description, default_global, create_date, edit_date, organization_id) FROM stdin;
1	Custom		f	2018-05-31 12:59:36.110862+00	2018-05-31 12:59:36.110875+00	1
2	Donor		f	2018-05-31 12:59:36.113119+00	2018-05-31 12:59:36.113131+00	1
3	Standard		f	2018-05-31 12:59:36.115138+00	2018-05-31 12:59:36.115149+00	1
\.


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 226
-- Name: indicators_indicatortype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_indicatortype_id_seq', 1, false);


--
-- TOC entry 4566 (class 0 OID 16675)
-- Dependencies: 229
-- Data for Name: indicators_level; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_level (id, name, sort, parent_id, global_default, description, color, create_date, edit_date, country_id, organization_id, workflowlevel1_id, created_by_id) FROM stdin;
1	Goal	0	0	f	Improved health and survival of Syrian communities affected by conflict	navy	2018-05-31 12:59:42.348089+00	2018-05-31 12:59:42.348101+00	\N	1	3	\N
2	Intermediate Result	1	1	f	Improved recovery from injuries as a result of conflict	red	2018-05-31 12:59:42.355882+00	2018-05-31 12:59:42.355895+00	\N	1	3	\N
3	Outcome 1	2	2	f	Emergency medical services improve in areas where emergency medical kits are provided	blue	2018-05-31 12:59:42.356949+00	2018-05-31 12:59:42.356961+00	\N	1	3	\N
4	Outcome 2	2	2	f	Community members with improved knowledge of hygiene practices	blue	2018-05-31 12:59:42.357721+00	2018-05-31 12:59:42.357732+00	\N	1	3	\N
5	Output 1	3	3	f	Emergency Medical Kits are delivered to mobile medical units in conflict-affected populations	green	2018-05-31 12:59:42.358435+00	2018-05-31 12:59:42.358446+00	\N	1	3	\N
6	Output 2	3	3	f	Treat injuries and emergency medical needs of affected communities	green	2018-05-31 12:59:42.359141+00	2018-05-31 12:59:42.359152+00	\N	1	3	\N
7	Output 3	3	4	f	Hand Washing Knowledge and Capacity	green	2018-05-31 12:59:42.359853+00	2018-05-31 12:59:42.359863+00	\N	1	3	\N
8	Output 4	3	4	f	Household Water Quality is Improved	green	2018-05-31 12:59:42.360563+00	2018-05-31 12:59:42.360574+00	\N	1	3	\N
9	Impact: Verwirklichung des Kinderrechts auf Bildung in Deutschland	0	0	f	Verwirklichung der Rechte Kindern aus sozial benachteiligten Bevölkerungsgruppen auf qualitativ hochwertige Bildung und Entwicklung	red	2018-05-31 12:59:42.361277+00	2018-05-31 12:59:42.361288+00	\N	1	6	\N
10	Outcome: Gute Bildung und Lernen ermöglichen	1	9	f	Ziel ist es, Kindern unabhängig von ihrem Hintergrund und ihrer Herkunft die Möglichkeit auf gute Bildung und erfolgreiches Lernen zu ermöglichen	blue	2018-05-31 12:59:42.362165+00	2018-05-31 12:59:42.362176+00	\N	1	6	\N
11	Outcome: Kooperation zwischen Eltern/Lehrern verbessern	1	9	f	Ziel ist es, eine stabile Beziehung zwischen Eltern und Lehrern zu bauen, Eltern in die Aktivitäten der Schule einzubeziehen und eine stabile Kommunikation aufzubauen.	blue	2018-05-31 12:59:42.362892+00	2018-05-31 12:59:42.362903+00	\N	1	6	\N
12	Outcome: Schulen familienfreundlicher gestalten	1	9	f	Ziel ist es, Schulen nicht nur als Raum zum Lernen, sondern auch zum Leben zu gestalten. Eine offene und vertrauensvolle Atmosphäre zu kreieren, in dem die ganze Persönlichkeit gesehen und gefördert wird.	green	2018-05-31 12:59:42.363597+00	2018-05-31 12:59:42.363608+00	\N	1	6	\N
13	Output: Schulungen für Familien durchführen	2	10	f		green	2018-05-31 12:59:42.364299+00	2018-05-31 12:59:42.36431+00	\N	1	6	\N
14	Output: Elternbeteiligung stärken	2	11	f		green	2018-05-31 12:59:42.365005+00	2018-05-31 12:59:42.365015+00	\N	1	6	\N
15	Output: Partnerschaftliches Verhältnis etablieren	2	11	f		green	2018-05-31 12:59:42.365738+00	2018-05-31 12:59:42.365749+00	\N	1	6	\N
16	Output: Fortbildungen für Lehrer	2	10	f		green	2018-05-31 12:59:42.366505+00	2018-05-31 12:59:42.366516+00	\N	1	6	\N
17	Output: Ideen partizipativ entwickeln und umsetzen	2	12	f		green	2018-05-31 12:59:42.367219+00	2018-05-31 12:59:42.36723+00	\N	1	6	\N
18	Output: Sprachbarrieren abbauen	2	11	f		green	2018-05-31 12:59:42.367936+00	2018-05-31 12:59:42.367946+00	\N	1	6	\N
\.


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 228
-- Name: indicators_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_level_id_seq', 1, false);


--
-- TOC entry 4568 (class 0 OID 16686)
-- Dependencies: 231
-- Data for Name: indicators_objective; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_objective (id, name, description, create_date, edit_date, workflowlevel1_id, created_by_id) FROM stdin;
\.


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 230
-- Name: indicators_objective_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_objective_id_seq', 1, false);


--
-- TOC entry 4570 (class 0 OID 16697)
-- Dependencies: 233
-- Data for Name: indicators_periodictarget; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_periodictarget (id, period, target, customsort, create_date, edit_date, indicator_id) FROM stdin;
1	February 2018	500.00	\N	\N	\N	1
2	March 2018	1000.00	\N	\N	\N	1
3	April 2018	1000.00	\N	\N	\N	1
4	May 2018	1500.00	\N	\N	\N	1
5	June 2018	1500.00	\N	\N	\N	1
6	July 2018	1000.00	\N	\N	\N	1
7	August 2018	70.00	\N	\N	\N	2
8	February 2018	500.00	\N	\N	\N	12
9	March 2018	500.00	\N	\N	\N	12
10	April 2018	1000.00	\N	\N	\N	12
11	May 2018	1000.00	\N	\N	\N	12
12	June 2018	1500.00	\N	\N	\N	12
13	July 2018	1500.00	\N	\N	\N	12
14	August 2018	1500.00	\N	\N	\N	12
15	August 2018	80.00	\N	\N	\N	3
16	February 2018	100.00	\N	\N	\N	7
17	March 2018	100.00	\N	\N	\N	7
18	April 2018	100.00	\N	\N	\N	7
19	May 2018	100.00	\N	\N	\N	7
20	June 2018	100.00	\N	\N	\N	7
21	July 2018	50.00	\N	\N	\N	7
22	August 2018	75.00	\N	\N	\N	4
23	February 2018	250.00	\N	\N	\N	5
24	March 2018	250.00	\N	\N	\N	5
25	April 2018	500.00	\N	\N	\N	5
26	May 2018	500.00	\N	\N	\N	5
27	August 2018	60.00	\N	\N	\N	6
28	February 2018	1.00	\N	\N	\N	8
29	March 2018	2.00	\N	\N	\N	8
30	April 2018	3.00	\N	\N	\N	8
31	May 2018	2.00	\N	\N	\N	8
32	June 2018	1.00	\N	\N	\N	8
33	August 2018	1.00	\N	\N	\N	8
34	August 2018	5.00	\N	\N	\N	9
35	July 2018	2500.00	\N	\N	\N	10
36	August 2018	2500.00	\N	\N	\N	10
37	July 2018	2500.00	\N	\N	\N	11
38	August 2018	2500.00	\N	\N	\N	11
\.


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 232
-- Name: indicators_periodictarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_periodictarget_id_seq', 1, false);


--
-- TOC entry 4572 (class 0 OID 16705)
-- Dependencies: 235
-- Data for Name: indicators_reportingperiod; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_reportingperiod (id, create_date, edit_date, frequency_id, organization_id) FROM stdin;
\.


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 234
-- Name: indicators_reportingperiod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_reportingperiod_id_seq', 1, false);


--
-- TOC entry 4574 (class 0 OID 16713)
-- Dependencies: 237
-- Data for Name: indicators_strategicobjective; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_strategicobjective (id, name, description, create_date, edit_date, country_id, organization_id) FROM stdin;
\.


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 236
-- Name: indicators_strategicobjective_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_strategicobjective_id_seq', 1, false);


--
-- TOC entry 4576 (class 0 OID 16724)
-- Dependencies: 239
-- Data for Name: indicators_tolatable; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_tolatable (id, name, table_id, remote_owner, url, unique_count, count_column_name_1, count_column_name_2, column_sum, column_avg, refresh_interval, create_date, edit_date, organization_id, owner_id) FROM stdin;
\.


--
-- TOC entry 4793 (class 0 OID 19768)
-- Dependencies: 456
-- Data for Name: indicators_tolatable_country; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_tolatable_country (id, tolatable_id, country_id) FROM stdin;
\.


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 455
-- Name: indicators_tolatable_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_tolatable_country_id_seq', 1, false);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 238
-- Name: indicators_tolatable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_tolatable_id_seq', 1, false);


--
-- TOC entry 4795 (class 0 OID 19784)
-- Dependencies: 458
-- Data for Name: indicators_tolatable_workflowlevel1; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.indicators_tolatable_workflowlevel1 (id, tolatable_id, workflowlevel1_id) FROM stdin;
\.


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 457
-- Name: indicators_tolatable_workflowlevel1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.indicators_tolatable_workflowlevel1_id_seq', 1, false);


--
-- TOC entry 4813 (class 0 OID 20508)
-- Dependencies: 476
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 479
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- TOC entry 4812 (class 0 OID 20495)
-- Dependencies: 475
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
\.


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 480
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- TOC entry 4814 (class 0 OID 20519)
-- Dependencies: 477
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 481
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- TOC entry 4815 (class 0 OID 20530)
-- Dependencies: 478
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated) FROM stdin;
\.


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 482
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- TOC entry 4821 (class 0 OID 20879)
-- Dependencies: 484
-- Data for Name: search_searchindexlog; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.search_searchindexlog (id, create_date, document_count) FROM stdin;
\.


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 483
-- Name: search_searchindexlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.search_searchindexlog_id_seq', 1, false);


--
-- TOC entry 4824 (class 0 OID 20897)
-- Dependencies: 487
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 486
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- TOC entry 4826 (class 0 OID 20908)
-- Dependencies: 489
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 488
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- TOC entry 4828 (class 0 OID 20916)
-- Dependencies: 491
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 490
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- TOC entry 4832 (class 0 OID 20959)
-- Dependencies: 495
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 494
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- TOC entry 4830 (class 0 OID 20924)
-- Dependencies: 493
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 492
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- TOC entry 4578 (class 0 OID 16749)
-- Dependencies: 241
-- Data for Name: workflow_adminlevelfour; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_adminlevelfour (id, name, create_date, edit_date, adminlevelthree_id, adminleveltwo_id) FROM stdin;
\.


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 240
-- Name: workflow_adminlevelfour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_adminlevelfour_id_seq', 1, false);


--
-- TOC entry 4580 (class 0 OID 16757)
-- Dependencies: 243
-- Data for Name: workflow_adminlevelone; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_adminlevelone (id, name, create_date, edit_date, country_id) FROM stdin;
\.


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 242
-- Name: workflow_adminlevelone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_adminlevelone_id_seq', 1, false);


--
-- TOC entry 4582 (class 0 OID 16765)
-- Dependencies: 245
-- Data for Name: workflow_adminlevelthree; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_adminlevelthree (id, name, create_date, edit_date, adminleveltwo_id) FROM stdin;
\.


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 244
-- Name: workflow_adminlevelthree_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_adminlevelthree_id_seq', 1, false);


--
-- TOC entry 4584 (class 0 OID 16773)
-- Dependencies: 247
-- Data for Name: workflow_adminleveltwo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_adminleveltwo (id, name, create_date, edit_date, adminlevelone_id) FROM stdin;
\.


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 246
-- Name: workflow_adminleveltwo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_adminleveltwo_id_seq', 1, false);


--
-- TOC entry 4586 (class 0 OID 16781)
-- Dependencies: 249
-- Data for Name: workflow_approvaltype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_approvaltype (id, name, default_global, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 248
-- Name: workflow_approvaltype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_approvaltype_id_seq', 1, false);


--
-- TOC entry 4588 (class 0 OID 16789)
-- Dependencies: 251
-- Data for Name: workflow_approvalworkflow; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_approvalworkflow (id, note, date_assigned, date_approved, create_date, edit_date, status, section, approval_type_id, assigned_to_id, requested_from_id, created_by_id) FROM stdin;
\.


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 250
-- Name: workflow_approvalworkflow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_approvalworkflow_id_seq', 1, false);


--
-- TOC entry 4590 (class 0 OID 16800)
-- Dependencies: 253
-- Data for Name: workflow_award; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_award (id, name, amount, status, create_date, edit_date, award_currency_id, currency_id, organization_id) FROM stdin;
\.


--
-- TOC entry 4742 (class 0 OID 17560)
-- Dependencies: 405
-- Data for Name: workflow_award_countries; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_award_countries (id, award_id, country_id) FROM stdin;
\.


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 404
-- Name: workflow_award_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_award_countries_id_seq', 1, false);


--
-- TOC entry 4744 (class 0 OID 17568)
-- Dependencies: 407
-- Data for Name: workflow_award_donors; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_award_donors (id, award_id, stakeholder_id) FROM stdin;
\.


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 406
-- Name: workflow_award_donors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_award_donors_id_seq', 1, false);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 252
-- Name: workflow_award_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_award_id_seq', 1, false);


--
-- TOC entry 4592 (class 0 OID 16808)
-- Dependencies: 255
-- Data for Name: workflow_budget; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_budget (id, contributor, account_code, cost_center, donor_code, description_of_contribution, proposed_value, actual_value, create_date, edit_date, donor_currency_id, local_currency_id, workflowlevel2_id, created_by_id) FROM stdin;
\.


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 254
-- Name: workflow_budget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_budget_id_seq', 1, false);


--
-- TOC entry 4594 (class 0 OID 16819)
-- Dependencies: 257
-- Data for Name: workflow_checklist; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_checklist (id, name, create_date, edit_date, country_id, owner_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 256
-- Name: workflow_checklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_checklist_id_seq', 1, false);


--
-- TOC entry 4596 (class 0 OID 16827)
-- Dependencies: 259
-- Data for Name: workflow_checklistitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_checklistitem (id, item, in_file, not_applicable, global_item, create_date, edit_date, checklist_id, owner_id) FROM stdin;
\.


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 258
-- Name: workflow_checklistitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_checklistitem_id_seq', 1, false);


--
-- TOC entry 4598 (class 0 OID 16835)
-- Dependencies: 261
-- Data for Name: workflow_codedfield; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_codedfield (id, name, label, is_required, is_universal, type, default_value, api_url, api_token, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 260
-- Name: workflow_codedfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_codedfield_id_seq', 1, false);


--
-- TOC entry 4738 (class 0 OID 17544)
-- Dependencies: 401
-- Data for Name: workflow_codedfield_workflowlevel1; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_codedfield_workflowlevel1 (id, codedfield_id, workflowlevel1_id) FROM stdin;
\.


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 400
-- Name: workflow_codedfield_workflowlevel1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_codedfield_workflowlevel1_id_seq', 1, false);


--
-- TOC entry 4740 (class 0 OID 17552)
-- Dependencies: 403
-- Data for Name: workflow_codedfield_workflowlevel2; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_codedfield_workflowlevel2 (id, codedfield_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 402
-- Name: workflow_codedfield_workflowlevel2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_codedfield_workflowlevel2_id_seq', 1, false);


--
-- TOC entry 4600 (class 0 OID 16846)
-- Dependencies: 263
-- Data for Name: workflow_codedfieldvalues; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_codedfieldvalues (id, value, create_date, edit_date, coded_field_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 262
-- Name: workflow_codedfieldvalues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_codedfieldvalues_id_seq', 1, false);


--
-- TOC entry 4602 (class 0 OID 16854)
-- Dependencies: 265
-- Data for Name: workflow_contact; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_contact (id, name, title, city, address, email, phone, create_date, edit_date, country_id, organization_id, workflowlevel1_id) FROM stdin;
\.


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 264
-- Name: workflow_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_contact_id_seq', 1, false);


--
-- TOC entry 4604 (class 0 OID 16865)
-- Dependencies: 267
-- Data for Name: workflow_country; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_country (id, country, code, description, latitude, longitude, zoom, create_date, edit_date) FROM stdin;
1	Afghanistan	AF		34.5333	69.1333	5	2018-05-31 12:59:35.894289+00	2018-05-31 12:59:35.894307+00
2	Pakistan	PK		33.6667	73.1667	5	2018-05-31 12:59:35.897728+00	2018-05-31 12:59:35.897741+00
3	Jordan	JO		31.9500	35.9333	5	2018-05-31 12:59:35.899639+00	2018-05-31 12:59:35.89965+00
4	Lebanon	LB		33.9000	35.5333	5	2018-05-31 12:59:35.902806+00	2018-05-31 12:59:35.902818+00
5	Ethiopia	ET		9.0167	38.7500	5	2018-05-31 12:59:35.904823+00	2018-05-31 12:59:35.904835+00
6	Timor-Leste	TL		-8.3	125.5667	5	2018-05-31 12:59:35.906896+00	2018-05-31 12:59:35.906908+00
7	Kenya	KE		-1.2833	36.8167	5	2018-05-31 12:59:35.908869+00	2018-05-31 12:59:35.90888+00
8	Iraq	IQ		33.3333	44.4333	5	2018-05-31 12:59:35.910904+00	2018-05-31 12:59:35.910916+00
9	Nepal	NP		26.5333	86.7333	5	2018-05-31 12:59:35.913045+00	2018-05-31 12:59:35.913057+00
10	Mali	ML		17.6500	0.0000	5	2018-05-31 12:59:35.915008+00	2018-05-31 12:59:35.915021+00
11	United States	US		45	-120	5	2018-05-31 12:59:35.916878+00	2018-05-31 12:59:35.91689+00
12	Turkey	TR		39.9167	32.8333	5	2018-05-31 12:59:35.918916+00	2018-05-31 12:59:35.918928+00
13	Syrian Arab Republic	SY		33.5000	36.3000	5	2018-05-31 12:59:35.921052+00	2018-05-31 12:59:35.921063+00
14	China	CN		\N	\N	5	2018-05-31 12:59:35.92303+00	2018-05-31 12:59:35.923041+00
15	India	IN		\N	\N	5	2018-05-31 12:59:35.925365+00	2018-05-31 12:59:35.925377+00
16	Indonesia	ID		\N	\N	5	2018-05-31 12:59:35.927521+00	2018-05-31 12:59:35.927532+00
17	Mongolia	MN		\N	\N	5	2018-05-31 12:59:35.9294+00	2018-05-31 12:59:35.929411+00
18	Myanmar	MY		21.9162	95.9560	5	2018-05-31 12:59:35.931314+00	2018-05-31 12:59:35.931325+00
19	Palestine	PS		31.3547	34.3088	5	2018-05-31 12:59:35.933169+00	2018-05-31 12:59:35.93318+00
20	South Sudan	SS		6.8770	31.3070	5	2018-05-31 12:59:35.935267+00	2018-05-31 12:59:35.935279+00
21	Uganda	UG		1.3733	32.2903	5	2018-05-31 12:59:35.937302+00	2018-05-31 12:59:35.937314+00
22	Germany	DE		51.1657	10.4515	5	2018-05-31 12:59:35.939273+00	2018-05-31 12:59:35.939288+00
\.


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 266
-- Name: workflow_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_country_id_seq', 22, true);


--
-- TOC entry 4606 (class 0 OID 16876)
-- Dependencies: 269
-- Data for Name: workflow_currency; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_currency (id, source_currency, target_currency, current_rate, conversion_date, create_date, edit_date) FROM stdin;
\.


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 268
-- Name: workflow_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_currency_id_seq', 1, false);


--
-- TOC entry 4748 (class 0 OID 18823)
-- Dependencies: 411
-- Data for Name: workflow_dashboard; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_dashboard (id, name, create_date, edit_date, user_id, public) FROM stdin;
\.


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 410
-- Name: workflow_dashboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_dashboard_id_seq', 1, false);


--
-- TOC entry 4750 (class 0 OID 18831)
-- Dependencies: 413
-- Data for Name: workflow_dashboard_share; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_dashboard_share (id, dashboard_id, tolauser_id) FROM stdin;
\.


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 412
-- Name: workflow_dashboard_share_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_dashboard_share_id_seq', 1, false);


--
-- TOC entry 4754 (class 0 OID 18850)
-- Dependencies: 417
-- Data for Name: workflow_dashboard_widgets; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_dashboard_widgets (id, dashboard_id, widget_id) FROM stdin;
\.


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 416
-- Name: workflow_dashboard_widgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_dashboard_widgets_id_seq', 1, false);


--
-- TOC entry 4608 (class 0 OID 16887)
-- Dependencies: 271
-- Data for Name: workflow_documentation; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_documentation (id, document_uuid, name, url, description, file_field, file_type, create_date, edit_date, workflowlevel1_id, workflowlevel2_id, created_by_id) FROM stdin;
\.


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 270
-- Name: workflow_documentation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_documentation_id_seq', 1, false);


--
-- TOC entry 4610 (class 0 OID 16900)
-- Dependencies: 273
-- Data for Name: workflow_formguidance; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_formguidance (id, form, guidance_link, guidance, default_global, create_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 272
-- Name: workflow_formguidance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_formguidance_id_seq', 1, false);


--
-- TOC entry 4612 (class 0 OID 16911)
-- Dependencies: 275
-- Data for Name: workflow_fundcode; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_fundcode (id, name, default_global, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 274
-- Name: workflow_fundcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_fundcode_id_seq', 1, false);


--
-- TOC entry 4614 (class 0 OID 16919)
-- Dependencies: 277
-- Data for Name: workflow_historicalbudget; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_historicalbudget (id, contributor, account_code, cost_center, donor_code, description_of_contribution, proposed_value, actual_value, create_date, edit_date, history_id, history_date, history_change_reason, history_type, donor_currency_id, history_user_id, local_currency_id, workflowlevel2_id, created_by_id) FROM stdin;
\.


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 276
-- Name: workflow_historicalbudget_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_historicalbudget_history_id_seq', 1, false);


--
-- TOC entry 4616 (class 0 OID 16930)
-- Dependencies: 279
-- Data for Name: workflow_historicalissueregister; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_historicalissueregister (id, name, type, impact, rating, status, cause, date_opened, date_resolved, create_date, edit_date, history_id, history_date, history_change_reason, history_type, assigned_id, history_user_id, organization_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 278
-- Name: workflow_historicalissueregister_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_historicalissueregister_history_id_seq', 1, false);


--
-- TOC entry 4618 (class 0 OID 16941)
-- Dependencies: 281
-- Data for Name: workflow_historicalriskregister; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_historicalriskregister (id, name, type, impact, likelihood, rating, status, category, contingency_plan, mitigation_plan, post_mitigation_status, action_by, action_when, create_date, edit_date, history_id, history_date, history_change_reason, history_type, history_user_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 280
-- Name: workflow_historicalriskregister_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_historicalriskregister_history_id_seq', 1, false);


--
-- TOC entry 4620 (class 0 OID 16952)
-- Dependencies: 283
-- Data for Name: workflow_historicalsiteprofile; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_historicalsiteprofile (id, site_uuid, name, contact_leader, date_of_firstcontact, contact_number, num_members, info_source, total_num_households, avg_household_size, total_population, total_male, total_female, total_land, total_agricultural_land, total_rainfed_land, total_horticultural_land, total_literate_peoples, literate_males, literate_females, literacy_rate, populations_owning_land, avg_landholding_size, households_owning_livestock, animal_type, latitude, longitude, status, create_date, edit_date, history_id, history_date, history_change_reason, history_type, admin_level_three_id, classify_land_id, country_id, district_id, history_user_id, office_id, province_id, type_id, village_id, organization_id, created_by_id) FROM stdin;
1	805937e2-8d40-4e6b-bdac-ea3cad4956eb	Medical Center 1 - Damascus	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	33.5000000000000000	36.3000000000000000	t	2018-05-31 12:59:41.950044+00	2018-05-31 12:59:41.950057+00	1	2018-05-31 12:59:41.955928+00	\N	+	\N	\N	13	\N	\N	\N	\N	\N	\N	1	35
2	09e7a82d-81a8-4d4e-9159-ae63f3482491	Medical Center 2 - Aleppo	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	36.2130824982000000	37.1569335937000000	t	2018-05-31 12:59:41.960925+00	2018-05-31 12:59:41.960942+00	2	2018-05-31 12:59:41.970184+00	\N	+	\N	\N	13	\N	\N	\N	\N	\N	\N	1	35
3	aa1bf3c3-1d7d-48c6-bb41-a69df554de2e	Medical Center 3 - Hamma	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	35.1421960686000000	36.7504394531000000	t	2018-05-31 12:59:41.973867+00	2018-05-31 12:59:41.973884+00	3	2018-05-31 12:59:41.98061+00	\N	+	\N	\N	13	\N	\N	\N	\N	\N	\N	1	35
4	bc970948-fb69-4c02-973d-d51f8eb98ad2	Medical Center 4 - Tartus	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	34.8959000000000000	35.8867000000000000	t	2018-05-31 12:59:41.987502+00	2018-05-31 12:59:41.987516+00	4	2018-05-31 12:59:41.990446+00	\N	+	\N	\N	13	\N	\N	\N	\N	\N	\N	1	35
5	d38f5b97-3efa-419f-a315-d9777c8cbedc	Medical Center 5 - Homs	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	34.7369225399000000	36.7284667969000000	t	2018-05-31 12:59:41.993392+00	2018-05-31 12:59:41.993408+00	5	2018-05-31 12:59:41.997557+00	\N	+	\N	\N	13	\N	\N	\N	\N	\N	\N	1	35
6	b71f0fd0-5bfd-4240-af0c-e047efd68643	Paul Schule	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	50.9692657293000000	6.9889383750000000	t	2018-05-31 12:59:42.000902+00	2018-05-31 12:59:42.000916+00	6	2018-05-31 12:59:42.003643+00	\N	+	\N	\N	22	\N	\N	\N	\N	\N	\N	1	35
7	8df7deae-6a66-479e-810c-e5fe8f3f7ec2	Peter Schule	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	49.4507464458000000	11.0319071250000000	t	2018-05-31 12:59:42.005856+00	2018-05-31 12:59:42.005868+00	7	2018-05-31 12:59:42.008524+00	\N	+	\N	\N	22	\N	\N	\N	\N	\N	\N	1	35
\.


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 282
-- Name: workflow_historicalsiteprofile_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_historicalsiteprofile_history_id_seq', 7, true);


--
-- TOC entry 4622 (class 0 OID 16963)
-- Dependencies: 285
-- Data for Name: workflow_historicalworkflowlevel2; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_historicalworkflowlevel2 (id, level2_uuid, parent_workflowlevel2, name, description, short_name, staff_responsible_id, effect_or_impact, expected_start_date, expected_end_date, total_estimated_budget, justification_background, risks_assumptions, description_of_government_involvement, description_of_community_involvement, actual_start_date, actual_end_date, actual_duration, actual_cost, total_cost, capacity_built, quality_assured, issues_and_challenges, lessons_learned, create_date, edit_date, status, progress, history_id, history_date, history_change_reason, history_type, donor_currency_id, history_user_id, local_currency_id, milestone_id, office_id, sector_id, workflowlevel1_id, created_by_id, address, notes, site_instructions, type) FROM stdin;
1	2015c72f-572c-462a-a8fa-a15c5a5f7fd1	0	Planning: How to map out a project	\N	\N	\N	\N	2018-01-01 11:00:00+00	2018-01-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.112809+00	2018-05-31 12:59:42.112825+00		open	1	2018-05-31 12:59:42.13212+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
2	29d92a75-954b-4a79-9ea1-7d7d0a6a4378	1	Determine the real problem to solve	\N	\N	\N	\N	2018-01-15 11:00:00+00	2018-01-19 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.135115+00	2018-05-31 12:59:42.135128+00	green	open	2	2018-05-31 12:59:42.139497+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
3	5ef421f4-62d0-4bb2-91f7-535afd102e4c	1	Identify Stakeholders	\N	\N	\N	\N	2017-12-20 11:00:00+00	2018-01-26 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.141449+00	2018-05-31 12:59:42.141461+00	green	open	3	2018-05-31 12:59:42.145581+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
4	4be3de17-15a9-4412-a58c-a1d07e1c60e0	1	Define project objectives	\N	\N	\N	\N	2018-01-01 11:00:00+00	2018-01-05 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.1476+00	2018-05-31 12:59:42.147612+00	green	open	4	2018-05-31 12:59:42.151854+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
5	f6bdbd0d-b605-4d81-8894-eeb0909cb283	1	Determine scope, resources and major tasks	\N	\N	\N	\N	2018-01-08 11:00:00+00	2018-01-12 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.1538+00	2018-05-31 12:59:42.153812+00	green	open	5	2018-05-31 12:59:42.158231+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
6	6f5fb44b-40a0-4c44-a5f2-a98c406be4e0	1	Prepare for trade-offs	\N	\N	\N	\N	2018-01-29 11:00:00+00	2018-01-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.160132+00	2018-05-31 12:59:42.160144+00	green	open	6	2018-05-31 12:59:42.164578+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
7	0ffce4fb-753c-4972-be26-50cba1f5c808	0	Build-up: How to get the project started	\N	\N	\N	\N	2017-11-01 11:00:00+00	2017-12-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.176458+00	2018-05-31 12:59:42.176471+00		open	7	2018-05-31 12:59:42.180808+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
8	6ae3beea-c131-47fd-a72f-d56491681069	7	Assemble your team	\N	\N	\N	\N	2017-11-01 11:00:00+00	2017-11-10 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.182848+00	2018-05-31 12:59:42.18286+00	green	open	8	2018-05-31 12:59:42.188653+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
9	63bdabe9-b407-4a8d-b5fd-c43e6a62ebc8	7	Plan assignments	\N	\N	\N	\N	2017-12-01 11:00:00+00	2017-12-08 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.190848+00	2018-05-31 12:59:42.19086+00	green	open	9	2018-05-31 12:59:42.194998+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
10	10b5f17e-7a35-4ea2-8fba-e05d3fcbaad3	7	Create the schedule	\N	\N	\N	\N	2017-11-13 11:00:00+00	2017-11-17 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.197047+00	2018-05-31 12:59:42.19706+00	green	open	10	2018-05-31 12:59:42.201352+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
11	4262c875-7a64-4881-9566-1b0ece6c3289	7	Hold a kickoff meeting	\N	\N	\N	\N	2017-11-27 11:00:00+00	2017-11-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.203255+00	2018-05-31 12:59:42.203267+00	green	open	11	2018-05-31 12:59:42.207541+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
12	c8339920-62d3-4806-b474-8cf5c1d8d3bc	7	Develop a budget	\N	\N	\N	\N	2017-11-20 11:00:00+00	2017-11-24 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.209469+00	2018-05-31 12:59:42.209481+00	green	open	12	2018-05-31 12:59:42.21433+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
13	63ee1bc6-5aca-4348-844f-83def04705c4	0	Implementation: How to execute the project	\N	\N	\N	\N	2018-02-01 11:00:00+00	2018-08-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.216347+00	2018-05-31 12:59:42.216359+00		open	13	2018-05-31 12:59:42.220459+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
14	e4303ea8-6c3d-4afb-864a-bf679f24d283	13	Monitor and control procress and budget	\N	\N	\N	\N	2018-04-02 11:00:00+00	2018-08-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.222455+00	2018-05-31 12:59:42.222467+00	green	open	14	2018-05-31 12:59:42.226625+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
15	58fd3a76-44be-424b-9ead-4b61757d11dd	13	Report progress	\N	\N	\N	\N	2018-06-01 11:00:00+00	2018-08-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.228901+00	2018-05-31 12:59:42.228913+00	green	open	15	2018-05-31 12:59:42.233553+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
16	f974979a-0b49-46d7-8907-690e5cb35465	13	Hold weekly team meetings	<p>Weekly meetings held every Monday</p>	\N	\N	\N	2018-02-01 11:00:00+00	2018-04-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.235471+00	2018-05-31 12:59:42.235484+00	green	open	16	2018-05-31 12:59:42.239723+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
17	6d29e77f-5a54-45e4-9fab-6244ed444a4e	13	Manage problems	\N	\N	\N	\N	2018-02-01 11:00:00+00	2018-08-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.241663+00	2018-05-31 12:59:42.241675+00	green	open	17	2018-05-31 12:59:42.246051+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
18	2eb758ba-0fff-4046-a8c8-4f531748e9f5	0	Closeout: How to handle end matters	\N	\N	\N	\N	2018-09-01 11:00:00+00	2018-10-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.248979+00	2018-05-31 12:59:42.248994+00		open	18	2018-05-31 12:59:42.255936+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
19	ec4da7be-62c6-4a49-8496-4b6599ddc6e8	18	Evaluate project performance	\N	\N	\N	\N	2018-10-15 11:00:00+00	2018-10-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.259097+00	2018-05-31 12:59:42.259114+00		open	19	2018-05-31 12:59:42.267979+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
20	41be238d-119b-4f04-802e-3adfa9bf8382	18	Close the project	\N	\N	\N	\N	2018-09-03 11:00:00+00	2018-09-28 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.271434+00	2018-05-31 12:59:42.271452+00	green	open	20	2018-05-31 12:59:42.278481+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
21	6803dc65-e22e-414c-ad7a-744ca3e49701	18	Debrief with the team	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.280465+00	2018-05-31 12:59:42.280478+00	green	open	21	2018-05-31 12:59:42.284777+00	\N	+	\N	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
22	97434701-750f-4076-807d-dff1a94d3e12	0	Ansprache von 20 Partnerschulen in Berlin	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.286806+00	2018-05-31 12:59:42.286817+00	green	closed	22	2018-05-31 12:59:42.291337+00	\N	+	\N	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
23	cad42cca-d142-40df-ab17-054cb8f55abd	0	20 Schulen in sozialen Brennpunkten identifizieren	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.29399+00	2018-05-31 12:59:42.294018+00	green	closed	23	2018-05-31 12:59:42.300002+00	\N	+	\N	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
24	2fc1c623-bb4f-4d2e-8004-a6023f5f3a3d	0	Ideen zur Gestaltung der Schule finden und umstetzen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.301972+00	2018-05-31 12:59:42.301984+00	yellow	tracking	24	2018-05-31 12:59:42.306418+00	\N	+	\N	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
25	10d78311-a64b-4f84-a87c-333896e34f95	0	Qualifizierung der Lehrer	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.308802+00	2018-05-31 12:59:42.308814+00	yellow	closed	25	2018-05-31 12:59:42.312978+00	\N	+	\N	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
26	548eeccc-02c8-4df4-af10-9f0569bc14f6	25	Lehrer auswählen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.314941+00	2018-05-31 12:59:42.314953+00	yellow	closed	26	2018-05-31 12:59:42.319232+00	\N	+	\N	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
27	9698a986-9da8-4b1a-a695-fee6d707e000	25	Trainings und Supervision durchführen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.321175+00	2018-05-31 12:59:42.321187+00	yellow	tracking	27	2018-05-31 12:59:42.326631+00	\N	+	\N	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
28	91c582df-6e5c-4bfc-8fe3-7b2c3d8cee6f	24	Ideenworkshops durchführen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.328961+00	2018-05-31 12:59:42.328973+00	yellow	tracking	28	2018-05-31 12:59:42.333358+00	\N	+	\N	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
29	18cf8abb-12b6-4057-90d6-335051a224b2	22	Direktoren ansprechen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.335333+00	2018-05-31 12:59:42.335345+00	green	closed	29	2018-05-31 12:59:42.339802+00	\N	+	\N	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
30	1593bb51-b79e-415b-ad86-6674f39b1626	24	Budgets zur Umsetzung finden	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.341821+00	2018-05-31 12:59:42.341832+00	red	awaitingapproval	30	2018-05-31 12:59:42.34624+00	\N	+	\N	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
\.


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 284
-- Name: workflow_historicalworkflowlevel2_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_historicalworkflowlevel2_history_id_seq', 30, true);


--
-- TOC entry 4624 (class 0 OID 16974)
-- Dependencies: 287
-- Data for Name: workflow_industry; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_industry (id, name, description, create_date, edit_date) FROM stdin;
\.


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 286
-- Name: workflow_industry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_industry_id_seq', 1, false);


--
-- TOC entry 4626 (class 0 OID 16985)
-- Dependencies: 289
-- Data for Name: workflow_internationalization; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_internationalization (id, language, language_file, create_date, edit_date) FROM stdin;
\.


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 288
-- Name: workflow_internationalization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_internationalization_id_seq', 1, false);


--
-- TOC entry 4628 (class 0 OID 16996)
-- Dependencies: 291
-- Data for Name: workflow_issueregister; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_issueregister (id, name, type, impact, rating, status, cause, date_opened, date_resolved, create_date, edit_date, assigned_id, organization_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 290
-- Name: workflow_issueregister_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_issueregister_id_seq', 1, false);


--
-- TOC entry 4630 (class 0 OID 17007)
-- Dependencies: 293
-- Data for Name: workflow_landtype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_landtype (id, classify_land, default_global, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 292
-- Name: workflow_landtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_landtype_id_seq', 1, false);


--
-- TOC entry 4632 (class 0 OID 17015)
-- Dependencies: 295
-- Data for Name: workflow_milestone; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_milestone (id, name, description, milestone_start_date, milestone_end_date, is_global, create_date, edit_date, organization_id, created_by_id) FROM stdin;
1	1. Identification and Design	\N	2017-07-01 10:00:00+00	2018-05-11 10:00:00+00	f	2018-05-31 12:59:42.015091+00	2018-05-31 12:59:42.015103+00	1	35
2	2. Setup and Planning	\N	2017-07-01 10:00:00+00	2018-05-11 10:00:00+00	f	2018-05-31 12:59:42.018051+00	2018-05-31 12:59:42.018067+00	1	35
3	3. Implementation	\N	2017-07-01 10:00:00+00	2018-05-11 10:00:00+00	f	2018-05-31 12:59:42.02012+00	2018-05-31 12:59:42.020134+00	1	35
4	4. Close Out	\N	2017-07-01 10:00:00+00	2018-05-11 10:00:00+00	f	2018-05-31 12:59:42.022036+00	2018-05-31 12:59:42.022049+00	1	35
5	Auswahl Schulen	\N	2017-07-01 10:00:00+00	2018-05-11 10:00:00+00	f	2018-05-31 12:59:42.024037+00	2018-05-31 12:59:42.024053+00	1	35
6	Durchführung Ideen Workshops	\N	2017-07-01 10:00:00+00	2018-05-11 10:00:00+00	f	2018-05-31 12:59:42.026172+00	2018-05-31 12:59:42.026186+00	1	35
7	Familien Fortbildungen	\N	2017-07-01 10:00:00+00	2018-05-11 10:00:00+00	f	2018-05-31 12:59:42.029611+00	2018-05-31 12:59:42.029627+00	1	35
8	Qualifizierung Lehrer	\N	2017-07-01 10:00:00+00	2018-05-11 10:00:00+00	f	2018-05-31 12:59:42.033871+00	2018-05-31 12:59:42.033887+00	1	35
\.


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 294
-- Name: workflow_milestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_milestone_id_seq', 8, true);


--
-- TOC entry 4634 (class 0 OID 17026)
-- Dependencies: 297
-- Data for Name: workflow_office; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_office (id, name, code, create_date, edit_date, country_id) FROM stdin;
\.


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 296
-- Name: workflow_office_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_office_id_seq', 1, false);


--
-- TOC entry 4636 (class 0 OID 17037)
-- Dependencies: 299
-- Data for Name: workflow_organization; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_organization (id, organization_uuid, name, description, organization_url, level_1_label, level_2_label, level_3_label, level_4_label, create_date, edit_date, chargebee_subscription_id, chargebee_used_seats, oauth_domains, currency_format, date_format, default_currency_id, allow_budget_decimal) FROM stdin;
1	d42a2231-441c-4a04-bc7d-9e70d764b622	TolaData	\N	http://toladata.com	Program	Project	Activity	Component	2018-05-31 12:59:35.844467+00	2018-05-31 12:59:35.844481+00	\N	0	{toladata.com,humanitec.com}	Commas	DD.MM.YYYY	\N	t
\.


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 298
-- Name: workflow_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_organization_id_seq', 1, true);


--
-- TOC entry 4638 (class 0 OID 17050)
-- Dependencies: 301
-- Data for Name: workflow_organization_industry; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_organization_industry (id, organization_id, industry_id) FROM stdin;
\.


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 300
-- Name: workflow_organization_industry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_organization_industry_id_seq', 1, false);


--
-- TOC entry 4736 (class 0 OID 17510)
-- Dependencies: 399
-- Data for Name: workflow_organization_sector; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_organization_sector (id, organization_id, sector_id) FROM stdin;
\.


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 398
-- Name: workflow_organization_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_organization_sector_id_seq', 1, false);


--
-- TOC entry 4640 (class 0 OID 17058)
-- Dependencies: 303
-- Data for Name: workflow_partner; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_partner (id, partners_uuid, name, create_date, edit_date, country_id, organization_id, type_id) FROM stdin;
\.


--
-- TOC entry 4642 (class 0 OID 17071)
-- Dependencies: 305
-- Data for Name: workflow_partner_approval; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_partner_approval (id, partner_id, approvalworkflow_id) FROM stdin;
\.


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 304
-- Name: workflow_partner_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_partner_approval_id_seq', 1, false);


--
-- TOC entry 4644 (class 0 OID 17079)
-- Dependencies: 307
-- Data for Name: workflow_partner_contact; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_partner_contact (id, partner_id, contact_id) FROM stdin;
\.


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 306
-- Name: workflow_partner_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_partner_contact_id_seq', 1, false);


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 302
-- Name: workflow_partner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_partner_id_seq', 1, false);


--
-- TOC entry 4732 (class 0 OID 17494)
-- Dependencies: 395
-- Data for Name: workflow_partner_sectors; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_partner_sectors (id, partner_id, sector_id) FROM stdin;
\.


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 394
-- Name: workflow_partner_sectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_partner_sectors_id_seq', 1, false);


--
-- TOC entry 4734 (class 0 OID 17502)
-- Dependencies: 397
-- Data for Name: workflow_partner_workflowlevel1; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_partner_workflowlevel1 (id, partner_id, workflowlevel1_id) FROM stdin;
\.


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 396
-- Name: workflow_partner_workflowlevel1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_partner_workflowlevel1_id_seq', 1, false);


--
-- TOC entry 4646 (class 0 OID 17087)
-- Dependencies: 309
-- Data for Name: workflow_portfolio; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_portfolio (id, name, description, is_global, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 4648 (class 0 OID 17098)
-- Dependencies: 311
-- Data for Name: workflow_portfolio_country; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_portfolio_country (id, portfolio_id, country_id) FROM stdin;
\.


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 310
-- Name: workflow_portfolio_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_portfolio_country_id_seq', 1, false);


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 308
-- Name: workflow_portfolio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_portfolio_id_seq', 1, false);


--
-- TOC entry 4834 (class 0 OID 21045)
-- Dependencies: 497
-- Data for Name: workflow_product; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_product (id, name, type, reference_id, create_date, edit_date, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 496
-- Name: workflow_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_product_id_seq', 1, false);


--
-- TOC entry 4650 (class 0 OID 17106)
-- Dependencies: 313
-- Data for Name: workflow_profiletype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_profiletype (id, profile, default_global, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 312
-- Name: workflow_profiletype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_profiletype_id_seq', 1, false);


--
-- TOC entry 4652 (class 0 OID 17114)
-- Dependencies: 315
-- Data for Name: workflow_projecttype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_projecttype (id, name, description, default_global, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 314
-- Name: workflow_projecttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_projecttype_id_seq', 1, false);


--
-- TOC entry 4654 (class 0 OID 17125)
-- Dependencies: 317
-- Data for Name: workflow_riskregister; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_riskregister (id, name, type, impact, likelihood, rating, status, category, contingency_plan, mitigation_plan, post_mitigation_status, action_by, action_when, create_date, edit_date, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 316
-- Name: workflow_riskregister_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_riskregister_id_seq', 1, false);


--
-- TOC entry 4656 (class 0 OID 17136)
-- Dependencies: 319
-- Data for Name: workflow_sector; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_sector (id, sector, default_global, create_date, edit_date, organization_id, created_by_id) FROM stdin;
3	Fisheries	f	2018-05-31 12:59:41.819726+00	2018-05-31 12:59:41.819739+00	1	\N
1	Agriculture	f	2018-05-31 12:59:41.805729+00	2018-05-31 12:59:41.805741+00	1	\N
2	Agribusiness	f	2018-05-31 12:59:41.8175+00	2018-05-31 12:59:41.817552+00	1	\N
4	Basic Needs	f	2018-05-31 12:59:41.82083+00	2018-05-31 12:59:41.820842+00	1	\N
5	Basic Health Care	f	2018-05-31 12:59:41.821852+00	2018-05-31 12:59:41.821863+00	1	\N
6	Basic Health Infrastructure	f	2018-05-31 12:59:41.823124+00	2018-05-31 12:59:41.823135+00	1	\N
7	Basic Nutrition	f	2018-05-31 12:59:41.824184+00	2018-05-31 12:59:41.824196+00	1	\N
8	Basic Life Skills For Youth	f	2018-05-31 12:59:41.825412+00	2018-05-31 12:59:41.825424+00	1	\N
9	Basic Drinking Water Supply And Basic Sanitation	f	2018-05-31 12:59:41.826433+00	2018-05-31 12:59:41.826445+00	1	\N
10	Basic Sanitation	f	2018-05-31 12:59:41.827473+00	2018-05-31 12:59:41.827485+00	1	\N
11	Basic Education	f	2018-05-31 12:59:41.828707+00	2018-05-31 12:59:41.82872+00	1	\N
12	Capacity development	f	2018-05-31 12:59:41.829728+00	2018-05-31 12:59:41.829739+00	1	\N
13	Child Health & Nutrition	f	2018-05-31 12:59:41.830705+00	2018-05-31 12:59:41.830717+00	1	\N
14	Emergency Response	f	2018-05-31 12:59:41.831713+00	2018-05-31 12:59:41.831724+00	1	\N
15	Climate Change Adaptation & Disaster Risk Reduction	f	2018-05-31 12:59:41.832725+00	2018-05-31 12:59:41.832737+00	1	\N
16	Climate Change Adaptation	f	2018-05-31 12:59:41.833758+00	2018-05-31 12:59:41.83377+00	1	\N
17	Disaster Risk Reduction	f	2018-05-31 12:59:41.834883+00	2018-05-31 12:59:41.834895+00	1	\N
18	Resilience	f	2018-05-31 12:59:41.835879+00	2018-05-31 12:59:41.83589+00	1	\N
19	Conflict Management	f	2018-05-31 12:59:41.83684+00	2018-05-31 12:59:41.836851+00	1	\N
20	Peacebuilding	f	2018-05-31 12:59:41.837813+00	2018-05-31 12:59:41.837824+00	1	\N
21	Conflict Prevention And Resolution	f	2018-05-31 12:59:41.838768+00	2018-05-31 12:59:41.838779+00	1	\N
22	Early Recovery	f	2018-05-31 12:59:41.839728+00	2018-05-31 12:59:41.83974+00	1	\N
23	Economic Recovery and Livelihoods	f	2018-05-31 12:59:41.840672+00	2018-05-31 12:59:41.840684+00	1	\N
24	Basic Infrastructure Restoration	f	2018-05-31 12:59:41.841608+00	2018-05-31 12:59:41.841619+00	1	\N
25	Economic and Market Development	f	2018-05-31 12:59:41.84255+00	2018-05-31 12:59:41.842562+00	1	\N
26	Private Sector Development	f	2018-05-31 12:59:41.84352+00	2018-05-31 12:59:41.843531+00	1	\N
27	Employment Opportunities	f	2018-05-31 12:59:41.844466+00	2018-05-31 12:59:41.844477+00	1	\N
28	Livelihood Improvement	f	2018-05-31 12:59:41.845419+00	2018-05-31 12:59:41.84543+00	1	\N
29	Enterprise Development	f	2018-05-31 12:59:41.846348+00	2018-05-31 12:59:41.846359+00	1	\N
30	Entrepreneurship	f	2018-05-31 12:59:41.847411+00	2018-05-31 12:59:41.847422+00	1	\N
31	Education	f	2018-05-31 12:59:41.848398+00	2018-05-31 12:59:41.848409+00	1	\N
32	Primary Education	f	2018-05-31 12:59:41.849397+00	2018-05-31 12:59:41.849408+00	1	\N
33	Secondary Education	f	2018-05-31 12:59:41.850377+00	2018-05-31 12:59:41.850388+00	1	\N
34	Post-Secondary Education	f	2018-05-31 12:59:41.851583+00	2018-05-31 12:59:41.851596+00	1	\N
35	Vocational Training	f	2018-05-31 12:59:41.852677+00	2018-05-31 12:59:41.852689+00	1	\N
36	Informal Education/Life skills	f	2018-05-31 12:59:41.853655+00	2018-05-31 12:59:41.853666+00	1	\N
37	Shelter	f	2018-05-31 12:59:41.855254+00	2018-05-31 12:59:41.855269+00	1	\N
38	Non-food Items (NFI)	f	2018-05-31 12:59:41.856554+00	2018-05-31 12:59:41.856567+00	1	\N
39	Fuel/Energy	f	2018-05-31 12:59:41.858013+00	2018-05-31 12:59:41.858027+00	1	\N
40	Social Support	f	2018-05-31 12:59:41.859269+00	2018-05-31 12:59:41.859283+00	1	\N
41	Information Dissemination	f	2018-05-31 12:59:41.860531+00	2018-05-31 12:59:41.860543+00	1	\N
42	Energy	f	2018-05-31 12:59:41.861708+00	2018-05-31 12:59:41.861719+00	1	\N
43	Access to Electricity	f	2018-05-31 12:59:41.86272+00	2018-05-31 12:59:41.862731+00	1	\N
44	Access to Clean Cooking Facilities	f	2018-05-31 12:59:41.863715+00	2018-05-31 12:59:41.863726+00	1	\N
45	Energy Efficiency	f	2018-05-31 12:59:41.864777+00	2018-05-31 12:59:41.864788+00	1	\N
46	Renewable Energy	f	2018-05-31 12:59:41.865786+00	2018-05-31 12:59:41.865798+00	1	\N
47	Financial services	f	2018-05-31 12:59:41.866804+00	2018-05-31 12:59:41.866815+00	1	\N
48	Financial Services	f	2018-05-31 12:59:41.867821+00	2018-05-31 12:59:41.867833+00	1	\N
49	Financial Inclusion	f	2018-05-31 12:59:41.868784+00	2018-05-31 12:59:41.868796+00	1	\N
50	Cash for Work	f	2018-05-31 12:59:41.869745+00	2018-05-31 12:59:41.869757+00	1	\N
51	Food Security	f	2018-05-31 12:59:41.87068+00	2018-05-31 12:59:41.870691+00	1	\N
52	Food Assistance	f	2018-05-31 12:59:41.871623+00	2018-05-31 12:59:41.871634+00	1	\N
53	Food Access	f	2018-05-31 12:59:41.872579+00	2018-05-31 12:59:41.872591+00	1	\N
54	Food Availability	f	2018-05-31 12:59:41.873515+00	2018-05-31 12:59:41.873526+00	1	\N
55	Agriculture and Livestock	f	2018-05-31 12:59:41.874455+00	2018-05-31 12:59:41.874465+00	1	\N
56	Gender	f	2018-05-31 12:59:41.875379+00	2018-05-31 12:59:41.87539+00	1	\N
57	Governance	f	2018-05-31 12:59:41.876313+00	2018-05-31 12:59:41.876324+00	1	\N
58	Democratic Participation And Civil Society	f	2018-05-31 12:59:41.877453+00	2018-05-31 12:59:41.877465+00	1	\N
59	Education Policy And Administrative Management	f	2018-05-31 12:59:41.878521+00	2018-05-31 12:59:41.878533+00	1	\N
60	Water Sector Policy And Administrative Management	f	2018-05-31 12:59:41.879529+00	2018-05-31 12:59:41.87954+00	1	\N
61	Fishing Policy And Administrative Management	f	2018-05-31 12:59:41.880535+00	2018-05-31 12:59:41.880546+00	1	\N
62	Agricultural Policy And Administrative Management	f	2018-05-31 12:59:41.881695+00	2018-05-31 12:59:41.881706+00	1	\N
63	Health Policy And Administrative Management	f	2018-05-31 12:59:41.882696+00	2018-05-31 12:59:41.882707+00	1	\N
64	Population Policy And Administrative Management	f	2018-05-31 12:59:41.883883+00	2018-05-31 12:59:41.883909+00	1	\N
65	Public Sector Policy And Administrative Management	f	2018-05-31 12:59:41.885214+00	2018-05-31 12:59:41.885226+00	1	\N
66	Social Protection And Welfare Services Policy, Planning And Administration	f	2018-05-31 12:59:41.886225+00	2018-05-31 12:59:41.886236+00	1	\N
67	Employment Policy And Administrative Management	f	2018-05-31 12:59:41.887205+00	2018-05-31 12:59:41.887216+00	1	\N
68	Housing Policy And Administrative Management	f	2018-05-31 12:59:41.888173+00	2018-05-31 12:59:41.888183+00	1	\N
69	Transport Policy And Administrative Management	f	2018-05-31 12:59:41.889157+00	2018-05-31 12:59:41.889168+00	1	\N
70	Communications Policy And Administrative Management	f	2018-05-31 12:59:41.890142+00	2018-05-31 12:59:41.890153+00	1	\N
71	Energy Policy And Administrative Management	f	2018-05-31 12:59:41.891131+00	2018-05-31 12:59:41.891142+00	1	\N
72	Financial Policy And Administrative Management	f	2018-05-31 12:59:41.892105+00	2018-05-31 12:59:41.892116+00	1	\N
73	Rural Land Policy And Management	f	2018-05-31 12:59:41.893375+00	2018-05-31 12:59:41.893386+00	1	\N
74	Urban Land Policy And Management	f	2018-05-31 12:59:41.894449+00	2018-05-31 12:59:41.894461+00	1	\N
75	Environmental Policy And Administrative Management	f	2018-05-31 12:59:41.895458+00	2018-05-31 12:59:41.89547+00	1	\N
76	Tourism Policy And Administrative Management	f	2018-05-31 12:59:41.896454+00	2018-05-31 12:59:41.896465+00	1	\N
77	Trade Policy And Administrative Management	f	2018-05-31 12:59:41.897449+00	2018-05-31 12:59:41.89746+00	1	\N
78	Construction Policy And Administrative Management	f	2018-05-31 12:59:41.898431+00	2018-05-31 12:59:41.898442+00	1	\N
79	Mineral/Mining Policy And Administrative Management	f	2018-05-31 12:59:41.899416+00	2018-05-31 12:59:41.899426+00	1	\N
80	Industrial Policy And Administrative Management	f	2018-05-31 12:59:41.900472+00	2018-05-31 12:59:41.900483+00	1	\N
81	Health	f	2018-05-31 12:59:41.901887+00	2018-05-31 12:59:41.901899+00	1	\N
82	General Clinical Services	f	2018-05-31 12:59:41.902961+00	2018-05-31 12:59:41.902973+00	1	\N
83	Maternal Health and Newborn Care	f	2018-05-31 12:59:41.903939+00	2018-05-31 12:59:41.903951+00	1	\N
84	Child Healh	f	2018-05-31 12:59:41.904982+00	2018-05-31 12:59:41.904993+00	1	\N
85	Sexual Violence	f	2018-05-31 12:59:41.905954+00	2018-05-31 12:59:41.905965+00	1	\N
86	Psychosocial support	f	2018-05-31 12:59:41.906934+00	2018-05-31 12:59:41.906945+00	1	\N
87	Infectious Diseases	f	2018-05-31 12:59:41.907945+00	2018-05-31 12:59:41.907956+00	1	\N
88	Human rights	f	2018-05-31 12:59:41.908921+00	2018-05-31 12:59:41.908932+00	1	\N
89	Information Dissemination and Knowledge Management	f	2018-05-31 12:59:41.909889+00	2018-05-31 12:59:41.9099+00	1	\N
90	Infrastructure	f	2018-05-31 12:59:41.910884+00	2018-05-31 12:59:41.910895+00	1	\N
91	Water supply Infrastructure	f	2018-05-31 12:59:41.911885+00	2018-05-31 12:59:41.911897+00	1	\N
92	Natural Resource Management	f	2018-05-31 12:59:41.912888+00	2018-05-31 12:59:41.912899+00	1	\N
93	Water Management	f	2018-05-31 12:59:41.913867+00	2018-05-31 12:59:41.913878+00	1	\N
94	Land Management	f	2018-05-31 12:59:41.914896+00	2018-05-31 12:59:41.914907+00	1	\N
95	Nutrition	f	2018-05-31 12:59:41.915867+00	2018-05-31 12:59:41.915878+00	1	\N
96	Infant Feeding	f	2018-05-31 12:59:41.916829+00	2018-05-31 12:59:41.91684+00	1	\N
97	Protection	f	2018-05-31 12:59:41.917826+00	2018-05-31 12:59:41.917838+00	1	\N
98	Child Protection	f	2018-05-31 12:59:41.918898+00	2018-05-31 12:59:41.91891+00	1	\N
99	Gender-Based Violence	f	2018-05-31 12:59:41.919908+00	2018-05-31 12:59:41.919919+00	1	\N
100	Housing Land and Property	f	2018-05-31 12:59:41.920892+00	2018-05-31 12:59:41.920903+00	1	\N
101	Water, Sanitation, and Hygiene (WASH)	f	2018-05-31 12:59:41.921861+00	2018-05-31 12:59:41.921873+00	1	\N
102	Water Supply	f	2018-05-31 12:59:41.922835+00	2018-05-31 12:59:41.922847+00	1	\N
103	Hygiene Promotion	f	2018-05-31 12:59:41.923846+00	2018-05-31 12:59:41.923857+00	1	\N
104	Excreta Disposal	f	2018-05-31 12:59:41.925082+00	2018-05-31 12:59:41.925094+00	1	\N
105	Solid Waste Management	f	2018-05-31 12:59:41.926142+00	2018-05-31 12:59:41.926153+00	1	\N
106	Youth Development	f	2018-05-31 12:59:41.927117+00	2018-05-31 12:59:41.927129+00	1	\N
107	Malnutrition Prevention	f	2018-05-31 12:59:41.928089+00	2018-05-31 12:59:41.9281+00	1	\N
108	Micronutrient Deficiency Prevention	f	2018-05-31 12:59:41.929065+00	2018-05-31 12:59:41.929076+00	1	\N
109	Children's Rights	f	2018-05-31 12:59:41.930041+00	2018-05-31 12:59:41.930052+00	1	\N
\.


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 318
-- Name: workflow_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_sector_id_seq', 109, true);


--
-- TOC entry 4658 (class 0 OID 17144)
-- Dependencies: 321
-- Data for Name: workflow_sectorrelated; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_sectorrelated (id, "order", org_order, organization_id, sector_id, sector_related_id) FROM stdin;
\.


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 320
-- Name: workflow_sectorrelated_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_sectorrelated_id_seq', 1, false);


--
-- TOC entry 4660 (class 0 OID 17154)
-- Dependencies: 323
-- Data for Name: workflow_siteprofile; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_siteprofile (id, site_uuid, name, contact_leader, date_of_firstcontact, contact_number, num_members, info_source, total_num_households, avg_household_size, total_population, total_male, total_female, total_land, total_agricultural_land, total_rainfed_land, total_horticultural_land, total_literate_peoples, literate_males, literate_females, literacy_rate, populations_owning_land, avg_landholding_size, households_owning_livestock, animal_type, latitude, longitude, status, create_date, edit_date, admin_level_three_id, classify_land_id, country_id, district_id, office_id, province_id, type_id, village_id, organization_id, created_by_id) FROM stdin;
1	805937e2-8d40-4e6b-bdac-ea3cad4956eb	Medical Center 1 - Damascus	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	33.5000000000000000	36.3000000000000000	t	2018-05-31 12:59:41.950044+00	2018-05-31 12:59:41.950057+00	\N	\N	13	\N	\N	\N	\N	\N	1	35
2	09e7a82d-81a8-4d4e-9159-ae63f3482491	Medical Center 2 - Aleppo	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	36.2130824982000000	37.1569335937000000	t	2018-05-31 12:59:41.960925+00	2018-05-31 12:59:41.960942+00	\N	\N	13	\N	\N	\N	\N	\N	1	35
3	aa1bf3c3-1d7d-48c6-bb41-a69df554de2e	Medical Center 3 - Hamma	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	35.1421960686000000	36.7504394531000000	t	2018-05-31 12:59:41.973867+00	2018-05-31 12:59:41.973884+00	\N	\N	13	\N	\N	\N	\N	\N	1	35
4	bc970948-fb69-4c02-973d-d51f8eb98ad2	Medical Center 4 - Tartus	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	34.8959000000000000	35.8867000000000000	t	2018-05-31 12:59:41.987502+00	2018-05-31 12:59:41.987516+00	\N	\N	13	\N	\N	\N	\N	\N	1	35
5	d38f5b97-3efa-419f-a315-d9777c8cbedc	Medical Center 5 - Homs	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	34.7369225399000000	36.7284667969000000	t	2018-05-31 12:59:41.993392+00	2018-05-31 12:59:41.993408+00	\N	\N	13	\N	\N	\N	\N	\N	1	35
6	b71f0fd0-5bfd-4240-af0c-e047efd68643	Paul Schule	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	50.9692657293000000	6.9889383750000000	t	2018-05-31 12:59:42.000902+00	2018-05-31 12:59:42.000916+00	\N	\N	22	\N	\N	\N	\N	\N	1	35
7	8df7deae-6a66-479e-810c-e5fe8f3f7ec2	Peter Schule	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00000000000000	\N	\N	49.4507464458000000	11.0319071250000000	t	2018-05-31 12:59:42.005856+00	2018-05-31 12:59:42.005868+00	\N	\N	22	\N	\N	\N	\N	\N	1	35
\.


--
-- TOC entry 4662 (class 0 OID 17167)
-- Dependencies: 325
-- Data for Name: workflow_siteprofile_approval; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_siteprofile_approval (id, siteprofile_id, approvalworkflow_id) FROM stdin;
\.


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 324
-- Name: workflow_siteprofile_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_siteprofile_approval_id_seq', 1, false);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 322
-- Name: workflow_siteprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_siteprofile_id_seq', 7, true);


--
-- TOC entry 4746 (class 0 OID 18758)
-- Dependencies: 409
-- Data for Name: workflow_siteprofile_workflowlevel1; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_siteprofile_workflowlevel1 (id, siteprofile_id, workflowlevel1_id) FROM stdin;
\.


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 408
-- Name: workflow_siteprofile_workflowlevel1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_siteprofile_workflowlevel1_id_seq', 1, false);


--
-- TOC entry 4664 (class 0 OID 17175)
-- Dependencies: 327
-- Data for Name: workflow_stakeholder; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_stakeholder (id, stakeholder_uuid, name, role, contribution, stakeholder_register, create_date, edit_date, country_id, formal_relationship_document_id, organization_id, type_id, vetting_document_id, created_by_id) FROM stdin;
1	4f13596a-3f8e-40a4-bf61-cce326c1b473	Municipal Government Official	Bulk Transport Services	\N	f	2018-05-31 12:59:42.010887+00	2018-05-31 12:59:42.013609+00	13	\N	1	\N	\N	35
\.


--
-- TOC entry 4666 (class 0 OID 17188)
-- Dependencies: 329
-- Data for Name: workflow_stakeholder_approval; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_stakeholder_approval (id, stakeholder_id, approvalworkflow_id) FROM stdin;
\.


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 328
-- Name: workflow_stakeholder_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_stakeholder_approval_id_seq', 1, false);


--
-- TOC entry 4668 (class 0 OID 17196)
-- Dependencies: 331
-- Data for Name: workflow_stakeholder_contact; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_stakeholder_contact (id, stakeholder_id, contact_id) FROM stdin;
\.


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 330
-- Name: workflow_stakeholder_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_stakeholder_contact_id_seq', 1, false);


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 326
-- Name: workflow_stakeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_stakeholder_id_seq', 1, true);


--
-- TOC entry 4670 (class 0 OID 17204)
-- Dependencies: 333
-- Data for Name: workflow_stakeholder_sectors; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_stakeholder_sectors (id, stakeholder_id, sector_id) FROM stdin;
\.


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 332
-- Name: workflow_stakeholder_sectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_stakeholder_sectors_id_seq', 1, false);


--
-- TOC entry 4730 (class 0 OID 17486)
-- Dependencies: 393
-- Data for Name: workflow_stakeholder_workflowlevel1; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_stakeholder_workflowlevel1 (id, stakeholder_id, workflowlevel1_id) FROM stdin;
\.


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 392
-- Name: workflow_stakeholder_workflowlevel1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_stakeholder_workflowlevel1_id_seq', 1, false);


--
-- TOC entry 4672 (class 0 OID 17212)
-- Dependencies: 335
-- Data for Name: workflow_stakeholdertype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_stakeholdertype (id, name, default_global, create_date, edit_date, organization_id) FROM stdin;
\.


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 334
-- Name: workflow_stakeholdertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_stakeholdertype_id_seq', 1, false);


--
-- TOC entry 4674 (class 0 OID 17220)
-- Dependencies: 337
-- Data for Name: workflow_tolabookmarks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_tolabookmarks (id, name, bookmark_url, filter, create_date, edit_date, user_id, workflowlevel1_id) FROM stdin;
\.


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 336
-- Name: workflow_tolabookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_tolabookmarks_id_seq', 1, false);


--
-- TOC entry 4676 (class 0 OID 17231)
-- Dependencies: 339
-- Data for Name: workflow_tolasites; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_tolasites (id, name, agency_name, agency_url, tola_report_url, tola_tables_url, front_end_url, tola_tables_user, tola_tables_token, privacy_disclaimer, created, updated, site_id, whitelisted_domains) FROM stdin;
1	TolaData	\N	\N	https://report.toladata.io	https://activity.toladata.io	https://activity.toladata.io	\N	\N	\N	2018-05-31 12:59:35.869669+00	\N	1	\N
\.


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 338
-- Name: workflow_tolasites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_tolasites_id_seq', 1, true);


--
-- TOC entry 4678 (class 0 OID 17242)
-- Dependencies: 341
-- Data for Name: workflow_tolauser; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_tolauser (id, tola_user_uuid, title, name, employee_number, position_description, contact_info, tables_api_token, activity_api_token, privacy_disclaimer_accepted, filter, create_date, edit_date, country_id, organization_id, user_id) FROM stdin;
1	da5cd512-d24b-40a5-9ddc-9eff7a14c540	\N	Andrew Ham	\N	Chief of Operations	\N	\N	\N	f	\N	2018-05-31 12:59:41.942589+00	2018-05-31 12:59:41.942601+00	22	1	34
2	8aa9ddca-1e9e-4f60-8e37-80977b6e811c	\N	Ninette Dedikari	\N	Chief of Operations	\N	\N	\N	f	\N	2018-05-31 12:59:41.948403+00	2018-05-31 12:59:41.948415+00	22	1	35
\.


--
-- TOC entry 4680 (class 0 OID 17257)
-- Dependencies: 343
-- Data for Name: workflow_tolauser_countries; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_tolauser_countries (id, tolauser_id, country_id) FROM stdin;
\.


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 342
-- Name: workflow_tolauser_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_tolauser_countries_id_seq', 1, false);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 340
-- Name: workflow_tolauser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_tolauser_id_seq', 2, true);


--
-- TOC entry 4682 (class 0 OID 17265)
-- Dependencies: 345
-- Data for Name: workflow_tolauserfilter; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_tolauserfilter (id, start_date_filter, end_date_filter, create_date, edit_date, user_id) FROM stdin;
\.


--
-- TOC entry 4684 (class 0 OID 17273)
-- Dependencies: 347
-- Data for Name: workflow_tolauserfilter_country_filter; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_tolauserfilter_country_filter (id, tolauserfilter_id, country_id) FROM stdin;
\.


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 346
-- Name: workflow_tolauserfilter_country_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_tolauserfilter_country_filter_id_seq', 1, false);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 344
-- Name: workflow_tolauserfilter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_tolauserfilter_id_seq', 1, false);


--
-- TOC entry 4686 (class 0 OID 17281)
-- Dependencies: 349
-- Data for Name: workflow_tolauserfilter_sector_filter; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_tolauserfilter_sector_filter (id, tolauserfilter_id, sector_id) FROM stdin;
\.


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 348
-- Name: workflow_tolauserfilter_sector_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_tolauserfilter_sector_filter_id_seq', 1, false);


--
-- TOC entry 4726 (class 0 OID 17470)
-- Dependencies: 389
-- Data for Name: workflow_tolauserfilter_workflowlevel1_filter; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_tolauserfilter_workflowlevel1_filter (id, tolauserfilter_id, workflowlevel1_id) FROM stdin;
\.


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 388
-- Name: workflow_tolauserfilter_workflowlevel1_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_tolauserfilter_workflowlevel1_filter_id_seq', 1, false);


--
-- TOC entry 4728 (class 0 OID 17478)
-- Dependencies: 391
-- Data for Name: workflow_tolauserfilter_workflowlevel2_filter; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_tolauserfilter_workflowlevel2_filter (id, tolauserfilter_id, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 390
-- Name: workflow_tolauserfilter_workflowlevel2_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_tolauserfilter_workflowlevel2_filter_id_seq', 1, false);


--
-- TOC entry 4752 (class 0 OID 18839)
-- Dependencies: 415
-- Data for Name: workflow_widget; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_widget (id, w, h, x, y, "xSm", "ySm", "xMd", "yMd", "xLg", "yLg", "xXl", "yXl", drag_and_drop, resizable, title, type, data, create_date, edit_date, changed) FROM stdin;
\.


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 414
-- Name: workflow_widget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_widget_id_seq', 1, false);


--
-- TOC entry 4688 (class 0 OID 17289)
-- Dependencies: 351
-- Data for Name: workflow_workflowlevel1; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1 (id, level1_uuid, unique_id, name, funding_status, cost_center, description, public_dashboard, start_date, end_date, create_date, edit_date, sort, organization_id, portfolio_id) FROM stdin;
1	4f789b6b-1a4a-446a-8530-1ae6e906b4fc	\N	Financial Assistance and Building Resilience in Conflict Areas	Funded	\N	<p>Build resilience among affected communities through improving access to finance</p>	f	2017-07-01 10:00:00+00	2019-06-30 10:00:00+00	2018-05-31 12:59:42.042165+00	2018-05-31 12:59:42.046154+00	0	1	\N
2	77c05b81-9c2d-4d16-8fb7-dca7c2d64f6a	\N	Population Health Initiative		\N	<p>Build resilience among affected communities through improving access to finance</p>	f	2017-07-01 10:00:00+00	2019-06-30 10:00:00+00	2018-05-31 12:59:42.057226+00	2018-05-31 12:59:42.059196+00	0	1	\N
3	41dd09f9-3875-4db9-a91a-6203842b652a	\N	Humanitarian Response to the Syrian Crisis	Funded	\N	<p>Newly funded program</p>	f	2017-07-01 10:00:00+00	2019-06-30 10:00:00+00	2018-05-31 12:59:42.068813+00	2018-05-31 12:59:42.072758+00	0	1	\N
4	c2b05c66-1c7f-4633-9800-4e2eb22fcc44	\N	Institutional Learning Initiative		\N	\N	f	2017-07-01 10:00:00+00	2019-06-30 10:00:00+00	2018-05-31 12:59:42.073993+00	2018-05-31 12:59:42.078786+00	0	1	\N
5	2d3846a6-e681-4895-81d9-da7dcae7e4fa	\N	Building resilience in Mali		\N	\N	f	2017-07-01 10:00:00+00	2019-06-30 10:00:00+00	2018-05-31 12:59:42.080482+00	2018-05-31 12:59:42.088586+00	0	1	\N
6	897af31a-4b2c-4f28-bcf8-1dcb0978c706	\N	Bildung für sozial benachteiligte Kinder in Deutschland		\N	\N	f	2017-07-01 10:00:00+00	2019-06-30 10:00:00+00	2018-05-31 12:59:42.097984+00	2018-05-31 12:59:42.108276+00	0	1	\N
\.


--
-- TOC entry 4690 (class 0 OID 17302)
-- Dependencies: 353
-- Data for Name: workflow_workflowlevel1_award; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1_award (id, workflowlevel1_id, award_id) FROM stdin;
\.


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 352
-- Name: workflow_workflowlevel1_award_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1_award_id_seq', 1, false);


--
-- TOC entry 4692 (class 0 OID 17310)
-- Dependencies: 355
-- Data for Name: workflow_workflowlevel1_country; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1_country (id, workflowlevel1_id, country_id) FROM stdin;
1	3	13
2	4	13
3	5	13
4	6	13
\.


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 354
-- Name: workflow_workflowlevel1_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1_country_id_seq', 4, true);


--
-- TOC entry 4694 (class 0 OID 17318)
-- Dependencies: 357
-- Data for Name: workflow_workflowlevel1_fund_code; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1_fund_code (id, workflowlevel1_id, fundcode_id) FROM stdin;
\.


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 356
-- Name: workflow_workflowlevel1_fund_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1_fund_code_id_seq', 1, false);


--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 350
-- Name: workflow_workflowlevel1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1_id_seq', 6, true);


--
-- TOC entry 4696 (class 0 OID 17326)
-- Dependencies: 359
-- Data for Name: workflow_workflowlevel1_milestone; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1_milestone (id, workflowlevel1_id, milestone_id) FROM stdin;
1	3	1
2	3	2
3	3	3
4	3	4
5	6	8
6	6	5
7	6	6
8	6	7
\.


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 358
-- Name: workflow_workflowlevel1_milestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1_milestone_id_seq', 8, true);


--
-- TOC entry 4698 (class 0 OID 17334)
-- Dependencies: 361
-- Data for Name: workflow_workflowlevel1_sector; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1_sector (id, workflowlevel1_id, sector_id) FROM stdin;
\.


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 360
-- Name: workflow_workflowlevel1_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1_sector_id_seq', 1, false);


--
-- TOC entry 4700 (class 0 OID 17342)
-- Dependencies: 363
-- Data for Name: workflow_workflowlevel1_sub_sector; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1_sub_sector (id, workflowlevel1_id, sector_id) FROM stdin;
\.


--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 362
-- Name: workflow_workflowlevel1_sub_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1_sub_sector_id_seq', 1, false);


--
-- TOC entry 4702 (class 0 OID 17350)
-- Dependencies: 365
-- Data for Name: workflow_workflowlevel1_user_access; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1_user_access (id, workflowlevel1_id, tolauser_id) FROM stdin;
1	1	1
2	2	2
3	3	1
\.


--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 364
-- Name: workflow_workflowlevel1_user_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1_user_access_id_seq', 3, true);


--
-- TOC entry 4704 (class 0 OID 17358)
-- Dependencies: 367
-- Data for Name: workflow_workflowlevel1sector; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1sector (id, create_date, edit_date, sort, sector_id, workflowlevel1_id) FROM stdin;
1	2018-05-31 12:59:42.812522+00	2018-05-31 12:59:42.812535+00	0	14	3
2	2018-05-31 12:59:42.817315+00	2018-05-31 12:59:42.817327+00	0	5	3
3	2018-05-31 12:59:42.821577+00	2018-05-31 12:59:42.82159+00	0	101	3
4	2018-05-31 12:59:42.825725+00	2018-05-31 12:59:42.825738+00	0	49	1
5	2018-05-31 12:59:42.830221+00	2018-05-31 12:59:42.830234+00	0	31	6
6	2018-05-31 12:59:42.834303+00	2018-05-31 12:59:42.834324+00	0	109	6
\.


--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 366
-- Name: workflow_workflowlevel1sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1sector_id_seq', 6, true);


--
-- TOC entry 4706 (class 0 OID 17366)
-- Dependencies: 369
-- Data for Name: workflow_workflowlevel1sector_sub_sector; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel1sector_sub_sector (id, workflowlevel1sector_id, sector_id) FROM stdin;
1	1	39
2	1	38
3	1	37
4	1	40
5	1	41
6	2	83
7	2	13
8	2	84
9	3	102
10	3	10
11	3	103
12	3	104
13	3	105
14	4	14
15	5	33
16	5	32
17	5	36
18	5	35
19	5	34
20	6	98
21	6	31
22	6	84
\.


--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 368
-- Name: workflow_workflowlevel1sector_sub_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel1sector_sub_sector_id_seq', 22, true);


--
-- TOC entry 4708 (class 0 OID 17374)
-- Dependencies: 371
-- Data for Name: workflow_workflowlevel2; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel2 (id, level2_uuid, parent_workflowlevel2, name, description, short_name, staff_responsible_id, effect_or_impact, expected_start_date, expected_end_date, total_estimated_budget, justification_background, risks_assumptions, description_of_government_involvement, description_of_community_involvement, actual_start_date, actual_end_date, actual_duration, actual_cost, total_cost, capacity_built, quality_assured, issues_and_challenges, lessons_learned, create_date, edit_date, status, progress, donor_currency_id, local_currency_id, milestone_id, office_id, sector_id, workflowlevel1_id, created_by_id, address, notes, site_instructions, type) FROM stdin;
1	2015c72f-572c-462a-a8fa-a15c5a5f7fd1	0	Planning: How to map out a project	\N	\N	\N	\N	2018-01-01 11:00:00+00	2018-01-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.112809+00	2018-05-31 12:59:42.112825+00		open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
2	29d92a75-954b-4a79-9ea1-7d7d0a6a4378	1	Determine the real problem to solve	\N	\N	\N	\N	2018-01-15 11:00:00+00	2018-01-19 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.135115+00	2018-05-31 12:59:42.135128+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
3	5ef421f4-62d0-4bb2-91f7-535afd102e4c	1	Identify Stakeholders	\N	\N	\N	\N	2017-12-20 11:00:00+00	2018-01-26 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.141449+00	2018-05-31 12:59:42.141461+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
4	4be3de17-15a9-4412-a58c-a1d07e1c60e0	1	Define project objectives	\N	\N	\N	\N	2018-01-01 11:00:00+00	2018-01-05 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.1476+00	2018-05-31 12:59:42.147612+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
5	f6bdbd0d-b605-4d81-8894-eeb0909cb283	1	Determine scope, resources and major tasks	\N	\N	\N	\N	2018-01-08 11:00:00+00	2018-01-12 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.1538+00	2018-05-31 12:59:42.153812+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
6	6f5fb44b-40a0-4c44-a5f2-a98c406be4e0	1	Prepare for trade-offs	\N	\N	\N	\N	2018-01-29 11:00:00+00	2018-01-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.160132+00	2018-05-31 12:59:42.160144+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
7	0ffce4fb-753c-4972-be26-50cba1f5c808	0	Build-up: How to get the project started	\N	\N	\N	\N	2017-11-01 11:00:00+00	2017-12-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.176458+00	2018-05-31 12:59:42.176471+00		open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
8	6ae3beea-c131-47fd-a72f-d56491681069	7	Assemble your team	\N	\N	\N	\N	2017-11-01 11:00:00+00	2017-11-10 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.182848+00	2018-05-31 12:59:42.18286+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
9	63bdabe9-b407-4a8d-b5fd-c43e6a62ebc8	7	Plan assignments	\N	\N	\N	\N	2017-12-01 11:00:00+00	2017-12-08 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.190848+00	2018-05-31 12:59:42.19086+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
10	10b5f17e-7a35-4ea2-8fba-e05d3fcbaad3	7	Create the schedule	\N	\N	\N	\N	2017-11-13 11:00:00+00	2017-11-17 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.197047+00	2018-05-31 12:59:42.19706+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
11	4262c875-7a64-4881-9566-1b0ece6c3289	7	Hold a kickoff meeting	\N	\N	\N	\N	2017-11-27 11:00:00+00	2017-11-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.203255+00	2018-05-31 12:59:42.203267+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
12	c8339920-62d3-4806-b474-8cf5c1d8d3bc	7	Develop a budget	\N	\N	\N	\N	2017-11-20 11:00:00+00	2017-11-24 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.209469+00	2018-05-31 12:59:42.209481+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
13	63ee1bc6-5aca-4348-844f-83def04705c4	0	Implementation: How to execute the project	\N	\N	\N	\N	2018-02-01 11:00:00+00	2018-08-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.216347+00	2018-05-31 12:59:42.216359+00		open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
14	e4303ea8-6c3d-4afb-864a-bf679f24d283	13	Monitor and control procress and budget	\N	\N	\N	\N	2018-04-02 11:00:00+00	2018-08-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.222455+00	2018-05-31 12:59:42.222467+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
15	58fd3a76-44be-424b-9ead-4b61757d11dd	13	Report progress	\N	\N	\N	\N	2018-06-01 11:00:00+00	2018-08-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.228901+00	2018-05-31 12:59:42.228913+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
16	f974979a-0b49-46d7-8907-690e5cb35465	13	Hold weekly team meetings	<p>Weekly meetings held every Monday</p>	\N	\N	\N	2018-02-01 11:00:00+00	2018-04-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.235471+00	2018-05-31 12:59:42.235484+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
17	6d29e77f-5a54-45e4-9fab-6244ed444a4e	13	Manage problems	\N	\N	\N	\N	2018-02-01 11:00:00+00	2018-08-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.241663+00	2018-05-31 12:59:42.241675+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
18	2eb758ba-0fff-4046-a8c8-4f531748e9f5	0	Closeout: How to handle end matters	\N	\N	\N	\N	2018-09-01 11:00:00+00	2018-10-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.248979+00	2018-05-31 12:59:42.248994+00		open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
19	ec4da7be-62c6-4a49-8496-4b6599ddc6e8	18	Evaluate project performance	\N	\N	\N	\N	2018-10-15 11:00:00+00	2018-10-31 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.259097+00	2018-05-31 12:59:42.259114+00		open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
20	41be238d-119b-4f04-802e-3adfa9bf8382	18	Close the project	\N	\N	\N	\N	2018-09-03 11:00:00+00	2018-09-28 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.271434+00	2018-05-31 12:59:42.271452+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
21	6803dc65-e22e-414c-ad7a-744ca3e49701	18	Debrief with the team	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.280465+00	2018-05-31 12:59:42.280478+00	green	open	\N	\N	\N	\N	\N	3	35	\N	\N	\N	\N
22	97434701-750f-4076-807d-dff1a94d3e12	0	Ansprache von 20 Partnerschulen in Berlin	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.286806+00	2018-05-31 12:59:42.286817+00	green	closed	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
23	cad42cca-d142-40df-ab17-054cb8f55abd	0	20 Schulen in sozialen Brennpunkten identifizieren	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.29399+00	2018-05-31 12:59:42.294018+00	green	closed	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
24	2fc1c623-bb4f-4d2e-8004-a6023f5f3a3d	0	Ideen zur Gestaltung der Schule finden und umstetzen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.301972+00	2018-05-31 12:59:42.301984+00	yellow	tracking	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
25	10d78311-a64b-4f84-a87c-333896e34f95	0	Qualifizierung der Lehrer	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.308802+00	2018-05-31 12:59:42.308814+00	yellow	closed	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
26	548eeccc-02c8-4df4-af10-9f0569bc14f6	25	Lehrer auswählen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.314941+00	2018-05-31 12:59:42.314953+00	yellow	closed	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
27	9698a986-9da8-4b1a-a695-fee6d707e000	25	Trainings und Supervision durchführen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.321175+00	2018-05-31 12:59:42.321187+00	yellow	tracking	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
28	91c582df-6e5c-4bfc-8fe3-7b2c3d8cee6f	24	Ideenworkshops durchführen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.328961+00	2018-05-31 12:59:42.328973+00	yellow	tracking	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
29	18cf8abb-12b6-4057-90d6-335051a224b2	22	Direktoren ansprechen	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.335333+00	2018-05-31 12:59:42.335345+00	green	closed	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
30	1593bb51-b79e-415b-ad86-6674f39b1626	24	Budgets zur Umsetzung finden	\N	\N	\N	\N	2018-10-01 11:00:00+00	2018-09-30 11:00:00+00	15000.00	\N	\N	\N	\N	\N	\N	\N	2900.00	0.00	\N	\N	\N	\N	2018-05-31 12:59:42.341821+00	2018-05-31 12:59:42.341832+00	red	awaitingapproval	\N	\N	\N	\N	\N	6	35	\N	\N	\N	\N
\.


--
-- TOC entry 4710 (class 0 OID 17387)
-- Dependencies: 373
-- Data for Name: workflow_workflowlevel2_approval; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel2_approval (id, workflowlevel2_id, approvalworkflow_id) FROM stdin;
\.


--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 372
-- Name: workflow_workflowlevel2_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel2_approval_id_seq', 1, false);


--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 370
-- Name: workflow_workflowlevel2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel2_id_seq', 30, true);


--
-- TOC entry 4712 (class 0 OID 17395)
-- Dependencies: 375
-- Data for Name: workflow_workflowlevel2_indicators; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel2_indicators (id, workflowlevel2_id, indicator_id) FROM stdin;
\.


--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 374
-- Name: workflow_workflowlevel2_indicators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel2_indicators_id_seq', 1, false);


--
-- TOC entry 4714 (class 0 OID 17403)
-- Dependencies: 377
-- Data for Name: workflow_workflowlevel2_site; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel2_site (id, workflowlevel2_id, siteprofile_id) FROM stdin;
1	7	1
2	7	2
3	7	3
4	7	4
5	7	5
\.


--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 376
-- Name: workflow_workflowlevel2_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel2_site_id_seq', 5, true);


--
-- TOC entry 4716 (class 0 OID 17411)
-- Dependencies: 379
-- Data for Name: workflow_workflowlevel2_stakeholder; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel2_stakeholder (id, workflowlevel2_id, stakeholder_id) FROM stdin;
1	7	1
\.


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 378
-- Name: workflow_workflowlevel2_stakeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel2_stakeholder_id_seq', 1, true);


--
-- TOC entry 4718 (class 0 OID 17419)
-- Dependencies: 381
-- Data for Name: workflow_workflowlevel2_sub_sector; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel2_sub_sector (id, workflowlevel2_id, sector_id) FROM stdin;
\.


--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 380
-- Name: workflow_workflowlevel2_sub_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel2_sub_sector_id_seq', 1, false);


--
-- TOC entry 4720 (class 0 OID 17427)
-- Dependencies: 383
-- Data for Name: workflow_workflowlevel2sort; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowlevel2sort (id, workflowlevel2_id, sort_array, create_date, edit_date, workflowlevel1_id, workflowlevel2_parent_id_id) FROM stdin;
\.


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 382
-- Name: workflow_workflowlevel2sort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowlevel2sort_id_seq', 1, false);


--
-- TOC entry 4722 (class 0 OID 17451)
-- Dependencies: 385
-- Data for Name: workflow_workflowmodules; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowmodules (id, modules, create_date, edit_date, workflowlevel2_id) FROM stdin;
\.


--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 384
-- Name: workflow_workflowmodules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowmodules_id_seq', 1, false);


--
-- TOC entry 4724 (class 0 OID 17459)
-- Dependencies: 387
-- Data for Name: workflow_workflowteam; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workflow_workflowteam (id, salary, start_date, end_date, status, budget_limit, create_date, edit_date, country_id, partner_org_id, role_id, workflow_user_id, workflowlevel1_id) FROM stdin;
1	60,000	\N	\N	\N	\N	2018-05-31 12:59:42.835761+00	2018-05-31 12:59:42.835773+00	\N	\N	3	1	1
2	60,000	\N	\N	\N	\N	2018-05-31 12:59:42.849357+00	2018-05-31 12:59:42.84937+00	\N	\N	3	2	2
3	60,000	\N	\N	\N	\N	2018-05-31 12:59:42.853291+00	2018-05-31 12:59:42.853303+00	\N	\N	3	1	2
4	60,000	\N	\N	\N	\N	2018-05-31 12:59:42.857053+00	2018-05-31 12:59:42.857066+00	\N	\N	3	2	1
5	60,000	\N	\N	\N	\N	2018-05-31 12:59:42.861011+00	2018-05-31 12:59:42.861023+00	\N	\N	3	1	3
6	60,000	\N	\N	\N	\N	2018-05-31 12:59:42.864679+00	2018-05-31 12:59:42.864692+00	\N	\N	3	2	3
\.


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 386
-- Name: workflow_workflowteam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.workflow_workflowteam_id_seq', 6, true);


--
-- TOC entry 3902 (class 2606 OID 19190)
-- Name: appointment_appointment_workflowlevel2 appointment_appointment__appointment_id_workflowl_4d6e5ca9_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointment_appointment_workflowlevel2
    ADD CONSTRAINT appointment_appointment__appointment_id_workflowl_4d6e5ca9_uniq UNIQUE (appointment_id, workflowlevel2_id);


--
-- TOC entry 3900 (class 2606 OID 19142)
-- Name: appointment_appointment appointment_appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointment_appointment
    ADD CONSTRAINT appointment_appointment_pkey PRIMARY KEY (id);


--
-- TOC entry 3906 (class 2606 OID 19158)
-- Name: appointment_appointment_workflowlevel2 appointment_appointment_workflowlevel2_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointment_appointment_workflowlevel2
    ADD CONSTRAINT appointment_appointment_workflowlevel2_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 16424)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3279 (class 2606 OID 16479)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3282 (class 2606 OID 16432)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 16422)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 16465)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3271 (class 2606 OID 16414)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 16450)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 16494)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3284 (class 2606 OID 16440)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 16458)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 16508)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3287 (class 2606 OID 16742)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3909 (class 2606 OID 19197)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 3911 (class 2606 OID 19199)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 3913 (class 2606 OID 19346)
-- Name: contact_contact contact_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contact_contact
    ADD CONSTRAINT contact_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 3916 (class 2606 OID 19385)
-- Name: contact_contact contact_contact_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contact_contact
    ADD CONSTRAINT contact_contact_uuid_key UNIQUE (uuid);


--
-- TOC entry 3302 (class 2606 OID 16522)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 16406)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3266 (class 2606 OID 16404)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 16396)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4088 (class 2606 OID 20892)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3306 (class 2606 OID 16545)
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- TOC entry 3308 (class 2606 OID 16543)
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- TOC entry 3962 (class 2606 OID 19624)
-- Name: formlibrary_beneficiary_distribution formlibrary_beneficiary__beneficiary_id_distribut_9999ac9d_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_distribution
    ADD CONSTRAINT formlibrary_beneficiary__beneficiary_id_distribut_9999ac9d_uniq UNIQUE (beneficiary_id, distribution_id);


--
-- TOC entry 3968 (class 2606 OID 19644)
-- Name: formlibrary_beneficiary_training formlibrary_beneficiary__beneficiary_id_traininga_d45e281e_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_training
    ADD CONSTRAINT formlibrary_beneficiary__beneficiary_id_traininga_d45e281e_uniq UNIQUE (beneficiary_id, trainingattendance_id);


--
-- TOC entry 3974 (class 2606 OID 19658)
-- Name: formlibrary_beneficiary_workflowlevel1 formlibrary_beneficiary__beneficiary_id_workflowl_3b8ffdb5_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_workflowlevel1
    ADD CONSTRAINT formlibrary_beneficiary__beneficiary_id_workflowl_3b8ffdb5_uniq UNIQUE (beneficiary_id, workflowlevel1_id);


--
-- TOC entry 3966 (class 2606 OID 19528)
-- Name: formlibrary_beneficiary_distribution formlibrary_beneficiary_distribution_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_distribution
    ADD CONSTRAINT formlibrary_beneficiary_distribution_pkey PRIMARY KEY (id);


--
-- TOC entry 3920 (class 2606 OID 19413)
-- Name: formlibrary_beneficiary formlibrary_beneficiary_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary
    ADD CONSTRAINT formlibrary_beneficiary_pkey PRIMARY KEY (id);


--
-- TOC entry 3971 (class 2606 OID 19536)
-- Name: formlibrary_beneficiary_training formlibrary_beneficiary_training_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_training
    ADD CONSTRAINT formlibrary_beneficiary_training_pkey PRIMARY KEY (id);


--
-- TOC entry 3978 (class 2606 OID 19544)
-- Name: formlibrary_beneficiary_workflowlevel1 formlibrary_beneficiary_workflowlevel1_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_workflowlevel1
    ADD CONSTRAINT formlibrary_beneficiary_workflowlevel1_pkey PRIMARY KEY (id);


--
-- TOC entry 3923 (class 2606 OID 19424)
-- Name: formlibrary_binaryfield formlibrary_binaryfield_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_binaryfield
    ADD CONSTRAINT formlibrary_binaryfield_pkey PRIMARY KEY (id);


--
-- TOC entry 3927 (class 2606 OID 19695)
-- Name: formlibrary_customform formlibrary_customform_form_uuid_9b0c3c03_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_customform
    ADD CONSTRAINT formlibrary_customform_form_uuid_9b0c3c03_uniq UNIQUE (form_uuid);


--
-- TOC entry 3930 (class 2606 OID 19435)
-- Name: formlibrary_customform formlibrary_customform_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_customform
    ADD CONSTRAINT formlibrary_customform_pkey PRIMARY KEY (id);


--
-- TOC entry 3933 (class 2606 OID 19446)
-- Name: formlibrary_customformfield formlibrary_customformfield_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_customformfield
    ADD CONSTRAINT formlibrary_customformfield_pkey PRIMARY KEY (id);


--
-- TOC entry 3958 (class 2606 OID 19512)
-- Name: formlibrary_distribution_disaggregation_value formlibrary_distribution_disaggregation_value_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution_disaggregation_value
    ADD CONSTRAINT formlibrary_distribution_disaggregation_value_pkey PRIMARY KEY (id);


--
-- TOC entry 3960 (class 2606 OID 19568)
-- Name: formlibrary_distribution_disaggregation_value formlibrary_distribution_distribution_id_disaggre_d148837d_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution_disaggregation_value
    ADD CONSTRAINT formlibrary_distribution_distribution_id_disaggre_d148837d_uniq UNIQUE (distribution_id, disaggregationvalue_id);


--
-- TOC entry 3938 (class 2606 OID 19457)
-- Name: formlibrary_distribution formlibrary_distribution_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution
    ADD CONSTRAINT formlibrary_distribution_pkey PRIMARY KEY (id);


--
-- TOC entry 3943 (class 2606 OID 19465)
-- Name: formlibrary_fieldtype formlibrary_fieldtype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_fieldtype
    ADD CONSTRAINT formlibrary_fieldtype_pkey PRIMARY KEY (id);


--
-- TOC entry 3950 (class 2606 OID 19496)
-- Name: formlibrary_trainingattendance_disaggregation_value formlibrary_trainingatte_trainingattendance_id_di_db12b79c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance_disaggregation_value
    ADD CONSTRAINT formlibrary_trainingatte_trainingattendance_id_di_db12b79c_uniq UNIQUE (trainingattendance_id, disaggregationvalue_id);


--
-- TOC entry 3954 (class 2606 OID 19484)
-- Name: formlibrary_trainingattendance_disaggregation_value formlibrary_trainingattendance_disaggregation_value_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance_disaggregation_value
    ADD CONSTRAINT formlibrary_trainingattendance_disaggregation_value_pkey PRIMARY KEY (id);


--
-- TOC entry 3945 (class 2606 OID 19476)
-- Name: formlibrary_trainingattendance formlibrary_trainingattendance_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance
    ADD CONSTRAINT formlibrary_trainingattendance_pkey PRIMARY KEY (id);


--
-- TOC entry 3980 (class 2606 OID 19729)
-- Name: guardian_groupobjectpermission guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- TOC entry 3985 (class 2606 OID 19717)
-- Name: guardian_groupobjectpermission guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- TOC entry 3987 (class 2606 OID 19727)
-- Name: guardian_userobjectpermission guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- TOC entry 3991 (class 2606 OID 19725)
-- Name: guardian_userobjectpermission guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- TOC entry 3918 (class 2606 OID 19402)
-- Name: health_check_db_testmodel health_check_db_testmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.health_check_db_testmodel
    ADD CONSTRAINT health_check_db_testmodel_pkey PRIMARY KEY (id);


--
-- TOC entry 4042 (class 2606 OID 20197)
-- Name: indicators_collecteddata_disaggregation_value indicators_collecteddata_collecteddata_id_disaggr_0b4cfd2b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_disaggregation_value
    ADD CONSTRAINT indicators_collecteddata_collecteddata_id_disaggr_0b4cfd2b_uniq UNIQUE (collecteddata_id, disaggregationvalue_id);


--
-- TOC entry 4048 (class 2606 OID 20229)
-- Name: indicators_collecteddata_site indicators_collecteddata_collecteddata_id_sitepro_af21c885_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_site
    ADD CONSTRAINT indicators_collecteddata_collecteddata_id_sitepro_af21c885_uniq UNIQUE (collecteddata_id, siteprofile_id);


--
-- TOC entry 3313 (class 2606 OID 16559)
-- Name: indicators_collecteddata indicators_collecteddata_data_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collecteddata_data_uuid_key UNIQUE (data_uuid);


--
-- TOC entry 4046 (class 2606 OID 19883)
-- Name: indicators_collecteddata_disaggregation_value indicators_collecteddata_disaggregation_value_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_disaggregation_value
    ADD CONSTRAINT indicators_collecteddata_disaggregation_value_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 16557)
-- Name: indicators_collecteddata indicators_collecteddata_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collecteddata_pkey PRIMARY KEY (id);


--
-- TOC entry 4051 (class 2606 OID 19891)
-- Name: indicators_collecteddata_site indicators_collecteddata_site_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_site
    ADD CONSTRAINT indicators_collecteddata_site_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 16570)
-- Name: indicators_disaggregationlabel indicators_disaggregationlabel_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_disaggregationlabel
    ADD CONSTRAINT indicators_disaggregationlabel_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 16581)
-- Name: indicators_disaggregationtype indicators_disaggregationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_disaggregationtype
    ADD CONSTRAINT indicators_disaggregationtype_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 16592)
-- Name: indicators_disaggregationvalue indicators_disaggregationvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_disaggregationvalue
    ADD CONSTRAINT indicators_disaggregationvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 16603)
-- Name: indicators_externalservice indicators_externalservice_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_externalservice
    ADD CONSTRAINT indicators_externalservice_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 16614)
-- Name: indicators_externalservicerecord indicators_externalservicerecord_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_externalservicerecord
    ADD CONSTRAINT indicators_externalservicerecord_pkey PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 16626)
-- Name: indicators_frequency indicators_frequency_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_frequency
    ADD CONSTRAINT indicators_frequency_pkey PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2606 OID 16637)
-- Name: indicators_historicalcollecteddata indicators_historicalcollecteddata_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_historicalcollecteddata
    ADD CONSTRAINT indicators_historicalcollecteddata_pkey PRIMARY KEY (history_id);


--
-- TOC entry 3365 (class 2606 OID 16648)
-- Name: indicators_historicalindicator indicators_historicalindicator_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_historicalindicator
    ADD CONSTRAINT indicators_historicalindicator_pkey PRIMARY KEY (history_id);


--
-- TOC entry 4006 (class 2606 OID 20021)
-- Name: indicators_indicator_disaggregation indicators_indicator_dis_indicator_id_disaggregat_eda80f8c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_disaggregation
    ADD CONSTRAINT indicators_indicator_dis_indicator_id_disaggregat_eda80f8c_uniq UNIQUE (indicator_id, disaggregationtype_id);


--
-- TOC entry 4010 (class 2606 OID 19810)
-- Name: indicators_indicator_disaggregation indicators_indicator_disaggregation_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_disaggregation
    ADD CONSTRAINT indicators_indicator_disaggregation_pkey PRIMARY KEY (id);


--
-- TOC entry 4012 (class 2606 OID 20041)
-- Name: indicators_indicator_indicator_type indicators_indicator_ind_indicator_id_indicatorty_c553ed1d_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_indicator_type
    ADD CONSTRAINT indicators_indicator_ind_indicator_id_indicatorty_c553ed1d_uniq UNIQUE (indicator_id, indicatortype_id);


--
-- TOC entry 4016 (class 2606 OID 19818)
-- Name: indicators_indicator_indicator_type indicators_indicator_indicator_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_indicator_type
    ADD CONSTRAINT indicators_indicator_indicator_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3375 (class 2606 OID 16661)
-- Name: indicators_indicator indicators_indicator_indicator_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_indicator_uuid_key UNIQUE (indicator_uuid);


--
-- TOC entry 4018 (class 2606 OID 20061)
-- Name: indicators_indicator_objectives indicators_indicator_obj_indicator_id_objective_i_38cda9e6_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_objectives
    ADD CONSTRAINT indicators_indicator_obj_indicator_id_objective_i_38cda9e6_uniq UNIQUE (indicator_id, objective_id);


--
-- TOC entry 4022 (class 2606 OID 19826)
-- Name: indicators_indicator_objectives indicators_indicator_objectives_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_objectives
    ADD CONSTRAINT indicators_indicator_objectives_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 16659)
-- Name: indicators_indicator indicators_indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_pkey PRIMARY KEY (id);


--
-- TOC entry 4024 (class 2606 OID 20087)
-- Name: indicators_indicator_strategic_objectives indicators_indicator_str_indicator_id_strategicob_d631b863_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_strategic_objectives
    ADD CONSTRAINT indicators_indicator_str_indicator_id_strategicob_d631b863_uniq UNIQUE (indicator_id, strategicobjective_id);


--
-- TOC entry 4028 (class 2606 OID 19834)
-- Name: indicators_indicator_strategic_objectives indicators_indicator_strategic_objectives_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_strategic_objectives
    ADD CONSTRAINT indicators_indicator_strategic_objectives_pkey PRIMARY KEY (id);


--
-- TOC entry 4030 (class 2606 OID 20101)
-- Name: indicators_indicator_sub_sector indicators_indicator_sub_indicator_id_sector_id_5c1cf7b4_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_sub_sector
    ADD CONSTRAINT indicators_indicator_sub_indicator_id_sector_id_5c1cf7b4_uniq UNIQUE (indicator_id, sector_id);


--
-- TOC entry 4033 (class 2606 OID 19842)
-- Name: indicators_indicator_sub_sector indicators_indicator_sub_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_sub_sector
    ADD CONSTRAINT indicators_indicator_sub_sector_pkey PRIMARY KEY (id);


--
-- TOC entry 4036 (class 2606 OID 20115)
-- Name: indicators_indicator_workflowlevel1 indicators_indicator_wor_indicator_id_workflowlev_d8660284_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_workflowlevel1
    ADD CONSTRAINT indicators_indicator_wor_indicator_id_workflowlev_d8660284_uniq UNIQUE (indicator_id, workflowlevel1_id);


--
-- TOC entry 4039 (class 2606 OID 19850)
-- Name: indicators_indicator_workflowlevel1 indicators_indicator_workflowlevel1_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_workflowlevel1
    ADD CONSTRAINT indicators_indicator_workflowlevel1_pkey PRIMARY KEY (id);


--
-- TOC entry 3383 (class 2606 OID 16672)
-- Name: indicators_indicatortype indicators_indicatortype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicatortype
    ADD CONSTRAINT indicators_indicatortype_pkey PRIMARY KEY (id);


--
-- TOC entry 3388 (class 2606 OID 16683)
-- Name: indicators_level indicators_level_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_level
    ADD CONSTRAINT indicators_level_pkey PRIMARY KEY (id);


--
-- TOC entry 3392 (class 2606 OID 16694)
-- Name: indicators_objective indicators_objective_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_objective
    ADD CONSTRAINT indicators_objective_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 16702)
-- Name: indicators_periodictarget indicators_periodictarget_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_periodictarget
    ADD CONSTRAINT indicators_periodictarget_pkey PRIMARY KEY (id);


--
-- TOC entry 3400 (class 2606 OID 16710)
-- Name: indicators_reportingperiod indicators_reportingperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_reportingperiod
    ADD CONSTRAINT indicators_reportingperiod_pkey PRIMARY KEY (id);


--
-- TOC entry 3404 (class 2606 OID 16721)
-- Name: indicators_strategicobjective indicators_strategicobjective_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_strategicobjective
    ADD CONSTRAINT indicators_strategicobjective_pkey PRIMARY KEY (id);


--
-- TOC entry 3994 (class 2606 OID 19903)
-- Name: indicators_tolatable_country indicators_tolatable_cou_tolatable_id_country_id_f41926af_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_country
    ADD CONSTRAINT indicators_tolatable_cou_tolatable_id_country_id_f41926af_uniq UNIQUE (tolatable_id, country_id);


--
-- TOC entry 3997 (class 2606 OID 19773)
-- Name: indicators_tolatable_country indicators_tolatable_country_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_country
    ADD CONSTRAINT indicators_tolatable_country_pkey PRIMARY KEY (id);


--
-- TOC entry 3408 (class 2606 OID 16732)
-- Name: indicators_tolatable indicators_tolatable_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable
    ADD CONSTRAINT indicators_tolatable_pkey PRIMARY KEY (id);


--
-- TOC entry 4000 (class 2606 OID 19929)
-- Name: indicators_tolatable_workflowlevel1 indicators_tolatable_wor_tolatable_id_workflowlev_33f4c94e_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_workflowlevel1
    ADD CONSTRAINT indicators_tolatable_wor_tolatable_id_workflowlev_33f4c94e_uniq UNIQUE (tolatable_id, workflowlevel1_id);


--
-- TOC entry 4002 (class 2606 OID 19789)
-- Name: indicators_tolatable_workflowlevel1 indicators_tolatable_workflowlevel1_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_workflowlevel1
    ADD CONSTRAINT indicators_tolatable_workflowlevel1_pkey PRIMARY KEY (id);


--
-- TOC entry 4063 (class 2606 OID 20638)
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- TOC entry 4066 (class 2606 OID 20623)
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- TOC entry 4055 (class 2606 OID 20505)
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- TOC entry 4059 (class 2606 OID 20676)
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- TOC entry 4071 (class 2606 OID 20626)
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- TOC entry 4073 (class 2606 OID 20743)
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- TOC entry 4076 (class 2606 OID 20654)
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- TOC entry 4079 (class 2606 OID 20765)
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- TOC entry 4082 (class 2606 OID 20629)
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_d090daa4_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq UNIQUE (token);


--
-- TOC entry 4085 (class 2606 OID 20884)
-- Name: search_searchindexlog search_searchindexlog_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.search_searchindexlog
    ADD CONSTRAINT search_searchindexlog_pkey PRIMARY KEY (id);


--
-- TOC entry 4091 (class 2606 OID 20905)
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- TOC entry 4093 (class 2606 OID 20956)
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- TOC entry 4097 (class 2606 OID 20953)
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- TOC entry 4099 (class 2606 OID 20913)
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- TOC entry 4102 (class 2606 OID 20921)
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- TOC entry 4104 (class 2606 OID 20938)
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- TOC entry 4111 (class 2606 OID 20968)
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- TOC entry 4106 (class 2606 OID 20932)
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- TOC entry 4108 (class 2606 OID 20934)
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- TOC entry 3412 (class 2606 OID 16754)
-- Name: workflow_adminlevelfour workflow_adminlevelfour_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelfour
    ADD CONSTRAINT workflow_adminlevelfour_pkey PRIMARY KEY (id);


--
-- TOC entry 3415 (class 2606 OID 16762)
-- Name: workflow_adminlevelone workflow_adminlevelone_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelone
    ADD CONSTRAINT workflow_adminlevelone_pkey PRIMARY KEY (id);


--
-- TOC entry 3418 (class 2606 OID 16770)
-- Name: workflow_adminlevelthree workflow_adminlevelthree_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelthree
    ADD CONSTRAINT workflow_adminlevelthree_pkey PRIMARY KEY (id);


--
-- TOC entry 3421 (class 2606 OID 16778)
-- Name: workflow_adminleveltwo workflow_adminleveltwo_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminleveltwo
    ADD CONSTRAINT workflow_adminleveltwo_pkey PRIMARY KEY (id);


--
-- TOC entry 3424 (class 2606 OID 16786)
-- Name: workflow_approvaltype workflow_approvaltype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_approvaltype
    ADD CONSTRAINT workflow_approvaltype_pkey PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 16797)
-- Name: workflow_approvalworkflow workflow_approvalworkflow_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_approvalworkflow
    ADD CONSTRAINT workflow_approvalworkflow_pkey PRIMARY KEY (id);


--
-- TOC entry 3865 (class 2606 OID 18592)
-- Name: workflow_award_countries workflow_award_countries_award_id_country_id_f9117d4a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_countries
    ADD CONSTRAINT workflow_award_countries_award_id_country_id_f9117d4a_uniq UNIQUE (award_id, country_id);


--
-- TOC entry 3868 (class 2606 OID 17565)
-- Name: workflow_award_countries workflow_award_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_countries
    ADD CONSTRAINT workflow_award_countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3871 (class 2606 OID 18612)
-- Name: workflow_award_donors workflow_award_donors_award_id_stakeholder_id_8ecbdee1_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_donors
    ADD CONSTRAINT workflow_award_donors_award_id_stakeholder_id_8ecbdee1_uniq UNIQUE (award_id, stakeholder_id);


--
-- TOC entry 3873 (class 2606 OID 17573)
-- Name: workflow_award_donors workflow_award_donors_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_donors
    ADD CONSTRAINT workflow_award_donors_pkey PRIMARY KEY (id);


--
-- TOC entry 3435 (class 2606 OID 16805)
-- Name: workflow_award workflow_award_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award
    ADD CONSTRAINT workflow_award_pkey PRIMARY KEY (id);


--
-- TOC entry 3440 (class 2606 OID 16816)
-- Name: workflow_budget workflow_budget_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_budget
    ADD CONSTRAINT workflow_budget_pkey PRIMARY KEY (id);


--
-- TOC entry 3445 (class 2606 OID 16824)
-- Name: workflow_checklist workflow_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_checklist
    ADD CONSTRAINT workflow_checklist_pkey PRIMARY KEY (id);


--
-- TOC entry 3450 (class 2606 OID 16832)
-- Name: workflow_checklistitem workflow_checklistitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_checklistitem
    ADD CONSTRAINT workflow_checklistitem_pkey PRIMARY KEY (id);


--
-- TOC entry 3453 (class 2606 OID 16843)
-- Name: workflow_codedfield workflow_codedfield_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield
    ADD CONSTRAINT workflow_codedfield_pkey PRIMARY KEY (id);


--
-- TOC entry 3858 (class 2606 OID 18530)
-- Name: workflow_codedfield_workflowlevel2 workflow_codedfield_work_codedfield_id_workflowle_03c7ca04_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel2
    ADD CONSTRAINT workflow_codedfield_work_codedfield_id_workflowle_03c7ca04_uniq UNIQUE (codedfield_id, workflowlevel2_id);


--
-- TOC entry 3852 (class 2606 OID 18516)
-- Name: workflow_codedfield_workflowlevel1 workflow_codedfield_work_codedfield_id_workflowle_e7de0496_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel1
    ADD CONSTRAINT workflow_codedfield_work_codedfield_id_workflowle_e7de0496_uniq UNIQUE (codedfield_id, workflowlevel1_id);


--
-- TOC entry 3855 (class 2606 OID 17549)
-- Name: workflow_codedfield_workflowlevel1 workflow_codedfield_workflowlevel1_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel1
    ADD CONSTRAINT workflow_codedfield_workflowlevel1_pkey PRIMARY KEY (id);


--
-- TOC entry 3861 (class 2606 OID 17557)
-- Name: workflow_codedfield_workflowlevel2 workflow_codedfield_workflowlevel2_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel2
    ADD CONSTRAINT workflow_codedfield_workflowlevel2_pkey PRIMARY KEY (id);


--
-- TOC entry 3456 (class 2606 OID 16851)
-- Name: workflow_codedfieldvalues workflow_codedfieldvalues_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfieldvalues
    ADD CONSTRAINT workflow_codedfieldvalues_pkey PRIMARY KEY (id);


--
-- TOC entry 3461 (class 2606 OID 16862)
-- Name: workflow_contact workflow_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_contact
    ADD CONSTRAINT workflow_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 3464 (class 2606 OID 16873)
-- Name: workflow_country workflow_country_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_country
    ADD CONSTRAINT workflow_country_pkey PRIMARY KEY (id);


--
-- TOC entry 3466 (class 2606 OID 16884)
-- Name: workflow_currency workflow_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_currency
    ADD CONSTRAINT workflow_currency_pkey PRIMARY KEY (id);


--
-- TOC entry 3882 (class 2606 OID 18828)
-- Name: workflow_dashboard workflow_dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard
    ADD CONSTRAINT workflow_dashboard_pkey PRIMARY KEY (id);


--
-- TOC entry 3886 (class 2606 OID 18873)
-- Name: workflow_dashboard_share workflow_dashboard_share_dashboard_id_tolauser_id_204bf72e_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_share
    ADD CONSTRAINT workflow_dashboard_share_dashboard_id_tolauser_id_204bf72e_uniq UNIQUE (dashboard_id, tolauser_id);


--
-- TOC entry 3888 (class 2606 OID 18836)
-- Name: workflow_dashboard_share workflow_dashboard_share_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_share
    ADD CONSTRAINT workflow_dashboard_share_pkey PRIMARY KEY (id);


--
-- TOC entry 3894 (class 2606 OID 18887)
-- Name: workflow_dashboard_widgets workflow_dashboard_widgets_dashboard_id_widget_id_5e1a5722_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_widgets
    ADD CONSTRAINT workflow_dashboard_widgets_dashboard_id_widget_id_5e1a5722_uniq UNIQUE (dashboard_id, widget_id);


--
-- TOC entry 3896 (class 2606 OID 18855)
-- Name: workflow_dashboard_widgets workflow_dashboard_widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_widgets
    ADD CONSTRAINT workflow_dashboard_widgets_pkey PRIMARY KEY (id);


--
-- TOC entry 3470 (class 2606 OID 16897)
-- Name: workflow_documentation workflow_documentation_document_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_documentation
    ADD CONSTRAINT workflow_documentation_document_uuid_key UNIQUE (document_uuid);


--
-- TOC entry 3472 (class 2606 OID 16895)
-- Name: workflow_documentation workflow_documentation_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_documentation
    ADD CONSTRAINT workflow_documentation_pkey PRIMARY KEY (id);


--
-- TOC entry 3477 (class 2606 OID 16908)
-- Name: workflow_formguidance workflow_formguidance_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_formguidance
    ADD CONSTRAINT workflow_formguidance_pkey PRIMARY KEY (id);


--
-- TOC entry 3480 (class 2606 OID 16916)
-- Name: workflow_fundcode workflow_fundcode_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_fundcode
    ADD CONSTRAINT workflow_fundcode_pkey PRIMARY KEY (id);


--
-- TOC entry 3487 (class 2606 OID 16927)
-- Name: workflow_historicalbudget workflow_historicalbudget_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalbudget
    ADD CONSTRAINT workflow_historicalbudget_pkey PRIMARY KEY (history_id);


--
-- TOC entry 3494 (class 2606 OID 16938)
-- Name: workflow_historicalissueregister workflow_historicalissueregister_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalissueregister
    ADD CONSTRAINT workflow_historicalissueregister_pkey PRIMARY KEY (history_id);


--
-- TOC entry 3499 (class 2606 OID 16949)
-- Name: workflow_historicalriskregister workflow_historicalriskregister_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalriskregister
    ADD CONSTRAINT workflow_historicalriskregister_pkey PRIMARY KEY (history_id);


--
-- TOC entry 3511 (class 2606 OID 16960)
-- Name: workflow_historicalsiteprofile workflow_historicalsiteprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalsiteprofile
    ADD CONSTRAINT workflow_historicalsiteprofile_pkey PRIMARY KEY (history_id);


--
-- TOC entry 3527 (class 2606 OID 16971)
-- Name: workflow_historicalworkflowlevel2 workflow_historicalworkflowlevel2_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalworkflowlevel2
    ADD CONSTRAINT workflow_historicalworkflowlevel2_pkey PRIMARY KEY (history_id);


--
-- TOC entry 3532 (class 2606 OID 16982)
-- Name: workflow_industry workflow_industry_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_industry
    ADD CONSTRAINT workflow_industry_pkey PRIMARY KEY (id);


--
-- TOC entry 3534 (class 2606 OID 16993)
-- Name: workflow_internationalization workflow_internationalization_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_internationalization
    ADD CONSTRAINT workflow_internationalization_pkey PRIMARY KEY (id);


--
-- TOC entry 3538 (class 2606 OID 17004)
-- Name: workflow_issueregister workflow_issueregister_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_issueregister
    ADD CONSTRAINT workflow_issueregister_pkey PRIMARY KEY (id);


--
-- TOC entry 3542 (class 2606 OID 17012)
-- Name: workflow_landtype workflow_landtype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_landtype
    ADD CONSTRAINT workflow_landtype_pkey PRIMARY KEY (id);


--
-- TOC entry 3546 (class 2606 OID 17023)
-- Name: workflow_milestone workflow_milestone_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_milestone
    ADD CONSTRAINT workflow_milestone_pkey PRIMARY KEY (id);


--
-- TOC entry 3549 (class 2606 OID 17034)
-- Name: workflow_office workflow_office_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_office
    ADD CONSTRAINT workflow_office_pkey PRIMARY KEY (id);


--
-- TOC entry 3557 (class 2606 OID 17659)
-- Name: workflow_organization_industry workflow_organization_in_organization_id_industry_d8554c00_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_industry
    ADD CONSTRAINT workflow_organization_in_organization_id_industry_d8554c00_uniq UNIQUE (organization_id, industry_id);


--
-- TOC entry 3561 (class 2606 OID 17055)
-- Name: workflow_organization_industry workflow_organization_industry_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_industry
    ADD CONSTRAINT workflow_organization_industry_pkey PRIMARY KEY (id);


--
-- TOC entry 3553 (class 2606 OID 17047)
-- Name: workflow_organization workflow_organization_organization_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization
    ADD CONSTRAINT workflow_organization_organization_uuid_key UNIQUE (organization_uuid);


--
-- TOC entry 3555 (class 2606 OID 17045)
-- Name: workflow_organization workflow_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization
    ADD CONSTRAINT workflow_organization_pkey PRIMARY KEY (id);


--
-- TOC entry 3846 (class 2606 OID 18389)
-- Name: workflow_organization_sector workflow_organization_se_organization_id_sector_i_80c4a1ae_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_sector
    ADD CONSTRAINT workflow_organization_se_organization_id_sector_i_80c4a1ae_uniq UNIQUE (organization_id, sector_id);


--
-- TOC entry 3849 (class 2606 OID 17515)
-- Name: workflow_organization_sector workflow_organization_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_sector
    ADD CONSTRAINT workflow_organization_sector_pkey PRIMARY KEY (id);


--
-- TOC entry 3571 (class 2606 OID 17686)
-- Name: workflow_partner_approval workflow_partner_approva_partner_id_approvalworkf_532f6324_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_approval
    ADD CONSTRAINT workflow_partner_approva_partner_id_approvalworkf_532f6324_uniq UNIQUE (partner_id, approvalworkflow_id);


--
-- TOC entry 3575 (class 2606 OID 17076)
-- Name: workflow_partner_approval workflow_partner_approval_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_approval
    ADD CONSTRAINT workflow_partner_approval_pkey PRIMARY KEY (id);


--
-- TOC entry 3579 (class 2606 OID 17700)
-- Name: workflow_partner_contact workflow_partner_contact_partner_id_contact_id_9474d267_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_contact
    ADD CONSTRAINT workflow_partner_contact_partner_id_contact_id_9474d267_uniq UNIQUE (partner_id, contact_id);


--
-- TOC entry 3581 (class 2606 OID 17084)
-- Name: workflow_partner_contact workflow_partner_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_contact
    ADD CONSTRAINT workflow_partner_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 3566 (class 2606 OID 17068)
-- Name: workflow_partner workflow_partner_partners_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner
    ADD CONSTRAINT workflow_partner_partners_uuid_key UNIQUE (partners_uuid);


--
-- TOC entry 3568 (class 2606 OID 17066)
-- Name: workflow_partner workflow_partner_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner
    ADD CONSTRAINT workflow_partner_pkey PRIMARY KEY (id);


--
-- TOC entry 3835 (class 2606 OID 18355)
-- Name: workflow_partner_sectors workflow_partner_sectors_partner_id_sector_id_13c58cc6_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_sectors
    ADD CONSTRAINT workflow_partner_sectors_partner_id_sector_id_13c58cc6_uniq UNIQUE (partner_id, sector_id);


--
-- TOC entry 3837 (class 2606 OID 17499)
-- Name: workflow_partner_sectors workflow_partner_sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_sectors
    ADD CONSTRAINT workflow_partner_sectors_pkey PRIMARY KEY (id);


--
-- TOC entry 3840 (class 2606 OID 18375)
-- Name: workflow_partner_workflowlevel1 workflow_partner_workflo_partner_id_workflowlevel_85d40bc7_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_workflowlevel1
    ADD CONSTRAINT workflow_partner_workflo_partner_id_workflowlevel_85d40bc7_uniq UNIQUE (partner_id, workflowlevel1_id);


--
-- TOC entry 3843 (class 2606 OID 17507)
-- Name: workflow_partner_workflowlevel1 workflow_partner_workflowlevel1_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_workflowlevel1
    ADD CONSTRAINT workflow_partner_workflowlevel1_pkey PRIMARY KEY (id);


--
-- TOC entry 3586 (class 2606 OID 17720)
-- Name: workflow_portfolio_country workflow_portfolio_count_portfolio_id_country_id_0e9bdcb2_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_portfolio_country
    ADD CONSTRAINT workflow_portfolio_count_portfolio_id_country_id_0e9bdcb2_uniq UNIQUE (portfolio_id, country_id);


--
-- TOC entry 3589 (class 2606 OID 17103)
-- Name: workflow_portfolio_country workflow_portfolio_country_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_portfolio_country
    ADD CONSTRAINT workflow_portfolio_country_pkey PRIMARY KEY (id);


--
-- TOC entry 3584 (class 2606 OID 17095)
-- Name: workflow_portfolio workflow_portfolio_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_portfolio
    ADD CONSTRAINT workflow_portfolio_pkey PRIMARY KEY (id);


--
-- TOC entry 4116 (class 2606 OID 21053)
-- Name: workflow_product workflow_product_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_product
    ADD CONSTRAINT workflow_product_pkey PRIMARY KEY (id);


--
-- TOC entry 3593 (class 2606 OID 17111)
-- Name: workflow_profiletype workflow_profiletype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_profiletype
    ADD CONSTRAINT workflow_profiletype_pkey PRIMARY KEY (id);


--
-- TOC entry 3596 (class 2606 OID 17122)
-- Name: workflow_projecttype workflow_projecttype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_projecttype
    ADD CONSTRAINT workflow_projecttype_pkey PRIMARY KEY (id);


--
-- TOC entry 3598 (class 2606 OID 17133)
-- Name: workflow_riskregister workflow_riskregister_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_riskregister
    ADD CONSTRAINT workflow_riskregister_pkey PRIMARY KEY (id);


--
-- TOC entry 3603 (class 2606 OID 17141)
-- Name: workflow_sector workflow_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_sector
    ADD CONSTRAINT workflow_sector_pkey PRIMARY KEY (id);


--
-- TOC entry 3606 (class 2606 OID 17151)
-- Name: workflow_sectorrelated workflow_sectorrelated_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_sectorrelated
    ADD CONSTRAINT workflow_sectorrelated_pkey PRIMARY KEY (id);


--
-- TOC entry 3625 (class 2606 OID 17819)
-- Name: workflow_siteprofile_approval workflow_siteprofile_app_siteprofile_id_approvalw_c649e870_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_approval
    ADD CONSTRAINT workflow_siteprofile_app_siteprofile_id_approvalw_c649e870_uniq UNIQUE (siteprofile_id, approvalworkflow_id);


--
-- TOC entry 3628 (class 2606 OID 17172)
-- Name: workflow_siteprofile_approval workflow_siteprofile_approval_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_approval
    ADD CONSTRAINT workflow_siteprofile_approval_pkey PRIMARY KEY (id);


--
-- TOC entry 3617 (class 2606 OID 17162)
-- Name: workflow_siteprofile workflow_siteprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 3621 (class 2606 OID 17164)
-- Name: workflow_siteprofile workflow_siteprofile_site_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_site_uuid_key UNIQUE (site_uuid);


--
-- TOC entry 3876 (class 2606 OID 18775)
-- Name: workflow_siteprofile_workflowlevel1 workflow_siteprofile_wor_siteprofile_id_workflowl_20206638_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_workflowlevel1
    ADD CONSTRAINT workflow_siteprofile_wor_siteprofile_id_workflowl_20206638_uniq UNIQUE (siteprofile_id, workflowlevel1_id);


--
-- TOC entry 3878 (class 2606 OID 18763)
-- Name: workflow_siteprofile_workflowlevel1 workflow_siteprofile_workflowlevel1_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_workflowlevel1
    ADD CONSTRAINT workflow_siteprofile_workflowlevel1_pkey PRIMARY KEY (id);


--
-- TOC entry 3642 (class 2606 OID 17852)
-- Name: workflow_stakeholder_approval workflow_stakeholder_app_stakeholder_id_approvalw_d6c43576_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_approval
    ADD CONSTRAINT workflow_stakeholder_app_stakeholder_id_approvalw_d6c43576_uniq UNIQUE (stakeholder_id, approvalworkflow_id);


--
-- TOC entry 3645 (class 2606 OID 17193)
-- Name: workflow_stakeholder_approval workflow_stakeholder_approval_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_approval
    ADD CONSTRAINT workflow_stakeholder_approval_pkey PRIMARY KEY (id);


--
-- TOC entry 3648 (class 2606 OID 17866)
-- Name: workflow_stakeholder_contact workflow_stakeholder_con_stakeholder_id_contact_i_0236a4bc_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_contact
    ADD CONSTRAINT workflow_stakeholder_con_stakeholder_id_contact_i_0236a4bc_uniq UNIQUE (stakeholder_id, contact_id);


--
-- TOC entry 3651 (class 2606 OID 17201)
-- Name: workflow_stakeholder_contact workflow_stakeholder_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_contact
    ADD CONSTRAINT workflow_stakeholder_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 3635 (class 2606 OID 17183)
-- Name: workflow_stakeholder workflow_stakeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder
    ADD CONSTRAINT workflow_stakeholder_pkey PRIMARY KEY (id);


--
-- TOC entry 3654 (class 2606 OID 17880)
-- Name: workflow_stakeholder_sectors workflow_stakeholder_sec_stakeholder_id_sector_id_090c41dd_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_sectors
    ADD CONSTRAINT workflow_stakeholder_sec_stakeholder_id_sector_id_090c41dd_uniq UNIQUE (stakeholder_id, sector_id);


--
-- TOC entry 3656 (class 2606 OID 17209)
-- Name: workflow_stakeholder_sectors workflow_stakeholder_sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_sectors
    ADD CONSTRAINT workflow_stakeholder_sectors_pkey PRIMARY KEY (id);


--
-- TOC entry 3638 (class 2606 OID 17185)
-- Name: workflow_stakeholder workflow_stakeholder_stakeholder_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder
    ADD CONSTRAINT workflow_stakeholder_stakeholder_uuid_key UNIQUE (stakeholder_uuid);


--
-- TOC entry 3828 (class 2606 OID 18335)
-- Name: workflow_stakeholder_workflowlevel1 workflow_stakeholder_wor_stakeholder_id_workflowl_2bd3043a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_workflowlevel1
    ADD CONSTRAINT workflow_stakeholder_wor_stakeholder_id_workflowl_2bd3043a_uniq UNIQUE (stakeholder_id, workflowlevel1_id);


--
-- TOC entry 3830 (class 2606 OID 17491)
-- Name: workflow_stakeholder_workflowlevel1 workflow_stakeholder_workflowlevel1_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_workflowlevel1
    ADD CONSTRAINT workflow_stakeholder_workflowlevel1_pkey PRIMARY KEY (id);


--
-- TOC entry 3661 (class 2606 OID 17217)
-- Name: workflow_stakeholdertype workflow_stakeholdertype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholdertype
    ADD CONSTRAINT workflow_stakeholdertype_pkey PRIMARY KEY (id);


--
-- TOC entry 3663 (class 2606 OID 17228)
-- Name: workflow_tolabookmarks workflow_tolabookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolabookmarks
    ADD CONSTRAINT workflow_tolabookmarks_pkey PRIMARY KEY (id);


--
-- TOC entry 3667 (class 2606 OID 17239)
-- Name: workflow_tolasites workflow_tolasites_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolasites
    ADD CONSTRAINT workflow_tolasites_pkey PRIMARY KEY (id);


--
-- TOC entry 3679 (class 2606 OID 17924)
-- Name: workflow_tolauser_countries workflow_tolauser_countr_tolauser_id_country_id_798c60eb_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser_countries
    ADD CONSTRAINT workflow_tolauser_countr_tolauser_id_country_id_798c60eb_uniq UNIQUE (tolauser_id, country_id);


--
-- TOC entry 3682 (class 2606 OID 17262)
-- Name: workflow_tolauser_countries workflow_tolauser_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser_countries
    ADD CONSTRAINT workflow_tolauser_countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3672 (class 2606 OID 17250)
-- Name: workflow_tolauser workflow_tolauser_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser
    ADD CONSTRAINT workflow_tolauser_pkey PRIMARY KEY (id);


--
-- TOC entry 3675 (class 2606 OID 17252)
-- Name: workflow_tolauser workflow_tolauser_tola_user_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser
    ADD CONSTRAINT workflow_tolauser_tola_user_uuid_key UNIQUE (tola_user_uuid);


--
-- TOC entry 3677 (class 2606 OID 17254)
-- Name: workflow_tolauser workflow_tolauser_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser
    ADD CONSTRAINT workflow_tolauser_user_id_key UNIQUE (user_id);


--
-- TOC entry 3688 (class 2606 OID 17944)
-- Name: workflow_tolauserfilter_country_filter workflow_tolauserfilter__tolauserfilter_id_countr_214630c4_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_country_filter
    ADD CONSTRAINT workflow_tolauserfilter__tolauserfilter_id_countr_214630c4_uniq UNIQUE (tolauserfilter_id, country_id);


--
-- TOC entry 3694 (class 2606 OID 17958)
-- Name: workflow_tolauserfilter_sector_filter workflow_tolauserfilter__tolauserfilter_id_sector_507e5834_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_sector_filter
    ADD CONSTRAINT workflow_tolauserfilter__tolauserfilter_id_sector_507e5834_uniq UNIQUE (tolauserfilter_id, sector_id);


--
-- TOC entry 3816 (class 2606 OID 18283)
-- Name: workflow_tolauserfilter_workflowlevel1_filter workflow_tolauserfilter__tolauserfilter_id_workfl_364f880a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel1_filter
    ADD CONSTRAINT workflow_tolauserfilter__tolauserfilter_id_workfl_364f880a_uniq UNIQUE (tolauserfilter_id, workflowlevel1_id);


--
-- TOC entry 3822 (class 2606 OID 18297)
-- Name: workflow_tolauserfilter_workflowlevel2_filter workflow_tolauserfilter__tolauserfilter_id_workfl_679d4e68_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel2_filter
    ADD CONSTRAINT workflow_tolauserfilter__tolauserfilter_id_workfl_679d4e68_uniq UNIQUE (tolauserfilter_id, workflowlevel2_id);


--
-- TOC entry 3692 (class 2606 OID 17278)
-- Name: workflow_tolauserfilter_country_filter workflow_tolauserfilter_country_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_country_filter
    ADD CONSTRAINT workflow_tolauserfilter_country_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 3685 (class 2606 OID 17270)
-- Name: workflow_tolauserfilter workflow_tolauserfilter_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter
    ADD CONSTRAINT workflow_tolauserfilter_pkey PRIMARY KEY (id);


--
-- TOC entry 3697 (class 2606 OID 17286)
-- Name: workflow_tolauserfilter_sector_filter workflow_tolauserfilter_sector_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_sector_filter
    ADD CONSTRAINT workflow_tolauserfilter_sector_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 3820 (class 2606 OID 17475)
-- Name: workflow_tolauserfilter_workflowlevel1_filter workflow_tolauserfilter_workflowlevel1_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel1_filter
    ADD CONSTRAINT workflow_tolauserfilter_workflowlevel1_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 3826 (class 2606 OID 17483)
-- Name: workflow_tolauserfilter_workflowlevel2_filter workflow_tolauserfilter_workflowlevel2_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel2_filter
    ADD CONSTRAINT workflow_tolauserfilter_workflowlevel2_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 3891 (class 2606 OID 18847)
-- Name: workflow_widget workflow_widget_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_widget
    ADD CONSTRAINT workflow_widget_pkey PRIMARY KEY (id);


--
-- TOC entry 3707 (class 2606 OID 17985)
-- Name: workflow_workflowlevel1_award workflow_workflowlevel1__workflowlevel1_id_award__fe622be5_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_award
    ADD CONSTRAINT workflow_workflowlevel1__workflowlevel1_id_award__fe622be5_uniq UNIQUE (workflowlevel1_id, award_id);


--
-- TOC entry 3713 (class 2606 OID 17999)
-- Name: workflow_workflowlevel1_country workflow_workflowlevel1__workflowlevel1_id_countr_97048081_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_country
    ADD CONSTRAINT workflow_workflowlevel1__workflowlevel1_id_countr_97048081_uniq UNIQUE (workflowlevel1_id, country_id);


--
-- TOC entry 3719 (class 2606 OID 18013)
-- Name: workflow_workflowlevel1_fund_code workflow_workflowlevel1__workflowlevel1_id_fundco_e44ee7c0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_fund_code
    ADD CONSTRAINT workflow_workflowlevel1__workflowlevel1_id_fundco_e44ee7c0_uniq UNIQUE (workflowlevel1_id, fundcode_id);


--
-- TOC entry 3725 (class 2606 OID 18027)
-- Name: workflow_workflowlevel1_milestone workflow_workflowlevel1__workflowlevel1_id_milest_781ff51a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_milestone
    ADD CONSTRAINT workflow_workflowlevel1__workflowlevel1_id_milest_781ff51a_uniq UNIQUE (workflowlevel1_id, milestone_id);


--
-- TOC entry 3731 (class 2606 OID 18041)
-- Name: workflow_workflowlevel1_sector workflow_workflowlevel1__workflowlevel1_id_sector_5c289b64_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sector
    ADD CONSTRAINT workflow_workflowlevel1__workflowlevel1_id_sector_5c289b64_uniq UNIQUE (workflowlevel1_id, sector_id);


--
-- TOC entry 3737 (class 2606 OID 18055)
-- Name: workflow_workflowlevel1_sub_sector workflow_workflowlevel1__workflowlevel1_id_sector_d38c4a9b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sub_sector
    ADD CONSTRAINT workflow_workflowlevel1__workflowlevel1_id_sector_d38c4a9b_uniq UNIQUE (workflowlevel1_id, sector_id);


--
-- TOC entry 3743 (class 2606 OID 18069)
-- Name: workflow_workflowlevel1_user_access workflow_workflowlevel1__workflowlevel1_id_tolaus_c36ef8fe_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_user_access
    ADD CONSTRAINT workflow_workflowlevel1__workflowlevel1_id_tolaus_c36ef8fe_uniq UNIQUE (workflowlevel1_id, tolauser_id);


--
-- TOC entry 3710 (class 2606 OID 17307)
-- Name: workflow_workflowlevel1_award workflow_workflowlevel1_award_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_award
    ADD CONSTRAINT workflow_workflowlevel1_award_pkey PRIMARY KEY (id);


--
-- TOC entry 3716 (class 2606 OID 17315)
-- Name: workflow_workflowlevel1_country workflow_workflowlevel1_country_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_country
    ADD CONSTRAINT workflow_workflowlevel1_country_pkey PRIMARY KEY (id);


--
-- TOC entry 3722 (class 2606 OID 17323)
-- Name: workflow_workflowlevel1_fund_code workflow_workflowlevel1_fund_code_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_fund_code
    ADD CONSTRAINT workflow_workflowlevel1_fund_code_pkey PRIMARY KEY (id);


--
-- TOC entry 3701 (class 2606 OID 17299)
-- Name: workflow_workflowlevel1 workflow_workflowlevel1_level1_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1
    ADD CONSTRAINT workflow_workflowlevel1_level1_uuid_key UNIQUE (level1_uuid);


--
-- TOC entry 3728 (class 2606 OID 17331)
-- Name: workflow_workflowlevel1_milestone workflow_workflowlevel1_milestone_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_milestone
    ADD CONSTRAINT workflow_workflowlevel1_milestone_pkey PRIMARY KEY (id);


--
-- TOC entry 3704 (class 2606 OID 17297)
-- Name: workflow_workflowlevel1 workflow_workflowlevel1_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1
    ADD CONSTRAINT workflow_workflowlevel1_pkey PRIMARY KEY (id);


--
-- TOC entry 3733 (class 2606 OID 17339)
-- Name: workflow_workflowlevel1_sector workflow_workflowlevel1_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sector
    ADD CONSTRAINT workflow_workflowlevel1_sector_pkey PRIMARY KEY (id);


--
-- TOC entry 3739 (class 2606 OID 17347)
-- Name: workflow_workflowlevel1_sub_sector workflow_workflowlevel1_sub_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sub_sector
    ADD CONSTRAINT workflow_workflowlevel1_sub_sector_pkey PRIMARY KEY (id);


--
-- TOC entry 3745 (class 2606 OID 17355)
-- Name: workflow_workflowlevel1_user_access workflow_workflowlevel1_user_access_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_user_access
    ADD CONSTRAINT workflow_workflowlevel1_user_access_pkey PRIMARY KEY (id);


--
-- TOC entry 3753 (class 2606 OID 18095)
-- Name: workflow_workflowlevel1sector_sub_sector workflow_workflowlevel1s_workflowlevel1sector_id__2b869c96_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1sector_sub_sector
    ADD CONSTRAINT workflow_workflowlevel1s_workflowlevel1sector_id__2b869c96_uniq UNIQUE (workflowlevel1sector_id, sector_id);


--
-- TOC entry 3749 (class 2606 OID 17363)
-- Name: workflow_workflowlevel1sector workflow_workflowlevel1sector_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1sector
    ADD CONSTRAINT workflow_workflowlevel1sector_pkey PRIMARY KEY (id);


--
-- TOC entry 3756 (class 2606 OID 17371)
-- Name: workflow_workflowlevel1sector_sub_sector workflow_workflowlevel1sector_sub_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1sector_sub_sector
    ADD CONSTRAINT workflow_workflowlevel1sector_sub_sector_pkey PRIMARY KEY (id);


--
-- TOC entry 3772 (class 2606 OID 18152)
-- Name: workflow_workflowlevel2_approval workflow_workflowlevel2__workflowlevel2_id_approv_46af760f_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_approval
    ADD CONSTRAINT workflow_workflowlevel2__workflowlevel2_id_approv_46af760f_uniq UNIQUE (workflowlevel2_id, approvalworkflow_id);


--
-- TOC entry 3778 (class 2606 OID 18166)
-- Name: workflow_workflowlevel2_indicators workflow_workflowlevel2__workflowlevel2_id_indica_5264e717_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_indicators
    ADD CONSTRAINT workflow_workflowlevel2__workflowlevel2_id_indica_5264e717_uniq UNIQUE (workflowlevel2_id, indicator_id);


--
-- TOC entry 3796 (class 2606 OID 18208)
-- Name: workflow_workflowlevel2_sub_sector workflow_workflowlevel2__workflowlevel2_id_sector_cafe47de_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_sub_sector
    ADD CONSTRAINT workflow_workflowlevel2__workflowlevel2_id_sector_cafe47de_uniq UNIQUE (workflowlevel2_id, sector_id);


--
-- TOC entry 3784 (class 2606 OID 18180)
-- Name: workflow_workflowlevel2_site workflow_workflowlevel2__workflowlevel2_id_sitepr_5aadb924_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_site
    ADD CONSTRAINT workflow_workflowlevel2__workflowlevel2_id_sitepr_5aadb924_uniq UNIQUE (workflowlevel2_id, siteprofile_id);


--
-- TOC entry 3790 (class 2606 OID 18194)
-- Name: workflow_workflowlevel2_stakeholder workflow_workflowlevel2__workflowlevel2_id_stakeh_f7fb27f7_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_stakeholder
    ADD CONSTRAINT workflow_workflowlevel2__workflowlevel2_id_stakeh_f7fb27f7_uniq UNIQUE (workflowlevel2_id, stakeholder_id);


--
-- TOC entry 3775 (class 2606 OID 17392)
-- Name: workflow_workflowlevel2_approval workflow_workflowlevel2_approval_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_approval
    ADD CONSTRAINT workflow_workflowlevel2_approval_pkey PRIMARY KEY (id);


--
-- TOC entry 3781 (class 2606 OID 17400)
-- Name: workflow_workflowlevel2_indicators workflow_workflowlevel2_indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_indicators
    ADD CONSTRAINT workflow_workflowlevel2_indicators_pkey PRIMARY KEY (id);


--
-- TOC entry 3762 (class 2606 OID 17384)
-- Name: workflow_workflowlevel2 workflow_workflowlevel2_level2_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlevel2_level2_uuid_key UNIQUE (level2_uuid);


--
-- TOC entry 3767 (class 2606 OID 17382)
-- Name: workflow_workflowlevel2 workflow_workflowlevel2_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlevel2_pkey PRIMARY KEY (id);


--
-- TOC entry 3786 (class 2606 OID 17408)
-- Name: workflow_workflowlevel2_site workflow_workflowlevel2_site_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_site
    ADD CONSTRAINT workflow_workflowlevel2_site_pkey PRIMARY KEY (id);


--
-- TOC entry 3792 (class 2606 OID 17416)
-- Name: workflow_workflowlevel2_stakeholder workflow_workflowlevel2_stakeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_stakeholder
    ADD CONSTRAINT workflow_workflowlevel2_stakeholder_pkey PRIMARY KEY (id);


--
-- TOC entry 3798 (class 2606 OID 17424)
-- Name: workflow_workflowlevel2_sub_sector workflow_workflowlevel2_sub_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_sub_sector
    ADD CONSTRAINT workflow_workflowlevel2_sub_sector_pkey PRIMARY KEY (id);


--
-- TOC entry 3803 (class 2606 OID 17435)
-- Name: workflow_workflowlevel2sort workflow_workflowlevel2sort_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2sort
    ADD CONSTRAINT workflow_workflowlevel2sort_pkey PRIMARY KEY (id);


--
-- TOC entry 3806 (class 2606 OID 17456)
-- Name: workflow_workflowmodules workflow_workflowmodules_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowmodules
    ADD CONSTRAINT workflow_workflowmodules_pkey PRIMARY KEY (id);


--
-- TOC entry 3811 (class 2606 OID 17467)
-- Name: workflow_workflowteam workflow_workflowteam_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowteam
    ADD CONSTRAINT workflow_workflowteam_pkey PRIMARY KEY (id);


--
-- TOC entry 3898 (class 1259 OID 19164)
-- Name: appointment_appointment_owner_id_9b0c47be; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX appointment_appointment_owner_id_9b0c47be ON public.appointment_appointment USING btree (owner_id);


--
-- TOC entry 3903 (class 1259 OID 19192)
-- Name: appointment_appointment_wo_workflowlevel2_id_cf7b9402; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX appointment_appointment_wo_workflowlevel2_id_cf7b9402 ON public.appointment_appointment_workflowlevel2 USING btree (workflowlevel2_id);


--
-- TOC entry 3904 (class 1259 OID 19191)
-- Name: appointment_appointment_workflowlevel2_appointment_id_ca9667b7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX appointment_appointment_workflowlevel2_appointment_id_ca9667b7 ON public.appointment_appointment_workflowlevel2 USING btree (appointment_id);


--
-- TOC entry 3272 (class 1259 OID 16467)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3277 (class 1259 OID 16480)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3280 (class 1259 OID 16481)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3267 (class 1259 OID 16466)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3288 (class 1259 OID 16496)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3291 (class 1259 OID 16495)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3294 (class 1259 OID 16510)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3297 (class 1259 OID 16509)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3285 (class 1259 OID 16743)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3907 (class 1259 OID 19205)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 3914 (class 1259 OID 19360)
-- Name: contact_contact_user_id_2e02db50; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX contact_contact_user_id_2e02db50 ON public.contact_contact USING btree (user_id);


--
-- TOC entry 3300 (class 1259 OID 16533)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3303 (class 1259 OID 16534)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 4086 (class 1259 OID 20894)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 4089 (class 1259 OID 20893)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3304 (class 1259 OID 16546)
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- TOC entry 3963 (class 1259 OID 19625)
-- Name: formlibrary_beneficiary_distribution_beneficiary_id_f6db57da; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_beneficiary_distribution_beneficiary_id_f6db57da ON public.formlibrary_beneficiary_distribution USING btree (beneficiary_id);


--
-- TOC entry 3964 (class 1259 OID 19626)
-- Name: formlibrary_beneficiary_distribution_distribution_id_4be4e564; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_beneficiary_distribution_distribution_id_4be4e564 ON public.formlibrary_beneficiary_distribution USING btree (distribution_id);


--
-- TOC entry 3921 (class 1259 OID 19627)
-- Name: formlibrary_beneficiary_site_id_fc084d62; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_beneficiary_site_id_fc084d62 ON public.formlibrary_beneficiary USING btree (site_id);


--
-- TOC entry 3969 (class 1259 OID 19645)
-- Name: formlibrary_beneficiary_training_beneficiary_id_594f1b5e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_beneficiary_training_beneficiary_id_594f1b5e ON public.formlibrary_beneficiary_training USING btree (beneficiary_id);


--
-- TOC entry 3972 (class 1259 OID 19646)
-- Name: formlibrary_beneficiary_training_trainingattendance_id_3d9d50ac; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_beneficiary_training_trainingattendance_id_3d9d50ac ON public.formlibrary_beneficiary_training USING btree (trainingattendance_id);


--
-- TOC entry 3975 (class 1259 OID 19660)
-- Name: formlibrary_beneficiary_wo_workflowlevel1_id_36df8abe; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_beneficiary_wo_workflowlevel1_id_36df8abe ON public.formlibrary_beneficiary_workflowlevel1 USING btree (workflowlevel1_id);


--
-- TOC entry 3976 (class 1259 OID 19659)
-- Name: formlibrary_beneficiary_workflowlevel1_beneficiary_id_3725f557; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_beneficiary_workflowlevel1_beneficiary_id_3725f557 ON public.formlibrary_beneficiary_workflowlevel1 USING btree (beneficiary_id);


--
-- TOC entry 3924 (class 1259 OID 19661)
-- Name: formlibrary_customform_created_by_id_8c03f8ad; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_customform_created_by_id_8c03f8ad ON public.formlibrary_customform USING btree (created_by_id);


--
-- TOC entry 3925 (class 1259 OID 19696)
-- Name: formlibrary_customform_form_uuid_9b0c3c03_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_customform_form_uuid_9b0c3c03_like ON public.formlibrary_customform USING btree (form_uuid varchar_pattern_ops);


--
-- TOC entry 3928 (class 1259 OID 19607)
-- Name: formlibrary_customform_organization_id_56919c52; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_customform_organization_id_56919c52 ON public.formlibrary_customform USING btree (organization_id);


--
-- TOC entry 3931 (class 1259 OID 19687)
-- Name: formlibrary_customform_workflowlevel1_id_db5a9031; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_customform_workflowlevel1_id_db5a9031 ON public.formlibrary_customform USING btree (workflowlevel1_id);


--
-- TOC entry 3934 (class 1259 OID 19601)
-- Name: formlibrary_customformfield_type_id_0aafbaba; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_customformfield_type_id_0aafbaba ON public.formlibrary_customformfield USING btree (type_id);


--
-- TOC entry 3955 (class 1259 OID 19570)
-- Name: formlibrary_distribution_d_disaggregationvalue_id_9db21dee; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_distribution_d_disaggregationvalue_id_9db21dee ON public.formlibrary_distribution_disaggregation_value USING btree (disaggregationvalue_id);


--
-- TOC entry 3956 (class 1259 OID 19569)
-- Name: formlibrary_distribution_d_distribution_id_98d78001; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_distribution_d_distribution_id_98d78001 ON public.formlibrary_distribution_disaggregation_value USING btree (distribution_id);


--
-- TOC entry 3935 (class 1259 OID 19571)
-- Name: formlibrary_distribution_distribution_indicator_id_508f8618; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_distribution_distribution_indicator_id_508f8618 ON public.formlibrary_distribution USING btree (distribution_indicator_id);


--
-- TOC entry 3936 (class 1259 OID 19577)
-- Name: formlibrary_distribution_office_code_id_5b514eb7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_distribution_office_code_id_5b514eb7 ON public.formlibrary_distribution USING btree (office_code_id);


--
-- TOC entry 3939 (class 1259 OID 19583)
-- Name: formlibrary_distribution_province_id_df5c6c48; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_distribution_province_id_df5c6c48 ON public.formlibrary_distribution USING btree (province_id);


--
-- TOC entry 3940 (class 1259 OID 19589)
-- Name: formlibrary_distribution_workflowlevel1_id_de680559; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_distribution_workflowlevel1_id_de680559 ON public.formlibrary_distribution USING btree (workflowlevel1_id);


--
-- TOC entry 3941 (class 1259 OID 19595)
-- Name: formlibrary_distribution_workflowlevel2_id_9ee2ef34; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_distribution_workflowlevel2_id_9ee2ef34 ON public.formlibrary_distribution USING btree (workflowlevel2_id);


--
-- TOC entry 3951 (class 1259 OID 19498)
-- Name: formlibrary_trainingattend_disaggregationvalue_id_39456c05; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_trainingattend_disaggregationvalue_id_39456c05 ON public.formlibrary_trainingattendance_disaggregation_value USING btree (disaggregationvalue_id);


--
-- TOC entry 3952 (class 1259 OID 19497)
-- Name: formlibrary_trainingattend_trainingattendance_id_7b20fecb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_trainingattend_trainingattendance_id_7b20fecb ON public.formlibrary_trainingattendance_disaggregation_value USING btree (trainingattendance_id);


--
-- TOC entry 3946 (class 1259 OID 19499)
-- Name: formlibrary_trainingattendance_training_indicator_id_33df7d98; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_trainingattendance_training_indicator_id_33df7d98 ON public.formlibrary_trainingattendance USING btree (training_indicator_id);


--
-- TOC entry 3947 (class 1259 OID 19545)
-- Name: formlibrary_trainingattendance_workflowlevel1_id_eadf5b3a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_trainingattendance_workflowlevel1_id_eadf5b3a ON public.formlibrary_trainingattendance USING btree (workflowlevel1_id);


--
-- TOC entry 3948 (class 1259 OID 19551)
-- Name: formlibrary_trainingattendance_workflowlevel2_id_4f1b2039; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX formlibrary_trainingattendance_workflowlevel2_id_4f1b2039 ON public.formlibrary_trainingattendance USING btree (workflowlevel2_id);


--
-- TOC entry 3981 (class 1259 OID 19745)
-- Name: guardian_groupobjectpermission_content_type_id_7ade36b8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX guardian_groupobjectpermission_content_type_id_7ade36b8 ON public.guardian_groupobjectpermission USING btree (content_type_id);


--
-- TOC entry 3982 (class 1259 OID 19746)
-- Name: guardian_groupobjectpermission_group_id_4bbbfb62; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX guardian_groupobjectpermission_group_id_4bbbfb62 ON public.guardian_groupobjectpermission USING btree (group_id);


--
-- TOC entry 3983 (class 1259 OID 19747)
-- Name: guardian_groupobjectpermission_permission_id_36572738; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX guardian_groupobjectpermission_permission_id_36572738 ON public.guardian_groupobjectpermission USING btree (permission_id);


--
-- TOC entry 3988 (class 1259 OID 19763)
-- Name: guardian_userobjectpermission_content_type_id_2e892405; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX guardian_userobjectpermission_content_type_id_2e892405 ON public.guardian_userobjectpermission USING btree (content_type_id);


--
-- TOC entry 3989 (class 1259 OID 19764)
-- Name: guardian_userobjectpermission_permission_id_71807bfc; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX guardian_userobjectpermission_permission_id_71807bfc ON public.guardian_userobjectpermission USING btree (permission_id);


--
-- TOC entry 3992 (class 1259 OID 19765)
-- Name: guardian_userobjectpermission_user_id_d5c1e964; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX guardian_userobjectpermission_user_id_d5c1e964 ON public.guardian_userobjectpermission USING btree (user_id);


--
-- TOC entry 3309 (class 1259 OID 20180)
-- Name: indicators_collecteddata_approved_by_id_d7a2be3d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_approved_by_id_d7a2be3d ON public.indicators_collecteddata USING btree (approved_by_id);


--
-- TOC entry 3310 (class 1259 OID 20250)
-- Name: indicators_collecteddata_created_by_id_e703906b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_created_by_id_e703906b ON public.indicators_collecteddata USING btree (created_by_id);


--
-- TOC entry 4043 (class 1259 OID 20198)
-- Name: indicators_collecteddata_d_collecteddata_id_7cc495e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_d_collecteddata_id_7cc495e7 ON public.indicators_collecteddata_disaggregation_value USING btree (collecteddata_id);


--
-- TOC entry 4044 (class 1259 OID 20199)
-- Name: indicators_collecteddata_d_disaggregationvalue_id_d1f12d4f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_d_disaggregationvalue_id_d1f12d4f ON public.indicators_collecteddata_disaggregation_value USING btree (disaggregationvalue_id);


--
-- TOC entry 3311 (class 1259 OID 16733)
-- Name: indicators_collecteddata_data_uuid_f9205ff5_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_data_uuid_f9205ff5_like ON public.indicators_collecteddata USING btree (data_uuid varchar_pattern_ops);


--
-- TOC entry 3314 (class 1259 OID 20200)
-- Name: indicators_collecteddata_evidence_id_72ab87b4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_evidence_id_72ab87b4 ON public.indicators_collecteddata USING btree (evidence_id);


--
-- TOC entry 3315 (class 1259 OID 20206)
-- Name: indicators_collecteddata_indicator_id_04993a79; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_indicator_id_04993a79 ON public.indicators_collecteddata USING btree (indicator_id);


--
-- TOC entry 3316 (class 1259 OID 20212)
-- Name: indicators_collecteddata_periodic_target_id_1af08713; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_periodic_target_id_1af08713 ON public.indicators_collecteddata USING btree (periodic_target_id);


--
-- TOC entry 4049 (class 1259 OID 20230)
-- Name: indicators_collecteddata_site_collecteddata_id_741ff857; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_site_collecteddata_id_741ff857 ON public.indicators_collecteddata_site USING btree (collecteddata_id);


--
-- TOC entry 4052 (class 1259 OID 20231)
-- Name: indicators_collecteddata_site_siteprofile_id_abe02a9c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_site_siteprofile_id_abe02a9c ON public.indicators_collecteddata_site USING btree (siteprofile_id);


--
-- TOC entry 3319 (class 1259 OID 20232)
-- Name: indicators_collecteddata_tola_table_id_06fe0aa2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_tola_table_id_06fe0aa2 ON public.indicators_collecteddata USING btree (tola_table_id);


--
-- TOC entry 3320 (class 1259 OID 20238)
-- Name: indicators_collecteddata_workflowlevel1_id_73f6f06a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_workflowlevel1_id_73f6f06a ON public.indicators_collecteddata USING btree (workflowlevel1_id);


--
-- TOC entry 3321 (class 1259 OID 20244)
-- Name: indicators_collecteddata_workflowlevel2_id_cb072a88; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_collecteddata_workflowlevel2_id_cb072a88 ON public.indicators_collecteddata USING btree (workflowlevel2_id);


--
-- TOC entry 3322 (class 1259 OID 20174)
-- Name: indicators_disaggregationlabel_disaggregation_type_id_9b8197ac; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_disaggregationlabel_disaggregation_type_id_9b8197ac ON public.indicators_disaggregationlabel USING btree (disaggregation_type_id);


--
-- TOC entry 3325 (class 1259 OID 20168)
-- Name: indicators_disaggregationtype_organization_id_513da13d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_disaggregationtype_organization_id_513da13d ON public.indicators_disaggregationtype USING btree (organization_id);


--
-- TOC entry 3328 (class 1259 OID 20162)
-- Name: indicators_disaggregationvalue_disaggregation_label_id_a5c81ee7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_disaggregationvalue_disaggregation_label_id_a5c81ee7 ON public.indicators_disaggregationvalue USING btree (disaggregation_label_id);


--
-- TOC entry 3331 (class 1259 OID 20156)
-- Name: indicators_externalservice_organization_id_2e94fb85; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_externalservice_organization_id_2e94fb85 ON public.indicators_externalservice USING btree (organization_id);


--
-- TOC entry 3334 (class 1259 OID 20150)
-- Name: indicators_externalservicerecord_external_service_id_98ab35d0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_externalservicerecord_external_service_id_98ab35d0 ON public.indicators_externalservicerecord USING btree (external_service_id);


--
-- TOC entry 3337 (class 1259 OID 20144)
-- Name: indicators_frequency_organization_id_2f72c3e5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_frequency_organization_id_2f72c3e5 ON public.indicators_frequency USING btree (organization_id);


--
-- TOC entry 3340 (class 1259 OID 20131)
-- Name: indicators_historicalcollecteddata_approved_by_id_a65cff31; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_approved_by_id_a65cff31 ON public.indicators_historicalcollecteddata USING btree (approved_by_id);


--
-- TOC entry 3341 (class 1259 OID 20256)
-- Name: indicators_historicalcollecteddata_created_by_id_50c3434d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_created_by_id_50c3434d ON public.indicators_historicalcollecteddata USING btree (created_by_id);


--
-- TOC entry 3342 (class 1259 OID 16735)
-- Name: indicators_historicalcollecteddata_data_uuid_13c178ce; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_data_uuid_13c178ce ON public.indicators_historicalcollecteddata USING btree (data_uuid);


--
-- TOC entry 3343 (class 1259 OID 16736)
-- Name: indicators_historicalcollecteddata_data_uuid_13c178ce_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_data_uuid_13c178ce_like ON public.indicators_historicalcollecteddata USING btree (data_uuid varchar_pattern_ops);


--
-- TOC entry 3344 (class 1259 OID 20132)
-- Name: indicators_historicalcollecteddata_evidence_id_167f366a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_evidence_id_167f366a ON public.indicators_historicalcollecteddata USING btree (evidence_id);


--
-- TOC entry 3345 (class 1259 OID 20133)
-- Name: indicators_historicalcollecteddata_history_user_id_ed2040fa; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_history_user_id_ed2040fa ON public.indicators_historicalcollecteddata USING btree (history_user_id);


--
-- TOC entry 3346 (class 1259 OID 16734)
-- Name: indicators_historicalcollecteddata_id_9b4e00c0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_id_9b4e00c0 ON public.indicators_historicalcollecteddata USING btree (id);


--
-- TOC entry 3347 (class 1259 OID 20139)
-- Name: indicators_historicalcollecteddata_indicator_id_2aaf395e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_indicator_id_2aaf395e ON public.indicators_historicalcollecteddata USING btree (indicator_id);


--
-- TOC entry 3348 (class 1259 OID 20140)
-- Name: indicators_historicalcollecteddata_periodic_target_id_1791fe5c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_periodic_target_id_1791fe5c ON public.indicators_historicalcollecteddata USING btree (periodic_target_id);


--
-- TOC entry 3351 (class 1259 OID 20141)
-- Name: indicators_historicalcollecteddata_tola_table_id_f0ac5812; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_tola_table_id_f0ac5812 ON public.indicators_historicalcollecteddata USING btree (tola_table_id);


--
-- TOC entry 3352 (class 1259 OID 20142)
-- Name: indicators_historicalcollecteddata_workflowlevel1_id_0e6e0aad; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_workflowlevel1_id_0e6e0aad ON public.indicators_historicalcollecteddata USING btree (workflowlevel1_id);


--
-- TOC entry 3353 (class 1259 OID 20143)
-- Name: indicators_historicalcollecteddata_workflowlevel2_id_49986066; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalcollecteddata_workflowlevel2_id_49986066 ON public.indicators_historicalcollecteddata USING btree (workflowlevel2_id);


--
-- TOC entry 3354 (class 1259 OID 20118)
-- Name: indicators_historicalindic_approval_submitted_by_id_227bb3e9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindic_approval_submitted_by_id_227bb3e9 ON public.indicators_historicalindicator USING btree (approval_submitted_by_id);


--
-- TOC entry 3355 (class 1259 OID 20120)
-- Name: indicators_historicalindic_data_collection_frequency__bafd1b4b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindic_data_collection_frequency__bafd1b4b ON public.indicators_historicalindicator USING btree (data_collection_frequency_id);


--
-- TOC entry 3356 (class 1259 OID 20121)
-- Name: indicators_historicalindic_external_service_record_id_abef9921; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindic_external_service_record_id_abef9921 ON public.indicators_historicalindicator USING btree (external_service_record_id);


--
-- TOC entry 3357 (class 1259 OID 20119)
-- Name: indicators_historicalindicator_approved_by_id_e906ba6f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindicator_approved_by_id_e906ba6f ON public.indicators_historicalindicator USING btree (approved_by_id);


--
-- TOC entry 3358 (class 1259 OID 20257)
-- Name: indicators_historicalindicator_created_by_id_57896be6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindicator_created_by_id_57896be6 ON public.indicators_historicalindicator USING btree (created_by_id);


--
-- TOC entry 3359 (class 1259 OID 20122)
-- Name: indicators_historicalindicator_history_user_id_b21a8374; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindicator_history_user_id_b21a8374 ON public.indicators_historicalindicator USING btree (history_user_id);


--
-- TOC entry 3360 (class 1259 OID 16737)
-- Name: indicators_historicalindicator_id_77c30799; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindicator_id_77c30799 ON public.indicators_historicalindicator USING btree (id);


--
-- TOC entry 3361 (class 1259 OID 16738)
-- Name: indicators_historicalindicator_indicator_uuid_dd2f9c41; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindicator_indicator_uuid_dd2f9c41 ON public.indicators_historicalindicator USING btree (indicator_uuid);


--
-- TOC entry 3362 (class 1259 OID 16739)
-- Name: indicators_historicalindicator_indicator_uuid_dd2f9c41_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindicator_indicator_uuid_dd2f9c41_like ON public.indicators_historicalindicator USING btree (indicator_uuid varchar_pattern_ops);


--
-- TOC entry 3363 (class 1259 OID 20128)
-- Name: indicators_historicalindicator_level_id_592df9bb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindicator_level_id_592df9bb ON public.indicators_historicalindicator USING btree (level_id);


--
-- TOC entry 3366 (class 1259 OID 20129)
-- Name: indicators_historicalindicator_reporting_frequency_id_31ca30c0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindicator_reporting_frequency_id_31ca30c0 ON public.indicators_historicalindicator USING btree (reporting_frequency_id);


--
-- TOC entry 3367 (class 1259 OID 20130)
-- Name: indicators_historicalindicator_sector_id_b2d81c14; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_historicalindicator_sector_id_b2d81c14 ON public.indicators_historicalindicator USING btree (sector_id);


--
-- TOC entry 3368 (class 1259 OID 19992)
-- Name: indicators_indicator_approval_submitted_by_id_b149cfec; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_approval_submitted_by_id_b149cfec ON public.indicators_indicator USING btree (approval_submitted_by_id);


--
-- TOC entry 3369 (class 1259 OID 19998)
-- Name: indicators_indicator_approved_by_id_bf449d47; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_approved_by_id_bf449d47 ON public.indicators_indicator USING btree (approved_by_id);


--
-- TOC entry 3370 (class 1259 OID 20258)
-- Name: indicators_indicator_created_by_id_c8b4de26; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_created_by_id_c8b4de26 ON public.indicators_indicator USING btree (created_by_id);


--
-- TOC entry 3371 (class 1259 OID 20004)
-- Name: indicators_indicator_data_collection_frequency_id_e39d6675; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_data_collection_frequency_id_e39d6675 ON public.indicators_indicator USING btree (data_collection_frequency_id);


--
-- TOC entry 4007 (class 1259 OID 20023)
-- Name: indicators_indicator_disag_disaggregationtype_id_62cf32af; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_disag_disaggregationtype_id_62cf32af ON public.indicators_indicator_disaggregation USING btree (disaggregationtype_id);


--
-- TOC entry 4008 (class 1259 OID 20022)
-- Name: indicators_indicator_disaggregation_indicator_id_15621d0f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_disaggregation_indicator_id_15621d0f ON public.indicators_indicator_disaggregation USING btree (indicator_id);


--
-- TOC entry 3372 (class 1259 OID 20024)
-- Name: indicators_indicator_external_service_record_id_b2b8c9a2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_external_service_record_id_b2b8c9a2 ON public.indicators_indicator USING btree (external_service_record_id);


--
-- TOC entry 4013 (class 1259 OID 20042)
-- Name: indicators_indicator_indicator_type_indicator_id_72d9ec81; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_indicator_type_indicator_id_72d9ec81 ON public.indicators_indicator_indicator_type USING btree (indicator_id);


--
-- TOC entry 4014 (class 1259 OID 20043)
-- Name: indicators_indicator_indicator_type_indicatortype_id_63a1a6ab; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_indicator_type_indicatortype_id_63a1a6ab ON public.indicators_indicator_indicator_type USING btree (indicatortype_id);


--
-- TOC entry 3373 (class 1259 OID 16740)
-- Name: indicators_indicator_indicator_uuid_c55eb010_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_indicator_uuid_c55eb010_like ON public.indicators_indicator USING btree (indicator_uuid varchar_pattern_ops);


--
-- TOC entry 3376 (class 1259 OID 20044)
-- Name: indicators_indicator_level_id_63b65f8d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_level_id_63b65f8d ON public.indicators_indicator USING btree (level_id);


--
-- TOC entry 4019 (class 1259 OID 20062)
-- Name: indicators_indicator_objectives_indicator_id_54260250; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_objectives_indicator_id_54260250 ON public.indicators_indicator_objectives USING btree (indicator_id);


--
-- TOC entry 4020 (class 1259 OID 20063)
-- Name: indicators_indicator_objectives_objective_id_8d7d4893; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_objectives_objective_id_8d7d4893 ON public.indicators_indicator_objectives USING btree (objective_id);


--
-- TOC entry 3379 (class 1259 OID 20064)
-- Name: indicators_indicator_reporting_frequency_id_c2346061; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_reporting_frequency_id_c2346061 ON public.indicators_indicator USING btree (reporting_frequency_id);


--
-- TOC entry 3380 (class 1259 OID 20070)
-- Name: indicators_indicator_sector_id_b9842819; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_sector_id_b9842819 ON public.indicators_indicator USING btree (sector_id);


--
-- TOC entry 4025 (class 1259 OID 20089)
-- Name: indicators_indicator_strat_strategicobjective_id_dee7457c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_strat_strategicobjective_id_dee7457c ON public.indicators_indicator_strategic_objectives USING btree (strategicobjective_id);


--
-- TOC entry 4026 (class 1259 OID 20088)
-- Name: indicators_indicator_strategic_objectives_indicator_id_1ffa4146; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_strategic_objectives_indicator_id_1ffa4146 ON public.indicators_indicator_strategic_objectives USING btree (indicator_id);


--
-- TOC entry 4031 (class 1259 OID 20102)
-- Name: indicators_indicator_sub_sector_indicator_id_ca713cd3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_sub_sector_indicator_id_ca713cd3 ON public.indicators_indicator_sub_sector USING btree (indicator_id);


--
-- TOC entry 4034 (class 1259 OID 20103)
-- Name: indicators_indicator_sub_sector_sector_id_40e585a4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_sub_sector_sector_id_40e585a4 ON public.indicators_indicator_sub_sector USING btree (sector_id);


--
-- TOC entry 4037 (class 1259 OID 20116)
-- Name: indicators_indicator_workflowlevel1_indicator_id_874eb385; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_workflowlevel1_indicator_id_874eb385 ON public.indicators_indicator_workflowlevel1 USING btree (indicator_id);


--
-- TOC entry 4040 (class 1259 OID 20117)
-- Name: indicators_indicator_workflowlevel1_workflowlevel1_id_0acb3a77; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicator_workflowlevel1_workflowlevel1_id_0acb3a77 ON public.indicators_indicator_workflowlevel1 USING btree (workflowlevel1_id);


--
-- TOC entry 3381 (class 1259 OID 19986)
-- Name: indicators_indicatortype_organization_id_5b8cb7ff; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_indicatortype_organization_id_5b8cb7ff ON public.indicators_indicatortype USING btree (organization_id);


--
-- TOC entry 3384 (class 1259 OID 19968)
-- Name: indicators_level_country_id_cca19b98; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_level_country_id_cca19b98 ON public.indicators_level USING btree (country_id);


--
-- TOC entry 3385 (class 1259 OID 20264)
-- Name: indicators_level_created_by_id_d7ce3e74; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_level_created_by_id_d7ce3e74 ON public.indicators_level USING btree (created_by_id);


--
-- TOC entry 3386 (class 1259 OID 19974)
-- Name: indicators_level_organization_id_04950d9e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_level_organization_id_04950d9e ON public.indicators_level USING btree (organization_id);


--
-- TOC entry 3389 (class 1259 OID 19980)
-- Name: indicators_level_workflowlevel1_id_c19bc1bc; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_level_workflowlevel1_id_c19bc1bc ON public.indicators_level USING btree (workflowlevel1_id);


--
-- TOC entry 3390 (class 1259 OID 20270)
-- Name: indicators_objective_created_by_id_0dce1901; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_objective_created_by_id_0dce1901 ON public.indicators_objective USING btree (created_by_id);


--
-- TOC entry 3393 (class 1259 OID 19962)
-- Name: indicators_objective_workflowlevel1_id_c6f39e35; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_objective_workflowlevel1_id_c6f39e35 ON public.indicators_objective USING btree (workflowlevel1_id);


--
-- TOC entry 3394 (class 1259 OID 19956)
-- Name: indicators_periodictarget_indicator_id_62876653; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_periodictarget_indicator_id_62876653 ON public.indicators_periodictarget USING btree (indicator_id);


--
-- TOC entry 3397 (class 1259 OID 19944)
-- Name: indicators_reportingperiod_frequency_id_976e9d48; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_reportingperiod_frequency_id_976e9d48 ON public.indicators_reportingperiod USING btree (frequency_id);


--
-- TOC entry 3398 (class 1259 OID 19950)
-- Name: indicators_reportingperiod_organization_id_2448625f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_reportingperiod_organization_id_2448625f ON public.indicators_reportingperiod USING btree (organization_id);


--
-- TOC entry 3401 (class 1259 OID 19932)
-- Name: indicators_strategicobjective_country_id_e7b84bfb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_strategicobjective_country_id_e7b84bfb ON public.indicators_strategicobjective USING btree (country_id);


--
-- TOC entry 3402 (class 1259 OID 19938)
-- Name: indicators_strategicobjective_organization_id_63473191; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_strategicobjective_organization_id_63473191 ON public.indicators_strategicobjective USING btree (organization_id);


--
-- TOC entry 3995 (class 1259 OID 19905)
-- Name: indicators_tolatable_country_country_id_29303999; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_tolatable_country_country_id_29303999 ON public.indicators_tolatable_country USING btree (country_id);


--
-- TOC entry 3998 (class 1259 OID 19904)
-- Name: indicators_tolatable_country_tolatable_id_948f959d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_tolatable_country_tolatable_id_948f959d ON public.indicators_tolatable_country USING btree (tolatable_id);


--
-- TOC entry 3405 (class 1259 OID 19906)
-- Name: indicators_tolatable_organization_id_c073449f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_tolatable_organization_id_c073449f ON public.indicators_tolatable USING btree (organization_id);


--
-- TOC entry 3406 (class 1259 OID 19912)
-- Name: indicators_tolatable_owner_id_40cf8506; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_tolatable_owner_id_40cf8506 ON public.indicators_tolatable USING btree (owner_id);


--
-- TOC entry 4003 (class 1259 OID 19930)
-- Name: indicators_tolatable_workflowlevel1_tolatable_id_88ff5b74; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_tolatable_workflowlevel1_tolatable_id_88ff5b74 ON public.indicators_tolatable_workflowlevel1 USING btree (tolatable_id);


--
-- TOC entry 4004 (class 1259 OID 19931)
-- Name: indicators_tolatable_workflowlevel1_workflowlevel1_id_18387ac6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX indicators_tolatable_workflowlevel1_workflowlevel1_id_18387ac6 ON public.indicators_tolatable_workflowlevel1 USING btree (workflowlevel1_id);


--
-- TOC entry 4061 (class 1259 OID 20704)
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- TOC entry 4064 (class 1259 OID 20624)
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- TOC entry 4067 (class 1259 OID 20560)
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- TOC entry 4053 (class 1259 OID 20543)
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- TOC entry 4056 (class 1259 OID 20544)
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- TOC entry 4057 (class 1259 OID 20545)
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- TOC entry 4060 (class 1259 OID 20546)
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- TOC entry 4068 (class 1259 OID 20692)
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- TOC entry 4069 (class 1259 OID 20627)
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- TOC entry 4074 (class 1259 OID 20574)
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- TOC entry 4077 (class 1259 OID 20716)
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- TOC entry 4080 (class 1259 OID 20630)
-- Name: oauth2_provider_refreshtoken_token_d090daa4_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_refreshtoken_token_d090daa4_like ON public.oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);


--
-- TOC entry 4083 (class 1259 OID 20593)
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- TOC entry 4094 (class 1259 OID 20939)
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- TOC entry 4095 (class 1259 OID 20940)
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- TOC entry 4100 (class 1259 OID 20979)
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- TOC entry 4112 (class 1259 OID 20990)
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- TOC entry 4113 (class 1259 OID 20969)
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- TOC entry 4114 (class 1259 OID 20970)
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- TOC entry 4109 (class 1259 OID 20946)
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- TOC entry 3409 (class 1259 OID 18651)
-- Name: workflow_adminlevelfour_adminlevelthree_id_97ba2aff; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_adminlevelfour_adminlevelthree_id_97ba2aff ON public.workflow_adminlevelfour USING btree (adminlevelthree_id);


--
-- TOC entry 3410 (class 1259 OID 18657)
-- Name: workflow_adminlevelfour_adminleveltwo_id_07255ef4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_adminlevelfour_adminleveltwo_id_07255ef4 ON public.workflow_adminlevelfour USING btree (adminleveltwo_id);


--
-- TOC entry 3413 (class 1259 OID 18645)
-- Name: workflow_adminlevelone_country_id_e5ad8503; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_adminlevelone_country_id_e5ad8503 ON public.workflow_adminlevelone USING btree (country_id);


--
-- TOC entry 3416 (class 1259 OID 18639)
-- Name: workflow_adminlevelthree_adminleveltwo_id_2a86be7c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_adminlevelthree_adminleveltwo_id_2a86be7c ON public.workflow_adminlevelthree USING btree (adminleveltwo_id);


--
-- TOC entry 3419 (class 1259 OID 17589)
-- Name: workflow_adminleveltwo_adminlevelone_id_98b1430f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_adminleveltwo_adminlevelone_id_98b1430f ON public.workflow_adminleveltwo USING btree (adminlevelone_id);


--
-- TOC entry 3422 (class 1259 OID 18633)
-- Name: workflow_approvaltype_organization_id_6eaaf76a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_approvaltype_organization_id_6eaaf76a ON public.workflow_approvaltype USING btree (organization_id);


--
-- TOC entry 3425 (class 1259 OID 17595)
-- Name: workflow_approvalworkflow_approval_type_id_9da43db2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_approvalworkflow_approval_type_id_9da43db2 ON public.workflow_approvalworkflow USING btree (approval_type_id);


--
-- TOC entry 3426 (class 1259 OID 18621)
-- Name: workflow_approvalworkflow_assigned_to_id_083e8782; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_approvalworkflow_assigned_to_id_083e8782 ON public.workflow_approvalworkflow USING btree (assigned_to_id);


--
-- TOC entry 3427 (class 1259 OID 18670)
-- Name: workflow_approvalworkflow_created_by_id_0854bf0a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_approvalworkflow_created_by_id_0854bf0a ON public.workflow_approvalworkflow USING btree (created_by_id);


--
-- TOC entry 3430 (class 1259 OID 18627)
-- Name: workflow_approvalworkflow_requested_from_id_fc25b0df; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_approvalworkflow_requested_from_id_fc25b0df ON public.workflow_approvalworkflow USING btree (requested_from_id);


--
-- TOC entry 3431 (class 1259 OID 18575)
-- Name: workflow_award_award_currency_id_4e3398dc; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_award_award_currency_id_4e3398dc ON public.workflow_award USING btree (award_currency_id);


--
-- TOC entry 3863 (class 1259 OID 18593)
-- Name: workflow_award_countries_award_id_a394de2f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_award_countries_award_id_a394de2f ON public.workflow_award_countries USING btree (award_id);


--
-- TOC entry 3866 (class 1259 OID 18594)
-- Name: workflow_award_countries_country_id_1a0d4825; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_award_countries_country_id_1a0d4825 ON public.workflow_award_countries USING btree (country_id);


--
-- TOC entry 3432 (class 1259 OID 18595)
-- Name: workflow_award_currency_id_4f867437; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_award_currency_id_4f867437 ON public.workflow_award USING btree (currency_id);


--
-- TOC entry 3869 (class 1259 OID 18613)
-- Name: workflow_award_donors_award_id_8b79077b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_award_donors_award_id_8b79077b ON public.workflow_award_donors USING btree (award_id);


--
-- TOC entry 3874 (class 1259 OID 18614)
-- Name: workflow_award_donors_stakeholder_id_3fec3462; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_award_donors_stakeholder_id_3fec3462 ON public.workflow_award_donors USING btree (stakeholder_id);


--
-- TOC entry 3433 (class 1259 OID 18615)
-- Name: workflow_award_organization_id_19140a57; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_award_organization_id_19140a57 ON public.workflow_award USING btree (organization_id);


--
-- TOC entry 3436 (class 1259 OID 18676)
-- Name: workflow_budget_created_by_id_d47e7967; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_budget_created_by_id_d47e7967 ON public.workflow_budget USING btree (created_by_id);


--
-- TOC entry 3437 (class 1259 OID 18557)
-- Name: workflow_budget_donor_currency_id_38f271ae; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_budget_donor_currency_id_38f271ae ON public.workflow_budget USING btree (donor_currency_id);


--
-- TOC entry 3438 (class 1259 OID 18563)
-- Name: workflow_budget_local_currency_id_eacbc6ca; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_budget_local_currency_id_eacbc6ca ON public.workflow_budget USING btree (local_currency_id);


--
-- TOC entry 3441 (class 1259 OID 18569)
-- Name: workflow_budget_workflowlevel2_id_6781df6b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_budget_workflowlevel2_id_6781df6b ON public.workflow_budget USING btree (workflowlevel2_id);


--
-- TOC entry 3442 (class 1259 OID 18539)
-- Name: workflow_checklist_country_id_0a47562e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_checklist_country_id_0a47562e ON public.workflow_checklist USING btree (country_id);


--
-- TOC entry 3443 (class 1259 OID 18545)
-- Name: workflow_checklist_owner_id_f07e4591; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_checklist_owner_id_f07e4591 ON public.workflow_checklist USING btree (owner_id);


--
-- TOC entry 3446 (class 1259 OID 18551)
-- Name: workflow_checklist_workflowlevel2_id_9c24dffd; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_checklist_workflowlevel2_id_9c24dffd ON public.workflow_checklist USING btree (workflowlevel2_id);


--
-- TOC entry 3447 (class 1259 OID 17601)
-- Name: workflow_checklistitem_checklist_id_83c88aea; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_checklistitem_checklist_id_83c88aea ON public.workflow_checklistitem USING btree (checklist_id);


--
-- TOC entry 3448 (class 1259 OID 18533)
-- Name: workflow_checklistitem_owner_id_1f74df76; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_checklistitem_owner_id_1f74df76 ON public.workflow_checklistitem USING btree (owner_id);


--
-- TOC entry 3451 (class 1259 OID 18499)
-- Name: workflow_codedfield_organization_id_bda5b30a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_codedfield_organization_id_bda5b30a ON public.workflow_codedfield USING btree (organization_id);


--
-- TOC entry 3853 (class 1259 OID 18517)
-- Name: workflow_codedfield_workflowlevel1_codedfield_id_224fd866; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_codedfield_workflowlevel1_codedfield_id_224fd866 ON public.workflow_codedfield_workflowlevel1 USING btree (codedfield_id);


--
-- TOC entry 3856 (class 1259 OID 18518)
-- Name: workflow_codedfield_workflowlevel1_workflowlevel1_id_3b2cc5cf; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_codedfield_workflowlevel1_workflowlevel1_id_3b2cc5cf ON public.workflow_codedfield_workflowlevel1 USING btree (workflowlevel1_id);


--
-- TOC entry 3859 (class 1259 OID 18531)
-- Name: workflow_codedfield_workflowlevel2_codedfield_id_fa4b871f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_codedfield_workflowlevel2_codedfield_id_fa4b871f ON public.workflow_codedfield_workflowlevel2 USING btree (codedfield_id);


--
-- TOC entry 3862 (class 1259 OID 18532)
-- Name: workflow_codedfield_workflowlevel2_workflowlevel2_id_4c7ba087; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_codedfield_workflowlevel2_workflowlevel2_id_4c7ba087 ON public.workflow_codedfield_workflowlevel2 USING btree (workflowlevel2_id);


--
-- TOC entry 3454 (class 1259 OID 17607)
-- Name: workflow_codedfieldvalues_coded_field_id_388efcf1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_codedfieldvalues_coded_field_id_388efcf1 ON public.workflow_codedfieldvalues USING btree (coded_field_id);


--
-- TOC entry 3457 (class 1259 OID 18493)
-- Name: workflow_codedfieldvalues_workflowlevel2_id_1c35be5f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_codedfieldvalues_workflowlevel2_id_1c35be5f ON public.workflow_codedfieldvalues USING btree (workflowlevel2_id);


--
-- TOC entry 3458 (class 1259 OID 18475)
-- Name: workflow_contact_country_id_2a98aac0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_contact_country_id_2a98aac0 ON public.workflow_contact USING btree (country_id);


--
-- TOC entry 3459 (class 1259 OID 18481)
-- Name: workflow_contact_organization_id_b549ef1e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_contact_organization_id_b549ef1e ON public.workflow_contact USING btree (organization_id);


--
-- TOC entry 3462 (class 1259 OID 18487)
-- Name: workflow_contact_workflowlevel1_id_cb88a6d2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_contact_workflowlevel1_id_cb88a6d2 ON public.workflow_contact USING btree (workflowlevel1_id);


--
-- TOC entry 3884 (class 1259 OID 18874)
-- Name: workflow_dashboard_share_dashboard_id_857b9a30; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_dashboard_share_dashboard_id_857b9a30 ON public.workflow_dashboard_share USING btree (dashboard_id);


--
-- TOC entry 3889 (class 1259 OID 18875)
-- Name: workflow_dashboard_share_tolauser_id_1dd62bf3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_dashboard_share_tolauser_id_1dd62bf3 ON public.workflow_dashboard_share USING btree (tolauser_id);


--
-- TOC entry 3883 (class 1259 OID 18861)
-- Name: workflow_dashboard_user_id_18f3de53; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_dashboard_user_id_18f3de53 ON public.workflow_dashboard USING btree (user_id);


--
-- TOC entry 3892 (class 1259 OID 18888)
-- Name: workflow_dashboard_widgets_dashboard_id_e5a96dde; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_dashboard_widgets_dashboard_id_e5a96dde ON public.workflow_dashboard_widgets USING btree (dashboard_id);


--
-- TOC entry 3897 (class 1259 OID 18889)
-- Name: workflow_dashboard_widgets_widget_id_8f401d09; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_dashboard_widgets_widget_id_8f401d09 ON public.workflow_dashboard_widgets USING btree (widget_id);


--
-- TOC entry 3467 (class 1259 OID 18682)
-- Name: workflow_documentation_created_by_id_416b8134; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_documentation_created_by_id_416b8134 ON public.workflow_documentation USING btree (created_by_id);


--
-- TOC entry 3468 (class 1259 OID 17608)
-- Name: workflow_documentation_document_uuid_45728dfd_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_documentation_document_uuid_45728dfd_like ON public.workflow_documentation USING btree (document_uuid varchar_pattern_ops);


--
-- TOC entry 3473 (class 1259 OID 18463)
-- Name: workflow_documentation_workflowlevel1_id_b907cc3a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_documentation_workflowlevel1_id_b907cc3a ON public.workflow_documentation USING btree (workflowlevel1_id);


--
-- TOC entry 3474 (class 1259 OID 18469)
-- Name: workflow_documentation_workflowlevel2_id_d5e7926a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_documentation_workflowlevel2_id_d5e7926a ON public.workflow_documentation USING btree (workflowlevel2_id);


--
-- TOC entry 3475 (class 1259 OID 18457)
-- Name: workflow_formguidance_organization_id_bd09f555; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_formguidance_organization_id_bd09f555 ON public.workflow_formguidance USING btree (organization_id);


--
-- TOC entry 3478 (class 1259 OID 18451)
-- Name: workflow_fundcode_organization_id_afd34157; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_fundcode_organization_id_afd34157 ON public.workflow_fundcode USING btree (organization_id);


--
-- TOC entry 3481 (class 1259 OID 18688)
-- Name: workflow_historicalbudget_created_by_id_dc40f681; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalbudget_created_by_id_dc40f681 ON public.workflow_historicalbudget USING btree (created_by_id);


--
-- TOC entry 3482 (class 1259 OID 17615)
-- Name: workflow_historicalbudget_donor_currency_id_a0c3c625; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalbudget_donor_currency_id_a0c3c625 ON public.workflow_historicalbudget USING btree (donor_currency_id);


--
-- TOC entry 3483 (class 1259 OID 17616)
-- Name: workflow_historicalbudget_history_user_id_8fd07dcf; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalbudget_history_user_id_8fd07dcf ON public.workflow_historicalbudget USING btree (history_user_id);


--
-- TOC entry 3484 (class 1259 OID 17614)
-- Name: workflow_historicalbudget_id_13b66f80; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalbudget_id_13b66f80 ON public.workflow_historicalbudget USING btree (id);


--
-- TOC entry 3485 (class 1259 OID 17617)
-- Name: workflow_historicalbudget_local_currency_id_21c62a89; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalbudget_local_currency_id_21c62a89 ON public.workflow_historicalbudget USING btree (local_currency_id);


--
-- TOC entry 3488 (class 1259 OID 18450)
-- Name: workflow_historicalbudget_workflowlevel2_id_885e3b17; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalbudget_workflowlevel2_id_885e3b17 ON public.workflow_historicalbudget USING btree (workflowlevel2_id);


--
-- TOC entry 3489 (class 1259 OID 18441)
-- Name: workflow_historicalissueregister_assigned_id_8a5afa9b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalissueregister_assigned_id_8a5afa9b ON public.workflow_historicalissueregister USING btree (assigned_id);


--
-- TOC entry 3490 (class 1259 OID 18442)
-- Name: workflow_historicalissueregister_history_user_id_8efec5d6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalissueregister_history_user_id_8efec5d6 ON public.workflow_historicalissueregister USING btree (history_user_id);


--
-- TOC entry 3491 (class 1259 OID 17618)
-- Name: workflow_historicalissueregister_id_1f9e76aa; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalissueregister_id_1f9e76aa ON public.workflow_historicalissueregister USING btree (id);


--
-- TOC entry 3492 (class 1259 OID 18448)
-- Name: workflow_historicalissueregister_organization_id_3e9afb9d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalissueregister_organization_id_3e9afb9d ON public.workflow_historicalissueregister USING btree (organization_id);


--
-- TOC entry 3495 (class 1259 OID 18449)
-- Name: workflow_historicalissueregister_workflowlevel2_id_301e1fb2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalissueregister_workflowlevel2_id_301e1fb2 ON public.workflow_historicalissueregister USING btree (workflowlevel2_id);


--
-- TOC entry 3496 (class 1259 OID 17625)
-- Name: workflow_historicalriskregister_history_user_id_6047c791; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalriskregister_history_user_id_6047c791 ON public.workflow_historicalriskregister USING btree (history_user_id);


--
-- TOC entry 3497 (class 1259 OID 17624)
-- Name: workflow_historicalriskregister_id_5bbcfd4d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalriskregister_id_5bbcfd4d ON public.workflow_historicalriskregister USING btree (id);


--
-- TOC entry 3500 (class 1259 OID 18440)
-- Name: workflow_historicalriskregister_workflowlevel2_id_4ee343c3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalriskregister_workflowlevel2_id_4ee343c3 ON public.workflow_historicalriskregister USING btree (workflowlevel2_id);


--
-- TOC entry 3501 (class 1259 OID 17629)
-- Name: workflow_historicalsiteprofile_admin_level_three_id_c8c83230; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_admin_level_three_id_c8c83230 ON public.workflow_historicalsiteprofile USING btree (admin_level_three_id);


--
-- TOC entry 3502 (class 1259 OID 18427)
-- Name: workflow_historicalsiteprofile_classify_land_id_de4109b6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_classify_land_id_de4109b6 ON public.workflow_historicalsiteprofile USING btree (classify_land_id);


--
-- TOC entry 3503 (class 1259 OID 18428)
-- Name: workflow_historicalsiteprofile_country_id_31633699; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_country_id_31633699 ON public.workflow_historicalsiteprofile USING btree (country_id);


--
-- TOC entry 3504 (class 1259 OID 18689)
-- Name: workflow_historicalsiteprofile_created_by_id_bc485553; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_created_by_id_bc485553 ON public.workflow_historicalsiteprofile USING btree (created_by_id);


--
-- TOC entry 3505 (class 1259 OID 18429)
-- Name: workflow_historicalsiteprofile_district_id_88ec10a6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_district_id_88ec10a6 ON public.workflow_historicalsiteprofile USING btree (district_id);


--
-- TOC entry 3506 (class 1259 OID 18430)
-- Name: workflow_historicalsiteprofile_history_user_id_7f6a2913; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_history_user_id_7f6a2913 ON public.workflow_historicalsiteprofile USING btree (history_user_id);


--
-- TOC entry 3507 (class 1259 OID 17626)
-- Name: workflow_historicalsiteprofile_id_b58ceb84; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_id_b58ceb84 ON public.workflow_historicalsiteprofile USING btree (id);


--
-- TOC entry 3508 (class 1259 OID 18436)
-- Name: workflow_historicalsiteprofile_office_id_d8fb71a5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_office_id_d8fb71a5 ON public.workflow_historicalsiteprofile USING btree (office_id);


--
-- TOC entry 3509 (class 1259 OID 18663)
-- Name: workflow_historicalsiteprofile_organization_id_ca6ea588; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_organization_id_ca6ea588 ON public.workflow_historicalsiteprofile USING btree (organization_id);


--
-- TOC entry 3512 (class 1259 OID 18437)
-- Name: workflow_historicalsiteprofile_province_id_851655ef; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_province_id_851655ef ON public.workflow_historicalsiteprofile USING btree (province_id);


--
-- TOC entry 3513 (class 1259 OID 17627)
-- Name: workflow_historicalsiteprofile_site_uuid_3c96622c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_site_uuid_3c96622c ON public.workflow_historicalsiteprofile USING btree (site_uuid);


--
-- TOC entry 3514 (class 1259 OID 17628)
-- Name: workflow_historicalsiteprofile_site_uuid_3c96622c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_site_uuid_3c96622c_like ON public.workflow_historicalsiteprofile USING btree (site_uuid varchar_pattern_ops);


--
-- TOC entry 3515 (class 1259 OID 18438)
-- Name: workflow_historicalsiteprofile_type_id_637d0341; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_type_id_637d0341 ON public.workflow_historicalsiteprofile USING btree (type_id);


--
-- TOC entry 3516 (class 1259 OID 18439)
-- Name: workflow_historicalsiteprofile_village_id_220915f0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalsiteprofile_village_id_220915f0 ON public.workflow_historicalsiteprofile USING btree (village_id);


--
-- TOC entry 3517 (class 1259 OID 18690)
-- Name: workflow_historicalworkflowlevel2_created_by_id_c12bc7f4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_created_by_id_c12bc7f4 ON public.workflow_historicalworkflowlevel2 USING btree (created_by_id);


--
-- TOC entry 3518 (class 1259 OID 17638)
-- Name: workflow_historicalworkflowlevel2_donor_currency_id_8d54ff8b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_donor_currency_id_8d54ff8b ON public.workflow_historicalworkflowlevel2 USING btree (donor_currency_id);


--
-- TOC entry 3519 (class 1259 OID 17639)
-- Name: workflow_historicalworkflowlevel2_history_user_id_82c5635b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_history_user_id_82c5635b ON public.workflow_historicalworkflowlevel2 USING btree (history_user_id);


--
-- TOC entry 3520 (class 1259 OID 17635)
-- Name: workflow_historicalworkflowlevel2_id_c1635c78; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_id_c1635c78 ON public.workflow_historicalworkflowlevel2 USING btree (id);


--
-- TOC entry 3521 (class 1259 OID 17636)
-- Name: workflow_historicalworkflowlevel2_level2_uuid_74d5913d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_level2_uuid_74d5913d ON public.workflow_historicalworkflowlevel2 USING btree (level2_uuid);


--
-- TOC entry 3522 (class 1259 OID 17637)
-- Name: workflow_historicalworkflowlevel2_level2_uuid_74d5913d_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_level2_uuid_74d5913d_like ON public.workflow_historicalworkflowlevel2 USING btree (level2_uuid varchar_pattern_ops);


--
-- TOC entry 3523 (class 1259 OID 17640)
-- Name: workflow_historicalworkflowlevel2_local_currency_id_0329c190; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_local_currency_id_0329c190 ON public.workflow_historicalworkflowlevel2 USING btree (local_currency_id);


--
-- TOC entry 3524 (class 1259 OID 18422)
-- Name: workflow_historicalworkflowlevel2_milestone_id_531b29a0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_milestone_id_531b29a0 ON public.workflow_historicalworkflowlevel2 USING btree (milestone_id);


--
-- TOC entry 3525 (class 1259 OID 18423)
-- Name: workflow_historicalworkflowlevel2_office_id_68583017; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_office_id_68583017 ON public.workflow_historicalworkflowlevel2 USING btree (office_id);


--
-- TOC entry 3528 (class 1259 OID 18425)
-- Name: workflow_historicalworkflowlevel2_sector_id_b1b965b8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_sector_id_b1b965b8 ON public.workflow_historicalworkflowlevel2 USING btree (sector_id);


--
-- TOC entry 3529 (class 1259 OID 18797)
-- Name: workflow_historicalworkflowlevel2_staff_responsible_id_80f3a732; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_staff_responsible_id_80f3a732 ON public.workflow_historicalworkflowlevel2 USING btree (staff_responsible_id);


--
-- TOC entry 3530 (class 1259 OID 18426)
-- Name: workflow_historicalworkflowlevel2_workflowlevel1_id_1c597cfe; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_historicalworkflowlevel2_workflowlevel1_id_1c597cfe ON public.workflow_historicalworkflowlevel2 USING btree (workflowlevel1_id);


--
-- TOC entry 3535 (class 1259 OID 18404)
-- Name: workflow_issueregister_assigned_id_a69494ac; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_issueregister_assigned_id_a69494ac ON public.workflow_issueregister USING btree (assigned_id);


--
-- TOC entry 3536 (class 1259 OID 18410)
-- Name: workflow_issueregister_organization_id_81386851; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_issueregister_organization_id_81386851 ON public.workflow_issueregister USING btree (organization_id);


--
-- TOC entry 3539 (class 1259 OID 18416)
-- Name: workflow_issueregister_workflowlevel2_id_a8196cc3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_issueregister_workflowlevel2_id_a8196cc3 ON public.workflow_issueregister USING btree (workflowlevel2_id);


--
-- TOC entry 3540 (class 1259 OID 18398)
-- Name: workflow_landtype_organization_id_cdb713ac; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_landtype_organization_id_cdb713ac ON public.workflow_landtype USING btree (organization_id);


--
-- TOC entry 3543 (class 1259 OID 18691)
-- Name: workflow_milestone_created_by_id_93866c38; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_milestone_created_by_id_93866c38 ON public.workflow_milestone USING btree (created_by_id);


--
-- TOC entry 3544 (class 1259 OID 18392)
-- Name: workflow_milestone_organization_id_385ee550; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_milestone_organization_id_385ee550 ON public.workflow_milestone USING btree (organization_id);


--
-- TOC entry 3547 (class 1259 OID 17646)
-- Name: workflow_office_country_id_b6502b75; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_office_country_id_b6502b75 ON public.workflow_office USING btree (country_id);


--
-- TOC entry 3550 (class 1259 OID 19126)
-- Name: workflow_organization_default_currency_id_ef8cfa51; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_organization_default_currency_id_ef8cfa51 ON public.workflow_organization USING btree (default_currency_id);


--
-- TOC entry 3558 (class 1259 OID 17661)
-- Name: workflow_organization_industry_industry_id_79eb4781; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_organization_industry_industry_id_79eb4781 ON public.workflow_organization_industry USING btree (industry_id);


--
-- TOC entry 3559 (class 1259 OID 17660)
-- Name: workflow_organization_industry_organization_id_5346494c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_organization_industry_organization_id_5346494c ON public.workflow_organization_industry USING btree (organization_id);


--
-- TOC entry 3551 (class 1259 OID 17647)
-- Name: workflow_organization_organization_uuid_d991dfcf_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_organization_organization_uuid_d991dfcf_like ON public.workflow_organization USING btree (organization_uuid varchar_pattern_ops);


--
-- TOC entry 3847 (class 1259 OID 18390)
-- Name: workflow_organization_sector_organization_id_3dc909a9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_organization_sector_organization_id_3dc909a9 ON public.workflow_organization_sector USING btree (organization_id);


--
-- TOC entry 3850 (class 1259 OID 18391)
-- Name: workflow_organization_sector_sector_id_b35395c9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_organization_sector_sector_id_b35395c9 ON public.workflow_organization_sector USING btree (sector_id);


--
-- TOC entry 3572 (class 1259 OID 17688)
-- Name: workflow_partner_approval_approvalworkflow_id_98f406a9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_approval_approvalworkflow_id_98f406a9 ON public.workflow_partner_approval USING btree (approvalworkflow_id);


--
-- TOC entry 3573 (class 1259 OID 17687)
-- Name: workflow_partner_approval_partner_id_66906ed4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_approval_partner_id_66906ed4 ON public.workflow_partner_approval USING btree (partner_id);


--
-- TOC entry 3576 (class 1259 OID 17702)
-- Name: workflow_partner_contact_contact_id_d5a6b82c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_contact_contact_id_d5a6b82c ON public.workflow_partner_contact USING btree (contact_id);


--
-- TOC entry 3577 (class 1259 OID 17701)
-- Name: workflow_partner_contact_partner_id_a2d9b0ab; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_contact_partner_id_a2d9b0ab ON public.workflow_partner_contact USING btree (partner_id);


--
-- TOC entry 3562 (class 1259 OID 17673)
-- Name: workflow_partner_country_id_aaa1e137; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_country_id_aaa1e137 ON public.workflow_partner USING btree (country_id);


--
-- TOC entry 3563 (class 1259 OID 17674)
-- Name: workflow_partner_organization_id_1987ea04; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_organization_id_1987ea04 ON public.workflow_partner USING btree (organization_id);


--
-- TOC entry 3564 (class 1259 OID 17672)
-- Name: workflow_partner_partners_uuid_d972eb68_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_partners_uuid_d972eb68_like ON public.workflow_partner USING btree (partners_uuid varchar_pattern_ops);


--
-- TOC entry 3833 (class 1259 OID 18356)
-- Name: workflow_partner_sectors_partner_id_ec9649d8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_sectors_partner_id_ec9649d8 ON public.workflow_partner_sectors USING btree (partner_id);


--
-- TOC entry 3838 (class 1259 OID 18357)
-- Name: workflow_partner_sectors_sector_id_8ab31f70; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_sectors_sector_id_8ab31f70 ON public.workflow_partner_sectors USING btree (sector_id);


--
-- TOC entry 3569 (class 1259 OID 18358)
-- Name: workflow_partner_type_id_13463e58; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_type_id_13463e58 ON public.workflow_partner USING btree (type_id);


--
-- TOC entry 3841 (class 1259 OID 18376)
-- Name: workflow_partner_workflowlevel1_partner_id_645be5d0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_workflowlevel1_partner_id_645be5d0 ON public.workflow_partner_workflowlevel1 USING btree (partner_id);


--
-- TOC entry 3844 (class 1259 OID 18377)
-- Name: workflow_partner_workflowlevel1_workflowlevel1_id_5c7334c5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_partner_workflowlevel1_workflowlevel1_id_5c7334c5 ON public.workflow_partner_workflowlevel1 USING btree (workflowlevel1_id);


--
-- TOC entry 3587 (class 1259 OID 17722)
-- Name: workflow_portfolio_country_country_id_cc3a4038; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_portfolio_country_country_id_cc3a4038 ON public.workflow_portfolio_country USING btree (country_id);


--
-- TOC entry 3590 (class 1259 OID 17721)
-- Name: workflow_portfolio_country_portfolio_id_e7f13fdd; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_portfolio_country_portfolio_id_e7f13fdd ON public.workflow_portfolio_country USING btree (portfolio_id);


--
-- TOC entry 3582 (class 1259 OID 17708)
-- Name: workflow_portfolio_organization_id_1afb1fbb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_portfolio_organization_id_1afb1fbb ON public.workflow_portfolio USING btree (organization_id);


--
-- TOC entry 4117 (class 1259 OID 21059)
-- Name: workflow_product_workflowlevel2_id_83634618; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_product_workflowlevel2_id_83634618 ON public.workflow_product USING btree (workflowlevel2_id);


--
-- TOC entry 3591 (class 1259 OID 17728)
-- Name: workflow_profiletype_organization_id_e74d5ee6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_profiletype_organization_id_e74d5ee6 ON public.workflow_profiletype USING btree (organization_id);


--
-- TOC entry 3594 (class 1259 OID 17734)
-- Name: workflow_projecttype_organization_id_7711701e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_projecttype_organization_id_7711701e ON public.workflow_projecttype USING btree (organization_id);


--
-- TOC entry 3599 (class 1259 OID 18338)
-- Name: workflow_riskregister_workflowlevel2_id_a1338b66; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_riskregister_workflowlevel2_id_a1338b66 ON public.workflow_riskregister USING btree (workflowlevel2_id);


--
-- TOC entry 3600 (class 1259 OID 18697)
-- Name: workflow_sector_created_by_id_0183e620; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_sector_created_by_id_0183e620 ON public.workflow_sector USING btree (created_by_id);


--
-- TOC entry 3601 (class 1259 OID 17740)
-- Name: workflow_sector_organization_id_57ac6345; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_sector_organization_id_57ac6345 ON public.workflow_sector USING btree (organization_id);


--
-- TOC entry 3604 (class 1259 OID 17756)
-- Name: workflow_sectorrelated_organization_id_e7b5d267; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_sectorrelated_organization_id_e7b5d267 ON public.workflow_sectorrelated USING btree (organization_id);


--
-- TOC entry 3607 (class 1259 OID 17757)
-- Name: workflow_sectorrelated_sector_id_cb8bcffc; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_sectorrelated_sector_id_cb8bcffc ON public.workflow_sectorrelated USING btree (sector_id);


--
-- TOC entry 3608 (class 1259 OID 17758)
-- Name: workflow_sectorrelated_sector_related_id_af3af2e4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_sectorrelated_sector_related_id_af3af2e4 ON public.workflow_sectorrelated USING btree (sector_related_id);


--
-- TOC entry 3609 (class 1259 OID 17800)
-- Name: workflow_siteprofile_admin_level_three_id_1e389391; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_admin_level_three_id_1e389391 ON public.workflow_siteprofile USING btree (admin_level_three_id);


--
-- TOC entry 3626 (class 1259 OID 17821)
-- Name: workflow_siteprofile_approval_approvalworkflow_id_fcff2b65; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_approval_approvalworkflow_id_fcff2b65 ON public.workflow_siteprofile_approval USING btree (approvalworkflow_id);


--
-- TOC entry 3629 (class 1259 OID 17820)
-- Name: workflow_siteprofile_approval_siteprofile_id_be2b5c63; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_approval_siteprofile_id_be2b5c63 ON public.workflow_siteprofile_approval USING btree (siteprofile_id);


--
-- TOC entry 3610 (class 1259 OID 17801)
-- Name: workflow_siteprofile_classify_land_id_289b3a44; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_classify_land_id_289b3a44 ON public.workflow_siteprofile USING btree (classify_land_id);


--
-- TOC entry 3611 (class 1259 OID 17802)
-- Name: workflow_siteprofile_country_id_f3d247df; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_country_id_f3d247df ON public.workflow_siteprofile USING btree (country_id);


--
-- TOC entry 3612 (class 1259 OID 18703)
-- Name: workflow_siteprofile_created_by_id_477746c2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_created_by_id_477746c2 ON public.workflow_siteprofile USING btree (created_by_id);


--
-- TOC entry 3613 (class 1259 OID 17803)
-- Name: workflow_siteprofile_district_id_a0584a32; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_district_id_a0584a32 ON public.workflow_siteprofile USING btree (district_id);


--
-- TOC entry 3614 (class 1259 OID 17804)
-- Name: workflow_siteprofile_office_id_fee52fdb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_office_id_fee52fdb ON public.workflow_siteprofile USING btree (office_id);


--
-- TOC entry 3615 (class 1259 OID 18664)
-- Name: workflow_siteprofile_organization_id_287db2d8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_organization_id_287db2d8 ON public.workflow_siteprofile USING btree (organization_id);


--
-- TOC entry 3618 (class 1259 OID 17805)
-- Name: workflow_siteprofile_province_id_c839dda9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_province_id_c839dda9 ON public.workflow_siteprofile USING btree (province_id);


--
-- TOC entry 3619 (class 1259 OID 17799)
-- Name: workflow_siteprofile_site_uuid_7c007fd7_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_site_uuid_7c007fd7_like ON public.workflow_siteprofile USING btree (site_uuid varchar_pattern_ops);


--
-- TOC entry 3622 (class 1259 OID 17806)
-- Name: workflow_siteprofile_type_id_ce84e091; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_type_id_ce84e091 ON public.workflow_siteprofile USING btree (type_id);


--
-- TOC entry 3623 (class 1259 OID 17807)
-- Name: workflow_siteprofile_village_id_d81c342b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_village_id_d81c342b ON public.workflow_siteprofile USING btree (village_id);


--
-- TOC entry 3879 (class 1259 OID 18776)
-- Name: workflow_siteprofile_workflowlevel1_siteprofile_id_2cbbc8cc; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_workflowlevel1_siteprofile_id_2cbbc8cc ON public.workflow_siteprofile_workflowlevel1 USING btree (siteprofile_id);


--
-- TOC entry 3880 (class 1259 OID 18777)
-- Name: workflow_siteprofile_workflowlevel1_workflowlevel1_id_28be3815; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_siteprofile_workflowlevel1_workflowlevel1_id_28be3815 ON public.workflow_siteprofile_workflowlevel1 USING btree (workflowlevel1_id);


--
-- TOC entry 3643 (class 1259 OID 17854)
-- Name: workflow_stakeholder_approval_approvalworkflow_id_9ed8e9ea; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_approval_approvalworkflow_id_9ed8e9ea ON public.workflow_stakeholder_approval USING btree (approvalworkflow_id);


--
-- TOC entry 3646 (class 1259 OID 17853)
-- Name: workflow_stakeholder_approval_stakeholder_id_1a0d9319; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_approval_stakeholder_id_1a0d9319 ON public.workflow_stakeholder_approval USING btree (stakeholder_id);


--
-- TOC entry 3649 (class 1259 OID 17868)
-- Name: workflow_stakeholder_contact_contact_id_a52d49b7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_contact_contact_id_a52d49b7 ON public.workflow_stakeholder_contact USING btree (contact_id);


--
-- TOC entry 3652 (class 1259 OID 17867)
-- Name: workflow_stakeholder_contact_stakeholder_id_859d3a6c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_contact_stakeholder_id_859d3a6c ON public.workflow_stakeholder_contact USING btree (stakeholder_id);


--
-- TOC entry 3630 (class 1259 OID 17838)
-- Name: workflow_stakeholder_country_id_7248058c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_country_id_7248058c ON public.workflow_stakeholder USING btree (country_id);


--
-- TOC entry 3631 (class 1259 OID 18709)
-- Name: workflow_stakeholder_created_by_id_dc258ea8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_created_by_id_dc258ea8 ON public.workflow_stakeholder USING btree (created_by_id);


--
-- TOC entry 3632 (class 1259 OID 17839)
-- Name: workflow_stakeholder_formal_relationship_document_id_d6ae8ee0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_formal_relationship_document_id_d6ae8ee0 ON public.workflow_stakeholder USING btree (formal_relationship_document_id);


--
-- TOC entry 3633 (class 1259 OID 17840)
-- Name: workflow_stakeholder_organization_id_55203489; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_organization_id_55203489 ON public.workflow_stakeholder USING btree (organization_id);


--
-- TOC entry 3657 (class 1259 OID 17882)
-- Name: workflow_stakeholder_sectors_sector_id_2b9eb58b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_sectors_sector_id_2b9eb58b ON public.workflow_stakeholder_sectors USING btree (sector_id);


--
-- TOC entry 3658 (class 1259 OID 17881)
-- Name: workflow_stakeholder_sectors_stakeholder_id_b87707c1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_sectors_stakeholder_id_b87707c1 ON public.workflow_stakeholder_sectors USING btree (stakeholder_id);


--
-- TOC entry 3636 (class 1259 OID 17837)
-- Name: workflow_stakeholder_stakeholder_uuid_763f655b_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_stakeholder_uuid_763f655b_like ON public.workflow_stakeholder USING btree (stakeholder_uuid varchar_pattern_ops);


--
-- TOC entry 3639 (class 1259 OID 18312)
-- Name: workflow_stakeholder_type_id_d3347ec3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_type_id_d3347ec3 ON public.workflow_stakeholder USING btree (type_id);


--
-- TOC entry 3640 (class 1259 OID 18318)
-- Name: workflow_stakeholder_vetting_document_id_422f8886; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_vetting_document_id_422f8886 ON public.workflow_stakeholder USING btree (vetting_document_id);


--
-- TOC entry 3831 (class 1259 OID 18336)
-- Name: workflow_stakeholder_workflowlevel1_stakeholder_id_08cb1c3a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_workflowlevel1_stakeholder_id_08cb1c3a ON public.workflow_stakeholder_workflowlevel1 USING btree (stakeholder_id);


--
-- TOC entry 3832 (class 1259 OID 18337)
-- Name: workflow_stakeholder_workflowlevel1_workflowlevel1_id_55fd6bdd; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholder_workflowlevel1_workflowlevel1_id_55fd6bdd ON public.workflow_stakeholder_workflowlevel1 USING btree (workflowlevel1_id);


--
-- TOC entry 3659 (class 1259 OID 17888)
-- Name: workflow_stakeholdertype_organization_id_dbc1672a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_stakeholdertype_organization_id_dbc1672a ON public.workflow_stakeholdertype USING btree (organization_id);


--
-- TOC entry 3664 (class 1259 OID 18300)
-- Name: workflow_tolabookmarks_user_id_8c465980; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolabookmarks_user_id_8c465980 ON public.workflow_tolabookmarks USING btree (user_id);


--
-- TOC entry 3665 (class 1259 OID 18306)
-- Name: workflow_tolabookmarks_workflowlevel1_id_f6c2fc28; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolabookmarks_workflowlevel1_id_f6c2fc28 ON public.workflow_tolabookmarks USING btree (workflowlevel1_id);


--
-- TOC entry 3668 (class 1259 OID 17894)
-- Name: workflow_tolasites_site_id_ff8ae7d0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolasites_site_id_ff8ae7d0 ON public.workflow_tolasites USING btree (site_id);


--
-- TOC entry 3680 (class 1259 OID 17926)
-- Name: workflow_tolauser_countries_country_id_ecb2dd72; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauser_countries_country_id_ecb2dd72 ON public.workflow_tolauser_countries USING btree (country_id);


--
-- TOC entry 3683 (class 1259 OID 17925)
-- Name: workflow_tolauser_countries_tolauser_id_a9a6268a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauser_countries_tolauser_id_a9a6268a ON public.workflow_tolauser_countries USING btree (tolauser_id);


--
-- TOC entry 3669 (class 1259 OID 17911)
-- Name: workflow_tolauser_country_id_6e7e0398; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauser_country_id_6e7e0398 ON public.workflow_tolauser USING btree (country_id);


--
-- TOC entry 3670 (class 1259 OID 17912)
-- Name: workflow_tolauser_organization_id_30fffd3d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauser_organization_id_30fffd3d ON public.workflow_tolauser USING btree (organization_id);


--
-- TOC entry 3673 (class 1259 OID 17910)
-- Name: workflow_tolauser_tola_user_uuid_88d1ed36_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauser_tola_user_uuid_88d1ed36_like ON public.workflow_tolauser USING btree (tola_user_uuid varchar_pattern_ops);


--
-- TOC entry 3689 (class 1259 OID 17945)
-- Name: workflow_tolauserfilter_co_tolauserfilter_id_a6f55884; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauserfilter_co_tolauserfilter_id_a6f55884 ON public.workflow_tolauserfilter_country_filter USING btree (tolauserfilter_id);


--
-- TOC entry 3690 (class 1259 OID 17946)
-- Name: workflow_tolauserfilter_country_filter_country_id_b6be5c62; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauserfilter_country_filter_country_id_b6be5c62 ON public.workflow_tolauserfilter_country_filter USING btree (country_id);


--
-- TOC entry 3695 (class 1259 OID 17959)
-- Name: workflow_tolauserfilter_se_tolauserfilter_id_de351530; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauserfilter_se_tolauserfilter_id_de351530 ON public.workflow_tolauserfilter_sector_filter USING btree (tolauserfilter_id);


--
-- TOC entry 3698 (class 1259 OID 17960)
-- Name: workflow_tolauserfilter_sector_filter_sector_id_ff15b829; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauserfilter_sector_filter_sector_id_ff15b829 ON public.workflow_tolauserfilter_sector_filter USING btree (sector_id);


--
-- TOC entry 3686 (class 1259 OID 17932)
-- Name: workflow_tolauserfilter_user_id_f0a2cdd1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauserfilter_user_id_f0a2cdd1 ON public.workflow_tolauserfilter USING btree (user_id);


--
-- TOC entry 3823 (class 1259 OID 18298)
-- Name: workflow_tolauserfilter_wo_tolauserfilter_id_2fd8bfb0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauserfilter_wo_tolauserfilter_id_2fd8bfb0 ON public.workflow_tolauserfilter_workflowlevel2_filter USING btree (tolauserfilter_id);


--
-- TOC entry 3817 (class 1259 OID 18284)
-- Name: workflow_tolauserfilter_wo_tolauserfilter_id_b6a0ec07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauserfilter_wo_tolauserfilter_id_b6a0ec07 ON public.workflow_tolauserfilter_workflowlevel1_filter USING btree (tolauserfilter_id);


--
-- TOC entry 3818 (class 1259 OID 18285)
-- Name: workflow_tolauserfilter_wo_workflowlevel1_id_a977fbd2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauserfilter_wo_workflowlevel1_id_a977fbd2 ON public.workflow_tolauserfilter_workflowlevel1_filter USING btree (workflowlevel1_id);


--
-- TOC entry 3824 (class 1259 OID 18299)
-- Name: workflow_tolauserfilter_wo_workflowlevel2_id_babbfaed; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_tolauserfilter_wo_workflowlevel2_id_babbfaed ON public.workflow_tolauserfilter_workflowlevel2_filter USING btree (workflowlevel2_id);


--
-- TOC entry 3708 (class 1259 OID 17987)
-- Name: workflow_workflowlevel1_award_award_id_7120035e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_award_award_id_7120035e ON public.workflow_workflowlevel1_award USING btree (award_id);


--
-- TOC entry 3711 (class 1259 OID 17986)
-- Name: workflow_workflowlevel1_award_workflowlevel1_id_1786447d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_award_workflowlevel1_id_1786447d ON public.workflow_workflowlevel1_award USING btree (workflowlevel1_id);


--
-- TOC entry 3714 (class 1259 OID 18001)
-- Name: workflow_workflowlevel1_country_country_id_bf775a40; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_country_country_id_bf775a40 ON public.workflow_workflowlevel1_country USING btree (country_id);


--
-- TOC entry 3717 (class 1259 OID 18000)
-- Name: workflow_workflowlevel1_country_workflowlevel1_id_6740cc30; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_country_workflowlevel1_id_6740cc30 ON public.workflow_workflowlevel1_country USING btree (workflowlevel1_id);


--
-- TOC entry 3720 (class 1259 OID 18015)
-- Name: workflow_workflowlevel1_fund_code_fundcode_id_f092c5cc; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_fund_code_fundcode_id_f092c5cc ON public.workflow_workflowlevel1_fund_code USING btree (fundcode_id);


--
-- TOC entry 3723 (class 1259 OID 18014)
-- Name: workflow_workflowlevel1_fund_code_workflowlevel1_id_ed535834; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_fund_code_workflowlevel1_id_ed535834 ON public.workflow_workflowlevel1_fund_code USING btree (workflowlevel1_id);


--
-- TOC entry 3699 (class 1259 OID 17971)
-- Name: workflow_workflowlevel1_level1_uuid_a8bfd793_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_level1_uuid_a8bfd793_like ON public.workflow_workflowlevel1 USING btree (level1_uuid varchar_pattern_ops);


--
-- TOC entry 3726 (class 1259 OID 18029)
-- Name: workflow_workflowlevel1_milestone_milestone_id_68303639; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_milestone_milestone_id_68303639 ON public.workflow_workflowlevel1_milestone USING btree (milestone_id);


--
-- TOC entry 3729 (class 1259 OID 18028)
-- Name: workflow_workflowlevel1_milestone_workflowlevel1_id_84d8d367; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_milestone_workflowlevel1_id_84d8d367 ON public.workflow_workflowlevel1_milestone USING btree (workflowlevel1_id);


--
-- TOC entry 3702 (class 1259 OID 17972)
-- Name: workflow_workflowlevel1_organization_id_2e581248; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_organization_id_2e581248 ON public.workflow_workflowlevel1 USING btree (organization_id);


--
-- TOC entry 3705 (class 1259 OID 17973)
-- Name: workflow_workflowlevel1_portfolio_id_686b516c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_portfolio_id_686b516c ON public.workflow_workflowlevel1 USING btree (portfolio_id);


--
-- TOC entry 3734 (class 1259 OID 18043)
-- Name: workflow_workflowlevel1_sector_sector_id_a859e05e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_sector_sector_id_a859e05e ON public.workflow_workflowlevel1_sector USING btree (sector_id);


--
-- TOC entry 3735 (class 1259 OID 18042)
-- Name: workflow_workflowlevel1_sector_workflowlevel1_id_f5621c27; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_sector_workflowlevel1_id_f5621c27 ON public.workflow_workflowlevel1_sector USING btree (workflowlevel1_id);


--
-- TOC entry 3740 (class 1259 OID 18057)
-- Name: workflow_workflowlevel1_sub_sector_sector_id_fe3abe58; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_sub_sector_sector_id_fe3abe58 ON public.workflow_workflowlevel1_sub_sector USING btree (sector_id);


--
-- TOC entry 3741 (class 1259 OID 18056)
-- Name: workflow_workflowlevel1_sub_sector_workflowlevel1_id_0269ee7f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_sub_sector_workflowlevel1_id_0269ee7f ON public.workflow_workflowlevel1_sub_sector USING btree (workflowlevel1_id);


--
-- TOC entry 3746 (class 1259 OID 18071)
-- Name: workflow_workflowlevel1_user_access_tolauser_id_56db007c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_user_access_tolauser_id_56db007c ON public.workflow_workflowlevel1_user_access USING btree (tolauser_id);


--
-- TOC entry 3747 (class 1259 OID 18070)
-- Name: workflow_workflowlevel1_user_access_workflowlevel1_id_ca852315; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1_user_access_workflowlevel1_id_ca852315 ON public.workflow_workflowlevel1_user_access USING btree (workflowlevel1_id);


--
-- TOC entry 3754 (class 1259 OID 18096)
-- Name: workflow_workflowlevel1sec_workflowlevel1sector_id_650a1a4c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1sec_workflowlevel1sector_id_650a1a4c ON public.workflow_workflowlevel1sector_sub_sector USING btree (workflowlevel1sector_id);


--
-- TOC entry 3750 (class 1259 OID 18082)
-- Name: workflow_workflowlevel1sector_sector_id_5c6db10a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1sector_sector_id_5c6db10a ON public.workflow_workflowlevel1sector USING btree (sector_id);


--
-- TOC entry 3757 (class 1259 OID 18097)
-- Name: workflow_workflowlevel1sector_sub_sector_sector_id_1a98d833; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1sector_sub_sector_sector_id_1a98d833 ON public.workflow_workflowlevel1sector_sub_sector USING btree (sector_id);


--
-- TOC entry 3751 (class 1259 OID 18083)
-- Name: workflow_workflowlevel1sector_workflowlevel1_id_7dd2532d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel1sector_workflowlevel1_id_7dd2532d ON public.workflow_workflowlevel1sector USING btree (workflowlevel1_id);


--
-- TOC entry 3773 (class 1259 OID 18154)
-- Name: workflow_workflowlevel2_approval_approvalworkflow_id_0e36796f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_approval_approvalworkflow_id_0e36796f ON public.workflow_workflowlevel2_approval USING btree (approvalworkflow_id);


--
-- TOC entry 3776 (class 1259 OID 18153)
-- Name: workflow_workflowlevel2_approval_workflowlevel2_id_71faed41; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_approval_workflowlevel2_id_71faed41 ON public.workflow_workflowlevel2_approval USING btree (workflowlevel2_id);


--
-- TOC entry 3758 (class 1259 OID 18715)
-- Name: workflow_workflowlevel2_created_by_id_fdb8f04f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_created_by_id_fdb8f04f ON public.workflow_workflowlevel2 USING btree (created_by_id);


--
-- TOC entry 3759 (class 1259 OID 18134)
-- Name: workflow_workflowlevel2_donor_currency_id_6cccc223; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_donor_currency_id_6cccc223 ON public.workflow_workflowlevel2 USING btree (donor_currency_id);


--
-- TOC entry 3779 (class 1259 OID 18168)
-- Name: workflow_workflowlevel2_indicators_indicator_id_200e1922; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_indicators_indicator_id_200e1922 ON public.workflow_workflowlevel2_indicators USING btree (indicator_id);


--
-- TOC entry 3782 (class 1259 OID 18167)
-- Name: workflow_workflowlevel2_indicators_workflowlevel2_id_eaceeb66; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_indicators_workflowlevel2_id_eaceeb66 ON public.workflow_workflowlevel2_indicators USING btree (workflowlevel2_id);


--
-- TOC entry 3760 (class 1259 OID 18133)
-- Name: workflow_workflowlevel2_level2_uuid_75d00d9d_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_level2_uuid_75d00d9d_like ON public.workflow_workflowlevel2 USING btree (level2_uuid varchar_pattern_ops);


--
-- TOC entry 3763 (class 1259 OID 18135)
-- Name: workflow_workflowlevel2_local_currency_id_32629185; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_local_currency_id_32629185 ON public.workflow_workflowlevel2 USING btree (local_currency_id);


--
-- TOC entry 3764 (class 1259 OID 18136)
-- Name: workflow_workflowlevel2_milestone_id_a56778a1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_milestone_id_a56778a1 ON public.workflow_workflowlevel2 USING btree (milestone_id);


--
-- TOC entry 3765 (class 1259 OID 18137)
-- Name: workflow_workflowlevel2_office_id_614f082c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_office_id_614f082c ON public.workflow_workflowlevel2 USING btree (office_id);


--
-- TOC entry 3768 (class 1259 OID 18139)
-- Name: workflow_workflowlevel2_sector_id_e98de51e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_sector_id_e98de51e ON public.workflow_workflowlevel2 USING btree (sector_id);


--
-- TOC entry 3787 (class 1259 OID 18182)
-- Name: workflow_workflowlevel2_site_siteprofile_id_dd3c466b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_site_siteprofile_id_dd3c466b ON public.workflow_workflowlevel2_site USING btree (siteprofile_id);


--
-- TOC entry 3788 (class 1259 OID 18181)
-- Name: workflow_workflowlevel2_site_workflowlevel2_id_bb554688; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_site_workflowlevel2_id_bb554688 ON public.workflow_workflowlevel2_site USING btree (workflowlevel2_id);


--
-- TOC entry 3769 (class 1259 OID 18815)
-- Name: workflow_workflowlevel2_staff_responsible_id_6bbb4a5d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_staff_responsible_id_6bbb4a5d ON public.workflow_workflowlevel2 USING btree (staff_responsible_id);


--
-- TOC entry 3793 (class 1259 OID 18196)
-- Name: workflow_workflowlevel2_stakeholder_stakeholder_id_fe6be156; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_stakeholder_stakeholder_id_fe6be156 ON public.workflow_workflowlevel2_stakeholder USING btree (stakeholder_id);


--
-- TOC entry 3794 (class 1259 OID 18195)
-- Name: workflow_workflowlevel2_stakeholder_workflowlevel2_id_41c65bd9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_stakeholder_workflowlevel2_id_41c65bd9 ON public.workflow_workflowlevel2_stakeholder USING btree (workflowlevel2_id);


--
-- TOC entry 3799 (class 1259 OID 18210)
-- Name: workflow_workflowlevel2_sub_sector_sector_id_f5c5620e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_sub_sector_sector_id_f5c5620e ON public.workflow_workflowlevel2_sub_sector USING btree (sector_id);


--
-- TOC entry 3800 (class 1259 OID 18209)
-- Name: workflow_workflowlevel2_sub_sector_workflowlevel2_id_8562c4d0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_sub_sector_workflowlevel2_id_8562c4d0 ON public.workflow_workflowlevel2_sub_sector USING btree (workflowlevel2_id);


--
-- TOC entry 3770 (class 1259 OID 18140)
-- Name: workflow_workflowlevel2_workflowlevel1_id_d0f4a9de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2_workflowlevel1_id_d0f4a9de ON public.workflow_workflowlevel2 USING btree (workflowlevel1_id);


--
-- TOC entry 3801 (class 1259 OID 18222)
-- Name: workflow_workflowlevel2sor_workflowlevel2_parent_id_i_11d043c3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2sor_workflowlevel2_parent_id_i_11d043c3 ON public.workflow_workflowlevel2sort USING btree (workflowlevel2_parent_id_id);


--
-- TOC entry 3804 (class 1259 OID 18221)
-- Name: workflow_workflowlevel2sort_workflowlevel1_id_4ecac071; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowlevel2sort_workflowlevel1_id_4ecac071 ON public.workflow_workflowlevel2sort USING btree (workflowlevel1_id);


--
-- TOC entry 3807 (class 1259 OID 18241)
-- Name: workflow_workflowmodules_workflowlevel2_id_82c21421; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowmodules_workflowlevel2_id_82c21421 ON public.workflow_workflowmodules USING btree (workflowlevel2_id);


--
-- TOC entry 3808 (class 1259 OID 18267)
-- Name: workflow_workflowteam_country_id_f2076b9e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowteam_country_id_f2076b9e ON public.workflow_workflowteam USING btree (country_id);


--
-- TOC entry 3809 (class 1259 OID 18268)
-- Name: workflow_workflowteam_partner_org_id_5d778d4c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowteam_partner_org_id_5d778d4c ON public.workflow_workflowteam USING btree (partner_org_id);


--
-- TOC entry 3812 (class 1259 OID 18269)
-- Name: workflow_workflowteam_role_id_f3ce989a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowteam_role_id_f3ce989a ON public.workflow_workflowteam USING btree (role_id);


--
-- TOC entry 3813 (class 1259 OID 18270)
-- Name: workflow_workflowteam_workflow_user_id_c6db2487; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowteam_workflow_user_id_c6db2487 ON public.workflow_workflowteam USING btree (workflow_user_id);


--
-- TOC entry 3814 (class 1259 OID 18271)
-- Name: workflow_workflowteam_workflowlevel1_id_8a97c756; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX workflow_workflowteam_workflowlevel1_id_8a97c756 ON public.workflow_workflowteam USING btree (workflowlevel1_id);


--
-- TOC entry 4343 (class 2606 OID 19179)
-- Name: appointment_appointment_workflowlevel2 appointment_appointm_appointment_id_ca9667b7_fk_appointme; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointment_appointment_workflowlevel2
    ADD CONSTRAINT appointment_appointm_appointment_id_ca9667b7_fk_appointme FOREIGN KEY (appointment_id) REFERENCES public.appointment_appointment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4344 (class 2606 OID 19184)
-- Name: appointment_appointment_workflowlevel2 appointment_appointm_workflowlevel2_id_cf7b9402_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointment_appointment_workflowlevel2
    ADD CONSTRAINT appointment_appointm_workflowlevel2_id_cf7b9402_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4342 (class 2606 OID 19159)
-- Name: appointment_appointment appointment_appointment_owner_id_9b0c47be_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointment_appointment
    ADD CONSTRAINT appointment_appointment_owner_id_9b0c47be_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4120 (class 2606 OID 16473)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4119 (class 2606 OID 16468)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4118 (class 2606 OID 16459)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4122 (class 2606 OID 16488)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4121 (class 2606 OID 16483)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4124 (class 2606 OID 16502)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4123 (class 2606 OID 16497)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4345 (class 2606 OID 19207)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4346 (class 2606 OID 19355)
-- Name: contact_contact contact_contact_user_id_2e02db50_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contact_contact
    ADD CONSTRAINT contact_contact_user_id_2e02db50_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4125 (class 2606 OID 16523)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4126 (class 2606 OID 16528)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4368 (class 2606 OID 19647)
-- Name: formlibrary_beneficiary_workflowlevel1 formlibrary_benefici_beneficiary_id_3725f557_fk_formlibra; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_workflowlevel1
    ADD CONSTRAINT formlibrary_benefici_beneficiary_id_3725f557_fk_formlibra FOREIGN KEY (beneficiary_id) REFERENCES public.formlibrary_beneficiary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4366 (class 2606 OID 19633)
-- Name: formlibrary_beneficiary_training formlibrary_benefici_beneficiary_id_594f1b5e_fk_formlibra; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_training
    ADD CONSTRAINT formlibrary_benefici_beneficiary_id_594f1b5e_fk_formlibra FOREIGN KEY (beneficiary_id) REFERENCES public.formlibrary_beneficiary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4364 (class 2606 OID 19613)
-- Name: formlibrary_beneficiary_distribution formlibrary_benefici_beneficiary_id_f6db57da_fk_formlibra; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_distribution
    ADD CONSTRAINT formlibrary_benefici_beneficiary_id_f6db57da_fk_formlibra FOREIGN KEY (beneficiary_id) REFERENCES public.formlibrary_beneficiary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4365 (class 2606 OID 19618)
-- Name: formlibrary_beneficiary_distribution formlibrary_benefici_distribution_id_4be4e564_fk_formlibra; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_distribution
    ADD CONSTRAINT formlibrary_benefici_distribution_id_4be4e564_fk_formlibra FOREIGN KEY (distribution_id) REFERENCES public.formlibrary_distribution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4347 (class 2606 OID 19628)
-- Name: formlibrary_beneficiary formlibrary_benefici_site_id_fc084d62_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary
    ADD CONSTRAINT formlibrary_benefici_site_id_fc084d62_fk_workflow_ FOREIGN KEY (site_id) REFERENCES public.workflow_siteprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4367 (class 2606 OID 19638)
-- Name: formlibrary_beneficiary_training formlibrary_benefici_trainingattendance_i_3d9d50ac_fk_formlibra; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_training
    ADD CONSTRAINT formlibrary_benefici_trainingattendance_i_3d9d50ac_fk_formlibra FOREIGN KEY (trainingattendance_id) REFERENCES public.formlibrary_trainingattendance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4369 (class 2606 OID 19652)
-- Name: formlibrary_beneficiary_workflowlevel1 formlibrary_benefici_workflowlevel1_id_36df8abe_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_beneficiary_workflowlevel1
    ADD CONSTRAINT formlibrary_benefici_workflowlevel1_id_36df8abe_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4348 (class 2606 OID 19608)
-- Name: formlibrary_customform formlibrary_customfo_organization_id_56919c52_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_customform
    ADD CONSTRAINT formlibrary_customfo_organization_id_56919c52_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4351 (class 2606 OID 19602)
-- Name: formlibrary_customformfield formlibrary_customfo_type_id_0aafbaba_fk_formlibra; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_customformfield
    ADD CONSTRAINT formlibrary_customfo_type_id_0aafbaba_fk_formlibra FOREIGN KEY (type_id) REFERENCES public.formlibrary_fieldtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4350 (class 2606 OID 19688)
-- Name: formlibrary_customform formlibrary_customfo_workflowlevel1_id_db5a9031_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_customform
    ADD CONSTRAINT formlibrary_customfo_workflowlevel1_id_db5a9031_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4349 (class 2606 OID 19662)
-- Name: formlibrary_customform formlibrary_customform_created_by_id_8c03f8ad_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_customform
    ADD CONSTRAINT formlibrary_customform_created_by_id_8c03f8ad_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4363 (class 2606 OID 19562)
-- Name: formlibrary_distribution_disaggregation_value formlibrary_distribu_disaggregationvalue__9db21dee_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution_disaggregation_value
    ADD CONSTRAINT formlibrary_distribu_disaggregationvalue__9db21dee_fk_indicator FOREIGN KEY (disaggregationvalue_id) REFERENCES public.indicators_disaggregationvalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4362 (class 2606 OID 19557)
-- Name: formlibrary_distribution_disaggregation_value formlibrary_distribu_distribution_id_98d78001_fk_formlibra; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution_disaggregation_value
    ADD CONSTRAINT formlibrary_distribu_distribution_id_98d78001_fk_formlibra FOREIGN KEY (distribution_id) REFERENCES public.formlibrary_distribution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4352 (class 2606 OID 19572)
-- Name: formlibrary_distribution formlibrary_distribu_distribution_indicat_508f8618_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution
    ADD CONSTRAINT formlibrary_distribu_distribution_indicat_508f8618_fk_indicator FOREIGN KEY (distribution_indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4353 (class 2606 OID 19578)
-- Name: formlibrary_distribution formlibrary_distribu_office_code_id_5b514eb7_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution
    ADD CONSTRAINT formlibrary_distribu_office_code_id_5b514eb7_fk_workflow_ FOREIGN KEY (office_code_id) REFERENCES public.workflow_office(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4354 (class 2606 OID 19584)
-- Name: formlibrary_distribution formlibrary_distribu_province_id_df5c6c48_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution
    ADD CONSTRAINT formlibrary_distribu_province_id_df5c6c48_fk_workflow_ FOREIGN KEY (province_id) REFERENCES public.workflow_adminlevelone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4355 (class 2606 OID 19590)
-- Name: formlibrary_distribution formlibrary_distribu_workflowlevel1_id_de680559_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution
    ADD CONSTRAINT formlibrary_distribu_workflowlevel1_id_de680559_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4356 (class 2606 OID 19596)
-- Name: formlibrary_distribution formlibrary_distribu_workflowlevel2_id_9ee2ef34_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_distribution
    ADD CONSTRAINT formlibrary_distribu_workflowlevel2_id_9ee2ef34_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4361 (class 2606 OID 19490)
-- Name: formlibrary_trainingattendance_disaggregation_value formlibrary_training_disaggregationvalue__39456c05_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance_disaggregation_value
    ADD CONSTRAINT formlibrary_training_disaggregationvalue__39456c05_fk_indicator FOREIGN KEY (disaggregationvalue_id) REFERENCES public.indicators_disaggregationvalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4357 (class 2606 OID 19500)
-- Name: formlibrary_trainingattendance formlibrary_training_training_indicator_i_33df7d98_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance
    ADD CONSTRAINT formlibrary_training_training_indicator_i_33df7d98_fk_indicator FOREIGN KEY (training_indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4360 (class 2606 OID 19485)
-- Name: formlibrary_trainingattendance_disaggregation_value formlibrary_training_trainingattendance_i_7b20fecb_fk_formlibra; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance_disaggregation_value
    ADD CONSTRAINT formlibrary_training_trainingattendance_i_7b20fecb_fk_formlibra FOREIGN KEY (trainingattendance_id) REFERENCES public.formlibrary_trainingattendance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4358 (class 2606 OID 19546)
-- Name: formlibrary_trainingattendance formlibrary_training_workflowlevel1_id_eadf5b3a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance
    ADD CONSTRAINT formlibrary_training_workflowlevel1_id_eadf5b3a_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4359 (class 2606 OID 19552)
-- Name: formlibrary_trainingattendance formlibrary_training_workflowlevel2_id_4f1b2039_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.formlibrary_trainingattendance
    ADD CONSTRAINT formlibrary_training_workflowlevel2_id_4f1b2039_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4370 (class 2606 OID 19730)
-- Name: guardian_groupobjectpermission guardian_groupobject_content_type_id_7ade36b8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_content_type_id_7ade36b8_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4371 (class 2606 OID 19735)
-- Name: guardian_groupobjectpermission guardian_groupobject_group_id_4bbbfb62_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_group_id_4bbbfb62_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4372 (class 2606 OID 19740)
-- Name: guardian_groupobjectpermission guardian_groupobject_permission_id_36572738_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_permission_id_36572738_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4373 (class 2606 OID 19748)
-- Name: guardian_userobjectpermission guardian_userobjectp_content_type_id_2e892405_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_content_type_id_2e892405_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4374 (class 2606 OID 19753)
-- Name: guardian_userobjectpermission guardian_userobjectp_permission_id_71807bfc_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_permission_id_71807bfc_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4375 (class 2606 OID 19758)
-- Name: guardian_userobjectpermission guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4128 (class 2606 OID 20314)
-- Name: indicators_collecteddata indicators_collected_approved_by_id_d7a2be3d_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collected_approved_by_id_d7a2be3d_fk_workflow_ FOREIGN KEY (approved_by_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4395 (class 2606 OID 20352)
-- Name: indicators_collecteddata_site indicators_collected_collecteddata_id_741ff857_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_site
    ADD CONSTRAINT indicators_collected_collecteddata_id_741ff857_fk_indicator FOREIGN KEY (collecteddata_id) REFERENCES public.indicators_collecteddata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4393 (class 2606 OID 20325)
-- Name: indicators_collecteddata_disaggregation_value indicators_collected_collecteddata_id_7cc495e7_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_disaggregation_value
    ADD CONSTRAINT indicators_collected_collecteddata_id_7cc495e7_fk_indicator FOREIGN KEY (collecteddata_id) REFERENCES public.indicators_collecteddata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4392 (class 2606 OID 20320)
-- Name: indicators_collecteddata_disaggregation_value indicators_collected_disaggregationvalue__d1f12d4f_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_disaggregation_value
    ADD CONSTRAINT indicators_collected_disaggregationvalue__d1f12d4f_fk_indicator FOREIGN KEY (disaggregationvalue_id) REFERENCES public.indicators_disaggregationvalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4129 (class 2606 OID 20330)
-- Name: indicators_collecteddata indicators_collected_evidence_id_72ab87b4_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collected_evidence_id_72ab87b4_fk_workflow_ FOREIGN KEY (evidence_id) REFERENCES public.workflow_documentation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4130 (class 2606 OID 20335)
-- Name: indicators_collecteddata indicators_collected_indicator_id_04993a79_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collected_indicator_id_04993a79_fk_indicator FOREIGN KEY (indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4134 (class 2606 OID 20468)
-- Name: indicators_collecteddata indicators_collected_periodic_target_id_1af08713_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collected_periodic_target_id_1af08713_fk_indicator FOREIGN KEY (periodic_target_id) REFERENCES public.indicators_periodictarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4394 (class 2606 OID 20347)
-- Name: indicators_collecteddata_site indicators_collected_siteprofile_id_abe02a9c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata_site
    ADD CONSTRAINT indicators_collected_siteprofile_id_abe02a9c_fk_workflow_ FOREIGN KEY (siteprofile_id) REFERENCES public.workflow_siteprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4131 (class 2606 OID 20357)
-- Name: indicators_collecteddata indicators_collected_tola_table_id_06fe0aa2_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collected_tola_table_id_06fe0aa2_fk_indicator FOREIGN KEY (tola_table_id) REFERENCES public.indicators_tolatable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4132 (class 2606 OID 20362)
-- Name: indicators_collecteddata indicators_collected_workflowlevel1_id_73f6f06a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collected_workflowlevel1_id_73f6f06a_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4133 (class 2606 OID 20367)
-- Name: indicators_collecteddata indicators_collected_workflowlevel2_id_cb072a88_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collected_workflowlevel2_id_cb072a88_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4127 (class 2606 OID 20251)
-- Name: indicators_collecteddata indicators_collecteddata_created_by_id_e703906b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_collecteddata
    ADD CONSTRAINT indicators_collecteddata_created_by_id_e703906b_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4137 (class 2606 OID 20163)
-- Name: indicators_disaggregationvalue indicators_disaggreg_disaggregation_label_a5c81ee7_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_disaggregationvalue
    ADD CONSTRAINT indicators_disaggreg_disaggregation_label_a5c81ee7_fk_indicator FOREIGN KEY (disaggregation_label_id) REFERENCES public.indicators_disaggregationlabel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4135 (class 2606 OID 20175)
-- Name: indicators_disaggregationlabel indicators_disaggreg_disaggregation_type__9b8197ac_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_disaggregationlabel
    ADD CONSTRAINT indicators_disaggreg_disaggregation_type__9b8197ac_fk_indicator FOREIGN KEY (disaggregation_type_id) REFERENCES public.indicators_disaggregationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4136 (class 2606 OID 20169)
-- Name: indicators_disaggregationtype indicators_disaggreg_organization_id_513da13d_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_disaggregationtype
    ADD CONSTRAINT indicators_disaggreg_organization_id_513da13d_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4139 (class 2606 OID 20151)
-- Name: indicators_externalservicerecord indicators_externals_external_service_id_98ab35d0_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_externalservicerecord
    ADD CONSTRAINT indicators_externals_external_service_id_98ab35d0_fk_indicator FOREIGN KEY (external_service_id) REFERENCES public.indicators_externalservice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4138 (class 2606 OID 20157)
-- Name: indicators_externalservice indicators_externals_organization_id_2e94fb85_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_externalservice
    ADD CONSTRAINT indicators_externals_organization_id_2e94fb85_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4140 (class 2606 OID 20145)
-- Name: indicators_frequency indicators_frequency_organization_id_2f72c3e5_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_frequency
    ADD CONSTRAINT indicators_frequency_organization_id_2f72c3e5_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4142 (class 2606 OID 20123)
-- Name: indicators_historicalindicator indicators_historica_history_user_id_b21a8374_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_historicalindicator
    ADD CONSTRAINT indicators_historica_history_user_id_b21a8374_fk_auth_user FOREIGN KEY (history_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4141 (class 2606 OID 20134)
-- Name: indicators_historicalcollecteddata indicators_historica_history_user_id_ed2040fa_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_historicalcollecteddata
    ADD CONSTRAINT indicators_historica_history_user_id_ed2040fa_fk_auth_user FOREIGN KEY (history_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4144 (class 2606 OID 20373)
-- Name: indicators_indicator indicators_indicator_approval_submitted_b_b149cfec_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_approval_submitted_b_b149cfec_fk_workflow_ FOREIGN KEY (approval_submitted_by_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4145 (class 2606 OID 20378)
-- Name: indicators_indicator indicators_indicator_approved_by_id_bf449d47_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_approved_by_id_bf449d47_fk_workflow_ FOREIGN KEY (approved_by_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4143 (class 2606 OID 20259)
-- Name: indicators_indicator indicators_indicator_created_by_id_c8b4de26_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_created_by_id_c8b4de26_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4146 (class 2606 OID 20383)
-- Name: indicators_indicator indicators_indicator_data_collection_freq_e39d6675_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_data_collection_freq_e39d6675_fk_indicator FOREIGN KEY (data_collection_frequency_id) REFERENCES public.indicators_frequency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4380 (class 2606 OID 20388)
-- Name: indicators_indicator_disaggregation indicators_indicator_disaggregationtype_i_62cf32af_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_disaggregation
    ADD CONSTRAINT indicators_indicator_disaggregationtype_i_62cf32af_fk_indicator FOREIGN KEY (disaggregationtype_id) REFERENCES public.indicators_disaggregationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4147 (class 2606 OID 20398)
-- Name: indicators_indicator indicators_indicator_external_service_rec_b2b8c9a2_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_external_service_rec_b2b8c9a2_fk_indicator FOREIGN KEY (external_service_record_id) REFERENCES public.indicators_externalservicerecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4381 (class 2606 OID 20393)
-- Name: indicators_indicator_disaggregation indicators_indicator_indicator_id_15621d0f_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_disaggregation
    ADD CONSTRAINT indicators_indicator_indicator_id_15621d0f_fk_indicator FOREIGN KEY (indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4387 (class 2606 OID 20443)
-- Name: indicators_indicator_strategic_objectives indicators_indicator_indicator_id_1ffa4146_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_strategic_objectives
    ADD CONSTRAINT indicators_indicator_indicator_id_1ffa4146_fk_indicator FOREIGN KEY (indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4385 (class 2606 OID 20423)
-- Name: indicators_indicator_objectives indicators_indicator_indicator_id_54260250_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_objectives
    ADD CONSTRAINT indicators_indicator_indicator_id_54260250_fk_indicator FOREIGN KEY (indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4383 (class 2606 OID 20478)
-- Name: indicators_indicator_indicator_type indicators_indicator_indicator_id_72d9ec81_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_indicator_type
    ADD CONSTRAINT indicators_indicator_indicator_id_72d9ec81_fk_indicator FOREIGN KEY (indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4391 (class 2606 OID 20488)
-- Name: indicators_indicator_workflowlevel1 indicators_indicator_indicator_id_874eb385_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_workflowlevel1
    ADD CONSTRAINT indicators_indicator_indicator_id_874eb385_fk_indicator FOREIGN KEY (indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4389 (class 2606 OID 20453)
-- Name: indicators_indicator_sub_sector indicators_indicator_indicator_id_ca713cd3_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_sub_sector
    ADD CONSTRAINT indicators_indicator_indicator_id_ca713cd3_fk_indicator FOREIGN KEY (indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4382 (class 2606 OID 20473)
-- Name: indicators_indicator_indicator_type indicators_indicator_indicatortype_id_63a1a6ab_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_indicator_type
    ADD CONSTRAINT indicators_indicator_indicatortype_id_63a1a6ab_fk_indicator FOREIGN KEY (indicatortype_id) REFERENCES public.indicators_indicatortype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4148 (class 2606 OID 20413)
-- Name: indicators_indicator indicators_indicator_level_id_63b65f8d_fk_indicators_level_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_level_id_63b65f8d_fk_indicators_level_id FOREIGN KEY (level_id) REFERENCES public.indicators_level(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4384 (class 2606 OID 20418)
-- Name: indicators_indicator_objectives indicators_indicator_objective_id_8d7d4893_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_objectives
    ADD CONSTRAINT indicators_indicator_objective_id_8d7d4893_fk_indicator FOREIGN KEY (objective_id) REFERENCES public.indicators_objective(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4151 (class 2606 OID 19987)
-- Name: indicators_indicatortype indicators_indicator_organization_id_5b8cb7ff_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicatortype
    ADD CONSTRAINT indicators_indicator_organization_id_5b8cb7ff_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4149 (class 2606 OID 20428)
-- Name: indicators_indicator indicators_indicator_reporting_frequency__c2346061_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_reporting_frequency__c2346061_fk_indicator FOREIGN KEY (reporting_frequency_id) REFERENCES public.indicators_frequency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4388 (class 2606 OID 20448)
-- Name: indicators_indicator_sub_sector indicators_indicator_sector_id_40e585a4_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_sub_sector
    ADD CONSTRAINT indicators_indicator_sector_id_40e585a4_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4150 (class 2606 OID 20433)
-- Name: indicators_indicator indicators_indicator_sector_id_b9842819_fk_workflow_sector_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator
    ADD CONSTRAINT indicators_indicator_sector_id_b9842819_fk_workflow_sector_id FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4386 (class 2606 OID 20438)
-- Name: indicators_indicator_strategic_objectives indicators_indicator_strategicobjective_i_dee7457c_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_strategic_objectives
    ADD CONSTRAINT indicators_indicator_strategicobjective_i_dee7457c_fk_indicator FOREIGN KEY (strategicobjective_id) REFERENCES public.indicators_strategicobjective(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4390 (class 2606 OID 20483)
-- Name: indicators_indicator_workflowlevel1 indicators_indicator_workflowlevel1_id_0acb3a77_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_indicator_workflowlevel1
    ADD CONSTRAINT indicators_indicator_workflowlevel1_id_0acb3a77_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4152 (class 2606 OID 19969)
-- Name: indicators_level indicators_level_country_id_cca19b98_fk_workflow_country_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_level
    ADD CONSTRAINT indicators_level_country_id_cca19b98_fk_workflow_country_id FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4155 (class 2606 OID 20265)
-- Name: indicators_level indicators_level_created_by_id_d7ce3e74_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_level
    ADD CONSTRAINT indicators_level_created_by_id_d7ce3e74_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4153 (class 2606 OID 19975)
-- Name: indicators_level indicators_level_organization_id_04950d9e_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_level
    ADD CONSTRAINT indicators_level_organization_id_04950d9e_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4154 (class 2606 OID 19981)
-- Name: indicators_level indicators_level_workflowlevel1_id_c19bc1bc_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_level
    ADD CONSTRAINT indicators_level_workflowlevel1_id_c19bc1bc_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4157 (class 2606 OID 20271)
-- Name: indicators_objective indicators_objective_created_by_id_0dce1901_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_objective
    ADD CONSTRAINT indicators_objective_created_by_id_0dce1901_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4156 (class 2606 OID 19963)
-- Name: indicators_objective indicators_objective_workflowlevel1_id_c6f39e35_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_objective
    ADD CONSTRAINT indicators_objective_workflowlevel1_id_c6f39e35_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4158 (class 2606 OID 19957)
-- Name: indicators_periodictarget indicators_periodict_indicator_id_62876653_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_periodictarget
    ADD CONSTRAINT indicators_periodict_indicator_id_62876653_fk_indicator FOREIGN KEY (indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4159 (class 2606 OID 19945)
-- Name: indicators_reportingperiod indicators_reporting_frequency_id_976e9d48_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_reportingperiod
    ADD CONSTRAINT indicators_reporting_frequency_id_976e9d48_fk_indicator FOREIGN KEY (frequency_id) REFERENCES public.indicators_frequency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4160 (class 2606 OID 19951)
-- Name: indicators_reportingperiod indicators_reporting_organization_id_2448625f_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_reportingperiod
    ADD CONSTRAINT indicators_reporting_organization_id_2448625f_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4161 (class 2606 OID 19933)
-- Name: indicators_strategicobjective indicators_strategic_country_id_e7b84bfb_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_strategicobjective
    ADD CONSTRAINT indicators_strategic_country_id_e7b84bfb_fk_workflow_ FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4162 (class 2606 OID 19939)
-- Name: indicators_strategicobjective indicators_strategic_organization_id_63473191_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_strategicobjective
    ADD CONSTRAINT indicators_strategic_organization_id_63473191_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4377 (class 2606 OID 19897)
-- Name: indicators_tolatable_country indicators_tolatable_country_id_29303999_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_country
    ADD CONSTRAINT indicators_tolatable_country_id_29303999_fk_workflow_ FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4163 (class 2606 OID 19907)
-- Name: indicators_tolatable indicators_tolatable_organization_id_c073449f_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable
    ADD CONSTRAINT indicators_tolatable_organization_id_c073449f_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4164 (class 2606 OID 19913)
-- Name: indicators_tolatable indicators_tolatable_owner_id_40cf8506_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable
    ADD CONSTRAINT indicators_tolatable_owner_id_40cf8506_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4378 (class 2606 OID 19918)
-- Name: indicators_tolatable_workflowlevel1 indicators_tolatable_tolatable_id_88ff5b74_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_workflowlevel1
    ADD CONSTRAINT indicators_tolatable_tolatable_id_88ff5b74_fk_indicator FOREIGN KEY (tolatable_id) REFERENCES public.indicators_tolatable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4376 (class 2606 OID 19892)
-- Name: indicators_tolatable_country indicators_tolatable_tolatable_id_948f959d_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_country
    ADD CONSTRAINT indicators_tolatable_tolatable_id_948f959d_fk_indicator FOREIGN KEY (tolatable_id) REFERENCES public.indicators_tolatable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4379 (class 2606 OID 19923)
-- Name: indicators_tolatable_workflowlevel1 indicators_tolatable_workflowlevel1_id_18387ac6_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.indicators_tolatable_workflowlevel1
    ADD CONSTRAINT indicators_tolatable_workflowlevel1_id_18387ac6_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4398 (class 2606 OID 20731)
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4397 (class 2606 OID 20669)
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4396 (class 2606 OID 20617)
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4399 (class 2606 OID 20726)
-- Name: oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4400 (class 2606 OID 20758)
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4401 (class 2606 OID 20664)
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_775e84e8_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4402 (class 2606 OID 20736)
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4403 (class 2606 OID 20778)
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4404 (class 2606 OID 20947)
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4165 (class 2606 OID 18652)
-- Name: workflow_adminlevelfour workflow_adminlevelf_adminlevelthree_id_97ba2aff_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelfour
    ADD CONSTRAINT workflow_adminlevelf_adminlevelthree_id_97ba2aff_fk_workflow_ FOREIGN KEY (adminlevelthree_id) REFERENCES public.workflow_adminlevelthree(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4166 (class 2606 OID 18658)
-- Name: workflow_adminlevelfour workflow_adminlevelf_adminleveltwo_id_07255ef4_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelfour
    ADD CONSTRAINT workflow_adminlevelf_adminleveltwo_id_07255ef4_fk_workflow_ FOREIGN KEY (adminleveltwo_id) REFERENCES public.workflow_adminleveltwo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4167 (class 2606 OID 18646)
-- Name: workflow_adminlevelone workflow_adminlevelo_country_id_e5ad8503_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelone
    ADD CONSTRAINT workflow_adminlevelo_country_id_e5ad8503_fk_workflow_ FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4169 (class 2606 OID 17584)
-- Name: workflow_adminleveltwo workflow_adminlevelt_adminlevelone_id_98b1430f_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminleveltwo
    ADD CONSTRAINT workflow_adminlevelt_adminlevelone_id_98b1430f_fk_workflow_ FOREIGN KEY (adminlevelone_id) REFERENCES public.workflow_adminlevelone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4168 (class 2606 OID 18640)
-- Name: workflow_adminlevelthree workflow_adminlevelt_adminleveltwo_id_2a86be7c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_adminlevelthree
    ADD CONSTRAINT workflow_adminlevelt_adminleveltwo_id_2a86be7c_fk_workflow_ FOREIGN KEY (adminleveltwo_id) REFERENCES public.workflow_adminleveltwo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4170 (class 2606 OID 18634)
-- Name: workflow_approvaltype workflow_approvaltyp_organization_id_6eaaf76a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_approvaltype
    ADD CONSTRAINT workflow_approvaltyp_organization_id_6eaaf76a_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4171 (class 2606 OID 17590)
-- Name: workflow_approvalworkflow workflow_approvalwor_approval_type_id_9da43db2_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_approvalworkflow
    ADD CONSTRAINT workflow_approvalwor_approval_type_id_9da43db2_fk_workflow_ FOREIGN KEY (approval_type_id) REFERENCES public.workflow_approvaltype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4172 (class 2606 OID 18622)
-- Name: workflow_approvalworkflow workflow_approvalwor_assigned_to_id_083e8782_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_approvalworkflow
    ADD CONSTRAINT workflow_approvalwor_assigned_to_id_083e8782_fk_workflow_ FOREIGN KEY (assigned_to_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4174 (class 2606 OID 18671)
-- Name: workflow_approvalworkflow workflow_approvalwor_created_by_id_0854bf0a_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_approvalworkflow
    ADD CONSTRAINT workflow_approvalwor_created_by_id_0854bf0a_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4173 (class 2606 OID 18628)
-- Name: workflow_approvalworkflow workflow_approvalwor_requested_from_id_fc25b0df_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_approvalworkflow
    ADD CONSTRAINT workflow_approvalwor_requested_from_id_fc25b0df_fk_workflow_ FOREIGN KEY (requested_from_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4175 (class 2606 OID 18576)
-- Name: workflow_award workflow_award_award_currency_id_4e3398dc_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award
    ADD CONSTRAINT workflow_award_award_currency_id_4e3398dc_fk_workflow_ FOREIGN KEY (award_currency_id) REFERENCES public.workflow_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4332 (class 2606 OID 18586)
-- Name: workflow_award_countries workflow_award_count_country_id_1a0d4825_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_countries
    ADD CONSTRAINT workflow_award_count_country_id_1a0d4825_fk_workflow_ FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4331 (class 2606 OID 18581)
-- Name: workflow_award_countries workflow_award_countries_award_id_a394de2f_fk_workflow_award_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_countries
    ADD CONSTRAINT workflow_award_countries_award_id_a394de2f_fk_workflow_award_id FOREIGN KEY (award_id) REFERENCES public.workflow_award(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4176 (class 2606 OID 18596)
-- Name: workflow_award workflow_award_currency_id_4f867437_fk_workflow_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award
    ADD CONSTRAINT workflow_award_currency_id_4f867437_fk_workflow_currency_id FOREIGN KEY (currency_id) REFERENCES public.workflow_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4334 (class 2606 OID 18606)
-- Name: workflow_award_donors workflow_award_donor_stakeholder_id_3fec3462_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_donors
    ADD CONSTRAINT workflow_award_donor_stakeholder_id_3fec3462_fk_workflow_ FOREIGN KEY (stakeholder_id) REFERENCES public.workflow_stakeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4333 (class 2606 OID 18601)
-- Name: workflow_award_donors workflow_award_donors_award_id_8b79077b_fk_workflow_award_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award_donors
    ADD CONSTRAINT workflow_award_donors_award_id_8b79077b_fk_workflow_award_id FOREIGN KEY (award_id) REFERENCES public.workflow_award(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4177 (class 2606 OID 18616)
-- Name: workflow_award workflow_award_organization_id_19140a57_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_award
    ADD CONSTRAINT workflow_award_organization_id_19140a57_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4178 (class 2606 OID 18677)
-- Name: workflow_budget workflow_budget_created_by_id_d47e7967_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_budget
    ADD CONSTRAINT workflow_budget_created_by_id_d47e7967_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4179 (class 2606 OID 18944)
-- Name: workflow_budget workflow_budget_donor_currency_id_38f271ae_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_budget
    ADD CONSTRAINT workflow_budget_donor_currency_id_38f271ae_fk_workflow_ FOREIGN KEY (donor_currency_id) REFERENCES public.workflow_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4180 (class 2606 OID 18949)
-- Name: workflow_budget workflow_budget_local_currency_id_eacbc6ca_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_budget
    ADD CONSTRAINT workflow_budget_local_currency_id_eacbc6ca_fk_workflow_ FOREIGN KEY (local_currency_id) REFERENCES public.workflow_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4181 (class 2606 OID 18954)
-- Name: workflow_budget workflow_budget_workflowlevel2_id_6781df6b_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_budget
    ADD CONSTRAINT workflow_budget_workflowlevel2_id_6781df6b_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4182 (class 2606 OID 18540)
-- Name: workflow_checklist workflow_checklist_country_id_0a47562e_fk_workflow_country_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_checklist
    ADD CONSTRAINT workflow_checklist_country_id_0a47562e_fk_workflow_country_id FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4183 (class 2606 OID 18546)
-- Name: workflow_checklist workflow_checklist_owner_id_f07e4591_fk_workflow_tolauser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_checklist
    ADD CONSTRAINT workflow_checklist_owner_id_f07e4591_fk_workflow_tolauser_id FOREIGN KEY (owner_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4184 (class 2606 OID 18552)
-- Name: workflow_checklist workflow_checklist_workflowlevel2_id_9c24dffd_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_checklist
    ADD CONSTRAINT workflow_checklist_workflowlevel2_id_9c24dffd_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4185 (class 2606 OID 17596)
-- Name: workflow_checklistitem workflow_checklistit_checklist_id_83c88aea_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_checklistitem
    ADD CONSTRAINT workflow_checklistit_checklist_id_83c88aea_fk_workflow_ FOREIGN KEY (checklist_id) REFERENCES public.workflow_checklist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4186 (class 2606 OID 18534)
-- Name: workflow_checklistitem workflow_checklistit_owner_id_1f74df76_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_checklistitem
    ADD CONSTRAINT workflow_checklistit_owner_id_1f74df76_fk_workflow_ FOREIGN KEY (owner_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4327 (class 2606 OID 18505)
-- Name: workflow_codedfield_workflowlevel1 workflow_codedfield__codedfield_id_224fd866_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel1
    ADD CONSTRAINT workflow_codedfield__codedfield_id_224fd866_fk_workflow_ FOREIGN KEY (codedfield_id) REFERENCES public.workflow_codedfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4329 (class 2606 OID 18519)
-- Name: workflow_codedfield_workflowlevel2 workflow_codedfield__codedfield_id_fa4b871f_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel2
    ADD CONSTRAINT workflow_codedfield__codedfield_id_fa4b871f_fk_workflow_ FOREIGN KEY (codedfield_id) REFERENCES public.workflow_codedfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4328 (class 2606 OID 18510)
-- Name: workflow_codedfield_workflowlevel1 workflow_codedfield__workflowlevel1_id_3b2cc5cf_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel1
    ADD CONSTRAINT workflow_codedfield__workflowlevel1_id_3b2cc5cf_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4330 (class 2606 OID 18524)
-- Name: workflow_codedfield_workflowlevel2 workflow_codedfield__workflowlevel2_id_4c7ba087_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield_workflowlevel2
    ADD CONSTRAINT workflow_codedfield__workflowlevel2_id_4c7ba087_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4187 (class 2606 OID 18500)
-- Name: workflow_codedfield workflow_codedfield_organization_id_bda5b30a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfield
    ADD CONSTRAINT workflow_codedfield_organization_id_bda5b30a_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4188 (class 2606 OID 17602)
-- Name: workflow_codedfieldvalues workflow_codedfieldv_coded_field_id_388efcf1_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfieldvalues
    ADD CONSTRAINT workflow_codedfieldv_coded_field_id_388efcf1_fk_workflow_ FOREIGN KEY (coded_field_id) REFERENCES public.workflow_codedfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4189 (class 2606 OID 18494)
-- Name: workflow_codedfieldvalues workflow_codedfieldv_workflowlevel2_id_1c35be5f_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_codedfieldvalues
    ADD CONSTRAINT workflow_codedfieldv_workflowlevel2_id_1c35be5f_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4190 (class 2606 OID 18476)
-- Name: workflow_contact workflow_contact_country_id_2a98aac0_fk_workflow_country_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_contact
    ADD CONSTRAINT workflow_contact_country_id_2a98aac0_fk_workflow_country_id FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4191 (class 2606 OID 18482)
-- Name: workflow_contact workflow_contact_organization_id_b549ef1e_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_contact
    ADD CONSTRAINT workflow_contact_organization_id_b549ef1e_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4192 (class 2606 OID 18488)
-- Name: workflow_contact workflow_contact_workflowlevel1_id_cb88a6d2_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_contact
    ADD CONSTRAINT workflow_contact_workflowlevel1_id_cb88a6d2_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4338 (class 2606 OID 18862)
-- Name: workflow_dashboard_share workflow_dashboard_s_dashboard_id_857b9a30_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_share
    ADD CONSTRAINT workflow_dashboard_s_dashboard_id_857b9a30_fk_workflow_ FOREIGN KEY (dashboard_id) REFERENCES public.workflow_dashboard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4339 (class 2606 OID 18867)
-- Name: workflow_dashboard_share workflow_dashboard_s_tolauser_id_1dd62bf3_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_share
    ADD CONSTRAINT workflow_dashboard_s_tolauser_id_1dd62bf3_fk_workflow_ FOREIGN KEY (tolauser_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4337 (class 2606 OID 18856)
-- Name: workflow_dashboard workflow_dashboard_user_id_18f3de53_fk_workflow_tolauser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard
    ADD CONSTRAINT workflow_dashboard_user_id_18f3de53_fk_workflow_tolauser_id FOREIGN KEY (user_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4340 (class 2606 OID 18876)
-- Name: workflow_dashboard_widgets workflow_dashboard_w_dashboard_id_e5a96dde_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_widgets
    ADD CONSTRAINT workflow_dashboard_w_dashboard_id_e5a96dde_fk_workflow_ FOREIGN KEY (dashboard_id) REFERENCES public.workflow_dashboard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4341 (class 2606 OID 18881)
-- Name: workflow_dashboard_widgets workflow_dashboard_w_widget_id_8f401d09_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_dashboard_widgets
    ADD CONSTRAINT workflow_dashboard_w_widget_id_8f401d09_fk_workflow_ FOREIGN KEY (widget_id) REFERENCES public.workflow_widget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4193 (class 2606 OID 18464)
-- Name: workflow_documentation workflow_documentati_workflowlevel1_id_b907cc3a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_documentation
    ADD CONSTRAINT workflow_documentati_workflowlevel1_id_b907cc3a_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4194 (class 2606 OID 18470)
-- Name: workflow_documentation workflow_documentati_workflowlevel2_id_d5e7926a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_documentation
    ADD CONSTRAINT workflow_documentati_workflowlevel2_id_d5e7926a_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4195 (class 2606 OID 18683)
-- Name: workflow_documentation workflow_documentation_created_by_id_416b8134_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_documentation
    ADD CONSTRAINT workflow_documentation_created_by_id_416b8134_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4196 (class 2606 OID 18458)
-- Name: workflow_formguidance workflow_formguidanc_organization_id_bd09f555_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_formguidance
    ADD CONSTRAINT workflow_formguidanc_organization_id_bd09f555_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4197 (class 2606 OID 18452)
-- Name: workflow_fundcode workflow_fundcode_organization_id_afd34157_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_fundcode
    ADD CONSTRAINT workflow_fundcode_organization_id_afd34157_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4198 (class 2606 OID 17609)
-- Name: workflow_historicalbudget workflow_historicalb_history_user_id_8fd07dcf_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalbudget
    ADD CONSTRAINT workflow_historicalb_history_user_id_8fd07dcf_fk_auth_user FOREIGN KEY (history_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4199 (class 2606 OID 18443)
-- Name: workflow_historicalissueregister workflow_historicali_history_user_id_8efec5d6_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalissueregister
    ADD CONSTRAINT workflow_historicali_history_user_id_8efec5d6_fk_auth_user FOREIGN KEY (history_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4200 (class 2606 OID 17619)
-- Name: workflow_historicalriskregister workflow_historicalr_history_user_id_6047c791_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalriskregister
    ADD CONSTRAINT workflow_historicalr_history_user_id_6047c791_fk_auth_user FOREIGN KEY (history_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4201 (class 2606 OID 18431)
-- Name: workflow_historicalsiteprofile workflow_historicals_history_user_id_7f6a2913_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalsiteprofile
    ADD CONSTRAINT workflow_historicals_history_user_id_7f6a2913_fk_auth_user FOREIGN KEY (history_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4202 (class 2606 OID 17630)
-- Name: workflow_historicalworkflowlevel2 workflow_historicalw_history_user_id_82c5635b_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_historicalworkflowlevel2
    ADD CONSTRAINT workflow_historicalw_history_user_id_82c5635b_fk_auth_user FOREIGN KEY (history_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4203 (class 2606 OID 18405)
-- Name: workflow_issueregister workflow_issueregist_assigned_id_a69494ac_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_issueregister
    ADD CONSTRAINT workflow_issueregist_assigned_id_a69494ac_fk_workflow_ FOREIGN KEY (assigned_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4204 (class 2606 OID 18411)
-- Name: workflow_issueregister workflow_issueregist_organization_id_81386851_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_issueregister
    ADD CONSTRAINT workflow_issueregist_organization_id_81386851_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4205 (class 2606 OID 18417)
-- Name: workflow_issueregister workflow_issueregist_workflowlevel2_id_a8196cc3_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_issueregister
    ADD CONSTRAINT workflow_issueregist_workflowlevel2_id_a8196cc3_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4206 (class 2606 OID 18399)
-- Name: workflow_landtype workflow_landtype_organization_id_cdb713ac_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_landtype
    ADD CONSTRAINT workflow_landtype_organization_id_cdb713ac_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4208 (class 2606 OID 18692)
-- Name: workflow_milestone workflow_milestone_created_by_id_93866c38_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_milestone
    ADD CONSTRAINT workflow_milestone_created_by_id_93866c38_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4207 (class 2606 OID 18393)
-- Name: workflow_milestone workflow_milestone_organization_id_385ee550_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_milestone
    ADD CONSTRAINT workflow_milestone_organization_id_385ee550_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4209 (class 2606 OID 17641)
-- Name: workflow_office workflow_office_country_id_b6502b75_fk_workflow_country_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_office
    ADD CONSTRAINT workflow_office_country_id_b6502b75_fk_workflow_country_id FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4210 (class 2606 OID 19127)
-- Name: workflow_organization workflow_organizatio_default_currency_id_ef8cfa51_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization
    ADD CONSTRAINT workflow_organizatio_default_currency_id_ef8cfa51_fk_workflow_ FOREIGN KEY (default_currency_id) REFERENCES public.workflow_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4212 (class 2606 OID 17653)
-- Name: workflow_organization_industry workflow_organizatio_industry_id_79eb4781_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_industry
    ADD CONSTRAINT workflow_organizatio_industry_id_79eb4781_fk_workflow_ FOREIGN KEY (industry_id) REFERENCES public.workflow_industry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4325 (class 2606 OID 18378)
-- Name: workflow_organization_sector workflow_organizatio_organization_id_3dc909a9_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_sector
    ADD CONSTRAINT workflow_organizatio_organization_id_3dc909a9_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4211 (class 2606 OID 17648)
-- Name: workflow_organization_industry workflow_organizatio_organization_id_5346494c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_industry
    ADD CONSTRAINT workflow_organizatio_organization_id_5346494c_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4326 (class 2606 OID 18383)
-- Name: workflow_organization_sector workflow_organizatio_sector_id_b35395c9_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_organization_sector
    ADD CONSTRAINT workflow_organizatio_sector_id_b35395c9_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4217 (class 2606 OID 17680)
-- Name: workflow_partner_approval workflow_partner_app_approvalworkflow_id_98f406a9_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_approval
    ADD CONSTRAINT workflow_partner_app_approvalworkflow_id_98f406a9_fk_workflow_ FOREIGN KEY (approvalworkflow_id) REFERENCES public.workflow_approvalworkflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4216 (class 2606 OID 17675)
-- Name: workflow_partner_approval workflow_partner_app_partner_id_66906ed4_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_approval
    ADD CONSTRAINT workflow_partner_app_partner_id_66906ed4_fk_workflow_ FOREIGN KEY (partner_id) REFERENCES public.workflow_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4219 (class 2606 OID 17694)
-- Name: workflow_partner_contact workflow_partner_con_contact_id_d5a6b82c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_contact
    ADD CONSTRAINT workflow_partner_con_contact_id_d5a6b82c_fk_workflow_ FOREIGN KEY (contact_id) REFERENCES public.workflow_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4218 (class 2606 OID 17689)
-- Name: workflow_partner_contact workflow_partner_con_partner_id_a2d9b0ab_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_contact
    ADD CONSTRAINT workflow_partner_con_partner_id_a2d9b0ab_fk_workflow_ FOREIGN KEY (partner_id) REFERENCES public.workflow_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4213 (class 2606 OID 17662)
-- Name: workflow_partner workflow_partner_country_id_aaa1e137_fk_workflow_country_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner
    ADD CONSTRAINT workflow_partner_country_id_aaa1e137_fk_workflow_country_id FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4214 (class 2606 OID 17667)
-- Name: workflow_partner workflow_partner_organization_id_1987ea04_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner
    ADD CONSTRAINT workflow_partner_organization_id_1987ea04_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4321 (class 2606 OID 18344)
-- Name: workflow_partner_sectors workflow_partner_sec_partner_id_ec9649d8_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_sectors
    ADD CONSTRAINT workflow_partner_sec_partner_id_ec9649d8_fk_workflow_ FOREIGN KEY (partner_id) REFERENCES public.workflow_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4322 (class 2606 OID 18349)
-- Name: workflow_partner_sectors workflow_partner_sec_sector_id_8ab31f70_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_sectors
    ADD CONSTRAINT workflow_partner_sec_sector_id_8ab31f70_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4215 (class 2606 OID 18359)
-- Name: workflow_partner workflow_partner_type_id_13463e58_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner
    ADD CONSTRAINT workflow_partner_type_id_13463e58_fk_workflow_ FOREIGN KEY (type_id) REFERENCES public.workflow_stakeholdertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4323 (class 2606 OID 18364)
-- Name: workflow_partner_workflowlevel1 workflow_partner_wor_partner_id_645be5d0_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_workflowlevel1
    ADD CONSTRAINT workflow_partner_wor_partner_id_645be5d0_fk_workflow_ FOREIGN KEY (partner_id) REFERENCES public.workflow_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4324 (class 2606 OID 18369)
-- Name: workflow_partner_workflowlevel1 workflow_partner_wor_workflowlevel1_id_5c7334c5_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_partner_workflowlevel1
    ADD CONSTRAINT workflow_partner_wor_workflowlevel1_id_5c7334c5_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4222 (class 2606 OID 17714)
-- Name: workflow_portfolio_country workflow_portfolio_c_country_id_cc3a4038_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_portfolio_country
    ADD CONSTRAINT workflow_portfolio_c_country_id_cc3a4038_fk_workflow_ FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4221 (class 2606 OID 17709)
-- Name: workflow_portfolio_country workflow_portfolio_c_portfolio_id_e7f13fdd_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_portfolio_country
    ADD CONSTRAINT workflow_portfolio_c_portfolio_id_e7f13fdd_fk_workflow_ FOREIGN KEY (portfolio_id) REFERENCES public.workflow_portfolio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4220 (class 2606 OID 17703)
-- Name: workflow_portfolio workflow_portfolio_organization_id_1afb1fbb_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_portfolio
    ADD CONSTRAINT workflow_portfolio_organization_id_1afb1fbb_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4405 (class 2606 OID 21054)
-- Name: workflow_product workflow_product_workflowlevel2_id_83634618_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_product
    ADD CONSTRAINT workflow_product_workflowlevel2_id_83634618_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4223 (class 2606 OID 17723)
-- Name: workflow_profiletype workflow_profiletype_organization_id_e74d5ee6_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_profiletype
    ADD CONSTRAINT workflow_profiletype_organization_id_e74d5ee6_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4224 (class 2606 OID 17729)
-- Name: workflow_projecttype workflow_projecttype_organization_id_7711701e_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_projecttype
    ADD CONSTRAINT workflow_projecttype_organization_id_7711701e_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4225 (class 2606 OID 18339)
-- Name: workflow_riskregister workflow_riskregiste_workflowlevel2_id_a1338b66_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_riskregister
    ADD CONSTRAINT workflow_riskregiste_workflowlevel2_id_a1338b66_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4227 (class 2606 OID 18698)
-- Name: workflow_sector workflow_sector_created_by_id_0183e620_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_sector
    ADD CONSTRAINT workflow_sector_created_by_id_0183e620_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4226 (class 2606 OID 17735)
-- Name: workflow_sector workflow_sector_organization_id_57ac6345_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_sector
    ADD CONSTRAINT workflow_sector_organization_id_57ac6345_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4228 (class 2606 OID 17741)
-- Name: workflow_sectorrelated workflow_sectorrelat_organization_id_e7b5d267_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_sectorrelated
    ADD CONSTRAINT workflow_sectorrelat_organization_id_e7b5d267_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4230 (class 2606 OID 17751)
-- Name: workflow_sectorrelated workflow_sectorrelat_sector_related_id_af3af2e4_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_sectorrelated
    ADD CONSTRAINT workflow_sectorrelat_sector_related_id_af3af2e4_fk_workflow_ FOREIGN KEY (sector_related_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4229 (class 2606 OID 17746)
-- Name: workflow_sectorrelated workflow_sectorrelated_sector_id_cb8bcffc_fk_workflow_sector_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_sectorrelated
    ADD CONSTRAINT workflow_sectorrelated_sector_id_cb8bcffc_fk_workflow_sector_id FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4231 (class 2606 OID 17759)
-- Name: workflow_siteprofile workflow_siteprofile_admin_level_three_id_1e389391_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_admin_level_three_id_1e389391_fk_workflow_ FOREIGN KEY (admin_level_three_id) REFERENCES public.workflow_adminlevelthree(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4242 (class 2606 OID 17813)
-- Name: workflow_siteprofile_approval workflow_siteprofile_approvalworkflow_id_fcff2b65_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_approval
    ADD CONSTRAINT workflow_siteprofile_approvalworkflow_id_fcff2b65_fk_workflow_ FOREIGN KEY (approvalworkflow_id) REFERENCES public.workflow_approvalworkflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4232 (class 2606 OID 17764)
-- Name: workflow_siteprofile workflow_siteprofile_classify_land_id_289b3a44_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_classify_land_id_289b3a44_fk_workflow_ FOREIGN KEY (classify_land_id) REFERENCES public.workflow_landtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4233 (class 2606 OID 17769)
-- Name: workflow_siteprofile workflow_siteprofile_country_id_f3d247df_fk_workflow_country_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_country_id_f3d247df_fk_workflow_country_id FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4240 (class 2606 OID 18704)
-- Name: workflow_siteprofile workflow_siteprofile_created_by_id_477746c2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_created_by_id_477746c2_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4234 (class 2606 OID 17774)
-- Name: workflow_siteprofile workflow_siteprofile_district_id_a0584a32_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_district_id_a0584a32_fk_workflow_ FOREIGN KEY (district_id) REFERENCES public.workflow_adminleveltwo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4235 (class 2606 OID 17779)
-- Name: workflow_siteprofile workflow_siteprofile_office_id_fee52fdb_fk_workflow_office_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_office_id_fee52fdb_fk_workflow_office_id FOREIGN KEY (office_id) REFERENCES public.workflow_office(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4239 (class 2606 OID 18665)
-- Name: workflow_siteprofile workflow_siteprofile_organization_id_287db2d8_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_organization_id_287db2d8_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4236 (class 2606 OID 17784)
-- Name: workflow_siteprofile workflow_siteprofile_province_id_c839dda9_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_province_id_c839dda9_fk_workflow_ FOREIGN KEY (province_id) REFERENCES public.workflow_adminlevelone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4335 (class 2606 OID 18764)
-- Name: workflow_siteprofile_workflowlevel1 workflow_siteprofile_siteprofile_id_2cbbc8cc_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_workflowlevel1
    ADD CONSTRAINT workflow_siteprofile_siteprofile_id_2cbbc8cc_fk_workflow_ FOREIGN KEY (siteprofile_id) REFERENCES public.workflow_siteprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4241 (class 2606 OID 17808)
-- Name: workflow_siteprofile_approval workflow_siteprofile_siteprofile_id_be2b5c63_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_approval
    ADD CONSTRAINT workflow_siteprofile_siteprofile_id_be2b5c63_fk_workflow_ FOREIGN KEY (siteprofile_id) REFERENCES public.workflow_siteprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4237 (class 2606 OID 17789)
-- Name: workflow_siteprofile workflow_siteprofile_type_id_ce84e091_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_type_id_ce84e091_fk_workflow_ FOREIGN KEY (type_id) REFERENCES public.workflow_profiletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4238 (class 2606 OID 17794)
-- Name: workflow_siteprofile workflow_siteprofile_village_id_d81c342b_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile
    ADD CONSTRAINT workflow_siteprofile_village_id_d81c342b_fk_workflow_ FOREIGN KEY (village_id) REFERENCES public.workflow_adminlevelthree(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4336 (class 2606 OID 18769)
-- Name: workflow_siteprofile_workflowlevel1 workflow_siteprofile_workflowlevel1_id_28be3815_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_siteprofile_workflowlevel1
    ADD CONSTRAINT workflow_siteprofile_workflowlevel1_id_28be3815_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4250 (class 2606 OID 17846)
-- Name: workflow_stakeholder_approval workflow_stakeholder_approvalworkflow_id_9ed8e9ea_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_approval
    ADD CONSTRAINT workflow_stakeholder_approvalworkflow_id_9ed8e9ea_fk_workflow_ FOREIGN KEY (approvalworkflow_id) REFERENCES public.workflow_approvalworkflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4252 (class 2606 OID 17860)
-- Name: workflow_stakeholder_contact workflow_stakeholder_contact_id_a52d49b7_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_contact
    ADD CONSTRAINT workflow_stakeholder_contact_id_a52d49b7_fk_workflow_ FOREIGN KEY (contact_id) REFERENCES public.workflow_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4243 (class 2606 OID 17822)
-- Name: workflow_stakeholder workflow_stakeholder_country_id_7248058c_fk_workflow_country_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder
    ADD CONSTRAINT workflow_stakeholder_country_id_7248058c_fk_workflow_country_id FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4248 (class 2606 OID 18710)
-- Name: workflow_stakeholder workflow_stakeholder_created_by_id_dc258ea8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder
    ADD CONSTRAINT workflow_stakeholder_created_by_id_dc258ea8_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4244 (class 2606 OID 17827)
-- Name: workflow_stakeholder workflow_stakeholder_formal_relationship__d6ae8ee0_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder
    ADD CONSTRAINT workflow_stakeholder_formal_relationship__d6ae8ee0_fk_workflow_ FOREIGN KEY (formal_relationship_document_id) REFERENCES public.workflow_documentation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4245 (class 2606 OID 17832)
-- Name: workflow_stakeholder workflow_stakeholder_organization_id_55203489_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder
    ADD CONSTRAINT workflow_stakeholder_organization_id_55203489_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4255 (class 2606 OID 17883)
-- Name: workflow_stakeholdertype workflow_stakeholder_organization_id_dbc1672a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholdertype
    ADD CONSTRAINT workflow_stakeholder_organization_id_dbc1672a_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4254 (class 2606 OID 17874)
-- Name: workflow_stakeholder_sectors workflow_stakeholder_sector_id_2b9eb58b_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_sectors
    ADD CONSTRAINT workflow_stakeholder_sector_id_2b9eb58b_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4319 (class 2606 OID 18324)
-- Name: workflow_stakeholder_workflowlevel1 workflow_stakeholder_stakeholder_id_08cb1c3a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_workflowlevel1
    ADD CONSTRAINT workflow_stakeholder_stakeholder_id_08cb1c3a_fk_workflow_ FOREIGN KEY (stakeholder_id) REFERENCES public.workflow_stakeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4249 (class 2606 OID 17841)
-- Name: workflow_stakeholder_approval workflow_stakeholder_stakeholder_id_1a0d9319_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_approval
    ADD CONSTRAINT workflow_stakeholder_stakeholder_id_1a0d9319_fk_workflow_ FOREIGN KEY (stakeholder_id) REFERENCES public.workflow_stakeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4251 (class 2606 OID 17855)
-- Name: workflow_stakeholder_contact workflow_stakeholder_stakeholder_id_859d3a6c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_contact
    ADD CONSTRAINT workflow_stakeholder_stakeholder_id_859d3a6c_fk_workflow_ FOREIGN KEY (stakeholder_id) REFERENCES public.workflow_stakeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4253 (class 2606 OID 17869)
-- Name: workflow_stakeholder_sectors workflow_stakeholder_stakeholder_id_b87707c1_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_sectors
    ADD CONSTRAINT workflow_stakeholder_stakeholder_id_b87707c1_fk_workflow_ FOREIGN KEY (stakeholder_id) REFERENCES public.workflow_stakeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4246 (class 2606 OID 18313)
-- Name: workflow_stakeholder workflow_stakeholder_type_id_d3347ec3_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder
    ADD CONSTRAINT workflow_stakeholder_type_id_d3347ec3_fk_workflow_ FOREIGN KEY (type_id) REFERENCES public.workflow_stakeholdertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4247 (class 2606 OID 18319)
-- Name: workflow_stakeholder workflow_stakeholder_vetting_document_id_422f8886_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder
    ADD CONSTRAINT workflow_stakeholder_vetting_document_id_422f8886_fk_workflow_ FOREIGN KEY (vetting_document_id) REFERENCES public.workflow_documentation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4320 (class 2606 OID 18329)
-- Name: workflow_stakeholder_workflowlevel1 workflow_stakeholder_workflowlevel1_id_55fd6bdd_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_stakeholder_workflowlevel1
    ADD CONSTRAINT workflow_stakeholder_workflowlevel1_id_55fd6bdd_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4257 (class 2606 OID 18307)
-- Name: workflow_tolabookmarks workflow_tolabookmar_workflowlevel1_id_f6c2fc28_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolabookmarks
    ADD CONSTRAINT workflow_tolabookmar_workflowlevel1_id_f6c2fc28_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4256 (class 2606 OID 18301)
-- Name: workflow_tolabookmarks workflow_tolabookmarks_user_id_8c465980_fk_workflow_tolauser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolabookmarks
    ADD CONSTRAINT workflow_tolabookmarks_user_id_8c465980_fk_workflow_tolauser_id FOREIGN KEY (user_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4258 (class 2606 OID 17889)
-- Name: workflow_tolasites workflow_tolasites_site_id_ff8ae7d0_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolasites
    ADD CONSTRAINT workflow_tolasites_site_id_ff8ae7d0_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4263 (class 2606 OID 17918)
-- Name: workflow_tolauser_countries workflow_tolauser_co_country_id_ecb2dd72_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser_countries
    ADD CONSTRAINT workflow_tolauser_co_country_id_ecb2dd72_fk_workflow_ FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4262 (class 2606 OID 17913)
-- Name: workflow_tolauser_countries workflow_tolauser_co_tolauser_id_a9a6268a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser_countries
    ADD CONSTRAINT workflow_tolauser_co_tolauser_id_a9a6268a_fk_workflow_ FOREIGN KEY (tolauser_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4259 (class 2606 OID 17895)
-- Name: workflow_tolauser workflow_tolauser_country_id_6e7e0398_fk_workflow_country_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser
    ADD CONSTRAINT workflow_tolauser_country_id_6e7e0398_fk_workflow_country_id FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4260 (class 2606 OID 17900)
-- Name: workflow_tolauser workflow_tolauser_organization_id_30fffd3d_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser
    ADD CONSTRAINT workflow_tolauser_organization_id_30fffd3d_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4261 (class 2606 OID 17905)
-- Name: workflow_tolauser workflow_tolauser_user_id_16814965_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauser
    ADD CONSTRAINT workflow_tolauser_user_id_16814965_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4266 (class 2606 OID 17938)
-- Name: workflow_tolauserfilter_country_filter workflow_tolauserfil_country_id_b6be5c62_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_country_filter
    ADD CONSTRAINT workflow_tolauserfil_country_id_b6be5c62_fk_workflow_ FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4268 (class 2606 OID 17952)
-- Name: workflow_tolauserfilter_sector_filter workflow_tolauserfil_sector_id_ff15b829_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_sector_filter
    ADD CONSTRAINT workflow_tolauserfil_sector_id_ff15b829_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4317 (class 2606 OID 18286)
-- Name: workflow_tolauserfilter_workflowlevel2_filter workflow_tolauserfil_tolauserfilter_id_2fd8bfb0_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel2_filter
    ADD CONSTRAINT workflow_tolauserfil_tolauserfilter_id_2fd8bfb0_fk_workflow_ FOREIGN KEY (tolauserfilter_id) REFERENCES public.workflow_tolauserfilter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4265 (class 2606 OID 17933)
-- Name: workflow_tolauserfilter_country_filter workflow_tolauserfil_tolauserfilter_id_a6f55884_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_country_filter
    ADD CONSTRAINT workflow_tolauserfil_tolauserfilter_id_a6f55884_fk_workflow_ FOREIGN KEY (tolauserfilter_id) REFERENCES public.workflow_tolauserfilter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4315 (class 2606 OID 18272)
-- Name: workflow_tolauserfilter_workflowlevel1_filter workflow_tolauserfil_tolauserfilter_id_b6a0ec07_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel1_filter
    ADD CONSTRAINT workflow_tolauserfil_tolauserfilter_id_b6a0ec07_fk_workflow_ FOREIGN KEY (tolauserfilter_id) REFERENCES public.workflow_tolauserfilter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4267 (class 2606 OID 17947)
-- Name: workflow_tolauserfilter_sector_filter workflow_tolauserfil_tolauserfilter_id_de351530_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_sector_filter
    ADD CONSTRAINT workflow_tolauserfil_tolauserfilter_id_de351530_fk_workflow_ FOREIGN KEY (tolauserfilter_id) REFERENCES public.workflow_tolauserfilter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4264 (class 2606 OID 17927)
-- Name: workflow_tolauserfilter workflow_tolauserfil_user_id_f0a2cdd1_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter
    ADD CONSTRAINT workflow_tolauserfil_user_id_f0a2cdd1_fk_workflow_ FOREIGN KEY (user_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4316 (class 2606 OID 18277)
-- Name: workflow_tolauserfilter_workflowlevel1_filter workflow_tolauserfil_workflowlevel1_id_a977fbd2_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel1_filter
    ADD CONSTRAINT workflow_tolauserfil_workflowlevel1_id_a977fbd2_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4318 (class 2606 OID 18291)
-- Name: workflow_tolauserfilter_workflowlevel2_filter workflow_tolauserfil_workflowlevel2_id_babbfaed_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_tolauserfilter_workflowlevel2_filter
    ADD CONSTRAINT workflow_tolauserfil_workflowlevel2_id_babbfaed_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4297 (class 2606 OID 19030)
-- Name: workflow_workflowlevel2_approval workflow_workflowlev_approvalworkflow_id_0e36796f_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_approval
    ADD CONSTRAINT workflow_workflowlev_approvalworkflow_id_0e36796f_fk_workflow_ FOREIGN KEY (approvalworkflow_id) REFERENCES public.workflow_approvalworkflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4271 (class 2606 OID 18960)
-- Name: workflow_workflowlevel1_award workflow_workflowlev_award_id_7120035e_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_award
    ADD CONSTRAINT workflow_workflowlev_award_id_7120035e_fk_workflow_ FOREIGN KEY (award_id) REFERENCES public.workflow_award(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4273 (class 2606 OID 18970)
-- Name: workflow_workflowlevel1_country workflow_workflowlev_country_id_bf775a40_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_country
    ADD CONSTRAINT workflow_workflowlev_country_id_bf775a40_fk_workflow_ FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4290 (class 2606 OID 19040)
-- Name: workflow_workflowlevel2 workflow_workflowlev_donor_currency_id_6cccc223_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlev_donor_currency_id_6cccc223_fk_workflow_ FOREIGN KEY (donor_currency_id) REFERENCES public.workflow_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4275 (class 2606 OID 18980)
-- Name: workflow_workflowlevel1_fund_code workflow_workflowlev_fundcode_id_f092c5cc_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_fund_code
    ADD CONSTRAINT workflow_workflowlev_fundcode_id_f092c5cc_fk_workflow_ FOREIGN KEY (fundcode_id) REFERENCES public.workflow_fundcode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4300 (class 2606 OID 18160)
-- Name: workflow_workflowlevel2_indicators workflow_workflowlev_indicator_id_200e1922_fk_indicator; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_indicators
    ADD CONSTRAINT workflow_workflowlev_indicator_id_200e1922_fk_indicator FOREIGN KEY (indicator_id) REFERENCES public.indicators_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4291 (class 2606 OID 19046)
-- Name: workflow_workflowlevel2 workflow_workflowlev_local_currency_id_32629185_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlev_local_currency_id_32629185_fk_workflow_ FOREIGN KEY (local_currency_id) REFERENCES public.workflow_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4277 (class 2606 OID 18990)
-- Name: workflow_workflowlevel1_milestone workflow_workflowlev_milestone_id_68303639_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_milestone
    ADD CONSTRAINT workflow_workflowlev_milestone_id_68303639_fk_workflow_ FOREIGN KEY (milestone_id) REFERENCES public.workflow_milestone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4292 (class 2606 OID 19051)
-- Name: workflow_workflowlevel2 workflow_workflowlev_milestone_id_a56778a1_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlev_milestone_id_a56778a1_fk_workflow_ FOREIGN KEY (milestone_id) REFERENCES public.workflow_milestone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4293 (class 2606 OID 19056)
-- Name: workflow_workflowlevel2 workflow_workflowlev_office_id_614f082c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlev_office_id_614f082c_fk_workflow_ FOREIGN KEY (office_id) REFERENCES public.workflow_office(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4269 (class 2606 OID 19000)
-- Name: workflow_workflowlevel1 workflow_workflowlev_organization_id_2e581248_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1
    ADD CONSTRAINT workflow_workflowlev_organization_id_2e581248_fk_workflow_ FOREIGN KEY (organization_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4270 (class 2606 OID 19005)
-- Name: workflow_workflowlevel1 workflow_workflowlev_portfolio_id_686b516c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1
    ADD CONSTRAINT workflow_workflowlev_portfolio_id_686b516c_fk_workflow_ FOREIGN KEY (portfolio_id) REFERENCES public.workflow_portfolio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4288 (class 2606 OID 18089)
-- Name: workflow_workflowlevel1sector_sub_sector workflow_workflowlev_sector_id_1a98d833_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1sector_sub_sector
    ADD CONSTRAINT workflow_workflowlev_sector_id_1a98d833_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4285 (class 2606 OID 18072)
-- Name: workflow_workflowlevel1sector workflow_workflowlev_sector_id_5c6db10a_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1sector
    ADD CONSTRAINT workflow_workflowlev_sector_id_5c6db10a_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4279 (class 2606 OID 19010)
-- Name: workflow_workflowlevel1_sector workflow_workflowlev_sector_id_a859e05e_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sector
    ADD CONSTRAINT workflow_workflowlev_sector_id_a859e05e_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4294 (class 2606 OID 19061)
-- Name: workflow_workflowlevel2 workflow_workflowlev_sector_id_e98de51e_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlev_sector_id_e98de51e_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4305 (class 2606 OID 19091)
-- Name: workflow_workflowlevel2_sub_sector workflow_workflowlev_sector_id_f5c5620e_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_sub_sector
    ADD CONSTRAINT workflow_workflowlev_sector_id_f5c5620e_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4281 (class 2606 OID 19020)
-- Name: workflow_workflowlevel1_sub_sector workflow_workflowlev_sector_id_fe3abe58_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sub_sector
    ADD CONSTRAINT workflow_workflowlev_sector_id_fe3abe58_fk_workflow_ FOREIGN KEY (sector_id) REFERENCES public.workflow_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4301 (class 2606 OID 19066)
-- Name: workflow_workflowlevel2_site workflow_workflowlev_siteprofile_id_dd3c466b_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_site
    ADD CONSTRAINT workflow_workflowlev_siteprofile_id_dd3c466b_fk_workflow_ FOREIGN KEY (siteprofile_id) REFERENCES public.workflow_siteprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4295 (class 2606 OID 19076)
-- Name: workflow_workflowlevel2 workflow_workflowlev_staff_responsible_id_6bbb4a5d_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlev_staff_responsible_id_6bbb4a5d_fk_workflow_ FOREIGN KEY (staff_responsible_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4303 (class 2606 OID 19081)
-- Name: workflow_workflowlevel2_stakeholder workflow_workflowlev_stakeholder_id_fe6be156_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_stakeholder
    ADD CONSTRAINT workflow_workflowlev_stakeholder_id_fe6be156_fk_workflow_ FOREIGN KEY (stakeholder_id) REFERENCES public.workflow_stakeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4284 (class 2606 OID 18063)
-- Name: workflow_workflowlevel1_user_access workflow_workflowlev_tolauser_id_56db007c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_user_access
    ADD CONSTRAINT workflow_workflowlev_tolauser_id_56db007c_fk_workflow_ FOREIGN KEY (tolauser_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4282 (class 2606 OID 19025)
-- Name: workflow_workflowlevel1_sub_sector workflow_workflowlev_workflowlevel1_id_0269ee7f_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sub_sector
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_0269ee7f_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4272 (class 2606 OID 18965)
-- Name: workflow_workflowlevel1_award workflow_workflowlev_workflowlevel1_id_1786447d_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_award
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_1786447d_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4307 (class 2606 OID 18211)
-- Name: workflow_workflowlevel2sort workflow_workflowlev_workflowlevel1_id_4ecac071_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2sort
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_4ecac071_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4274 (class 2606 OID 18975)
-- Name: workflow_workflowlevel1_country workflow_workflowlev_workflowlevel1_id_6740cc30_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_country
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_6740cc30_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4286 (class 2606 OID 18077)
-- Name: workflow_workflowlevel1sector workflow_workflowlev_workflowlevel1_id_7dd2532d_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1sector
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_7dd2532d_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4278 (class 2606 OID 18995)
-- Name: workflow_workflowlevel1_milestone workflow_workflowlev_workflowlevel1_id_84d8d367_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_milestone
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_84d8d367_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4283 (class 2606 OID 18058)
-- Name: workflow_workflowlevel1_user_access workflow_workflowlev_workflowlevel1_id_ca852315_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_user_access
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_ca852315_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4296 (class 2606 OID 19101)
-- Name: workflow_workflowlevel2 workflow_workflowlev_workflowlevel1_id_d0f4a9de_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_d0f4a9de_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4276 (class 2606 OID 18985)
-- Name: workflow_workflowlevel1_fund_code workflow_workflowlev_workflowlevel1_id_ed535834_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_fund_code
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_ed535834_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4280 (class 2606 OID 19015)
-- Name: workflow_workflowlevel1_sector workflow_workflowlev_workflowlevel1_id_f5621c27_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1_sector
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1_id_f5621c27_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4287 (class 2606 OID 18084)
-- Name: workflow_workflowlevel1sector_sub_sector workflow_workflowlev_workflowlevel1sector_650a1a4c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel1sector_sub_sector
    ADD CONSTRAINT workflow_workflowlev_workflowlevel1sector_650a1a4c_fk_workflow_ FOREIGN KEY (workflowlevel1sector_id) REFERENCES public.workflow_workflowlevel1sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4304 (class 2606 OID 19086)
-- Name: workflow_workflowlevel2_stakeholder workflow_workflowlev_workflowlevel2_id_41c65bd9_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_stakeholder
    ADD CONSTRAINT workflow_workflowlev_workflowlevel2_id_41c65bd9_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4298 (class 2606 OID 19035)
-- Name: workflow_workflowlevel2_approval workflow_workflowlev_workflowlevel2_id_71faed41_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_approval
    ADD CONSTRAINT workflow_workflowlev_workflowlevel2_id_71faed41_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4306 (class 2606 OID 19096)
-- Name: workflow_workflowlevel2_sub_sector workflow_workflowlev_workflowlevel2_id_8562c4d0_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_sub_sector
    ADD CONSTRAINT workflow_workflowlev_workflowlevel2_id_8562c4d0_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4302 (class 2606 OID 19071)
-- Name: workflow_workflowlevel2_site workflow_workflowlev_workflowlevel2_id_bb554688_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_site
    ADD CONSTRAINT workflow_workflowlev_workflowlevel2_id_bb554688_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4299 (class 2606 OID 18155)
-- Name: workflow_workflowlevel2_indicators workflow_workflowlev_workflowlevel2_id_eaceeb66_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2_indicators
    ADD CONSTRAINT workflow_workflowlev_workflowlevel2_id_eaceeb66_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4308 (class 2606 OID 18216)
-- Name: workflow_workflowlevel2sort workflow_workflowlev_workflowlevel2_paren_11d043c3_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2sort
    ADD CONSTRAINT workflow_workflowlev_workflowlevel2_paren_11d043c3_fk_workflow_ FOREIGN KEY (workflowlevel2_parent_id_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4289 (class 2606 OID 18721)
-- Name: workflow_workflowlevel2 workflow_workflowlevel2_created_by_id_fdb8f04f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowlevel2
    ADD CONSTRAINT workflow_workflowlevel2_created_by_id_fdb8f04f_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4309 (class 2606 OID 18236)
-- Name: workflow_workflowmodules workflow_workflowmod_workflowlevel2_id_82c21421_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowmodules
    ADD CONSTRAINT workflow_workflowmod_workflowlevel2_id_82c21421_fk_workflow_ FOREIGN KEY (workflowlevel2_id) REFERENCES public.workflow_workflowlevel2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4310 (class 2606 OID 18242)
-- Name: workflow_workflowteam workflow_workflowtea_country_id_f2076b9e_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowteam
    ADD CONSTRAINT workflow_workflowtea_country_id_f2076b9e_fk_workflow_ FOREIGN KEY (country_id) REFERENCES public.workflow_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4311 (class 2606 OID 18247)
-- Name: workflow_workflowteam workflow_workflowtea_partner_org_id_5d778d4c_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowteam
    ADD CONSTRAINT workflow_workflowtea_partner_org_id_5d778d4c_fk_workflow_ FOREIGN KEY (partner_org_id) REFERENCES public.workflow_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4313 (class 2606 OID 18257)
-- Name: workflow_workflowteam workflow_workflowtea_workflow_user_id_c6db2487_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowteam
    ADD CONSTRAINT workflow_workflowtea_workflow_user_id_c6db2487_fk_workflow_ FOREIGN KEY (workflow_user_id) REFERENCES public.workflow_tolauser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4314 (class 2606 OID 18262)
-- Name: workflow_workflowteam workflow_workflowtea_workflowlevel1_id_8a97c756_fk_workflow_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowteam
    ADD CONSTRAINT workflow_workflowtea_workflowlevel1_id_8a97c756_fk_workflow_ FOREIGN KEY (workflowlevel1_id) REFERENCES public.workflow_workflowlevel1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4312 (class 2606 OID 18252)
-- Name: workflow_workflowteam workflow_workflowteam_role_id_f3ce989a_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workflow_workflowteam
    ADD CONSTRAINT workflow_workflowteam_role_id_f3ce989a_fk_auth_group_id FOREIGN KEY (role_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2018-05-31 13:09:56 UTC

--
-- PostgreSQL database dump complete
--

