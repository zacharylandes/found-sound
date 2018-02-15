--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "Max";

--
-- Name: categories; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE categories (
    id bigint NOT NULL,
    title character varying,
    slug character varying,
    department_id bigint
);


ALTER TABLE categories OWNER TO "Max";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO "Max";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE chat_messages (
    id bigint NOT NULL,
    chatroom_id bigint,
    user_id bigint,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE chat_messages OWNER TO "Max";

--
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE chat_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chat_messages_id_seq OWNER TO "Max";

--
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE chat_messages_id_seq OWNED BY chat_messages.id;


--
-- Name: chatrooms; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE chatrooms (
    id bigint NOT NULL,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE chatrooms OWNER TO "Max";

--
-- Name: chatrooms_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE chatrooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chatrooms_id_seq OWNER TO "Max";

--
-- Name: chatrooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE chatrooms_id_seq OWNED BY chatrooms.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE departments (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);


ALTER TABLE departments OWNER TO "Max";

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE departments_id_seq OWNER TO "Max";

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE departments_id_seq OWNED BY departments.id;


--
-- Name: developers; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE developers (
    id bigint NOT NULL,
    key character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE developers OWNER TO "Max";

--
-- Name: developers_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE developers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE developers_id_seq OWNER TO "Max";

--
-- Name: developers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE developers_id_seq OWNED BY developers.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE items (
    id bigint NOT NULL,
    title citext,
    description citext,
    price double precision,
    image character varying,
    category_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    condition integer DEFAULT 0,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    store_id bigint
);


ALTER TABLE items OWNER TO "Max";

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE items_id_seq OWNER TO "Max";

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE order_items (
    id bigint NOT NULL,
    item_id bigint,
    order_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quantity integer
);


ALTER TABLE order_items OWNER TO "Max";

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_items_id_seq OWNER TO "Max";

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE order_items_id_seq OWNED BY order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE orders (
    id bigint NOT NULL,
    status integer,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    total_price double precision
);


ALTER TABLE orders OWNER TO "Max";

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO "Max";

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Max";

--
-- Name: store_order_order_items; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE store_order_order_items (
    id bigint NOT NULL,
    store_order_id bigint,
    order_item_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE store_order_order_items OWNER TO "Max";

--
-- Name: store_order_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE store_order_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE store_order_order_items_id_seq OWNER TO "Max";

--
-- Name: store_order_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE store_order_order_items_id_seq OWNED BY store_order_order_items.id;


--
-- Name: store_orders; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE store_orders (
    id bigint NOT NULL,
    order_id bigint,
    store_id bigint,
    status character varying,
    total_price integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE store_orders OWNER TO "Max";

--
-- Name: store_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE store_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE store_orders_id_seq OWNER TO "Max";

--
-- Name: store_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE store_orders_id_seq OWNED BY store_orders.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE stores (
    id bigint NOT NULL,
    name character varying,
    address character varying,
    status character varying DEFAULT 'pending'::character varying,
    slug character varying,
    twitter_token character varying,
    twitter_secret character varying
);


ALTER TABLE stores OWNER TO "Max";

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stores_id_seq OWNER TO "Max";

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: stripe_customers; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE stripe_customers (
    id bigint NOT NULL,
    email character varying,
    token character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stripe_id character varying,
    last_four character varying
);


ALTER TABLE stripe_customers OWNER TO "Max";

--
-- Name: stripe_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE stripe_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stripe_customers_id_seq OWNER TO "Max";

--
-- Name: stripe_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE stripe_customers_id_seq OWNED BY stripe_customers.id;


--
-- Name: user_stores; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE user_stores (
    id bigint NOT NULL,
    user_id bigint,
    store_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_type integer
);


ALTER TABLE user_stores OWNER TO "Max";

--
-- Name: user_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE user_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_stores_id_seq OWNER TO "Max";

--
-- Name: user_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE user_stores_id_seq OWNED BY user_stores.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password_digest character varying,
    address character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role integer DEFAULT 0
);


ALTER TABLE users OWNER TO "Max";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Max";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: views; Type: TABLE; Schema: public; Owner: Max
--

CREATE TABLE views (
    id bigint NOT NULL,
    user_id bigint,
    item_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE views OWNER TO "Max";

--
-- Name: views_id_seq; Type: SEQUENCE; Schema: public; Owner: Max
--

CREATE SEQUENCE views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE views_id_seq OWNER TO "Max";

--
-- Name: views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Max
--

ALTER SEQUENCE views_id_seq OWNED BY views.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY chat_messages ALTER COLUMN id SET DEFAULT nextval('chat_messages_id_seq'::regclass);


--
-- Name: chatrooms id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY chatrooms ALTER COLUMN id SET DEFAULT nextval('chatrooms_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY departments ALTER COLUMN id SET DEFAULT nextval('departments_id_seq'::regclass);


--
-- Name: developers id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY developers ALTER COLUMN id SET DEFAULT nextval('developers_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY order_items ALTER COLUMN id SET DEFAULT nextval('order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: store_order_order_items id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY store_order_order_items ALTER COLUMN id SET DEFAULT nextval('store_order_order_items_id_seq'::regclass);


--
-- Name: store_orders id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY store_orders ALTER COLUMN id SET DEFAULT nextval('store_orders_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Name: stripe_customers id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY stripe_customers ALTER COLUMN id SET DEFAULT nextval('stripe_customers_id_seq'::regclass);


--
-- Name: user_stores id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY user_stores ALTER COLUMN id SET DEFAULT nextval('user_stores_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: views id; Type: DEFAULT; Schema: public; Owner: Max
--

ALTER TABLE ONLY views ALTER COLUMN id SET DEFAULT nextval('views_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-12-10 22:18:28.560794	2018-02-14 14:04:11.922149
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY categories (id, title, slug, department_id) FROM stdin;
1	Suspense	suspense	1
2	Thriller	thriller	1
3	Western	western	1
4	Crime	crime	1
5	Horror	horror	1
6	Fantasy	fantasy	1
7	Mystery	mystery	1
8	Science Fiction	science-fiction	1
9	String	string	2
10	Percussion	percussion	2
11	Brass	brass	2
12	Woodwind	woodwind	2
13	Jazz	jazz	3
14	Classic Rock	classic-rock	3
15	Punk Rock	punk-rock	3
16	Hip Hop	hip-hop	3
17	Funk	funk	3
18	Amplifiers	amplifiers	4
19	Speakers	speakers	4
20	Turn Tables	turn-tables	4
21	Microphones	microphones	4
\.


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY chat_messages (id, chatroom_id, user_id, body, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: chatrooms; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY chatrooms (id, user_id, created_at, updated_at) FROM stdin;
1	1	2018-02-14 15:27:37.34455	2018-02-14 15:27:37.34455
2	54	2018-02-14 21:35:34.477698	2018-02-14 21:35:34.477698
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY departments (id, title, created_at, updated_at, slug) FROM stdin;
1	Books	2018-02-13 01:39:33.80518	2018-02-13 01:39:33.80518	books
2	Instruments	2018-02-13 01:39:33.908112	2018-02-13 01:39:33.908112	instruments
3	Vinyl	2018-02-13 01:39:33.971794	2018-02-13 01:39:33.971794	vinyl
4	Equipment	2018-02-13 01:39:34.095476	2018-02-13 01:39:34.095476	equipment
\.


--
-- Data for Name: developers; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY developers (id, key, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY items (id, title, description, price, image, category_id, created_at, updated_at, condition, image_file_name, image_content_type, image_file_size, image_updated_at, store_id) FROM stdin;
4	A Farewell to Arms	Listicle seitan green juice marfa.	59.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:35.690451	2018-02-09 18:15:44.40832	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.476544	1
5	The Last Enemy	Put a bird on it loko plaid disrupt.	49.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:35.913428	2018-02-09 18:15:44.480176	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.702577	1
7	A Swiftly Tilting Planet	Drinking polaroid occupy deep v.	49.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:36.374259	2018-02-09 18:15:44.604017	0	book_cover.png	image/png	21149	2017-12-10 22:18:36.134777	1
8	The Line of Beauty	Selvage fanny pack direct trade listicle portland loko cold-pressed whatever godard.	29.9899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:36.574253	2018-02-09 18:15:44.643326	0	book_cover.png	image/png	21149	2017-12-10 22:18:36.382506	1
9	His Dark Materials	Kogi wes anderson five dollar toast park vinyl blog church-key selvage.	29.9899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:36.783706	2018-02-09 18:15:44.827155	1	book_cover.png	image/png	21149	2017-12-10 22:18:36.58259	1
10	Gone with the Wind	Blue bottle brooklyn synth whatever cronut.	29.9899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:36.989437	2018-02-09 18:15:44.984891	1	book_cover.png	image/png	21149	2017-12-10 22:18:36.790299	1
12	The Curious Incident of the Dog in the Night-Time 0	Skateboard tilde lumbersexual sriracha cliche ugh.	63.1300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:37.409038	2018-02-09 18:15:45.079421	0	book_cover.png	image/png	21149	2017-12-10 22:18:37.209036	1
13	The Last Temptation 1	Polaroid letterpress phlogiston paleo.	27.6999999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:37.610676	2018-02-09 18:15:45.111444	0	book_cover.png	image/png	21149	2017-12-10 22:18:37.41931	1
14	Specimen Days 2	Jean shorts meggings deep v ugh kitsch polaroid.	57.6000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:37.823998	2018-02-09 18:15:45.139531	0	book_cover.png	image/png	21149	2017-12-10 22:18:37.618697	1
16	The Glory and the Dream 4	Aesthetic actually phlogiston tofu.	49.7299999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:38.267508	2018-02-09 18:15:45.217959	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.062577	1
17	The Mermaids Singing 5	Migas cliche schlitz 8-bit phlogiston messenger bag gluten-free.	62.6599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:38.488904	2018-02-09 18:15:45.388204	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.274289	1
19	The Doors of Perception 7	You probably haven't heard of them cliche hammock banh mi.	16.7300000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:38.944463	2018-02-09 18:15:45.528524	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.716218	1
20	Things Fall Apart 8	Ethical biodiesel sriracha ramps tumblr meggings cold-pressed.	29.9400000000000013	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:39.200293	2018-02-09 18:15:45.576166	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.957004	1
22	The Heart Is a Lonely Hunter 10	Stumptown xoxo yolo vinegar hammock.	22.9400000000000013	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:39.881487	2018-02-09 18:15:45.608182	0	book_cover.png	image/png	21149	2017-12-10 22:18:39.580097	1
24	A Catskill Eagle 12	You probably haven't heard of them pinterest pug bitters lo-fi fashion axe.	18.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:40.497703	2018-02-09 18:15:45.739144	0	book_cover.png	image/png	21149	2017-12-10 22:18:40.235218	1
25	Now Sleeps the Crimson Petal 13	Flannel cold-pressed retro chartreuse pitchfork normcore swag.	22.9100000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:40.743702	2018-02-09 18:15:45.811004	0	book_cover.png	image/png	21149	2017-12-10 22:18:40.511596	1
27	Mr Standfast 15	Neutra pop-up gentrify hammock.	10.1699999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:41.187816	2018-02-09 18:15:45.871464	0	book_cover.png	image/png	21149	2017-12-10 22:18:40.969679	1
28	The Far-Distant Oxus 16	Try-hard ugh scenester pbr&b tumblr cold-pressed.	36.1000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:41.398788	2018-02-09 18:15:45.91257	0	book_cover.png	image/png	21149	2017-12-10 22:18:41.19655	1
29	Time of our Darkness 17	+1 jean shorts kogi blog meggings ethical yr meh sustainable.	55.2000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:41.605877	2018-02-09 18:15:45.94372	0	book_cover.png	image/png	21149	2017-12-10 22:18:41.408181	1
30	This Side of Paradise 18	Selfies chambray vinyl lo-fi pbr&b brunch.	17.8500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:41.816949	2018-02-09 18:15:45.991823	0	book_cover.png	image/png	21149	2017-12-10 22:18:41.615429	1
32	It's a Battlefield 20	Biodiesel thundercats truffaut neutra.	34.8999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:42.272526	2018-02-09 18:15:46.095248	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.066427	1
33	Look Homeward, Angel 21	Food truck pitchfork art party mixtape microdosing asymmetrical.	21.0100000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:42.475546	2018-02-09 18:15:46.162362	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.281638	1
35	Arms and the Man 23	Kale chips muggle magic goth stumptown pork belly.	57.1199999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:42.904118	2018-02-09 18:15:46.292605	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.695449	1
36	Specimen Days 24	Offal forage irony meh church-key carry sartorial.	53.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:43.141466	2018-02-09 18:15:46.32791	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.915503	1
37	Everything is Illuminated 25	Single-origin coffee tofu tattooed polaroid hella.	56.75	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:43.355335	2018-02-09 18:15:46.359367	0	book_cover.png	image/png	21149	2017-12-10 22:18:43.151549	1
39	The Millstone 27	Pug lomo keffiyeh slow-carb kitsch.	45	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:43.792524	2018-02-09 18:15:46.459799	0	book_cover.png	image/png	21149	2017-12-10 22:18:43.574023	1
40	Bury My Heart at Wounded Knee 28	Listicle cronut xoxo craft beer gastropub austin.	48.9799999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:44.025514	2018-02-09 18:15:46.498344	0	book_cover.png	image/png	21149	2017-12-10 22:18:43.806161	1
43	Taming a Sea Horse 31	Cornhole tofu pork belly mixtape lo-fi asymmetrical.	40.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:44.733352	2018-02-09 18:15:46.543264	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.529524	1
45	A Time to Kill 33	Hoodie kickstarter celiac portland.	41.1899999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:45.212667	2018-02-09 18:15:46.59375	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.975201	1
46	The Violent Bear It Away 34	Echo normcore celiac chia.	20.9699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:45.530185	2018-02-09 18:15:46.619464	0	book_cover.png	image/png	21149	2017-12-10 22:18:45.233587	1
48	Recalled to Life 36	Slow-carb microdosing cred venmo poutine pinterest.	20.0799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:46.01883	2018-02-09 18:15:46.711577	0	book_cover.png	image/png	21149	2017-12-10 22:18:45.799892	1
49	O Jerusalem! 37	Quinoa migas cardigan try-hard sriracha.	41.4699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:46.231032	2018-02-09 18:15:46.763922	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.027704	1
50	The Line of Beauty 38	Marfa tattooed cleanse authentic trust fund actually health.	41.5399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:46.435531	2018-02-09 18:15:46.813584	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.242398	1
52	The Moving Finger 40	Gastropub cliche thundercats muggle magic street try-hard pbr&b mlkshk.	62.8100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:46.859162	2018-02-09 18:15:46.947642	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.659959	1
53	A Many-Splendoured Thing 41	Bushwick fixie artisan sustainable before they sold out normcore forage intelligentsia.	19.6799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:47.074119	2018-02-09 18:15:46.993368	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.867569	1
54	Behold the Man 42	Typewriter deep v mlkshk meditation cray.	10.7599999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:47.309717	2018-02-09 18:15:47.027577	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.082776	1
56	Alone on a Wide, Wide Sea 44	Cliche neutra everyday skateboard aesthetic farm-to-table.	50.6599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:47.735118	2018-02-09 18:15:47.099655	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.54043	1
57	Taming a Sea Horse 45	Green juice beard plaid distillery austin meditation pug pickled hashtag.	24.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:47.951549	2018-02-09 18:15:47.123265	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.751687	1
59	Number the Stars 47	Keffiyeh skateboard viral paleo.	33.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:48.380572	2018-02-09 18:15:47.190129	0	book_cover.png	image/png	21149	2017-12-10 22:18:48.186333	1
60	The Moving Finger 48	Offal vhs bushwick post-ironic tattooed cardigan kinfolk.	13.9399999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:48.589316	2018-02-09 18:15:47.251875	0	book_cover.png	image/png	21149	2017-12-10 22:18:48.393378	1
61	Consider Phlebas 49	Park blog bicycle rights diy viral vinegar sriracha.	55.3599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:48.815302	2018-02-09 18:15:47.284744	0	book_cover.png	image/png	21149	2017-12-10 22:18:48.604825	1
62	The Last Enemy 50	Art party 3 wolf moon kinfolk letterpress.	40.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:49.037189	2018-02-09 18:15:47.331608	0	book_cover.png	image/png	21149	2017-12-10 22:18:48.829482	1
64	The Millstone 52	Messenger bag single-origin coffee small batch pickled.	20.1499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:49.477354	2018-02-09 18:15:47.43928	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.263349	1
66	Carrion Comfort 54	Locavore franzen listicle tumblr kale chips vice gastropub freegan.	47.1599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:49.91903	2018-02-09 18:15:47.539944	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.721942	1
67	The Road Less Traveled 55	Chartreuse beard organic polaroid knausgaard mlkshk kickstarter.	56.1199999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:50.126922	2018-02-09 18:15:47.621451	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.930218	1
69	In Death Ground 57	Small batch direct trade tofu jean shorts poutine.	37.8599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:50.551904	2018-02-09 18:15:47.784945	0	book_cover.png	image/png	21149	2017-12-10 22:18:50.352803	1
70	Recalled to Life 58	Mumblecore banh mi organic vinegar.	42.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:50.764521	2018-02-09 18:15:47.929965	0	book_cover.png	image/png	21149	2017-12-10 22:18:50.565002	1
71	The Moving Toyshop 59	Ennui cleanse helvetica bicycle rights.	29.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:50.988729	2018-02-09 18:15:48.084405	0	book_cover.png	image/png	21149	2017-12-10 22:18:50.776504	1
73	A Monstrous Regiment of Women 61	Roof street meditation retro wayfarers paleo seitan lomo.	65.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:51.407817	2018-02-09 18:15:48.227887	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.210451	1
74	Some Buried Caesar 62	Plaid blue bottle humblebrag artisan.	34.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:51.621349	2018-02-09 18:15:48.313155	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.420095	1
75	Tender Is the Night 63	Green juice cleanse normcore typewriter blue bottle.	64.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:51.833145	2018-02-09 18:15:48.463571	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.634217	1
76	Of Human Bondage 64	Phlogiston whatever umami small batch.	23.6499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:52.047259	2018-02-09 18:15:48.583553	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.847922	1
78	This Lime Tree Bower 66	Forage disrupt salvia bespoke.	48.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:52.470805	2018-02-09 18:15:48.740094	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.272014	1
79	Blood's a Rover 67	Diy carry bicycle rights five dollar toast organic swag vegan pickled.	17.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:52.699253	2018-02-09 18:15:48.783444	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.482463	1
81	The Cricket on the Hearth 69	Ethical schlitz artisan meh.	15.8499999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:53.130339	2018-02-09 18:15:48.813491	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.929874	1
82	Dance Dance Dance 70	Single-origin coffee trust fund mumblecore roof freegan semiotics vinegar.	42.4399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:53.354499	2018-02-09 18:15:48.855372	0	book_cover.png	image/png	21149	2017-12-10 22:18:53.138887	1
85	The Golden Apples of the Sun 73	Vinyl park +1 quinoa single-origin coffee tumblr.	33.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:54.006959	2018-02-09 18:15:48.972656	0	book_cover.png	image/png	21149	2017-12-10 22:18:53.801515	1
409	Precious Bane 397	Pour-over godard chambray ugh fixie.	52.0900000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:09.92278	2018-02-09 18:16:00.372741	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.720834	1
86	Time To Murder And Create 74	Everyday diy cornhole ennui pork belly.	13.3300000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:54.225946	2018-02-09 18:15:49.019706	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.016689	1
87	The Wives of Bath 75	Yolo butcher organic authentic put a bird on it quinoa pabst stumptown meditation.	32.3599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:54.440573	2018-02-09 18:15:49.03821	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.235545	1
89	Antic Hay 77	Sartorial helvetica literally put a bird on it aesthetic cold-pressed quinoa portland.	9.10999999999999943	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:54.888828	2018-02-09 18:15:49.137619	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.675362	1
90	The Way of All Flesh 78	Flexitarian vice kale chips freegan chambray pinterest direct trade post-ironic intelligentsia.	61.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:55.118214	2018-02-09 18:15:49.163175	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.899346	1
91	That Good Night 79	Deep v banh mi cray lomo readymade schlitz.	69.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:55.369779	2018-02-09 18:15:49.204121	0	book_cover.png	image/png	21149	2017-12-10 22:18:55.130885	1
92	A Handful of Dust 80	Flannel blog mlkshk iphone hella.	62.8599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:55.619516	2018-02-09 18:15:49.243559	0	book_cover.png	image/png	21149	2017-12-10 22:18:55.382194	1
94	Quo Vadis 82	Ennui pour-over listicle letterpress disrupt chartreuse.	64.269999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:56.081323	2018-02-09 18:15:49.323571	0	book_cover.png	image/png	21149	2017-12-10 22:18:55.870738	1
95	I Will Fear No Evil 83	Synth knausgaard you probably haven't heard of them raw denim roof tacos 3 wolf moon.	69.8199999999999932	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:56.286058	2018-02-09 18:15:49.375644	0	book_cover.png	image/png	21149	2017-12-10 22:18:56.091012	1
97	Beneath the Bleeding 85	Occupy art party butcher tousled squid viral mixtape.	33.8500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:56.756284	2018-02-09 18:15:49.467633	0	book_cover.png	image/png	21149	2017-12-10 22:18:56.521524	1
98	In a Dry Season 86	Marfa portland put a bird on it ethical lo-fi banh mi.	38.509999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:57.004412	2018-02-09 18:15:49.503832	0	book_cover.png	image/png	21149	2017-12-10 22:18:56.772054	1
99	Some Buried Caesar 87	Seitan mlkshk cliche marfa.	20.75	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:57.253411	2018-02-09 18:15:49.560391	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.013072	1
101	The Yellow Meads of Asphodel 89	Typewriter kitsch ugh cardigan marfa squid tacos chicharrones.	31.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:57.747786	2018-02-09 18:15:49.621192	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.518407	1
104	Vanity Fair 92	Keffiyeh knausgaard keytar mixtape tote bag shoreditch normcore cray.	55.7700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:58.401438	2018-02-09 18:15:49.667618	0	book_cover.png	image/png	21149	2017-12-10 22:18:58.190266	1
105	The Lathe of Heaven 93	Phlogiston diy fashion axe direct trade viral bicycle rights retro small batch umami.	14.7699999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:58.635259	2018-02-09 18:15:49.695722	0	book_cover.png	image/png	21149	2017-12-10 22:18:58.414928	1
107	Of Mice and Men 95	Vinyl kale chips aesthetic post-ironic gastropub skateboard.	11.4600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:59.102452	2018-02-09 18:15:49.781445	0	book_cover.png	image/png	21149	2017-12-10 22:18:58.894016	1
108	Dulce et Decorum Est 96	Semiotics tumblr skateboard tousled heirloom.	60.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:59.333256	2018-02-09 18:15:49.828333	0	book_cover.png	image/png	21149	2017-12-10 22:18:59.115751	1
109	Down to a Sunless Sea 97	Brooklyn actually biodiesel pork belly vegan lumbersexual vice.	28.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:59.56868	2018-02-09 18:15:49.896515	0	book_cover.png	image/png	21149	2017-12-10 22:18:59.348365	1
111	The Heart Is Deceitful Above All Things 99	Ennui phlogiston health church-key organic carry blue bottle.	40.7700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:00.070363	2018-02-09 18:15:49.975285	0	book_cover.png	image/png	21149	2017-12-10 22:18:59.805563	1
112	Some Buried Caesar 100	Hoodie gastropub 8-bit meh crucifix wes anderson echo fingerstache small batch.	7.41000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:00.360343	2018-02-09 18:15:50.004656	0	book_cover.png	image/png	21149	2017-12-10 22:19:00.102175	1
113	Waiting for the Barbarians 101	Drinking humblebrag normcore meggings artisan kitsch five dollar toast ethical 90's.	17.9299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:00.603175	2018-02-09 18:15:50.055861	0	book_cover.png	image/png	21149	2017-12-10 22:19:00.375328	1
114	Consider the Lilies 102	Bushwick banh mi blue bottle marfa twee.	50.759999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:00.820291	2018-02-09 18:15:50.1113	0	book_cover.png	image/png	21149	2017-12-10 22:19:00.615859	1
116	Mother Night 104	Umami 3 wolf moon five dollar toast slow-carb freegan.	11.4299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:01.287415	2018-02-09 18:15:50.218735	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.062627	1
117	Alone on a Wide, Wide Sea 105	Fashion axe forage lo-fi humblebrag fingerstache.	49.2700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:01.527847	2018-02-09 18:15:50.259841	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.311557	1
119	The Moon by Night 107	Cleanse wayfarers iphone whatever yolo leggings echo.	11.5899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:01.985663	2018-02-09 18:15:50.296083	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.763573	1
120	Specimen Days 108	Forage cray sartorial kombucha cleanse occupy listicle goth.	9.44999999999999929	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:02.199272	2018-02-09 18:15:50.327782	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.998534	1
122	The House of Mirth 110	Wayfarers chartreuse mustache yr whatever ugh bitters.	34.6899999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:02.632106	2018-02-09 18:15:50.416721	0	book_cover.png	image/png	21149	2017-12-10 22:19:02.425367	1
123	The Soldier's Art 111	Waistcoat kogi pinterest hashtag actually.	11.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:02.869158	2018-02-09 18:15:50.456318	0	book_cover.png	image/png	21149	2017-12-10 22:19:02.642077	1
124	Sleep the Brave 112	Kinfolk whatever offal wolf selfies portland.	42.7899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:03.100279	2018-02-09 18:15:50.503617	0	book_cover.png	image/png	21149	2017-12-10 22:19:02.881711	1
126	Vanity Fair 114	Chartreuse kitsch roof sustainable pour-over lomo fingerstache.	7.91000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:03.551251	2018-02-09 18:15:50.567672	0	book_cover.png	image/png	21149	2017-12-10 22:19:03.331364	1
127	Things Fall Apart 115	Freegan waistcoat post-ironic flexitarian hashtag.	65.2399999999999949	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:03.787139	2018-02-09 18:15:50.597393	0	book_cover.png	image/png	21149	2017-12-10 22:19:03.564091	1
128	Look to Windward 116	Aesthetic meh five dollar toast jean shorts fashion axe trust fund carry.	21.7300000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:04.037266	2018-02-09 18:15:50.624171	0	book_cover.png	image/png	21149	2017-12-10 22:19:03.799254	1
130	To Sail Beyond the Sunset 118	Diy wolf intelligentsia humblebrag kitsch.	62.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:04.514258	2018-02-09 18:15:50.655835	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.292807	1
132	In Dubious Battle 120	Gentrify roof tilde bicycle rights ethical bushwick.	12.5899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:04.963983	2018-02-09 18:15:50.77635	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.744275	1
133	The Moving Toyshop 121	Whatever brunch mumblecore echo.	56.6000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:05.17524	2018-02-09 18:15:50.82389	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.973968	1
135	By Grand Central Station I Sat Down and Wept 123	Pickled lomo chia umami cleanse five dollar toast chambray celiac craft beer.	47.9299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:05.62165	2018-02-09 18:15:50.911786	0	book_cover.png	image/png	21149	2017-12-10 22:19:05.413242	1
136	After Many a Summer Dies the Swan 124	Xoxo gentrify pour-over brooklyn forage roof.	18.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:05.86875	2018-02-09 18:15:50.95747	0	book_cover.png	image/png	21149	2017-12-10 22:19:05.635435	1
137	A Many-Splendoured Thing 125	Microdosing 3 wolf moon venmo taxidermy diy drinking green juice.	66.7399999999999949	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:06.144859	2018-02-09 18:15:50.989834	0	book_cover.png	image/png	21149	2017-12-10 22:19:05.885533	1
139	That Good Night 127	Organic ethical taxidermy godard.	31.6600000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:06.58187	2018-02-09 18:15:51.072271	0	book_cover.png	image/png	21149	2017-12-10 22:19:06.381898	1
140	Arms and the Man 128	Bushwick 8-bit hoodie letterpress gluten-free vinyl +1 jean shorts meditation.	13.5800000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:06.787639	2018-02-09 18:15:51.111258	0	book_cover.png	image/png	21149	2017-12-10 22:19:06.594203	1
142	Cover Her Face 130	Scenester jean shorts schlitz literally.	41.3400000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:07.229093	2018-02-09 18:15:51.219769	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.011631	1
143	The Skull Beneath the Skin 131	Artisan etsy actually tilde wes anderson.	58.1300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:07.455168	2018-02-09 18:15:51.275094	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.24826	1
144	I Will Fear No Evil 132	Brooklyn narwhal migas small batch authentic trust fund vinyl listicle.	55.7899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:07.671366	2018-02-09 18:15:51.35948	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.467116	1
145	Of Mice and Men 133	Messenger bag brunch banh mi bitters yr small batch keffiyeh godard humblebrag.	60.759999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:07.953315	2018-02-09 18:15:51.407314	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.683137	1
147	Wildfire at Midnight 135	Wayfarers chambray lumbersexual cleanse hoodie pbr&b leggings.	24.6499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:08.522469	2018-02-09 18:15:51.535578	0	book_cover.png	image/png	21149	2017-12-10 22:19:08.263391	1
148	A Passage to India 136	Scenester plaid try-hard marfa.	10.4800000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:08.833837	2018-02-09 18:15:51.579915	0	book_cover.png	image/png	21149	2017-12-10 22:19:08.536715	1
149	Fear and Trembling 137	Pitchfork deep v craft beer pop-up pabst.	10.4399999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:09.1032	2018-02-09 18:15:51.657648	0	book_cover.png	image/png	21149	2017-12-10 22:19:08.846696	1
151	Lilies of the Field 139	Literally letterpress tilde humblebrag selvage retro.	25.8599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:09.541716	2018-02-09 18:15:51.749573	0	book_cover.png	image/png	21149	2017-12-10 22:19:09.328748	1
152	The Moving Finger 140	Gastropub hashtag next level shoreditch stumptown roof bespoke diy messenger bag.	20.370000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:09.808451	2018-02-09 18:15:51.780917	0	book_cover.png	image/png	21149	2017-12-10 22:19:09.5547	1
155	I Know Why the Caged Bird Sings 143	Celiac wolf portland plaid.	53.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:10.570865	2018-02-09 18:15:51.824485	0	book_cover.png	image/png	21149	2017-12-10 22:19:10.339931	1
159	The Wings of the Dove 147	Next level squid wayfarers artisan sartorial +1 fingerstache authentic.	64.3499999999999943	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:11.461882	2018-02-09 18:15:51.865711	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.242054	1
160	Ring of Bright Water 148	Disrupt wayfarers phlogiston 8-bit retro park franzen bitters venmo.	50.4200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:11.687421	2018-02-09 18:15:51.892589	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.475201	1
161	For a Breath I Tarry 149	Park organic readymade blue bottle synth chicharrones.	20.9299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:11.902148	2018-02-09 18:15:51.917141	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.697359	1
163	Have His Carcase 151	Beard artisan phlogiston selvage.	27.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:12.339684	2018-02-09 18:15:51.959189	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.131088	1
164	Clouds of Witness 152	Photo booth semiotics meh pitchfork 3 wolf moon fingerstache chambray.	34.8599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:12.552618	2018-02-09 18:15:51.97958	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.350305	1
165	Pale Kings and Princes 153	Sriracha truffaut scenester tofu.	41.9500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:12.761138	2018-02-09 18:15:52.014351	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.561924	1
167	Of Human Bondage 155	Forage salvia wolf letterpress.	46.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:13.221631	2018-02-09 18:15:52.063359	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.999485	1
168	A Time of Gifts 156	Crucifix drinking umami banh mi vhs single-origin coffee austin banjo.	17.9899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:13.444945	2018-02-09 18:15:52.091566	0	book_cover.png	image/png	21149	2017-12-10 22:19:13.233394	1
170	Of Human Bondage 158	Next level iphone cornhole freegan muggle magic kickstarter sustainable semiotics.	20.9100000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:13.882986	2018-02-09 18:15:52.150157	0	book_cover.png	image/png	21149	2017-12-10 22:19:13.677653	1
171	Vile Bodies 159	Blog kitsch chartreuse normcore.	16.2199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:14.107521	2018-02-09 18:15:52.171386	0	book_cover.png	image/png	21149	2017-12-10 22:19:13.894632	1
172	As I Lay Dying 160	Deep v 8-bit ethical tousled roof ennui.	52.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:14.342302	2018-02-09 18:15:52.195409	0	book_cover.png	image/png	21149	2017-12-10 22:19:14.121756	1
174	This Lime Tree Bower 162	Kombucha pork belly vhs tote bag direct trade.	66.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:14.799976	2018-02-09 18:15:52.243546	0	book_cover.png	image/png	21149	2017-12-10 22:19:14.585865	1
175	Endless Night 163	Microdosing celiac diy shabby chic chia schlitz.	36.1499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:15.021167	2018-02-09 18:15:52.263416	0	book_cover.png	image/png	21149	2017-12-10 22:19:14.816799	1
178	All the King's Men 166	Intelligentsia twee artisan neutra authentic beard seitan quinoa.	59.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:15.694691	2018-02-09 18:15:52.323856	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.478662	1
179	The Road Less Traveled 167	Occupy health mumblecore craft beer gastropub ennui.	66.4000000000000057	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:15.927646	2018-02-09 18:15:52.344842	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.707416	1
180	Dance Dance Dance 168	Kogi humblebrag vhs blue bottle fashion axe direct trade.	67.2399999999999949	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:16.149586	2018-02-09 18:15:52.369588	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.941089	1
182	The Wealth of Nations 170	Shabby chic pug marfa authentic lomo.	32.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:16.617228	2018-02-09 18:15:52.415227	0	book_cover.png	image/png	21149	2017-12-10 22:19:16.395568	1
183	Waiting for the Barbarians 171	Tofu blue bottle squid pork belly polaroid mixtape.	63.6000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:16.864532	2018-02-09 18:15:52.443239	0	book_cover.png	image/png	21149	2017-12-10 22:19:16.63183	1
184	Ah, Wilderness! 172	Asymmetrical normcore freegan pbr&b farm-to-table readymade craft beer kogi.	23.1600000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:17.088492	2018-02-09 18:15:52.484725	0	book_cover.png	image/png	21149	2017-12-10 22:19:16.87704	1
186	In Dubious Battle 174	Typewriter poutine aesthetic hella.	40.9500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:17.554417	2018-02-09 18:15:52.559699	0	book_cover.png	image/png	21149	2017-12-10 22:19:17.337878	1
187	The Last Enemy 175	Cornhole heirloom 8-bit thundercats.	36.1799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:17.790678	2018-02-09 18:15:52.612363	0	book_cover.png	image/png	21149	2017-12-10 22:19:17.56828	1
188	A Passage to India 176	Photo booth master ennui pickled gastropub vinyl cardigan.	51.5700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:18.015057	2018-02-09 18:15:52.667482	0	book_cover.png	image/png	21149	2017-12-10 22:19:17.803973	1
190	A Many-Splendoured Thing 178	Wolf tumblr thundercats green juice trust fund synth leggings kombucha phlogiston.	18.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:18.471351	2018-02-09 18:15:52.739608	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.255815	1
191	That Hideous Strength 179	Direct trade master everyday mustache.	44.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:18.686263	2018-02-09 18:15:52.788814	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.480648	1
192	Where Angels Fear to Tread 180	Disrupt whatever tousled everyday 3 wolf moon jean shorts taxidermy tacos salvia.	58.759999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:18.912587	2018-02-09 18:15:52.819652	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.702042	1
193	The Wealth of Nations 181	Retro chicharrones chartreuse aesthetic.	66.9899999999999949	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:19.13885	2018-02-09 18:15:52.843418	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.922243	1
197	The Wings of the Dove 185	Thundercats carry dreamcatcher ugh.	28.8099999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:20.046556	2018-02-09 18:15:52.945038	0	book_cover.png	image/png	21149	2017-12-10 22:19:19.815147	1
198	The Skull Beneath the Skin 186	Tofu aesthetic pork belly chia poutine.	57.9600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:20.254654	2018-02-09 18:15:52.979539	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.055848	1
199	Infinite Jest 187	Selfies marfa meh pbr&b drinking kickstarter godard phlogiston.	14.9299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:20.471644	2018-02-09 18:15:53.015618	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.268167	1
201	The Glory and the Dream 189	Cardigan goth austin leggings pabst godard disrupt crucifix.	57.240000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:20.923754	2018-02-09 18:15:53.073623	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.69341	1
202	What's Become of Waring 190	Pitchfork farm-to-table try-hard chicharrones paleo meditation gentrify.	11.7699999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:21.156821	2018-02-09 18:15:53.101921	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.932999	1
203	Vanity Fair 191	Before they sold out next level gentrify butcher leggings helvetica single-origin coffee green juice.	51.5200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:21.386629	2018-02-09 18:15:53.132349	0	book_cover.png	image/png	21149	2017-12-10 22:19:21.167531	1
205	The Millstone 193	Farm-to-table bespoke pbr&b squid migas.	42.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:21.834091	2018-02-09 18:15:53.213119	0	book_cover.png	image/png	21149	2017-12-10 22:19:21.622157	1
206	Consider Phlebas 194	Offal tattooed loko paleo biodiesel neutra.	60.75	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:22.051979	2018-02-09 18:15:53.267635	0	book_cover.png	image/png	21149	2017-12-10 22:19:21.846219	1
207	All the King's Men 195	Quinoa kitsch echo +1 chambray gastropub tofu viral.	62.9299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:22.272056	2018-02-09 18:15:53.305974	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.061184	1
209	Infinite Jest 197	Distillery selfies brunch schlitz irony marfa banjo.	7.41000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:22.707877	2018-02-09 18:15:53.410853	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.509475	1
210	To Sail Beyond the Sunset 198	Health yuccie kale chips viral deep v keytar cred dreamcatcher street.	60.1599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:22.927581	2018-02-09 18:15:53.471735	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.725741	1
212	Wildfire at Midnight 200	Raw denim letterpress selfies stumptown readymade authentic goth locavore marfa.	54.3699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:23.370948	2018-02-09 18:15:53.515421	0	book_cover.png	image/png	21149	2017-12-10 22:19:23.160794	1
214	The Far-Distant Oxus 202	Mumblecore chicharrones letterpress banh mi chillwave bicycle rights.	41.1199999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:23.838736	2018-02-09 18:15:53.603607	0	book_cover.png	image/png	21149	2017-12-10 22:19:23.627006	1
215	Let Us Now Praise Famous Men 203	Diy stumptown ugh 90's keytar cliche.	19.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:24.06737	2018-02-09 18:15:53.633589	0	book_cover.png	image/png	21149	2017-12-10 22:19:23.850814	1
216	O Pioneers! 204	Trust fund 3 wolf moon chia forage diy tattooed sriracha mlkshk.	16.9800000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:24.287639	2018-02-09 18:15:53.675533	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.078941	1
218	The Waste Land 206	Cray craft beer schlitz banh mi retro waistcoat.	37.6899999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:24.712541	2018-02-09 18:15:53.775698	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.512015	1
219	Pale Kings and Princes 207	Direct trade kogi gastropub art party park narwhal muggle magic.	69.730000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:24.921455	2018-02-09 18:15:53.830534	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.723625	1
220	Dying of the Light 208	Kitsch semiotics pour-over normcore mixtape tumblr flexitarian bicycle rights.	41.3999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:25.165585	2018-02-09 18:15:53.875915	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.929543	1
222	Recalled to Life 210	Chartreuse meditation celiac pbr&b echo sriracha yolo.	10.3499999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:25.588924	2018-02-09 18:15:53.948722	0	book_cover.png	image/png	21149	2017-12-10 22:19:25.385328	1
223	The Skull Beneath the Skin 211	Organic bitters asymmetrical put a bird on it kickstarter cred lomo blue bottle.	64.0499999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:25.809976	2018-02-09 18:15:53.981721	0	book_cover.png	image/png	21149	2017-12-10 22:19:25.604527	1
224	The Golden Apples of the Sun 212	Waistcoat bicycle rights single-origin coffee chartreuse.	57.3699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:26.066202	2018-02-09 18:15:54.031772	0	book_cover.png	image/png	21149	2017-12-10 22:19:25.819388	1
225	Lilies of the Field 213	Meggings drinking tote bag cronut.	56.4299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:26.284632	2018-02-09 18:15:54.064113	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.074252	1
227	O Pioneers! 215	Phlogiston heirloom loko bitters health cleanse single-origin coffee paleo.	68.8299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:26.729006	2018-02-09 18:15:54.126012	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.524016	1
228	The Heart Is a Lonely Hunter 216	Celiac pickled heirloom tote bag semiotics disrupt bushwick meditation freegan.	21.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:26.952862	2018-02-09 18:15:54.167402	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.739155	1
230	Frequent Hearses 218	Authentic cleanse health bitters austin cred.	48.4500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:27.397282	2018-02-09 18:15:54.223897	0	book_cover.png	image/png	21149	2017-12-10 22:19:27.191496	1
231	All Passion Spent 219	Kogi distillery portland phlogiston locavore.	64.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:27.61253	2018-02-09 18:15:54.279329	0	book_cover.png	image/png	21149	2017-12-10 22:19:27.406752	1
233	Alone on a Wide, Wide Sea 221	Bespoke gastropub mustache lo-fi fixie kickstarter.	28.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:28.132177	2018-02-09 18:15:54.323511	0	book_cover.png	image/png	21149	2017-12-10 22:19:27.926899	1
234	Vanity Fair 222	8-bit farm-to-table yr cornhole sustainable skateboard locavore.	69.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:28.340283	2018-02-09 18:15:54.383856	0	book_cover.png	image/png	21149	2017-12-10 22:19:28.141092	1
235	That Good Night 223	Selvage pbr&b helvetica everyday kombucha brooklyn art party dreamcatcher meh.	8.09999999999999964	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:28.574542	2018-02-09 18:15:54.435509	0	book_cover.png	image/png	21149	2017-12-10 22:19:28.355222	1
237	Tiger! Tiger! 225	Viral sriracha irony bushwick meggings photo booth microdosing tattooed hashtag.	35.1000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:29.203555	2018-02-09 18:15:54.511675	0	book_cover.png	image/png	21149	2017-12-10 22:19:28.826279	1
238	Eyeless in Gaza 226	Put a bird on it butcher five dollar toast tattooed messenger bag before they sold out sartorial wolf.	27.370000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:29.496599	2018-02-09 18:15:54.56008	0	book_cover.png	image/png	21149	2017-12-10 22:19:29.217263	1
239	Blue Remembered Earth 227	Shabby chic bespoke heirloom celiac craft beer authentic put a bird on it.	54.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:29.774391	2018-02-09 18:15:54.588561	0	book_cover.png	image/png	21149	2017-12-10 22:19:29.517038	1
241	The Cricket on the Hearth 229	Sustainable cray vinyl migas.	43.8800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:30.29914	2018-02-09 18:15:54.680358	0	book_cover.png	image/png	21149	2017-12-10 22:19:30.08451	1
242	Where Angels Fear to Tread 230	Muggle magic twee cardigan vinyl trust fund iphone meh.	50.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:30.628267	2018-02-09 18:15:54.73233	0	book_cover.png	image/png	21149	2017-12-10 22:19:30.311786	1
243	A Time of Gifts 231	Iphone truffaut dreamcatcher kale chips bicycle rights migas.	12.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:30.910607	2018-02-09 18:15:54.807525	0	book_cover.png	image/png	21149	2017-12-10 22:19:30.636831	1
246	Behold the Man 234	Phlogiston sriracha banjo yolo next level jean shorts kombucha tacos.	43.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:31.658504	2018-02-09 18:15:54.903895	0	book_cover.png	image/png	21149	2017-12-10 22:19:31.443575	1
247	From Here to Eternity 235	Small batch roof literally mumblecore vegan yr pour-over kickstarter selvage.	31.0100000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:31.893284	2018-02-09 18:15:54.937226	0	book_cover.png	image/png	21149	2017-12-10 22:19:31.671355	1
249	Specimen Days 237	Waistcoat brunch migas mlkshk post-ironic chia.	27.4800000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:32.376294	2018-02-09 18:15:55.019565	0	book_cover.png	image/png	21149	2017-12-10 22:19:32.137724	1
250	Beyond the Mexique Bay 238	+1 kitsch butcher photo booth chillwave.	37.3400000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:32.603826	2018-02-09 18:15:55.083078	0	book_cover.png	image/png	21149	2017-12-10 22:19:32.387053	1
251	The Needle's Eye 239	Pop-up gentrify sriracha phlogiston venmo thundercats chicharrones.	7.49000000000000021	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:32.829702	2018-02-09 18:15:55.106114	0	book_cover.png	image/png	21149	2017-12-10 22:19:32.612204	1
253	Jesting Pilate 241	Park kombucha post-ironic chillwave shoreditch kogi next level.	49.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:33.323525	2018-02-09 18:15:55.143315	0	book_cover.png	image/png	21149	2017-12-10 22:19:33.09403	1
254	Nectar in a Sieve 242	Synth thundercats brooklyn cold-pressed chartreuse.	33.4399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:33.622556	2018-02-09 18:15:55.158148	0	book_cover.png	image/png	21149	2017-12-10 22:19:33.336091	1
255	Terrible Swift Sword 243	Wolf polaroid try-hard kitsch.	14.5399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:33.917664	2018-02-09 18:15:55.174826	0	book_cover.png	image/png	21149	2017-12-10 22:19:33.635647	1
257	In Death Ground 245	Biodiesel mumblecore banh mi kogi direct trade hella selvage.	49.0200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:34.504025	2018-02-09 18:15:55.220488	0	book_cover.png	image/png	21149	2017-12-10 22:19:34.262161	1
258	The Wings of the Dove 246	Venmo pinterest sriracha schlitz.	28.1600000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:34.750381	2018-02-09 18:15:55.274997	0	book_cover.png	image/png	21149	2017-12-10 22:19:34.519434	1
259	Lilies of the Field 247	Letterpress slow-carb kale chips fanny pack distillery banh mi pug small batch microdosing.	54.2999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:35.016117	2018-02-09 18:15:55.314573	0	book_cover.png	image/png	21149	2017-12-10 22:19:34.765372	1
261	Sleep the Brave 249	Vinyl butcher farm-to-table seitan banh mi tattooed marfa try-hard muggle magic.	16.8599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:35.471656	2018-02-09 18:15:55.42725	0	book_cover.png	image/png	21149	2017-12-10 22:19:35.267576	1
262	By Grand Central Station I Sat Down and Wept 250	Williamsburg thundercats fixie dreamcatcher semiotics.	60.8100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:35.706525	2018-02-09 18:15:55.454268	0	book_cover.png	image/png	21149	2017-12-10 22:19:35.484966	1
265	As I Lay Dying 253	Letterpress loko listicle swag cray vinegar biodiesel.	42.9600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:36.562695	2018-02-09 18:15:55.531097	0	book_cover.png	image/png	21149	2017-12-10 22:19:36.332033	1
266	Butter In a Lordly Dish 254	Seitan keffiyeh bespoke marfa plaid church-key lomo pitchfork humblebrag.	12.8699999999999992	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:36.800891	2018-02-09 18:15:55.557478	0	book_cover.png	image/png	21149	2017-12-10 22:19:36.574089	1
267	The Proper Study 255	Selvage craft beer ennui knausgaard freegan pickled.	7.73000000000000043	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:37.025361	2018-02-09 18:15:55.587211	0	book_cover.png	image/png	21149	2017-12-10 22:19:36.810611	1
268	To Your Scattered Bodies Go 256	Umami roof hammock meditation yolo.	66.6299999999999955	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:37.247432	2018-02-09 18:15:55.621366	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.035991	1
272	A Passage to India 260	Kale chips chillwave crucifix everyday kinfolk sartorial banjo park.	11.3300000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:38.159049	2018-02-09 18:15:55.675013	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.93808	1
273	The Way Through the Woods 261	Fashion axe craft beer vhs vinegar.	17.8500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:38.382324	2018-02-09 18:15:55.694017	0	book_cover.png	image/png	21149	2017-12-10 22:19:38.168518	1
274	From Here to Eternity 262	Marfa godard meditation pork belly roof brunch.	67.7099999999999937	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:38.599467	2018-02-09 18:15:55.723563	0	book_cover.png	image/png	21149	2017-12-10 22:19:38.393139	1
277	Edna O'Brien 265	Gluten-free kombucha waistcoat diy echo church-key.	34.2100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:39.370809	2018-02-09 18:15:55.803507	0	book_cover.png	image/png	21149	2017-12-10 22:19:39.16438	1
278	The Line of Beauty 266	Meggings drinking banjo try-hard cray fingerstache.	63.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:39.584984	2018-02-09 18:15:55.848739	0	book_cover.png	image/png	21149	2017-12-10 22:19:39.380106	1
279	A Summer Bird-Cage 267	Ethical drinking leggings pickled trust fund.	21.120000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:39.88054	2018-02-09 18:15:55.880364	0	book_cover.png	image/png	21149	2017-12-10 22:19:39.599552	1
280	Behold the Man 268	Heirloom photo booth brunch tofu kinfolk.	34.8699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:40.10894	2018-02-09 18:15:55.905947	0	book_cover.png	image/png	21149	2017-12-10 22:19:39.890483	1
281	Dulce et Decorum Est 269	3 wolf moon microdosing hoodie 90's.	11.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:40.32248	2018-02-09 18:15:55.923507	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.117635	1
283	An Acceptable Time 271	Sartorial yolo butcher fanny pack chambray leggings normcore skateboard.	33.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:40.765765	2018-02-09 18:15:55.999703	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.561084	1
284	Nine Coaches Waiting 272	Letterpress stumptown cray lumbersexual xoxo everyday 8-bit semiotics tote bag.	50.3999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:40.98539	2018-02-09 18:15:56.023342	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.774742	1
285	The Needle's Eye 273	Pickled pabst food truck kitsch post-ironic pitchfork.	61.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:41.244257	2018-02-09 18:15:56.059658	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.994979	1
286	Far From the Madding Crowd 274	Tattooed try-hard bushwick godard.	45.7000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:41.555835	2018-02-09 18:15:56.09079	0	book_cover.png	image/png	21149	2017-12-10 22:19:41.260459	1
288	The Proper Study 276	Bitters godard meditation gastropub lo-fi.	26.4800000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:42.067873	2018-02-09 18:15:56.140466	0	book_cover.png	image/png	21149	2017-12-10 22:19:41.848228	1
289	A Farewell to Arms 277	Viral slow-carb pinterest brooklyn pork belly skateboard 90's yr.	26.870000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:42.285146	2018-02-09 18:15:56.166088	0	book_cover.png	image/png	21149	2017-12-10 22:19:42.081092	1
292	Dance Dance Dance 280	Church-key green juice kogi austin bespoke tumblr vice.	47.240000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:43.012244	2018-02-09 18:15:56.207804	0	book_cover.png	image/png	21149	2017-12-10 22:19:42.75796	1
293	Unweaving the Rainbow 281	Church-key pop-up vhs single-origin coffee direct trade.	17.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:43.27259	2018-02-09 18:15:56.239129	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.02536	1
294	Many Waters 282	+1 farm-to-table before they sold out locavore goth distillery vice.	55.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:43.507806	2018-02-09 18:15:56.261571	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.285418	1
296	Time To Murder And Create 284	Pickled iphone tofu brunch.	47.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:43.947601	2018-02-09 18:15:56.294456	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.743293	1
297	Stranger in a Strange Land 285	Migas pickled chambray leggings dreamcatcher wolf deep v intelligentsia.	32.5900000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:44.199394	2018-02-09 18:15:56.334118	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.957161	1
298	To Say Nothing of the Dog 286	Gluten-free keffiyeh beard chia banjo portland distillery gastropub schlitz.	50.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:44.446526	2018-02-09 18:15:56.373434	0	book_cover.png	image/png	21149	2017-12-10 22:19:44.209799	1
300	Specimen Days 288	Drinking microdosing kitsch put a bird on it biodiesel vhs.	28.5599999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:44.902803	2018-02-09 18:15:56.439322	0	book_cover.png	image/png	21149	2017-12-10 22:19:44.672967	1
301	In Dubious Battle 289	Before they sold out microdosing hoodie neutra.	50.2199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:45.140405	2018-02-09 18:15:56.472202	0	book_cover.png	image/png	21149	2017-12-10 22:19:44.914856	1
302	Shall not Perish 290	Salvia park shabby chic cardigan selfies try-hard franzen.	20.9600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:45.426396	2018-02-09 18:15:56.486023	0	book_cover.png	image/png	21149	2017-12-10 22:19:45.15712	1
304	Dying of the Light 292	Organic occupy poutine williamsburg.	68.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:45.888795	2018-02-09 18:15:56.524949	0	book_cover.png	image/png	21149	2017-12-10 22:19:45.665756	1
305	Lilies of the Field 293	Polaroid flannel listicle aesthetic hashtag swag.	64.1500000000000057	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:46.115676	2018-02-09 18:15:56.557479	0	book_cover.png	image/png	21149	2017-12-10 22:19:45.896546	1
306	The Cricket on the Hearth 294	Kale chips cornhole truffaut lo-fi tousled.	32.9699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:46.354218	2018-02-09 18:15:56.631369	0	book_cover.png	image/png	21149	2017-12-10 22:19:46.126713	1
310	Behold the Man 298	Paleo kickstarter fingerstache church-key echo gentrify.	57.4399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:47.432053	2018-02-09 18:15:56.71517	0	book_cover.png	image/png	21149	2017-12-10 22:19:47.187951	1
312	His Dark Materials 300	Distillery xoxo 90's next level asymmetrical jean shorts.	40.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:47.880003	2018-02-09 18:15:56.808693	0	book_cover.png	image/png	21149	2017-12-10 22:19:47.677668	1
313	Paths of Glory 301	Flexitarian typewriter microdosing blog banh mi fanny pack swag skateboard.	48.4099999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:48.106294	2018-02-09 18:15:56.847443	0	book_cover.png	image/png	21149	2017-12-10 22:19:47.888671	1
315	Dying of the Light 303	Chartreuse schlitz letterpress wes anderson +1.	61.8500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:48.562662	2018-02-09 18:15:56.951746	0	book_cover.png	image/png	21149	2017-12-10 22:19:48.345429	1
316	The World, the Flesh and the Devil 304	Chambray food truck ennui williamsburg fanny pack keffiyeh beard 8-bit typewriter.	65.7600000000000051	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:48.800738	2018-02-09 18:15:57.003694	0	book_cover.png	image/png	21149	2017-12-10 22:19:48.571754	1
317	If I Forget Thee Jerusalem 305	Hammock blog kombucha keytar knausgaard.	62.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:49.026231	2018-02-09 18:15:57.046328	0	book_cover.png	image/png	21149	2017-12-10 22:19:48.810052	1
319	Shall not Perish 307	Beard muggle magic food truck tousled normcore.	25.9899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:49.483055	2018-02-09 18:15:57.180641	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.267781	1
320	Vanity Fair 308	Chambray truffaut park gentrify cronut vinegar selfies keytar pitchfork.	42	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:49.717642	2018-02-09 18:15:57.243625	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.494657	1
321	Shall not Perish 309	Pug mlkshk wolf vinyl butcher master tacos squid diy.	11.5299999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:49.935596	2018-02-09 18:15:57.313154	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.726824	1
323	Specimen Days 311	Trust fund bushwick food truck chambray pickled biodiesel five dollar toast vinegar letterpress.	8.71000000000000085	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:50.393806	2018-02-09 18:15:57.439411	0	book_cover.png	image/png	21149	2017-12-10 22:19:50.173745	1
324	Carrion Comfort 312	Put a bird on it +1 tattooed cred gluten-free distillery freegan 3 wolf moon sartorial.	58.5200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:50.628796	2018-02-09 18:15:57.48158	0	book_cover.png	image/png	21149	2017-12-10 22:19:50.405396	1
325	The Wives of Bath 313	Echo meditation put a bird on it pug vinegar bushwick vice actually brunch.	55.2800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:50.862645	2018-02-09 18:15:57.531868	0	book_cover.png	image/png	21149	2017-12-10 22:19:50.640785	1
327	Beyond the Mexique Bay 315	Pug distillery fanny pack banh mi sartorial tilde actually normcore bespoke.	14.9600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:51.312242	2018-02-09 18:15:57.665561	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.092624	1
661	A Summer Bird-Cage 649	Schlitz pour-over ramps selvage.	15.8499999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:07.240229	2018-02-09 18:16:08.448369	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.019806	1
328	Fame Is the Spur 316	Tousled blog +1 shabby chic tacos flannel polaroid pickled green juice.	23.5500000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:51.539421	2018-02-09 18:15:57.725005	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.32455	1
329	Edna O'Brien 317	Pour-over biodiesel selfies crucifix hoodie deep v try-hard hammock 3 wolf moon.	18.6799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:51.751694	2018-02-09 18:15:57.787509	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.552371	1
332	A Monstrous Regiment of Women 320	Hammock iphone mixtape carry small batch migas kitsch vice paleo.	67.769999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:52.422223	2018-02-09 18:15:57.882789	0	book_cover.png	image/png	21149	2017-12-10 22:19:52.204299	1
333	Far From the Madding Crowd 321	Umami waistcoat chartreuse health typewriter.	46.8699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:52.653127	2018-02-09 18:15:57.948018	0	book_cover.png	image/png	21149	2017-12-10 22:19:52.435203	1
334	By Grand Central Station I Sat Down and Wept 322	Tattooed thundercats pitchfork artisan stumptown quinoa.	65.5400000000000063	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:52.876346	2018-02-09 18:15:57.987643	0	book_cover.png	image/png	21149	2017-12-10 22:19:52.661966	1
335	Mother Night 323	Twee yr mlkshk echo roof franzen gastropub.	66.5699999999999932	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:53.111928	2018-02-09 18:15:58.026892	0	book_cover.png	image/png	21149	2017-12-10 22:19:52.886158	1
337	The Last Enemy 325	Iphone carry wes anderson pork belly street cold-pressed portland synth wayfarers.	40.3299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:53.570919	2018-02-09 18:15:58.095978	0	book_cover.png	image/png	21149	2017-12-10 22:19:53.357146	1
338	The Yellow Meads of Asphodel 326	Williamsburg kogi shoreditch tofu.	14.3800000000000008	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:53.797989	2018-02-09 18:15:58.155945	0	book_cover.png	image/png	21149	2017-12-10 22:19:53.584299	1
340	Mr Standfast 328	Raw denim austin cray single-origin coffee green juice aesthetic normcore tote bag.	9.50999999999999979	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:54.306148	2018-02-09 18:15:58.218937	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.081525	1
341	A Glass of Blessings 329	Ethical freegan goth farm-to-table raw denim cornhole vinegar distillery.	17.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:54.536971	2018-02-09 18:15:58.247999	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.318295	1
343	The Violent Bear It Away 331	Waistcoat crucifix skateboard selfies tumblr austin brunch put a bird on it.	18.1600000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:54.981093	2018-02-09 18:15:58.343866	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.765003	1
497	The Green Bay Tree 485	Paleo literally fixie etsy deep v hoodie.	39.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:29.951888	2018-02-09 18:15:58.387504	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.743386	1
347	Moab Is My Washpot 335	Kinfolk beard before they sold out letterpress mustache raw denim.	68.1899999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:55.873235	2018-02-09 18:15:58.488561	0	book_cover.png	image/png	21149	2017-12-10 22:19:55.673998	1
348	Now Sleeps the Crimson Petal 336	Raw denim put a bird on it actually blog.	50.7700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:56.09604	2018-02-09 18:15:58.547613	0	book_cover.png	image/png	21149	2017-12-10 22:19:55.885973	1
349	The Soldier's Art 337	Five dollar toast fingerstache cold-pressed marfa single-origin coffee portland.	14.3100000000000005	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:56.327518	2018-02-09 18:15:58.611469	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.112451	1
351	Vanity Fair 339	Diy chicharrones cardigan sriracha umami forage scenester ethical microdosing.	67.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:56.7673	2018-02-09 18:15:58.677668	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.562983	1
352	In Death Ground 340	Vhs artisan lomo thundercats fashion axe organic health you probably haven't heard of them pitchfork.	23.2399999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:56.987856	2018-02-09 18:15:58.706205	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.779481	1
353	The Last Enemy 341	Brunch lo-fi wes anderson beard scenester viral.	50.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:57.209407	2018-02-09 18:15:58.760809	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.999178	1
355	Nine Coaches Waiting 343	Messenger bag tousled tacos roof 8-bit organic.	40.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:57.680521	2018-02-09 18:15:58.818375	0	book_cover.png	image/png	21149	2017-12-10 22:19:57.458141	1
356	The Moving Toyshop 344	Intelligentsia chambray kinfolk portland yolo ramps.	45.4600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:57.900445	2018-02-09 18:15:58.850383	0	book_cover.png	image/png	21149	2017-12-10 22:19:57.694663	1
357	For Whom the Bell Tolls 345	Messenger bag chia diy tofu hella cardigan.	13.4600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:58.134168	2018-02-09 18:15:58.871799	0	book_cover.png	image/png	21149	2017-12-10 22:19:57.912175	1
358	If Not Now, When? 346	Chia fingerstache banjo cred.	41.8500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:58.359903	2018-02-09 18:15:58.902718	0	book_cover.png	image/png	21149	2017-12-10 22:19:58.146316	1
360	Everything is Illuminated 348	Sustainable chicharrones knausgaard jean shorts meh.	24.5399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:58.803498	2018-02-09 18:15:58.9675	0	book_cover.png	image/png	21149	2017-12-10 22:19:58.594261	1
361	Of Mice and Men 349	Muggle magic hashtag franzen brooklyn narwhal organic occupy.	20.5500000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:59.047477	2018-02-09 18:15:58.987893	0	book_cover.png	image/png	21149	2017-12-10 22:19:58.816646	1
362	Many Waters 350	Narwhal dreamcatcher pinterest master ramps.	64.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:59.256865	2018-02-09 18:15:59.031183	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.061104	1
364	Blue Remembered Earth 352	Next level thundercats etsy intelligentsia ugh viral dreamcatcher keytar.	15.4499999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:59.695407	2018-02-09 18:15:59.077667	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.491448	1
365	Mr Standfast 353	3 wolf moon muggle magic art party normcore thundercats.	19.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:59.920045	2018-02-09 18:15:59.115379	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.707996	1
368	The Curious Incident of the Dog in the Night-Time 356	Bushwick chartreuse occupy +1 jean shorts post-ironic literally cronut.	37.5900000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:00.596726	2018-02-09 18:15:59.171179	0	book_cover.png	image/png	21149	2017-12-10 22:20:00.388106	1
369	The Mermaids Singing 357	Shoreditch salvia selvage echo.	18.8000000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:00.84662	2018-02-09 18:15:59.20392	0	book_cover.png	image/png	21149	2017-12-10 22:20:00.609322	1
370	All the King's Men 358	Distillery street twee park franzen cardigan.	9.72000000000000064	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:01.102953	2018-02-09 18:15:59.229681	0	book_cover.png	image/png	21149	2017-12-10 22:20:00.860489	1
372	By Grand Central Station I Sat Down and Wept 360	Literally flexitarian letterpress blue bottle butcher flannel pork belly keytar mixtape.	50.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:01.582717	2018-02-09 18:15:59.282869	0	book_cover.png	image/png	21149	2017-12-10 22:20:01.368666	1
373	Bury My Heart at Wounded Knee 361	Irony tote bag loko iphone green juice selvage shabby chic gluten-free.	8.89000000000000057	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:01.817861	2018-02-09 18:15:59.31161	0	book_cover.png	image/png	21149	2017-12-10 22:20:01.600201	1
374	Mr Standfast 362	Hashtag farm-to-table kickstarter wayfarers health.	65.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:02.053458	2018-02-09 18:15:59.339242	0	book_cover.png	image/png	21149	2017-12-10 22:20:01.831571	1
376	The Heart Is Deceitful Above All Things 364	Yr everyday franzen cold-pressed schlitz next level waistcoat.	47.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:02.51519	2018-02-09 18:15:59.401518	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.302555	1
377	A Many-Splendoured Thing 365	Humblebrag wes anderson muggle magic roof thundercats blue bottle banjo lomo blog.	54.2800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:02.746393	2018-02-09 18:15:59.431242	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.528604	1
379	A Glass of Blessings 367	Banjo ethical craft beer pbr&b single-origin coffee.	15.9499999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:03.174931	2018-02-09 18:15:59.491629	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.975629	1
380	Fear and Trembling 368	Synth chartreuse small batch plaid.	26.9499999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:03.401285	2018-02-09 18:15:59.527564	0	book_cover.png	image/png	21149	2017-12-10 22:20:03.193468	1
381	Waiting for the Barbarians 369	Lumbersexual knausgaard iphone letterpress.	41.1300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:03.621325	2018-02-09 18:15:59.559329	0	book_cover.png	image/png	21149	2017-12-10 22:20:03.410946	1
383	This Side of Paradise 371	+1 squid deep v wayfarers.	18.3099999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:04.043403	2018-02-09 18:15:59.594091	0	book_cover.png	image/png	21149	2017-12-10 22:20:03.841762	1
385	Frequent Hearses 373	Everyday iphone microdosing 90's five dollar toast authentic.	32.009999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:04.487269	2018-02-09 18:15:59.668861	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.265912	1
387	Fair Stood the Wind for France 375	Asymmetrical pop-up slow-carb chartreuse raw denim iphone yuccie.	23.2800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:04.910039	2018-02-09 18:15:59.737138	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.708966	1
389	Down to a Sunless Sea 377	Hella bitters portland carry microdosing cliche waistcoat literally.	42.2800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:05.363365	2018-02-09 18:15:59.823217	0	book_cover.png	image/png	21149	2017-12-10 22:20:05.159945	1
393	No Longer at Ease 381	Listicle sriracha bitters typewriter diy lo-fi drinking butcher.	25.629999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:06.27254	2018-02-09 18:15:59.959388	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.055401	1
394	I Will Fear No Evil 382	Kale chips shoreditch scenester 3 wolf moon vice hoodie godard.	33.5799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:06.486751	2018-02-09 18:15:59.999789	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.287298	1
395	Behold the Man 383	Meggings craft beer seitan polaroid meditation actually.	49.1000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:06.714108	2018-02-09 18:16:00.027845	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.502494	1
396	Fame Is the Spur 384	Diy letterpress art party flexitarian meh.	47.8699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:06.938103	2018-02-09 18:16:00.052871	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.72565	1
397	The Stars' Tennis Balls 385	Selvage wolf brooklyn normcore church-key yuccie literally.	10.4399999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:07.151159	2018-02-09 18:16:00.071257	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.947727	1
398	The Wind's Twelve Quarters 386	Tote bag hella diy meh you probably haven't heard of them yuccie bespoke beard irony.	51.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:07.369286	2018-02-09 18:16:00.102577	0	book_cover.png	image/png	21149	2017-12-10 22:20:07.159813	1
399	The Road Less Traveled 387	Ennui banh mi banjo cold-pressed chia cleanse.	58.3800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:07.591791	2018-02-09 18:16:00.127835	0	book_cover.png	image/png	21149	2017-12-10 22:20:07.378515	1
400	Tirra Lirra by the River 388	Schlitz carry pickled post-ironic.	60.5499999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:07.822993	2018-02-09 18:16:00.149014	0	book_cover.png	image/png	21149	2017-12-10 22:20:07.605608	1
401	Fair Stood the Wind for France 389	Ugh pork belly selvage flannel blue bottle intelligentsia.	48.2999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:08.04075	2018-02-09 18:16:00.172406	0	book_cover.png	image/png	21149	2017-12-10 22:20:07.836368	1
402	This Lime Tree Bower 390	Neutra swag cornhole pickled.	56.4699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:08.271757	2018-02-09 18:16:00.195145	0	book_cover.png	image/png	21149	2017-12-10 22:20:08.057727	1
403	The Other Side of Silence 391	Butcher irony trust fund tacos twee.	52.8800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:08.500598	2018-02-09 18:16:00.219336	0	book_cover.png	image/png	21149	2017-12-10 22:20:08.281359	1
405	Oh! To be in England 393	Squid tacos pickled trust fund pitchfork cliche beard scenester.	67.0699999999999932	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:09.047862	2018-02-09 18:16:00.272038	0	book_cover.png	image/png	21149	2017-12-10 22:20:08.7494	1
406	A Scanner Darkly 394	Next level typewriter brooklyn loko occupy.	29.8099999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:09.262936	2018-02-09 18:16:00.314057	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.057372	1
410	Specimen Days 398	Fingerstache vegan small batch crucifix celiac mustache food truck.	40.509999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:10.141807	2018-02-09 18:16:00.399593	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.932255	1
411	Noli Me Tangere 399	Fixie poutine 3 wolf moon kitsch.	51.4200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:10.372211	2018-02-09 18:16:00.418669	0	book_cover.png	image/png	21149	2017-12-10 22:20:10.152133	1
413	Ring of Bright Water 401	Narwhal yuccie brooklyn beard.	44.7000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:10.806974	2018-02-09 18:16:00.467223	0	book_cover.png	image/png	21149	2017-12-10 22:20:10.607218	1
414	The Grapes of Wrath 402	Williamsburg banjo narwhal sustainable church-key single-origin coffee before they sold out.	16.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:11.021345	2018-02-09 18:16:00.495529	0	book_cover.png	image/png	21149	2017-12-10 22:20:10.817928	1
415	The Last Enemy 403	Pour-over semiotics ennui humblebrag pork belly.	13.0299999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:11.232032	2018-02-09 18:16:00.520107	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.030483	1
416	The Moon by Night 404	Stumptown tacos kickstarter pug.	51.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:11.446932	2018-02-09 18:16:00.552065	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.245344	1
419	An Evil Cradling 407	Cronut aesthetic art party next level photo booth selvage vhs waistcoat gentrify.	50.5900000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:12.072641	2018-02-09 18:16:00.644579	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.87463	1
420	A Handful of Dust 408	Knausgaard viral cold-pressed iphone echo mixtape vice single-origin coffee.	24.5899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:12.299123	2018-02-09 18:16:00.671835	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.082669	1
422	Tiger! Tiger! 410	Viral heirloom art party cardigan squid pinterest cliche.	68.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:12.736154	2018-02-09 18:16:00.695212	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.527464	1
425	To Your Scattered Bodies Go 413	Iphone ramps leggings pabst echo normcore skateboard.	30.4499999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:13.390804	2018-02-09 18:16:00.727117	0	book_cover.png	image/png	21149	2017-12-10 22:20:13.184482	1
426	Some Buried Caesar 414	Schlitz celiac meditation venmo whatever.	40.009999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:13.610318	2018-02-09 18:16:00.755613	0	book_cover.png	image/png	21149	2017-12-10 22:20:13.404231	1
428	Consider Phlebas 416	Mumblecore polaroid retro cliche +1 street.	56.0799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:14.055703	2018-02-09 18:16:00.84095	0	book_cover.png	image/png	21149	2017-12-10 22:20:13.846732	1
429	A Time of Gifts 417	Cardigan ramps microdosing kogi chicharrones yolo heirloom schlitz tilde.	62.6899999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:14.280156	2018-02-09 18:16:00.869094	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.070868	1
430	Paths of Glory 418	Vinyl letterpress kale chips actually narwhal chicharrones swag gluten-free viral.	35.6000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:14.509278	2018-02-09 18:16:00.903323	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.294699	1
432	A Swiftly Tilting Planet 420	Banjo diy cred pinterest fanny pack.	25.620000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:14.963085	2018-02-09 18:16:00.98665	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.752305	1
433	Rosemary Sutcliff 421	Cliche taxidermy offal brunch.	32.2000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:15.171994	2018-02-09 18:16:01.039976	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.973138	1
434	No Longer at Ease 422	Blue bottle phlogiston +1 seitan 8-bit tofu.	58.3299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:15.393702	2018-02-09 18:16:01.096303	0	book_cover.png	image/png	21149	2017-12-10 22:20:15.186849	1
436	Recalled to Life 424	Kombucha seitan chillwave meh readymade waistcoat chambray.	44.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:15.839656	2018-02-09 18:16:01.188411	0	book_cover.png	image/png	21149	2017-12-10 22:20:15.626327	1
437	Jacob Have I Loved 425	Letterpress try-hard selfies neutra viral intelligentsia chillwave offal meh.	16.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:16.062367	2018-02-09 18:16:01.228525	0	book_cover.png	image/png	21149	2017-12-10 22:20:15.853938	1
439	Have His Carcase 427	Aesthetic fingerstache everyday salvia meggings pop-up.	51.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:16.532935	2018-02-09 18:16:01.327308	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.320713	1
440	The Daffodil Sky 428	Keffiyeh hammock cronut kinfolk roof small batch +1.	60.0700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:16.760587	2018-02-09 18:16:01.389465	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.550319	1
441	The Yellow Meads of Asphodel 429	Food truck fixie photo booth keffiyeh.	57.1000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:16.985143	2018-02-09 18:16:01.434897	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.772668	1
442	The Moving Finger 430	Pug actually single-origin coffee brooklyn keffiyeh skateboard bitters.	7.70000000000000018	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:17.220689	2018-02-09 18:16:01.465608	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.99702	1
445	The Way of All Flesh 433	Chartreuse hammock health neutra synth before they sold out readymade sartorial.	27.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:17.958476	2018-02-09 18:16:01.52044	0	book_cover.png	image/png	21149	2017-12-10 22:20:17.696255	1
446	Carrion Comfort 434	Cred loko cray everyday drinking goth.	12.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:18.173087	2018-02-09 18:16:01.559845	0	book_cover.png	image/png	21149	2017-12-10 22:20:17.971076	1
448	That Good Night 436	Franzen pitchfork swag wayfarers cornhole cliche flexitarian food truck meh.	32.3800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:18.638272	2018-02-09 18:16:01.621475	0	book_cover.png	image/png	21149	2017-12-10 22:20:18.40633	1
449	The Last Enemy 437	Flannel vegan vice chartreuse flexitarian poutine twee thundercats.	53	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:18.884857	2018-02-09 18:16:01.647677	0	book_cover.png	image/png	21149	2017-12-10 22:20:18.655547	1
450	The Little Foxes 438	Neutra kombucha mlkshk gastropub.	69.8700000000000045	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:19.099165	2018-02-09 18:16:01.671875	0	book_cover.png	image/png	21149	2017-12-10 22:20:18.896341	1
452	An Acceptable Time 440	Slow-carb crucifix flexitarian xoxo echo tofu.	23.4499999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:19.571288	2018-02-09 18:16:01.719479	0	book_cover.png	image/png	21149	2017-12-10 22:20:19.341494	1
453	Taming a Sea Horse 441	Waistcoat organic chia deep v kombucha butcher vinegar flexitarian.	12.1699999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:19.855705	2018-02-09 18:16:01.772657	0	book_cover.png	image/png	21149	2017-12-10 22:20:19.588039	1
454	The Millstone 442	Freegan kinfolk lumbersexual gluten-free shoreditch pop-up.	13.1199999999999992	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:20.072489	2018-02-09 18:16:01.816566	0	book_cover.png	image/png	21149	2017-12-10 22:20:19.868329	1
456	This Side of Paradise 444	Try-hard gastropub plaid listicle occupy literally trust fund.	51.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:20.564574	2018-02-09 18:16:01.924571	0	book_cover.png	image/png	21149	2017-12-10 22:20:20.311015	1
457	The Other Side of Silence 445	Twee quinoa raw denim kale chips mumblecore messenger bag ennui.	29.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:20.78019	2018-02-09 18:16:01.959246	0	book_cover.png	image/png	21149	2017-12-10 22:20:20.574389	1
458	Dance Dance Dance 446	Pickled offal distillery wolf wes anderson.	51.4299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:21.00804	2018-02-09 18:16:01.979345	0	book_cover.png	image/png	21149	2017-12-10 22:20:20.789349	1
460	Recalled to Life 448	Meditation etsy neutra humblebrag tousled quinoa trust fund brunch umami.	10.8599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:21.46809	2018-02-09 18:16:02.051542	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.253493	1
461	Endless Night 449	Pickled listicle butcher portland.	63.9699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:21.701272	2018-02-09 18:16:02.111452	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.48816	1
463	The Millstone 451	Austin drinking mumblecore lo-fi intelligentsia.	61.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:22.174804	2018-02-09 18:16:02.208615	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.953982	1
464	Cover Her Face 452	Kombucha tote bag tilde gastropub cornhole vhs swag.	53.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:22.387309	2018-02-09 18:16:02.23515	0	book_cover.png	image/png	21149	2017-12-10 22:20:22.187933	1
466	Look to Windward 454	Offal craft beer venmo tousled 90's.	13.1199999999999992	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:22.837881	2018-02-09 18:16:02.280175	0	book_cover.png	image/png	21149	2017-12-10 22:20:22.635711	1
468	Dying of the Light 456	Hella raw denim distillery gentrify bushwick ugh kale chips flannel hoodie.	51.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:23.266705	2018-02-09 18:16:02.297876	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.062126	1
469	The Stars' Tennis Balls 457	Semiotics etsy typewriter messenger bag marfa.	55.3699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:23.493656	2018-02-09 18:16:02.311175	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.276537	1
471	The Last Enemy 459	Forage migas letterpress vegan fingerstache actually cardigan pug ramps.	20.4100000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:23.957826	2018-02-09 18:16:02.359247	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.723955	1
472	For a Breath I Tarry 460	Thundercats sriracha park actually cliche ethical tattooed messenger bag.	48.9299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:24.276699	2018-02-09 18:16:02.383622	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.969996	1
473	Blithe Spirit 461	Pabst iphone flannel meditation pop-up kale chips.	23.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:24.549615	2018-02-09 18:16:02.411747	0	book_cover.png	image/png	21149	2017-12-10 22:20:24.288174	1
475	If I Forget Thee Jerusalem 463	Marfa knausgaard art party chambray.	18.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:25.017397	2018-02-09 18:16:02.457518	0	book_cover.png	image/png	21149	2017-12-10 22:20:24.805253	1
476	Rosemary Sutcliff 464	Mlkshk normcore tumblr chartreuse tote bag flexitarian narwhal austin.	64.5400000000000063	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:25.25331	2018-02-09 18:16:02.475682	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.02946	1
478	A Handful of Dust 466	Hashtag listicle yuccie tote bag direct trade 3 wolf moon thundercats carry plaid.	24.3299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:25.700015	2018-02-09 18:16:02.535475	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.495812	1
479	Nectar in a Sieve 467	+1 austin actually jean shorts sriracha pabst dreamcatcher.	33.2299999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:25.918823	2018-02-09 18:16:02.559848	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.711836	1
481	To Sail Beyond the Sunset 469	Pabst selfies next level occupy cornhole fanny pack.	38.2800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:26.374767	2018-02-09 18:16:02.609848	0	book_cover.png	image/png	21149	2017-12-10 22:20:26.151131	1
482	A Monstrous Regiment of Women 470	Cleanse art party 90's banh mi ugh.	22.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:26.607897	2018-02-09 18:16:02.631637	0	book_cover.png	image/png	21149	2017-12-10 22:20:26.390522	1
483	The Parliament of Man 471	Aesthetic retro twee small batch.	8.52999999999999936	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:26.834391	2018-02-09 18:16:02.652147	0	book_cover.png	image/png	21149	2017-12-10 22:20:26.616945	1
484	Now Sleeps the Crimson Petal 472	Drinking blog viral health.	58.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:27.059519	2018-02-09 18:16:02.679195	0	book_cover.png	image/png	21149	2017-12-10 22:20:26.843773	1
486	Time To Murder And Create 474	Farm-to-table paleo try-hard schlitz pinterest bespoke offal disrupt neutra.	21.120000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:27.503964	2018-02-09 18:16:02.73426	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.301625	1
487	Brandy of the Damned 475	Marfa raw denim sustainable selvage mlkshk five dollar toast typewriter tattooed pitchfork.	26.8999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:27.737991	2018-02-09 18:16:02.77209	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.513375	1
488	A Confederacy of Dunces 476	Wolf selvage 3 wolf moon fanny pack tofu vhs everyday drinking seitan.	16.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:27.951941	2018-02-09 18:16:02.803666	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.746521	1
491	Beneath the Bleeding 479	Everyday farm-to-table lomo chillwave stumptown craft beer cornhole plaid.	68.9300000000000068	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:28.605834	2018-02-09 18:16:02.876037	0	book_cover.png	image/png	21149	2017-12-10 22:20:28.393878	1
492	Recalled to Life 480	Skateboard vegan asymmetrical humblebrag craft beer lo-fi semiotics.	39.1000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:28.820722	2018-02-09 18:16:02.971488	0	book_cover.png	image/png	21149	2017-12-10 22:20:28.61895	1
493	Beyond the Mexique Bay 481	Crucifix cronut hoodie marfa tacos.	9.58000000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:29.040971	2018-02-09 18:16:02.992171	0	book_cover.png	image/png	21149	2017-12-10 22:20:28.833615	1
495	Time To Murder And Create 483	Banjo carry literally pabst selfies vegan hammock pitchfork.	36.4099999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:29.497647	2018-02-09 18:16:03.041179	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.296798	1
496	This Side of Paradise 484	Seitan vice keffiyeh narwhal small batch tofu gastropub blog normcore.	61.1599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:29.734089	2018-02-09 18:16:03.068934	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.510444	1
500	Endless Night 488	Schlitz try-hard yolo actually organic.	62.7000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:30.634096	2018-02-09 18:16:03.181189	0	book_cover.png	image/png	21149	2017-12-10 22:20:30.428904	1
501	Brandy of the Damned 489	Wes anderson sriracha waistcoat farm-to-table.	21.6999999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:30.864977	2018-02-09 18:16:03.235278	0	book_cover.png	image/png	21149	2017-12-10 22:20:30.646093	1
502	Sleep the Brave 490	Gluten-free vinyl messenger bag fingerstache flannel artisan.	24.9100000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:31.10017	2018-02-09 18:16:03.263388	0	book_cover.png	image/png	21149	2017-12-10 22:20:30.885946	1
504	Specimen Days 492	Fashion axe letterpress skateboard normcore.	21.9299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:31.529371	2018-02-09 18:16:03.328253	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.329272	1
505	The Lathe of Heaven 493	Poutine slow-carb quinoa craft beer.	45.1199999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:31.745216	2018-02-09 18:16:03.355846	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.537831	1
507	Tirra Lirra by the River 495	Xoxo bicycle rights flannel venmo trust fund pabst stumptown carry celiac.	8.33000000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:32.183573	2018-02-09 18:16:03.383877	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.96631	1
509	Things Fall Apart 497	Thundercats 3 wolf moon schlitz vhs muggle magic organic cold-pressed sustainable.	66.9699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:32.608201	2018-02-09 18:16:03.443427	0	book_cover.png	image/png	21149	2017-12-10 22:20:32.408188	1
510	I Sing the Body Electric 498	Pitchfork cronut ethical kitsch etsy flexitarian.	33.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:32.832876	2018-02-09 18:16:03.468683	0	book_cover.png	image/png	21149	2017-12-10 22:20:32.619227	1
512	Mother Night 500	Pabst gentrify trust fund you probably haven't heard of them vice scenester kale chips drinking.	52.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:33.2987	2018-02-09 18:16:03.519851	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.079673	1
513	The Painted Veil 501	Freegan try-hard truffaut artisan kitsch waistcoat cronut.	68.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:33.514645	2018-02-09 18:16:03.548501	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.308118	1
514	Recalled to Life 502	Art party viral cleanse trust fund.	7.55999999999999961	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:33.744649	2018-02-09 18:16:03.597756	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.52689	1
515	The Soldier's Art 503	Thundercats ugh goth kombucha.	59.3400000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:33.972883	2018-02-09 18:16:03.627659	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.757054	1
517	The Golden Bowl 505	Carry freegan church-key hammock.	36.2700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:34.412238	2018-02-09 18:16:03.723302	0	book_cover.png	image/png	21149	2017-12-10 22:20:34.203575	1
518	The Last Temptation 506	Lomo direct trade salvia trust fund 3 wolf moon poutine.	30.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:34.633583	2018-02-09 18:16:03.741934	0	book_cover.png	image/png	21149	2017-12-10 22:20:34.422184	1
520	The Millstone 508	Slow-carb neutra asymmetrical whatever roof actually wolf gastropub twee.	35.2800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:35.080966	2018-02-09 18:16:03.798559	0	book_cover.png	image/png	21149	2017-12-10 22:20:34.872047	1
521	Arms and the Man 509	Migas blue bottle vinegar hammock try-hard bitters dreamcatcher.	44.1000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:35.300821	2018-02-09 18:16:03.83039	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.092486	1
523	This Side of Paradise 511	Tilde beard meh 3 wolf moon trust fund bicycle rights.	23.2800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:35.744142	2018-02-09 18:16:03.859364	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.531078	1
525	Let Us Now Praise Famous Men 513	Cray post-ironic waistcoat williamsburg.	54.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:36.208791	2018-02-09 18:16:03.921006	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.994514	1
526	The Last Enemy 514	Wayfarers forage meditation blue bottle.	50.9699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:36.423434	2018-02-09 18:16:03.970877	0	book_cover.png	image/png	21149	2017-12-10 22:20:36.218004	1
527	The Skull Beneath the Skin 515	Phlogiston chambray next level jean shorts.	16.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:36.658697	2018-02-09 18:16:03.99828	0	book_cover.png	image/png	21149	2017-12-10 22:20:36.433437	1
529	All the King's Men 517	Irony meh gentrify trust fund cleanse shabby chic ennui listicle butcher.	66.9599999999999937	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:37.13156	2018-02-09 18:16:04.053421	0	book_cover.png	image/png	21149	2017-12-10 22:20:36.899387	1
530	By Grand Central Station I Sat Down and Wept 518	Dreamcatcher kogi church-key yolo pour-over austin semiotics etsy.	60.509999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:37.45539	2018-02-09 18:16:04.08599	0	book_cover.png	image/png	21149	2017-12-10 22:20:37.142233	1
532	Ah, Wilderness! 520	Small batch wayfarers truffaut hammock intelligentsia.	67.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:37.901372	2018-02-09 18:16:04.163119	0	book_cover.png	image/png	21149	2017-12-10 22:20:37.689805	1
533	In Death Ground 521	Sustainable bespoke leggings dreamcatcher pabst pour-over.	59.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:38.125361	2018-02-09 18:16:04.189164	0	book_cover.png	image/png	21149	2017-12-10 22:20:37.911377	1
534	Jacob Have I Loved 522	Cray bicycle rights umami heirloom.	52.75	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:38.348128	2018-02-09 18:16:04.220889	0	book_cover.png	image/png	21149	2017-12-10 22:20:38.135382	1
536	The Road Less Traveled 524	Tacos ennui direct trade try-hard forage.	34.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:38.783244	2018-02-09 18:16:04.33024	0	book_cover.png	image/png	21149	2017-12-10 22:20:38.577682	1
538	Butter In a Lordly Dish 526	Small batch kitsch cliche cred trust fund jean shorts cold-pressed 90's.	67.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:39.312265	2018-02-09 18:16:04.359587	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.109801	1
539	In a Glass Darkly 527	Neutra master letterpress vice flexitarian listicle.	65.730000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:39.543136	2018-02-09 18:16:04.396061	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.32228	1
540	Eyeless in Gaza 528	Hashtag yuccie wayfarers cornhole.	16	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:39.766193	2018-02-09 18:16:04.432415	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.552194	1
541	The House of Mirth 529	Cronut direct trade sartorial keffiyeh chambray everyday.	17.4899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:39.983044	2018-02-09 18:16:04.458031	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.776511	1
544	When the Green Woods Laugh 532	Five dollar toast locavore tumblr vinyl shabby chic small batch master roof humblebrag.	66.3599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:40.640731	2018-02-09 18:16:04.549602	0	book_cover.png	image/png	21149	2017-12-10 22:20:40.428734	1
545	Clouds of Witness 533	Organic portland hella cray.	12.5700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:40.860612	2018-02-09 18:16:04.571488	0	book_cover.png	image/png	21149	2017-12-10 22:20:40.650791	1
546	Blue Remembered Earth 534	3 wolf moon viral trust fund whatever mixtape wolf.	37.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:41.069386	2018-02-09 18:16:04.603398	0	book_cover.png	image/png	21149	2017-12-10 22:20:40.869736	1
548	To a God Unknown 536	You probably haven't heard of them intelligentsia crucifix mustache wolf artisan literally.	51.759999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:41.501112	2018-02-09 18:16:04.646839	0	book_cover.png	image/png	21149	2017-12-10 22:20:41.297522	1
549	The Moon by Night 537	Hashtag shoreditch tote bag organic health banh mi.	64.519999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:41.738856	2018-02-09 18:16:04.662146	0	book_cover.png	image/png	21149	2017-12-10 22:20:41.511034	1
550	A Many-Splendoured Thing 538	Sustainable vhs trust fund williamsburg.	39.7000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:42.003432	2018-02-09 18:16:04.699185	0	book_cover.png	image/png	21149	2017-12-10 22:20:41.7578	1
551	A Summer Bird-Cage 539	Phlogiston williamsburg meggings cred.	47.4299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:42.217546	2018-02-09 18:16:04.744014	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.014291	1
553	The Torment of Others 541	Vinyl 3 wolf moon kinfolk health waistcoat heirloom pinterest stumptown.	9.65000000000000036	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:42.668614	2018-02-09 18:16:04.81188	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.44303	1
554	What's Become of Waring 542	Etsy whatever cliche actually poutine vice knausgaard fingerstache blog.	38.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:42.882536	2018-02-09 18:16:04.847458	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.676752	1
555	Absalom, Absalom! 543	Cornhole ennui thundercats +1 messenger bag gluten-free truffaut cronut twee.	11.4600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:43.100817	2018-02-09 18:16:04.874996	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.890892	1
557	The Little Foxes 545	Readymade lomo 8-bit ramps wayfarers.	39.3699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:43.546943	2018-02-09 18:16:04.918446	0	book_cover.png	image/png	21149	2017-12-10 22:20:43.33342	1
558	Beyond the Mexique Bay 546	Etsy williamsburg food truck swag truffaut.	63.1499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:43.765523	2018-02-09 18:16:04.94284	0	book_cover.png	image/png	21149	2017-12-10 22:20:43.555878	1
559	Ego Dominus Tuus 547	Cold-pressed 8-bit 3 wolf moon tote bag cronut shoreditch.	16.0100000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:44.005837	2018-02-09 18:16:04.979558	0	book_cover.png	image/png	21149	2017-12-10 22:20:43.774263	1
561	An Evil Cradling 549	Blue bottle gluten-free roof kale chips lo-fi schlitz hoodie put a bird on it.	68.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:44.46241	2018-02-09 18:16:05.041083	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.236719	1
562	Arms and the Man 550	90's actually irony narwhal sriracha williamsburg occupy farm-to-table squid.	22.129999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:44.693788	2018-02-09 18:16:05.065595	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.473801	1
564	A Time to Kill 552	Chambray park fixie cornhole microdosing iphone offal mustache.	39.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:45.138146	2018-02-09 18:16:05.152009	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.921748	1
565	An Evil Cradling 553	Paleo chia semiotics cray.	30.3299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:45.388796	2018-02-09 18:16:05.227223	0	book_cover.png	image/png	21149	2017-12-10 22:20:45.147446	1
566	Wildfire at Midnight 554	Leggings fanny pack carry chillwave heirloom kogi.	59.4399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:45.608639	2018-02-09 18:16:05.297272	0	book_cover.png	image/png	21149	2017-12-10 22:20:45.398504	1
568	The Moon by Night 556	Stumptown pinterest franzen raw denim.	37.8299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:46.073475	2018-02-09 18:16:05.412913	0	book_cover.png	image/png	21149	2017-12-10 22:20:45.867191	1
571	Françoise Sagan 559	Listicle farm-to-table craft beer paleo post-ironic.	67.3499999999999943	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:46.790359	2018-02-09 18:16:05.46704	0	book_cover.png	image/png	21149	2017-12-10 22:20:46.567218	1
572	The Doors of Perception 560	Selvage xoxo roof mustache before they sold out.	54.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:47.011858	2018-02-09 18:16:05.486768	0	book_cover.png	image/png	21149	2017-12-10 22:20:46.803576	1
574	Now Sleeps the Crimson Petal 562	Polaroid pour-over swag mumblecore mixtape thundercats.	19.0799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:47.472725	2018-02-09 18:16:05.543036	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.252139	1
576	Terrible Swift Sword 564	Cleanse lumbersexual salvia jean shorts roof literally selfies authentic swag.	64.1599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:47.931665	2018-02-09 18:16:05.58666	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.71838	1
578	The Road Less Traveled 566	Typewriter chambray 3 wolf moon asymmetrical mixtape bicycle rights.	53.9399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:48.360281	2018-02-09 18:16:05.679773	0	book_cover.png	image/png	21149	2017-12-10 22:20:48.161305	1
579	Rosemary Sutcliff 567	Paleo ethical literally fashion axe kickstarter art party viral photo booth.	40.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:48.571205	2018-02-09 18:16:05.723619	0	book_cover.png	image/png	21149	2017-12-10 22:20:48.372349	1
580	The Waste Land 568	Franzen keytar kogi fixie schlitz.	61.3200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:48.800714	2018-02-09 18:16:05.752746	0	book_cover.png	image/png	21149	2017-12-10 22:20:48.580488	1
582	The Millstone 570	Portland chillwave pour-over kinfolk synth cronut.	17.3099999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:49.242874	2018-02-09 18:16:05.913394	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.032836	1
583	Ah, Wilderness! 571	Tattooed everyday humblebrag chicharrones 3 wolf moon gluten-free vhs keffiyeh shoreditch.	7.37999999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:49.480917	2018-02-09 18:16:05.942372	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.252344	1
586	A Monstrous Regiment of Women 574	Poutine farm-to-table street pour-over.	25.3000000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:50.202487	2018-02-09 18:16:06.015893	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.990149	1
587	Death Be Not Proud 575	Wayfarers farm-to-table synth blog.	60.0200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:50.417409	2018-02-09 18:16:06.052669	0	book_cover.png	image/png	21149	2017-12-10 22:20:50.211811	1
588	Beneath the Bleeding 576	Hoodie semiotics vinegar hammock echo.	64.4000000000000057	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:50.637389	2018-02-09 18:16:06.075236	0	book_cover.png	image/png	21149	2017-12-10 22:20:50.428312	1
590	Butter In a Lordly Dish 578	Selfies gentrify shabby chic intelligentsia five dollar toast loko irony.	22.4200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:51.109619	2018-02-09 18:16:06.129843	0	book_cover.png	image/png	21149	2017-12-10 22:20:50.897346	1
591	Mother Night 579	Etsy carry narwhal cardigan scenester locavore flannel 8-bit.	44.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:51.375552	2018-02-09 18:16:06.164595	0	book_cover.png	image/png	21149	2017-12-10 22:20:51.126741	1
593	The Yellow Meads of Asphodel 581	Pinterest raw denim diy banjo chia wolf chambray aesthetic leggings.	37.1300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:51.812804	2018-02-09 18:16:06.261052	0	book_cover.png	image/png	21149	2017-12-10 22:20:51.598332	1
594	Consider Phlebas 582	Poutine yolo freegan selfies loko vegan.	30.0799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:52.047272	2018-02-09 18:16:06.314234	0	book_cover.png	image/png	21149	2017-12-10 22:20:51.82251	1
595	The Last Enemy 583	Banh mi blue bottle fixie fashion axe kitsch kale chips.	44.7700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:52.2783	2018-02-09 18:16:06.345595	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.060432	1
596	Dulce et Decorum Est 584	Vinegar yolo kale chips retro vice chartreuse.	69.519999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:52.492926	2018-02-09 18:16:06.375625	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.287843	1
599	The Millstone 587	Everyday butcher chartreuse wes anderson whatever pug single-origin coffee chillwave beard.	29	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:53.159929	2018-02-09 18:16:06.435507	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.956524	1
600	To Your Scattered Bodies Go 588	Raw denim bespoke normcore tousled williamsburg 3 wolf moon blog.	31.9899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:53.390059	2018-02-09 18:16:06.484498	0	book_cover.png	image/png	21149	2017-12-10 22:20:53.169898	1
601	Ah, Wilderness! 589	Artisan xoxo jean shorts fanny pack yolo chicharrones bespoke chia.	28.9899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:53.616345	2018-02-09 18:16:06.515133	0	book_cover.png	image/png	21149	2017-12-10 22:20:53.39963	1
603	The Mermaids Singing 591	Microdosing bicycle rights pork belly pour-over vinyl viral food truck mumblecore yolo.	18.6000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:54.050666	2018-02-09 18:16:06.595435	0	book_cover.png	image/png	21149	2017-12-10 22:20:53.839027	1
604	Vanity Fair 592	Drinking listicle wayfarers sriracha schlitz echo gluten-free pug vegan.	35.1899999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:54.289787	2018-02-09 18:16:06.689221	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.067232	1
606	The Wings of the Dove 594	Microdosing vinegar xoxo cred meggings authentic.	46.6899999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:54.727486	2018-02-09 18:16:06.754224	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.521279	1
607	Consider the Lilies 595	Waistcoat banh mi pitchfork helvetica meh ugh cleanse umami.	20.5599999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:54.934689	2018-02-09 18:16:06.77675	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.73758	1
608	Paths of Glory 596	Polaroid gentrify tumblr waistcoat street kickstarter scenester food truck.	48.6300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:55.156249	2018-02-09 18:16:06.800993	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.945025	1
609	To Say Nothing of the Dog 597	Tumblr slow-carb bushwick hoodie.	49.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:55.370178	2018-02-09 18:16:06.823676	0	book_cover.png	image/png	21149	2017-12-10 22:20:55.1698	1
611	Jesting Pilate 599	Hashtag kombucha retro brooklyn cray 90's phlogiston.	29.9800000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:55.873879	2018-02-09 18:16:06.924443	0	book_cover.png	image/png	21149	2017-12-10 22:20:55.661318	1
612	Stranger in a Strange Land 600	Scenester offal readymade distillery gastropub tote bag master.	31.3000000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:56.102102	2018-02-09 18:16:06.947336	0	book_cover.png	image/png	21149	2017-12-10 22:20:55.887329	1
614	Many Waters 602	Ethical kombucha xoxo asymmetrical carry vice.	69.269999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:56.555434	2018-02-09 18:16:06.967335	0	book_cover.png	image/png	21149	2017-12-10 22:20:56.336609	1
616	Consider Phlebas 604	Banh mi lomo bicycle rights pug keytar tote bag.	65.9399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:57.022777	2018-02-09 18:16:07.013413	0	book_cover.png	image/png	21149	2017-12-10 22:20:56.81796	1
617	Fear and Trembling 605	Sustainable you probably haven't heard of them pickled truffaut umami.	25.0899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:57.248725	2018-02-09 18:16:07.041453	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.035536	1
618	A Many-Splendoured Thing 606	Gluten-free crucifix humblebrag goth roof mlkshk offal retro.	66.9899999999999949	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:57.47281	2018-02-09 18:16:07.080942	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.261229	1
620	The Moving Finger 608	Brunch austin everyday farm-to-table tote bag.	39.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:57.933609	2018-02-09 18:16:07.132122	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.702102	1
621	Brandy of the Damned 609	Vice chicharrones synth post-ironic.	56.2999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:58.14492	2018-02-09 18:16:07.151402	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.943328	1
622	The Violent Bear It Away 610	Tumblr hammock pbr&b crucifix vhs narwhal pickled freegan.	57.4600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:58.362107	2018-02-09 18:16:07.175593	0	book_cover.png	image/png	21149	2017-12-10 22:20:58.160497	1
625	Specimen Days 613	Green juice mlkshk disrupt lo-fi fanny pack meditation.	10.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:59.024029	2018-02-09 18:16:07.221463	0	book_cover.png	image/png	21149	2017-12-10 22:20:58.821475	1
626	The Other Side of Silence 614	Selfies cold-pressed loko pabst hashtag vhs.	62.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:59.250346	2018-02-09 18:16:07.265359	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.039585	1
627	Carrion Comfort 615	Meditation vice fanny pack schlitz diy slow-carb try-hard wayfarers mixtape.	7.46999999999999975	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:59.488895	2018-02-09 18:16:07.299271	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.26098	1
628	The Last Enemy 616	Phlogiston vhs post-ironic quinoa.	9.33000000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:59.706027	2018-02-09 18:16:07.327417	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.50167	1
630	The Torment of Others 618	Hoodie cold-pressed beard etsy letterpress godard 90's goth.	35.6599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:00.131306	2018-02-09 18:16:07.403187	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.93008	1
631	To Your Scattered Bodies Go 619	Everyday ramps goth tofu cray celiac letterpress diy meggings.	67.3700000000000045	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:00.34529	2018-02-09 18:16:07.422889	0	book_cover.png	image/png	21149	2017-12-10 22:21:00.143631	1
633	A Swiftly Tilting Planet 621	Keytar lo-fi echo deep v whatever letterpress swag farm-to-table you probably haven't heard of them.	18	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:00.826983	2018-02-09 18:16:07.493781	0	book_cover.png	image/png	21149	2017-12-10 22:21:00.599688	1
634	The Wind's Twelve Quarters 622	Bespoke ugh iphone post-ironic.	42.1300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:01.051614	2018-02-09 18:16:07.514666	0	book_cover.png	image/png	21149	2017-12-10 22:21:00.840176	1
635	The Green Bay Tree 623	Xoxo jean shorts poutine occupy yuccie fanny pack.	10.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:01.269958	2018-02-09 18:16:07.542245	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.064562	1
637	Françoise Sagan 625	Bespoke vegan pop-up freegan tilde neutra farm-to-table pbr&b messenger bag.	22.2399999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:01.73404	2018-02-09 18:16:07.593501	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.516087	1
638	The Parliament of Man 626	Fixie salvia authentic tumblr letterpress pinterest sriracha tote bag franzen.	61.6499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:01.945514	2018-02-09 18:16:07.651487	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.74708	1
639	Time To Murder And Create 627	Brunch farm-to-table readymade cliche bushwick.	35.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:02.172249	2018-02-09 18:16:07.683572	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.959999	1
641	Cabbages and Kings 629	Ugh offal ennui chambray pug tacos.	56.2199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:02.615033	2018-02-09 18:16:07.759102	0	book_cover.png	image/png	21149	2017-12-10 22:21:02.415227	1
642	From Here to Eternity 630	Art party literally hella humblebrag gentrify poutine.	30.7600000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:02.843445	2018-02-09 18:16:07.797065	0	book_cover.png	image/png	21149	2017-12-10 22:21:02.628148	1
644	This Side of Paradise 632	Readymade echo pork belly migas green juice fanny pack.	8.65000000000000036	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:03.336812	2018-02-09 18:16:07.846436	0	book_cover.png	image/png	21149	2017-12-10 22:21:03.105871	1
646	Rosemary Sutcliff 634	Meggings craft beer +1 actually pbr&b green juice 3 wolf moon aesthetic.	46.3800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:03.775636	2018-02-09 18:16:07.959485	0	book_cover.png	image/png	21149	2017-12-10 22:21:03.563904	1
647	Beyond the Mexique Bay 635	Pinterest ugh offal selfies next level thundercats.	42.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:04.027504	2018-02-09 18:16:07.9918	0	book_cover.png	image/png	21149	2017-12-10 22:21:03.789509	1
648	The Monkey's Raincoat 636	Wolf small batch green juice ramps disrupt authentic.	30.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:04.251063	2018-02-09 18:16:08.026988	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.042513	1
650	Taming a Sea Horse 638	Taxidermy skateboard slow-carb semiotics.	15.6500000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:04.694672	2018-02-09 18:16:08.167723	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.483686	1
654	This Lime Tree Bower 642	Tousled lomo tofu kickstarter franzen forage leggings poutine.	16.5500000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:05.605331	2018-02-09 18:16:08.246372	0	book_cover.png	image/png	21149	2017-12-10 22:21:05.39722	1
655	Those Barren Leaves, Thrones, Dominations 643	Listicle banjo paleo food truck pour-over squid.	7.38999999999999968	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:05.836587	2018-02-09 18:16:08.270236	0	book_cover.png	image/png	21149	2017-12-10 22:21:05.617851	1
656	Vanity Fair 644	Tilde banh mi health bespoke.	50.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:06.066618	2018-02-09 18:16:08.311656	0	book_cover.png	image/png	21149	2017-12-10 22:21:05.851445	1
660	Nine Coaches Waiting 648	You probably haven't heard of them chambray synth forage.	62.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:07.001298	2018-02-09 18:16:08.410829	0	book_cover.png	image/png	21149	2017-12-10 22:21:06.784011	1
663	It's a Battlefield 651	Pbr&b distillery fashion axe typewriter meditation viral neutra gluten-free.	31.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:07.711822	2018-02-09 18:16:08.515614	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.486212	1
664	The Moon by Night 652	Locavore semiotics kale chips etsy lomo.	49.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:07.941963	2018-02-09 18:16:08.558086	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.727142	1
665	Things Fall Apart 653	Keytar whatever deep v post-ironic synth 90's chia.	16.2800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:08.168401	2018-02-09 18:16:08.603196	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.96291	1
667	No Highway 655	Echo bitters pickled messenger bag offal blue bottle pabst selfies schlitz.	68.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:08.595213	2018-02-09 18:16:08.651557	0	book_cover.png	image/png	21149	2017-12-10 22:21:08.388918	1
668	The Man Within 656	Synth asymmetrical pour-over listicle carry.	48.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:08.852544	2018-02-09 18:16:08.672606	0	book_cover.png	image/png	21149	2017-12-10 22:21:08.605515	1
669	By Grand Central Station I Sat Down and Wept 657	Skateboard taxidermy vice kogi artisan whatever helvetica.	24.8000000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:09.103547	2018-02-09 18:16:08.69226	0	book_cover.png	image/png	21149	2017-12-10 22:21:08.865608	1
671	The Soldier's Art 659	Tacos lomo next level bitters blog typewriter vegan keytar yolo.	48.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:09.518881	2018-02-09 18:16:08.758055	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.32094	1
672	The Way of All Flesh 660	Lomo 90's goth ramps gastropub irony intelligentsia.	26.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:09.738103	2018-02-09 18:16:08.793235	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.527329	1
673	Jacob Have I Loved 661	Kickstarter letterpress brooklyn flexitarian park.	56.8500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:09.953083	2018-02-09 18:16:08.832814	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.747847	1
674	Sleep the Brave 662	Tacos bushwick food truck franzen.	62.2999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:10.167013	2018-02-09 18:16:08.920454	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.961384	1
676	Consider Phlebas 664	Keffiyeh pbr&b helvetica disrupt.	24.3099999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:10.604457	2018-02-09 18:16:09.018797	0	book_cover.png	image/png	21149	2017-12-10 22:21:10.397604	1
677	The Cricket on the Hearth 665	Bitters typewriter meditation before they sold out street shoreditch.	45.490000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:10.831086	2018-02-09 18:16:09.050085	0	book_cover.png	image/png	21149	2017-12-10 22:21:10.616728	1
679	The Green Bay Tree 667	Cold-pressed helvetica meh jean shorts heirloom echo plaid.	23.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:11.297315	2018-02-09 18:16:09.115666	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.071193	1
680	To a God Unknown 668	Cred you probably haven't heard of them goth jean shorts forage tilde selvage franzen.	69.5100000000000051	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:11.509843	2018-02-09 18:16:09.141565	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.309193	1
681	Now Sleeps the Crimson Petal 669	Sriracha crucifix messenger bag pabst disrupt.	65.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:11.732038	2018-02-09 18:16:09.167987	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.521971	1
682	Cover Her Face 670	Banh mi helvetica irony health.	23.879999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:11.960872	2018-02-09 18:16:09.188703	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.744934	1
684	The Line of Beauty 672	Irony mumblecore selvage lo-fi church-key literally letterpress.	16.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:12.396953	2018-02-09 18:16:09.25534	0	book_cover.png	image/png	21149	2017-12-10 22:21:12.189345	1
685	The Wives of Bath 673	Messenger bag fashion axe tote bag small batch literally art party.	15.5600000000000005	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:12.608982	2018-02-09 18:16:09.281755	0	book_cover.png	image/png	21149	2017-12-10 22:21:12.405566	1
687	In Death Ground 675	Vhs tousled beard 90's normcore butcher gastropub ennui.	33.3599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:13.08203	2018-02-09 18:16:09.352397	0	book_cover.png	image/png	21149	2017-12-10 22:21:12.864724	1
688	Unweaving the Rainbow 676	Wes anderson asymmetrical narwhal aesthetic loko.	54.490000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:13.30637	2018-02-09 18:16:09.3709	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.091319	1
689	The Wealth of Nations 677	Fingerstache poutine sriracha fixie franzen photo booth keytar.	13.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:13.516797	2018-02-09 18:16:09.387602	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.31547	1
691	Have His Carcase 679	Artisan phlogiston bitters pour-over scenester pork belly semiotics freegan quinoa.	69.8299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:13.948611	2018-02-09 18:16:09.419932	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.734923	1
693	Cover Her Face 681	Hashtag next level forage kogi readymade.	65.6800000000000068	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:14.398925	2018-02-09 18:16:09.452843	0	book_cover.png	image/png	21149	2017-12-10 22:21:14.178382	1
694	A Scanner Darkly 682	Master microdosing hella celiac seitan.	15.6799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:14.620408	2018-02-09 18:16:09.470631	0	book_cover.png	image/png	21149	2017-12-10 22:21:14.412284	1
695	Ring of Bright Water 683	Bespoke next level meh umami 8-bit beard cold-pressed.	29.4100000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:14.832376	2018-02-09 18:16:09.503207	0	book_cover.png	image/png	21149	2017-12-10 22:21:14.628567	1
697	Tender Is the Night 685	Kombucha leggings vinyl cornhole.	41.5399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:15.277132	2018-02-09 18:16:09.554037	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.064988	1
698	The Golden Bowl 686	Lomo ugh whatever pour-over fanny pack tilde aesthetic.	41.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:15.487679	2018-02-09 18:16:09.574571	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.289214	1
699	To a God Unknown 687	8-bit crucifix goth mixtape schlitz.	13.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:15.719272	2018-02-09 18:16:09.619318	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.503912	1
702	Many Waters 690	Whatever forage asymmetrical small batch organic 8-bit.	18.0899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:16.393675	2018-02-09 18:16:09.686032	0	book_cover.png	image/png	21149	2017-12-10 22:21:16.185646	1
703	Of Mice and Men 691	Ramps cardigan shoreditch typewriter tilde.	67.1299999999999955	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:16.616241	2018-02-09 18:16:09.715681	0	book_cover.png	image/png	21149	2017-12-10 22:21:16.40548	1
704	Terrible Swift Sword 692	Tumblr wayfarers goth biodiesel.	58.7700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:16.835114	2018-02-09 18:16:09.735603	0	book_cover.png	image/png	21149	2017-12-10 22:21:16.628546	1
706	Françoise Sagan 694	Vice disrupt dreamcatcher freegan.	52.8299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:17.287621	2018-02-09 18:16:09.807498	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.075883	1
707	Rosemary Sutcliff 695	Farm-to-table freegan gluten-free park raw denim.	34.3800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:17.518801	2018-02-09 18:16:09.8376	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.301813	1
708	The Last Enemy 696	8-bit pug retro tumblr kitsch.	36.9299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:17.737049	2018-02-09 18:16:09.866812	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.53335	1
710	No Longer at Ease 698	Yolo whatever leggings umami brooklyn green juice kombucha.	69.2999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:18.189832	2018-02-09 18:16:09.946503	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.969229	1
711	Nectar in a Sieve 699	Five dollar toast next level sriracha lumbersexual gastropub goth roof chicharrones wes anderson.	36.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:18.404495	2018-02-09 18:16:09.97171	0	book_cover.png	image/png	21149	2017-12-10 22:21:18.203244	1
713	A Farewell to Arms 701	Loko health mumblecore kickstarter ramps put a bird on it bitters taxidermy diy.	25.870000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:18.849812	2018-02-09 18:16:10.039111	0	book_cover.png	image/png	21149	2017-12-10 22:21:18.64454	1
714	Jesting Pilate 702	Tattooed ramps kombucha vinyl venmo 3 wolf moon seitan.	46.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:19.083072	2018-02-09 18:16:10.06731	0	book_cover.png	image/png	21149	2017-12-10 22:21:18.864501	1
715	Death Be Not Proud 703	Flexitarian carry artisan chartreuse meditation marfa gastropub locavore tattooed.	66.6200000000000045	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:19.296227	2018-02-09 18:16:10.105426	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.095343	1
716	Surprised by Joy 704	Trust fund yr ethical meh leggings.	36.0200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:19.518437	2018-02-09 18:16:10.128632	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.308147	1
718	No Highway 706	Yolo roof wayfarers tilde chillwave.	42.4500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:19.953998	2018-02-09 18:16:10.197807	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.746967	1
720	That Good Night 708	Mustache salvia street hashtag pinterest yolo hammock blog.	40.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:20.381235	2018-02-09 18:16:10.254958	0	book_cover.png	image/png	21149	2017-12-10 22:21:20.177866	1
722	Behold the Man 710	Street post-ironic wes anderson migas cliche vinyl.	29.0300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:20.820256	2018-02-09 18:16:10.297979	0	book_cover.png	image/png	21149	2017-12-10 22:21:20.611064	1
723	Let Us Now Praise Famous Men 711	Heirloom yuccie poutine swag tofu.	62.6300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:21.058673	2018-02-09 18:16:10.338715	0	book_cover.png	image/png	21149	2017-12-10 22:21:20.835271	1
724	Mr Standfast 712	Post-ironic kombucha tousled kinfolk twee cliche beard chillwave muggle magic.	60.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:21.281547	2018-02-09 18:16:10.364469	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.070719	1
726	The Glory and the Dream 714	Stumptown fingerstache cold-pressed gastropub gentrify dreamcatcher.	38.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:21.721852	2018-02-09 18:16:10.432279	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.511102	1
727	Dying of the Light 715	Organic wayfarers cornhole hammock helvetica truffaut park microdosing.	9.4399999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:21.942005	2018-02-09 18:16:10.460938	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.7343	1
728	A Summer Bird-Cage 716	Cronut photo booth gluten-free keytar godard.	7.49000000000000021	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:22.176755	2018-02-09 18:16:10.475434	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.954549	1
731	The Skull Beneath the Skin 719	Tilde 8-bit dreamcatcher pork belly phlogiston keffiyeh five dollar toast.	22.4699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:22.869087	2018-02-09 18:16:10.497115	0	book_cover.png	image/png	21149	2017-12-10 22:21:22.655633	1
733	If Not Now, When? 721	Try-hard jean shorts kombucha green juice flexitarian chicharrones brooklyn pickled next level.	41.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:23.339593	2018-02-09 18:16:10.542503	0	book_cover.png	image/png	21149	2017-12-10 22:21:23.105691	1
734	Cabbages and Kings 722	Pbr&b shoreditch meditation tilde raw denim.	47.6300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:23.563181	2018-02-09 18:16:10.566491	0	book_cover.png	image/png	21149	2017-12-10 22:21:23.356592	1
735	A Monstrous Regiment of Women 723	Typewriter tattooed gluten-free distillery blog xoxo.	24.5700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:23.799103	2018-02-09 18:16:10.586763	0	book_cover.png	image/png	21149	2017-12-10 22:21:23.581019	1
737	An Instant In The Wind 725	Biodiesel heirloom taxidermy pitchfork retro pour-over before they sold out.	26.1999999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:24.255187	2018-02-09 18:16:10.639402	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.041524	1
738	The Grapes of Wrath 726	Wes anderson yuccie small batch drinking sriracha pork belly yolo.	69.019999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:24.46671	2018-02-09 18:16:10.690218	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.266509	1
739	Vanity Fair 727	Whatever mustache twee cronut phlogiston green juice gentrify intelligentsia.	45.4399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:24.691041	2018-02-09 18:16:10.743481	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.476667	1
741	Where Angels Fear to Tread 729	Williamsburg brooklyn intelligentsia humblebrag mustache.	12.75	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:25.187554	2018-02-09 18:16:10.843765	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.974187	1
742	The Monkey's Raincoat 730	Five dollar toast chartreuse church-key 90's offal pop-up echo.	55.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:25.416358	2018-02-09 18:16:10.88665	0	book_cover.png	image/png	21149	2017-12-10 22:21:25.197763	1
744	A Scanner Darkly 732	Occupy food truck ugh tattooed tousled tacos microdosing.	25.8299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:25.84852	2018-02-09 18:16:10.922274	0	book_cover.png	image/png	21149	2017-12-10 22:21:25.64277	1
746	Dying of the Light 734	Vegan distillery pitchfork slow-carb wayfarers ethical quinoa.	25.120000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:26.280799	2018-02-09 18:16:10.976846	0	book_cover.png	image/png	21149	2017-12-10 22:21:26.061728	1
747	Wildfire at Midnight 735	Cred +1 beard cardigan.	44.509999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:26.528129	2018-02-09 18:16:11.002841	0	book_cover.png	image/png	21149	2017-12-10 22:21:26.312064	1
749	Sleep the Brave 737	Lo-fi diy artisan +1 keytar salvia meggings raw denim.	66.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:26.98788	2018-02-09 18:16:11.050088	0	book_cover.png	image/png	21149	2017-12-10 22:21:26.782183	1
750	The Widening Gyre 738	Loko pbr&b pug flexitarian bicycle rights semiotics asymmetrical.	66.5699999999999932	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:27.202736	2018-02-09 18:16:11.09178	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.000102	1
751	In Death Ground 739	Readymade beard tousled slow-carb chartreuse.	56.2299999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:27.435672	2018-02-09 18:16:11.126378	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.215302	1
753	Dance Dance Dance 741	Organic lomo echo intelligentsia tumblr hoodie heirloom drinking letterpress.	47.009999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:27.887567	2018-02-09 18:16:11.203761	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.666936	1
754	East of Eden 742	Taxidermy pbr&b brooklyn venmo franzen.	58.4799999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:28.112793	2018-02-09 18:16:11.220567	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.899403	1
755	Death Be Not Proud 743	Keffiyeh microdosing selfies mixtape deep v blue bottle offal lomo.	34.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:28.337068	2018-02-09 18:16:11.237813	0	book_cover.png	image/png	21149	2017-12-10 22:21:28.127887	1
757	The Far-Distant Oxus 745	Art party aesthetic xoxo fingerstache.	22.9499999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:28.813184	2018-02-09 18:16:11.281955	0	book_cover.png	image/png	21149	2017-12-10 22:21:28.562326	1
758	Fair Stood the Wind for France 746	Freegan chicharrones fanny pack crucifix offal irony before they sold out shabby chic taxidermy.	29.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:29.045125	2018-02-09 18:16:11.307356	0	book_cover.png	image/png	21149	2017-12-10 22:21:28.826725	1
759	The Daffodil Sky 747	8-bit butcher vhs cliche.	25.2100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:29.269034	2018-02-09 18:16:11.332131	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.057748	1
761	This Side of Paradise 749	Deep v raw denim offal schlitz ennui helvetica.	61.8800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:29.718107	2018-02-09 18:16:11.402389	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.504818	1
762	Consider the Lilies 750	Five dollar toast slow-carb loko austin hammock 3 wolf moon.	15.5099999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:29.936094	2018-02-09 18:16:11.444836	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.725161	1
763	Jacob Have I Loved 751	Stumptown chia ethical pinterest yr banh mi blue bottle.	28.5199999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:30.165829	2018-02-09 18:16:11.475404	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.948513	1
766	Blue Remembered Earth 754	Art party tilde pug bitters kogi pickled typewriter distillery.	55.4299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:30.851792	2018-02-09 18:16:11.547297	0	book_cover.png	image/png	21149	2017-12-10 22:21:30.647573	1
767	A Catskill Eagle 755	Small batch taxidermy church-key yr put a bird on it mixtape schlitz slow-carb blue bottle.	69.3199999999999932	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:31.115784	2018-02-09 18:16:11.579249	0	book_cover.png	image/png	21149	2017-12-10 22:21:30.864695	1
769	The Green Bay Tree 757	8-bit xoxo pop-up godard marfa.	16.8599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:31.563046	2018-02-09 18:16:11.59844	0	book_cover.png	image/png	21149	2017-12-10 22:21:31.343892	1
771	Recalled to Life 759	Forage hashtag scenester pitchfork iphone diy heirloom yr direct trade.	67.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:32.181518	2018-02-09 18:16:11.645091	0	book_cover.png	image/png	21149	2017-12-10 22:21:31.828568	1
772	A Many-Splendoured Thing 760	Vinegar venmo 3 wolf moon carry ethical pop-up squid jean shorts.	33.1599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:32.45893	2018-02-09 18:16:11.679992	0	book_cover.png	image/png	21149	2017-12-10 22:21:32.19381	1
773	All the King's Men 761	Hashtag listicle semiotics lomo bitters.	18.879999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:32.672613	2018-02-09 18:16:11.724458	0	book_cover.png	image/png	21149	2017-12-10 22:21:32.469357	1
775	Wildfire at Midnight 763	Bitters chia ennui hashtag.	39.0799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:33.121582	2018-02-09 18:16:11.88341	0	book_cover.png	image/png	21149	2017-12-10 22:21:32.912642	1
776	Lilies of the Field 764	Vinegar flannel asymmetrical heirloom letterpress iphone.	60.7999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:33.345918	2018-02-09 18:16:11.935644	0	book_cover.png	image/png	21149	2017-12-10 22:21:33.131209	1
777	Brandy of the Damned 765	Typewriter kombucha synth leggings salvia portland pitchfork.	67.7900000000000063	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:33.561115	2018-02-09 18:16:11.964723	0	book_cover.png	image/png	21149	2017-12-10 22:21:33.356021	1
779	I Sing the Body Electric 767	Polaroid organic kinfolk banjo lomo goth.	17.5199999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:34.00073	2018-02-09 18:16:12.036658	0	book_cover.png	image/png	21149	2017-12-10 22:21:33.791151	1
780	Little Hands Clapping 768	Meh intelligentsia bitters retro sustainable narwhal.	14.9399999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:34.220832	2018-02-09 18:16:12.055139	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.012497	1
781	A Handful of Dust 769	Wayfarers trust fund sustainable kombucha.	33.8999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:34.448921	2018-02-09 18:16:12.073247	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.236219	1
782	The Daffodil Sky 770	8-bit shabby chic mlkshk vice.	64.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:34.677197	2018-02-09 18:16:12.098289	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.458148	1
785	Shall not Perish 773	Aesthetic normcore keffiyeh bitters wayfarers narwhal before they sold out poutine goth.	9.00999999999999979	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:35.341513	2018-02-09 18:16:12.148397	0	book_cover.png	image/png	21149	2017-12-10 22:21:35.12745	1
786	Some Buried Caesar 774	3 wolf moon food truck bespoke put a bird on it kickstarter blog stumptown 90's.	26.1600000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:35.567901	2018-02-09 18:16:12.21546	0	book_cover.png	image/png	21149	2017-12-10 22:21:35.353081	1
788	Precious Bane 776	Pour-over kinfolk post-ironic portland 8-bit 90's.	22.7399999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:36.02811	2018-02-09 18:16:12.304246	0	book_cover.png	image/png	21149	2017-12-10 22:21:35.810659	1
789	Where Angels Fear to Tread 777	+1 selvage tacos phlogiston goth art party church-key.	34.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:36.256039	2018-02-09 18:16:12.336796	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.040385	1
790	Those Barren Leaves, Thrones, Dominations 778	Listicle cred farm-to-table plaid roof kombucha lomo umami.	20.7300000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:36.480141	2018-02-09 18:16:12.374429	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.26645	1
792	Nine Coaches Waiting 780	Hammock lomo direct trade portland migas hella 8-bit mixtape dreamcatcher.	55.3299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:36.955819	2018-02-09 18:16:12.439483	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.733261	1
793	This Lime Tree Bower 781	Chia williamsburg park irony kitsch semiotics meh food truck.	31.4899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:37.183443	2018-02-09 18:16:12.47479	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.965243	1
794	If I Forget Thee Jerusalem 782	Cardigan salvia vegan goth.	57.9399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:37.409821	2018-02-09 18:16:12.500722	0	book_cover.png	image/png	21149	2017-12-10 22:21:37.1931	1
796	Everything is Illuminated 784	Humblebrag biodiesel umami pug photo booth helvetica seitan meggings.	44.8800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:37.867972	2018-02-09 18:16:12.558191	0	book_cover.png	image/png	21149	2017-12-10 22:21:37.645288	1
797	Look Homeward, Angel 785	Humblebrag beard master vinegar tofu ethical health bushwick.	66.0100000000000051	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:38.08803	2018-02-09 18:16:12.591373	0	book_cover.png	image/png	21149	2017-12-10 22:21:37.878543	1
799	In Death Ground 787	Messenger bag disrupt godard forage.	39.0799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:38.557271	2018-02-09 18:16:12.619477	0	book_cover.png	image/png	21149	2017-12-10 22:21:38.321219	1
800	The Proper Study 788	Sustainable seitan forage pork belly tilde yolo.	58.1499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:38.842871	2018-02-09 18:16:12.651973	0	book_cover.png	image/png	21149	2017-12-10 22:21:38.568029	1
802	Butter In a Lordly Dish 790	Cliche stumptown distillery green juice normcore twee.	53.8800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:39.330079	2018-02-09 18:16:12.707888	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.123767	1
803	Fair Stood the Wind for France 791	Food truck migas disrupt gentrify swag yr salvia tumblr.	26.4499999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:39.553169	2018-02-09 18:16:12.73935	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.340375	1
804	If Not Now, When? 792	Banjo diy kale chips chia.	43.2700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:39.769001	2018-02-09 18:16:12.771612	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.562368	1
807	To a God Unknown 795	Listicle wolf sustainable pop-up freegan slow-carb.	38.3699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:40.411962	2018-02-09 18:16:12.821312	0	book_cover.png	image/png	21149	2017-12-10 22:21:40.208576	1
809	Look to Windward 797	Mlkshk tattooed fingerstache blog ethical next level listicle viral.	68.519999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:40.830108	2018-02-09 18:16:12.86055	0	book_cover.png	image/png	21149	2017-12-10 22:21:40.634954	1
810	East of Eden 798	Etsy post-ironic skateboard crucifix direct trade lomo fanny pack.	50.5799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:41.044003	2018-02-09 18:16:12.883387	0	book_cover.png	image/png	21149	2017-12-10 22:21:40.839033	1
811	It's a Battlefield 799	Muggle magic carry wes anderson narwhal pop-up.	64.7000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:41.254216	2018-02-09 18:16:12.911295	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.053358	1
813	In Death Ground 801	Dreamcatcher banjo locavore fanny pack stumptown flexitarian muggle magic microdosing.	46.759999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:41.687787	2018-02-09 18:16:12.9944	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.483405	1
815	All Passion Spent 803	Trust fund austin twee banh mi muggle magic leggings next level occupy.	43.8299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:42.132523	2018-02-09 18:16:13.057151	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.91694	1
816	The Daffodil Sky 804	Chia swag truffaut paleo slow-carb knausgaard sriracha.	23.0899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:42.340544	2018-02-09 18:16:13.091971	0	book_cover.png	image/png	21149	2017-12-10 22:21:42.140933	1
818	Sleep the Brave 806	Dreamcatcher mustache meggings godard kitsch diy try-hard chambray.	59.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:42.79219	2018-02-09 18:16:13.156025	0	book_cover.png	image/png	21149	2017-12-10 22:21:42.57892	1
819	Specimen Days 807	Hammock xoxo locavore vegan selvage wolf.	50.3200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:43.013925	2018-02-09 18:16:13.189029	0	book_cover.png	image/png	21149	2017-12-10 22:21:42.805978	1
820	As I Lay Dying 808	Put a bird on it pabst you probably haven't heard of them wolf disrupt.	63.509999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:43.24119	2018-02-09 18:16:13.213702	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.029406	1
822	Arms and the Man 810	Waistcoat letterpress vinegar retro pabst post-ironic quinoa narwhal.	27.379999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:43.684435	2018-02-09 18:16:13.295403	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.471886	1
823	In Dubious Battle 811	90's street fixie ugh marfa artisan.	24.8000000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:43.905658	2018-02-09 18:16:13.341426	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.693968	1
825	Look to Windward 813	You probably haven't heard of them diy drinking authentic keffiyeh waistcoat literally.	42.8299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:44.361906	2018-02-09 18:16:13.433607	0	book_cover.png	image/png	21149	2017-12-10 22:21:44.154691	1
826	Absalom, Absalom! 814	Pork belly jean shorts craft beer xoxo banjo.	57.2199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:44.577582	2018-02-09 18:16:13.48063	0	book_cover.png	image/png	21149	2017-12-10 22:21:44.373451	1
827	Ring of Bright Water 815	Diy kinfolk vice swag church-key keytar.	55.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:44.791785	2018-02-09 18:16:13.509309	0	book_cover.png	image/png	21149	2017-12-10 22:21:44.588834	1
830	I Sing the Body Electric 818	Muggle magic pbr&b flannel quinoa asymmetrical actually yolo tousled.	48.4200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:45.472423	2018-02-09 18:16:13.595293	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.259701	1
831	Blithe Spirit 819	Kombucha knausgaard yr gastropub chartreuse five dollar toast phlogiston.	42.0300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:45.688041	2018-02-09 18:16:13.623699	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.482236	1
832	The Millstone 820	Kale chips poutine next level kinfolk meditation beard kombucha.	63.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:45.907053	2018-02-09 18:16:13.655884	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.698207	1
833	A Handful of Dust 821	Carry mustache ramps messenger bag hashtag gentrify umami slow-carb thundercats.	18.2100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:46.153316	2018-02-09 18:16:13.683786	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.916558	1
834	The Millstone 822	Dreamcatcher banjo pickled pitchfork authentic put a bird on it.	37.8599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:46.374569	2018-02-09 18:16:13.722185	0	book_cover.png	image/png	21149	2017-12-10 22:21:46.165512	1
835	Oh! To be in England 823	Banh mi biodiesel mustache small batch banjo keffiyeh.	17.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:46.601933	2018-02-09 18:16:13.747548	0	book_cover.png	image/png	21149	2017-12-10 22:21:46.386404	1
838	The Heart Is Deceitful Above All Things 826	Truffaut austin banh mi disrupt five dollar toast stumptown church-key.	62.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:47.320764	2018-02-09 18:16:13.807512	0	book_cover.png	image/png	21149	2017-12-10 22:21:47.094911	1
839	An Acceptable Time 827	Synth diy pork belly carry banh mi skateboard bespoke portland hella.	18.9800000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:47.549006	2018-02-09 18:16:13.835599	0	book_cover.png	image/png	21149	2017-12-10 22:21:47.336494	1
840	Dance Dance Dance 828	Muggle magic yolo artisan disrupt stumptown.	29.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:47.796494	2018-02-09 18:16:13.867623	0	book_cover.png	image/png	21149	2017-12-10 22:21:47.569107	1
842	Butter In a Lordly Dish 830	Green juice letterpress kale chips meh salvia.	36.7899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:48.265364	2018-02-09 18:16:13.923183	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.041203	1
843	Brandy of the Damned 831	Kickstarter cornhole next level direct trade.	44.0300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:48.484331	2018-02-09 18:16:13.955094	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.281682	1
846	Vanity Fair 834	Retro mixtape tote bag cornhole tacos.	62.9600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:49.19728	2018-02-09 18:16:14.011236	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.992956	1
847	Nectar in a Sieve 835	Austin kogi tacos umami waistcoat distillery pitchfork art party +1.	67.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:49.421549	2018-02-09 18:16:14.03232	0	book_cover.png	image/png	21149	2017-12-10 22:21:49.207829	1
848	As I Lay Dying 836	Offal you probably haven't heard of them heirloom artisan authentic semiotics.	48.6499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:49.638966	2018-02-09 18:16:14.081218	0	book_cover.png	image/png	21149	2017-12-10 22:21:49.431742	1
850	Brandy of the Damned 838	90's diy try-hard drinking you probably haven't heard of them.	56.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:50.098797	2018-02-09 18:16:14.107668	0	book_cover.png	image/png	21149	2017-12-10 22:21:49.858475	1
852	The Parliament of Man 840	Jean shorts intelligentsia photo booth selfies etsy.	22.0300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:50.541301	2018-02-09 18:16:14.17889	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.341553	1
853	To Say Nothing of the Dog 841	Pour-over sustainable chillwave narwhal hammock hashtag vinegar xoxo five dollar toast.	36.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:50.748549	2018-02-09 18:16:14.215747	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.55003	1
854	Blithe Spirit 842	Pug migas knausgaard goth pbr&b occupy fanny pack mixtape bicycle rights.	51.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:50.977614	2018-02-09 18:16:14.277134	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.756274	1
856	Of Human Bondage 844	Chartreuse irony plaid mustache lumbersexual pour-over +1.	50.9699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:51.408696	2018-02-09 18:16:14.359214	0	book_cover.png	image/png	21149	2017-12-10 22:21:51.216062	1
857	The Wings of the Dove 845	Godard yr vegan kinfolk chia locavore blue bottle organic.	16.3599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:51.621065	2018-02-09 18:16:14.380219	0	book_cover.png	image/png	21149	2017-12-10 22:21:51.420796	1
859	The Cricket on the Hearth 847	Humblebrag kombucha schlitz typewriter migas diy salvia.	21.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:52.042624	2018-02-09 18:16:14.439229	0	book_cover.png	image/png	21149	2017-12-10 22:21:51.846958	1
860	Infinite Jest 848	+1 schlitz vinyl put a bird on it meh polaroid twee.	34.0499999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:52.239768	2018-02-09 18:16:14.459019	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.051097	1
861	The Road Less Traveled 849	Marfa yuccie tilde intelligentsia bespoke.	44.5499999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:52.482497	2018-02-09 18:16:14.48148	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.253263	1
863	Tiger! Tiger! 851	Hoodie put a bird on it semiotics ennui tacos echo vice food truck phlogiston.	57.759999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:52.915015	2018-02-09 18:16:14.531572	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.710318	1
864	Number the Stars 852	Goth small batch hoodie cray bushwick.	66.7600000000000051	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:53.122761	2018-02-09 18:16:14.572702	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.929731	1
865	The Wind's Twelve Quarters 853	Actually cleanse tilde pour-over food truck wayfarers.	32.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:53.345278	2018-02-09 18:16:14.603465	0	book_cover.png	image/png	21149	2017-12-10 22:21:53.130981	1
867	This Side of Paradise 855	Salvia vinegar banh mi vice wolf bitters microdosing chambray.	68.9000000000000057	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:53.77234	2018-02-09 18:16:14.699895	0	book_cover.png	image/png	21149	2017-12-10 22:21:53.570916	1
868	No Country for Old Men 856	Jean shorts typewriter poutine kickstarter.	67.1800000000000068	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:53.990351	2018-02-09 18:16:14.721337	0	book_cover.png	image/png	21149	2017-12-10 22:21:53.780766	1
869	An Instant In The Wind 857	Keffiyeh actually williamsburg pbr&b brunch vice.	50.3999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:54.204661	2018-02-09 18:16:14.740828	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.001336	1
872	After Many a Summer Dies the Swan 860	Loko vhs offal jean shorts trust fund yuccie kombucha narwhal meh.	19.7399999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:54.849192	2018-02-09 18:16:14.788089	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.645764	1
873	Now Sleeps the Crimson Petal 861	Roof artisan bespoke keffiyeh cred brunch 3 wolf moon chicharrones crucifix.	58.5799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:55.054346	2018-02-09 18:16:14.811529	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.857321	1
874	An Acceptable Time 862	Microdosing literally gastropub mumblecore twee.	19.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:55.277649	2018-02-09 18:16:14.834803	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.06537	1
876	Tiger! Tiger! 864	Mixtape meh brunch tattooed godard twee diy phlogiston bespoke.	30.7300000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:55.706545	2018-02-09 18:16:14.882836	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.510505	1
877	Beneath the Bleeding 865	Lomo shabby chic disrupt beard pour-over humblebrag.	53.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:55.915903	2018-02-09 18:16:14.91222	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.715856	1
878	Jacob Have I Loved 866	Cronut organic chartreuse diy squid farm-to-table sustainable pop-up.	7.26999999999999957	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:56.116442	2018-02-09 18:16:14.958537	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.923936	1
880	By Grand Central Station I Sat Down and Wept 868	Gentrify five dollar toast +1 cliche 90's stumptown pickled.	12.3599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:56.569672	2018-02-09 18:16:15.018008	0	book_cover.png	image/png	21149	2017-12-10 22:21:56.349027	1
881	When the Green Woods Laugh 869	Narwhal portland 3 wolf moon artisan listicle mustache leggings.	41.740000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:56.783445	2018-02-09 18:16:15.039681	0	book_cover.png	image/png	21149	2017-12-10 22:21:56.580856	1
883	The Daffodil Sky 871	Lomo cleanse 8-bit organic brunch.	36.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:57.212979	2018-02-09 18:16:15.071664	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.005482	1
885	That Hideous Strength 873	Sartorial street franzen kogi etsy forage direct trade chicharrones wes anderson.	51.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:57.640442	2018-02-09 18:16:15.126704	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.44194	1
886	Mother Night 874	Master yr flannel beard vinegar waistcoat.	42.6499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:57.87759	2018-02-09 18:16:15.147678	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.650245	1
887	To a God Unknown 875	Cardigan waistcoat goth five dollar toast hashtag.	58.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:58.092582	2018-02-09 18:16:15.18328	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.885441	1
889	The Line of Beauty 877	Actually ramps pop-up mlkshk.	60.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:58.530187	2018-02-09 18:16:15.252647	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.313885	1
890	The Stars' Tennis Balls 878	Cliche polaroid cornhole wayfarers banh mi cred.	38.1199999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:58.750827	2018-02-09 18:16:15.294138	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.538182	1
891	Down to a Sunless Sea 879	Forage kickstarter kombucha sartorial.	51.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:58.962694	2018-02-09 18:16:15.332694	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.76187	1
894	Moab Is My Washpot 882	Chartreuse art party chia marfa.	15.0800000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:59.57022	2018-02-09 18:16:15.387473	0	book_cover.png	image/png	21149	2017-12-10 22:21:59.376909	1
895	The Road Less Traveled 883	Tofu beard migas direct trade fingerstache deep v cliche gentrify intelligentsia.	15.1899999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:59.801445	2018-02-09 18:16:15.417886	0	book_cover.png	image/png	21149	2017-12-10 22:21:59.598651	1
896	Gone with the Wind 884	Single-origin coffee intelligentsia leggings 8-bit locavore ugh.	18.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:00.011063	2018-02-09 18:16:15.438302	0	book_cover.png	image/png	21149	2017-12-10 22:21:59.812228	1
898	Now Sleeps the Crimson Petal 886	Williamsburg tofu pork belly viral mixtape intelligentsia.	16.3999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:00.438633	2018-02-09 18:16:15.496962	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.234915	1
899	Look to Windward 887	Echo marfa pinterest deep v.	27.2100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:00.654745	2018-02-09 18:16:15.523347	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.450595	1
900	No Longer at Ease 888	Vegan pour-over lomo chambray 90's mixtape leggings meh mustache.	67.2900000000000063	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:00.869137	2018-02-09 18:16:15.546722	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.665537	1
902	Look Homeward, Angel 890	Yr microdosing celiac flexitarian vhs.	39.2999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:01.293474	2018-02-09 18:16:15.627278	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.092102	1
903	Dance Dance Dance 891	Actually loko poutine try-hard microdosing heirloom thundercats.	27.6799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:01.496701	2018-02-09 18:16:15.651145	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.303145	1
905	Beyond the Mexique Bay 893	Street vegan thundercats brooklyn flexitarian vice brunch.	48.4399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:01.93142	2018-02-09 18:16:15.73933	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.721927	1
906	An Acceptable Time 894	Craft beer paleo kinfolk fixie leggings direct trade bitters.	61.4500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:02.151002	2018-02-09 18:16:15.775224	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.945042	1
907	Beneath the Bleeding 895	Selvage listicle retro microdosing mumblecore thundercats swag.	30.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:02.363546	2018-02-09 18:16:15.791393	0	book_cover.png	image/png	21149	2017-12-10 22:22:02.159838	1
908	The Other Side of Silence 896	Iphone echo sriracha leggings raw denim.	45.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:02.571911	2018-02-09 18:16:15.857609	0	book_cover.png	image/png	21149	2017-12-10 22:22:02.371531	1
911	For a Breath I Tarry 899	Photo booth skateboard banh mi roof five dollar toast single-origin coffee chicharrones.	37.7700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:03.245394	2018-02-09 18:16:15.912726	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.04422	1
912	Absalom, Absalom! 900	Ethical whatever artisan 8-bit godard listicle wolf waistcoat.	14.9800000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:03.465251	2018-02-09 18:16:15.931184	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.26268	1
914	The Curious Incident of the Dog in the Night-Time 902	Beard skateboard marfa chartreuse.	34.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:03.918864	2018-02-09 18:16:15.97622	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.717741	1
915	The Mermaids Singing 903	Thundercats selvage freegan tofu five dollar toast.	9.40000000000000036	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:04.163201	2018-02-09 18:16:16.003067	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.931751	1
916	The Monkey's Raincoat 904	Brooklyn kitsch vinegar portland mixtape.	35.6400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:04.384331	2018-02-09 18:16:16.020894	0	book_cover.png	image/png	21149	2017-12-10 22:22:04.179525	1
918	Many Waters 906	Banjo photo booth austin direct trade.	62.740000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:04.828533	2018-02-09 18:16:16.079318	0	book_cover.png	image/png	21149	2017-12-10 22:22:04.611852	1
919	I Will Fear No Evil 907	Try-hard brunch mustache retro sartorial williamsburg selfies next level thundercats.	27.8399999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:05.058282	2018-02-09 18:16:16.115589	0	book_cover.png	image/png	21149	2017-12-10 22:22:04.843934	1
924	The Doors of Perception 912	Mumblecore locavore echo sustainable pug single-origin coffee shoreditch cleanse.	51.5399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:06.189589	2018-02-09 18:16:16.220095	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.986501	1
925	The Skull Beneath the Skin 913	Flannel jean shorts portland butcher.	35.3999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:06.415829	2018-02-09 18:16:16.240382	0	book_cover.png	image/png	21149	2017-12-10 22:22:06.206006	1
926	Frequent Hearses 914	Chicharrones sustainable deep v goth.	51.5900000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:06.646125	2018-02-09 18:16:16.26349	0	book_cover.png	image/png	21149	2017-12-10 22:22:06.433729	1
928	When the Green Woods Laugh 916	Freegan ethical viral drinking williamsburg messenger bag ennui master.	32.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:07.063034	2018-02-09 18:16:16.324231	0	book_cover.png	image/png	21149	2017-12-10 22:22:06.868669	1
929	Ah, Wilderness! 917	3 wolf moon narwhal shabby chic church-key blog.	8.66000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:07.300816	2018-02-09 18:16:16.365676	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.083096	1
931	Sleep the Brave 919	Viral hella muggle magic five dollar toast keytar stumptown.	11.4100000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:07.768177	2018-02-09 18:16:16.419203	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.561013	1
932	Ah, Wilderness! 920	Food truck pabst street goth lumbersexual.	33.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:07.981497	2018-02-09 18:16:16.447501	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.777931	1
933	Those Barren Leaves, Thrones, Dominations 921	Organic tacos stumptown kickstarter artisan cleanse bushwick aesthetic tote bag.	40.1599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:08.20364	2018-02-09 18:16:16.47683	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.99761	1
934	From Here to Eternity 922	Wes anderson cronut cold-pressed photo booth goth squid trust fund.	54.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:08.426826	2018-02-09 18:16:16.512841	0	book_cover.png	image/png	21149	2017-12-10 22:22:08.219495	1
936	A Summer Bird-Cage 924	Wayfarers yolo butcher keytar before they sold out.	31.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:08.943239	2018-02-09 18:16:16.581544	0	book_cover.png	image/png	21149	2017-12-10 22:22:08.676378	1
937	Brandy of the Damned 925	Tattooed chillwave before they sold out ugh occupy literally.	57.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:09.161907	2018-02-09 18:16:16.636139	0	book_cover.png	image/png	21149	2017-12-10 22:22:08.95234	1
938	The Millstone 926	Cray five dollar toast etsy crucifix jean shorts.	68.4300000000000068	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:09.375836	2018-02-09 18:16:16.663293	0	book_cover.png	image/png	21149	2017-12-10 22:22:09.175378	1
940	A Swiftly Tilting Planet 928	Quinoa echo tilde synth gastropub mlkshk crucifix.	67.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:09.814456	2018-02-09 18:16:16.731257	0	book_cover.png	image/png	21149	2017-12-10 22:22:09.601042	1
941	The Painted Veil 929	Mustache actually tote bag helvetica distillery gluten-free goth.	45.6300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:10.03285	2018-02-09 18:16:16.759142	0	book_cover.png	image/png	21149	2017-12-10 22:22:09.826973	1
943	Unweaving the Rainbow 931	Cronut banjo schlitz marfa synth aesthetic.	56.6199999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:10.486844	2018-02-09 18:16:16.80734	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.271188	1
945	East of Eden 933	Microdosing tofu asymmetrical post-ironic wayfarers.	59.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:10.926752	2018-02-09 18:16:16.827335	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.704706	1
946	Frequent Hearses 934	Small batch godard dreamcatcher swag chartreuse stumptown.	11.0899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:11.140253	2018-02-09 18:16:16.844548	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.938847	1
948	The Curious Incident of the Dog in the Night-Time 936	Swag messenger bag pinterest wayfarers.	57.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:11.584656	2018-02-09 18:16:16.89125	0	book_cover.png	image/png	21149	2017-12-10 22:22:11.378203	1
949	Fame Is the Spur 937	Small batch swag tousled williamsburg freegan shoreditch.	41.3599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:11.798353	2018-02-09 18:16:16.911463	0	book_cover.png	image/png	21149	2017-12-10 22:22:11.594291	1
950	Oh! To be in England 938	Microdosing hella shoreditch marfa skateboard slow-carb sartorial mumblecore.	49.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:12.024324	2018-02-09 18:16:16.930344	0	book_cover.png	image/png	21149	2017-12-10 22:22:11.810892	1
952	A Confederacy of Dunces 940	Butcher celiac sartorial loko messenger bag twee kombucha 8-bit.	22.370000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:12.444605	2018-02-09 18:16:16.978951	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.244749	1
953	Time To Murder And Create 941	Offal literally vegan gluten-free farm-to-table meh.	68.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:12.682333	2018-02-09 18:16:17.003329	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.456094	1
954	Stranger in a Strange Land 942	Trust fund cleanse messenger bag wolf asymmetrical fanny pack chambray phlogiston.	66.1500000000000057	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:12.914284	2018-02-09 18:16:17.031178	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.691004	1
956	Shall not Perish 944	Cardigan kinfolk organic goth cold-pressed vhs schlitz yolo ugh.	66.0699999999999932	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:13.351834	2018-02-09 18:16:17.071266	0	book_cover.png	image/png	21149	2017-12-10 22:22:13.140061	1
957	An Acceptable Time 945	Etsy gentrify cold-pressed 8-bit brunch banh mi locavore church-key.	29.5199999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:13.57578	2018-02-09 18:16:17.091679	0	book_cover.png	image/png	21149	2017-12-10 22:22:13.360736	1
958	East of Eden 946	Stumptown synth biodiesel chicharrones cornhole street ugh meh disrupt.	42.4099999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:13.795748	2018-02-09 18:16:17.111087	0	book_cover.png	image/png	21149	2017-12-10 22:22:13.586898	1
960	The Widening Gyre 948	Fanny pack schlitz wolf organic.	10.2799999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:14.228469	2018-02-09 18:16:17.138364	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.024815	1
962	Time of our Darkness 950	Salvia banjo polaroid tumblr.	54.1599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:14.684776	2018-02-09 18:16:17.205608	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.461325	1
963	Such, Such Were the Joys 951	Intelligentsia listicle literally disrupt.	38.9799999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:14.903807	2018-02-09 18:16:17.233244	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.704364	1
964	The Wives of Bath 952	Roof xoxo offal brooklyn forage.	17.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:15.128209	2018-02-09 18:16:17.255265	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.912437	1
965	The Wealth of Nations 953	Fashion axe readymade meditation chartreuse kitsch literally photo booth.	61.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:15.343942	2018-02-09 18:16:17.27779	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.140002	1
967	A Catskill Eagle 955	Authentic green juice kitsch skateboard organic yuccie flexitarian humblebrag banh mi.	55.75	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:15.775176	2018-02-09 18:16:17.320035	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.555626	1
968	Unweaving the Rainbow 956	Kitsch hashtag chillwave meditation +1 schlitz banh mi everyday.	55.5700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:15.987571	2018-02-09 18:16:17.356983	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.787303	1
969	A Swiftly Tilting Planet 957	Blue bottle synth selvage tumblr try-hard flannel kinfolk tofu raw denim.	66.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:16.188468	2018-02-09 18:16:17.386873	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.996754	1
970	What's Become of Waring 958	Salvia narwhal loko cred portland twee.	47.9500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:16.399814	2018-02-09 18:16:17.406947	0	book_cover.png	image/png	21149	2017-12-10 22:22:16.197316	1
972	An Evil Cradling 960	Marfa readymade five dollar toast iphone.	49.4299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:16.827275	2018-02-09 18:16:17.45121	0	book_cover.png	image/png	21149	2017-12-10 22:22:16.626403	1
973	Look to Windward 961	Tote bag five dollar toast post-ironic wolf.	23.7699999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:17.03988	2018-02-09 18:16:17.470739	0	book_cover.png	image/png	21149	2017-12-10 22:22:16.8412	1
976	The Golden Apples of the Sun 964	Blog banjo narwhal fingerstache photo booth.	58.9699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:17.677478	2018-02-09 18:16:17.511006	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.478927	1
977	Mother Night 965	Tote bag sustainable vegan vhs.	52.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:17.891925	2018-02-09 18:16:17.53202	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.687079	1
978	No Country for Old Men 966	Put a bird on it banjo plaid tacos whatever cleanse ennui gentrify.	18.4200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:18.111844	2018-02-09 18:16:17.555653	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.903328	1
979	Moab Is My Washpot 967	Pitchfork cred shoreditch sartorial.	63.8400000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:18.341869	2018-02-09 18:16:17.59348	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.12042	1
981	From Here to Eternity 969	Pour-over chia letterpress umami lo-fi poutine kickstarter cardigan loko.	14.2300000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:18.769358	2018-02-09 18:16:17.63907	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.565578	1
982	Dulce et Decorum Est 970	Austin chillwave neutra organic shabby chic.	53.4399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:18.981851	2018-02-09 18:16:17.679923	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.777779	1
984	Rosemary Sutcliff 972	Marfa master brooklyn polaroid xoxo pug shoreditch wes anderson cardigan.	46.0700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:19.412649	2018-02-09 18:16:17.781761	0	book_cover.png	image/png	21149	2017-12-10 22:22:19.200992	1
985	The Waste Land 973	Gluten-free meditation etsy normcore hella roof meggings diy authentic.	27.3299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:19.652187	2018-02-09 18:16:17.83525	0	book_cover.png	image/png	21149	2017-12-10 22:22:19.427584	1
986	By Grand Central Station I Sat Down and Wept 974	Kogi quinoa taxidermy stumptown fanny pack sartorial xoxo carry.	49.6799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:19.870643	2018-02-09 18:16:17.888131	0	book_cover.png	image/png	21149	2017-12-10 22:22:19.668446	1
988	East of Eden 976	Ennui hashtag ugh deep v seitan.	52.5499999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:20.354454	2018-02-09 18:16:17.949488	0	book_cover.png	image/png	21149	2017-12-10 22:22:20.132566	1
989	In Dubious Battle 977	Dreamcatcher pitchfork humblebrag knausgaard food truck.	64.2900000000000063	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:20.599043	2018-02-09 18:16:17.979539	0	book_cover.png	image/png	21149	2017-12-10 22:22:20.368664	1
991	No Highway 979	Freegan gluten-free health narwhal umami synth.	29.0199999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:21.07282	2018-02-09 18:16:18.04642	0	book_cover.png	image/png	21149	2017-12-10 22:22:20.82897	1
993	When the Green Woods Laugh 981	Irony chicharrones organic gluten-free selfies chia.	45.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:21.522459	2018-02-09 18:16:18.096733	0	book_cover.png	image/png	21149	2017-12-10 22:22:21.314199	1
994	Terrible Swift Sword 982	Etsy offal park tilde pabst godard mustache disrupt.	9.30000000000000071	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:21.748096	2018-02-09 18:16:18.128329	0	book_cover.png	image/png	21149	2017-12-10 22:22:21.538313	1
996	Far From the Madding Crowd 984	Tote bag normcore pbr&b bespoke vegan cornhole viral.	41.1499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:22.220194	2018-02-09 18:16:18.219294	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.014498	1
1	The Needle's Eye	Pitchfork wes anderson salvia vegan 3 wolf moon scenester umami.	39.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:34.819196	2018-02-09 18:16:18.237293	0	book_cover.png	image/png	21149	2017-12-10 22:18:34.375993	1
21	What's Become of Waring 9	Direct trade humblebrag fingerstache yr you probably haven't heard of them poutine meh vinyl organic.	18.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:39.567733	2018-02-09 18:16:18.291609	0	book_cover.png	image/png	21149	2017-12-10 22:18:39.222621	1
41	Terrible Swift Sword 29	Asymmetrical health muggle magic lomo jean shorts echo kogi before they sold out.	69.9399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:44.262945	2018-02-09 18:16:18.322361	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.045258	1
65	Ring of Bright Water 53	Xoxo cardigan tote bag meh austin photo booth church-key yuccie.	34.259999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:49.710215	2018-02-09 18:16:18.362083	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.490306	1
80	Vile Bodies 68	Wayfarers taxidermy intelligentsia tattooed try-hard vinyl listicle marfa.	23.5500000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:52.912662	2018-02-09 18:16:18.389146	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.715459	1
83	A Catskill Eagle 71	Pop-up carry yuccie flannel tousled bespoke direct trade craft beer dreamcatcher.	22.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:53.570141	2018-02-09 18:16:18.423446	0	book_cover.png	image/png	21149	2017-12-10 22:18:53.364629	1
102	No Highway 90	Pinterest goth butcher fanny pack sustainable.	47.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:57.967338	2018-02-09 18:16:18.447542	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.760488	1
118	Bury My Heart at Wounded Knee 106	Trust fund disrupt mixtape austin.	63.3400000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:01.751371	2018-02-09 18:16:18.518016	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.539444	1
129	The Widening Gyre 117	Helvetica single-origin coffee gastropub cred 3 wolf moon letterpress drinking biodiesel sartorial.	37.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:04.276607	2018-02-09 18:16:18.549144	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.050463	1
156	Specimen Days 144	Yolo shoreditch sustainable messenger bag sartorial vhs pop-up meditation.	24.379999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:10.793714	2018-02-09 18:16:18.599397	0	book_cover.png	image/png	21149	2017-12-10 22:19:10.582647	1
158	The Sun Also Rises 146	Selfies xoxo fanny pack farm-to-table tacos neutra cleanse pug diy.	57.4099999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:11.231739	2018-02-09 18:16:18.643803	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.017051	1
177	The Violent Bear It Away 165	Vice raw denim selvage fixie art party biodiesel intelligentsia loko.	23.2100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:15.461228	2018-02-09 18:16:18.683456	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.2505	1
211	The Cricket on the Hearth 199	Gentrify keffiyeh photo booth food truck asymmetrical vinegar actually art party ennui.	38.3800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:23.148737	2018-02-09 18:16:18.735571	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.938613	1
232	Nine Coaches Waiting 220	Intelligentsia typewriter yr austin tattooed carry trust fund flannel.	66.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:27.917783	2018-02-09 18:16:18.761229	0	book_cover.png	image/png	21149	2017-12-10 22:19:27.662944	1
245	The Curious Incident of the Dog in the Night-Time 233	Bitters sustainable keytar +1 dreamcatcher waistcoat aesthetic yr 3 wolf moon.	61.9600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:31.434257	2018-02-09 18:16:18.809351	0	book_cover.png	image/png	21149	2017-12-10 22:19:31.190441	1
997	Bury My Heart at Wounded Knee 985	Listicle fashion axe ramps cronut.	13.4900000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:22.444582	2018-02-09 18:16:18.838014	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.237086	1
1000	I Know Why the Caged Bird Sings 988	Vhs ugh direct trade squid ennui crucifix banh mi gentrify distillery.	69.0799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:23.083359	2018-02-09 18:16:18.899536	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.885586	1
1001	Tiger! Tiger! 989	Wayfarers echo irony distillery gentrify gluten-free.	62.4600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:23.296374	2018-02-09 18:16:18.930033	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.094123	1
1002	I Sing the Body Electric 990	Cleanse forage intelligentsia health +1.	62.0300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:23.517932	2018-02-09 18:16:18.966094	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.311247	1
1004	Fear and Trembling 992	Xoxo sustainable bespoke keffiyeh.	18.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:23.969099	2018-02-09 18:16:19.011369	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.762149	1
1005	Blithe Spirit 993	8-bit williamsburg fanny pack banh mi.	31.5799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:24.182426	2018-02-09 18:16:19.031288	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.983937	1
1006	To Sail Beyond the Sunset 994	Keffiyeh salvia keytar banh mi try-hard blog bicycle rights.	19.5700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:24.396285	2018-02-09 18:16:19.055265	0	book_cover.png	image/png	21149	2017-12-10 22:22:24.19457	1
1008	Specimen Days 996	Phlogiston pitchfork twee asymmetrical pop-up fingerstache aesthetic ethical salvia.	11.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:24.849686	2018-02-09 18:16:19.099229	0	book_cover.png	image/png	21149	2017-12-10 22:22:24.63691	1
1009	By Grand Central Station I Sat Down and Wept 997	Sriracha keytar sartorial godard 3 wolf moon occupy fanny pack franzen williamsburg.	36.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:25.06304	2018-02-09 18:16:19.119219	0	book_cover.png	image/png	21149	2017-12-10 22:22:24.8612	1
1011	The Proper Study 999	Banjo wayfarers hella fixie fingerstache five dollar toast bicycle rights.	14.9100000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:25.498023	2018-02-09 18:16:19.183396	0	book_cover.png	image/png	21149	2017-12-10 22:22:25.291241	1
269	The Soldier's Art 257	Migas retro selvage stumptown wolf pinterest kickstarter authentic.	15.4000000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:37.47664	2018-02-09 18:16:19.228624	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.257668	1
270	Carrion Comfort 258	Narwhal small batch wes anderson messenger bag hashtag crucifix letterpress.	25.629999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:37.69816	2018-02-09 18:16:19.245144	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.487173	1
290	The Wealth of Nations 278	Locavore quinoa 3 wolf moon portland kitsch etsy 8-bit health truffaut.	43.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:42.495928	2018-02-09 18:16:19.262879	0	book_cover.png	image/png	21149	2017-12-10 22:19:42.294848	1
309	The Wind's Twelve Quarters 297	Gastropub helvetica tote bag ugh waistcoat artisan sartorial you probably haven't heard of them.	40.0600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:47.174538	2018-02-09 18:16:19.299955	0	book_cover.png	image/png	21149	2017-12-10 22:19:46.922099	1
330	The Cricket on the Hearth 318	Seitan try-hard fixie aesthetic gentrify xoxo pitchfork yuccie venmo.	30.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:51.973529	2018-02-09 18:16:19.327225	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.763973	1
344	Little Hands Clapping 332	Kickstarter occupy offal shoreditch hashtag poutine humblebrag.	22.7899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:55.205737	2018-02-09 18:16:19.351414	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.993722	1
367	No Country for Old Men 355	Small batch keytar deep v ennui pabst park raw denim mixtape.	63.6599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:00.374855	2018-02-09 18:16:19.390818	0	book_cover.png	image/png	21149	2017-12-10 22:20:00.161638	1
382	The Green Bay Tree 370	Waistcoat pop-up vice whatever semiotics health single-origin coffee.	41.0700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:03.833218	2018-02-09 18:16:19.412881	0	book_cover.png	image/png	21149	2017-12-10 22:20:03.631985	1
407	Blood's a Rover 395	Listicle tousled wes anderson venmo authentic ramps banh mi viral.	54.6499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:09.487341	2018-02-09 18:16:19.442369	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.274962	1
421	Let Us Now Praise Famous Men 409	Echo venmo chambray quinoa semiotics food truck.	57.0900000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:12.516802	2018-02-09 18:16:19.461308	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.308546	1
423	That Good Night 411	Jean shorts next level master hoodie meggings scenester synth cred normcore.	65.519999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:12.952502	2018-02-09 18:16:19.477951	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.746293	1
459	Blood's a Rover 447	Williamsburg small batch seitan fingerstache 90's pinterest helvetica etsy cliche.	61.6400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:21.236709	2018-02-09 18:16:19.503017	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.020562	1
467	Eyeless in Gaza 455	Banjo shabby chic wes anderson wayfarers williamsburg scenester biodiesel fashion axe jean shorts.	44.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:23.052912	2018-02-09 18:16:19.518349	0	book_cover.png	image/png	21149	2017-12-10 22:20:22.846403	1
489	Number the Stars 477	Next level 8-bit venmo fashion axe quinoa yuccie tacos asymmetrical photo booth.	21.0199999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:28.167993	2018-02-09 18:16:19.534926	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.961637	1
498	Far From the Madding Crowd 486	Gluten-free health polaroid franzen church-key.	61.7299999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:30.174319	2018-02-09 18:16:19.55338	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.961139	1
522	Stranger in a Strange Land 510	Locavore seitan mixtape green juice banh mi bicycle rights.	21.2600000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:35.522299	2018-02-09 18:16:19.60717	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.31006	1
537	Have His Carcase 525	Wes anderson street wolf leggings cray pbr&b salvia.	49.5399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:39.099844	2018-02-09 18:16:19.629659	0	book_cover.png	image/png	21149	2017-12-10 22:20:38.792363	1
569	The Far-Distant Oxus 557	Tofu pickled aesthetic drinking pour-over literally freegan skateboard.	69.7000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:46.304514	2018-02-09 18:16:19.697236	0	book_cover.png	image/png	21149	2017-12-10 22:20:46.086912	1
570	The Painted Veil 558	You probably haven't heard of them kale chips deep v art party raw denim tousled literally tacos.	64.1500000000000057	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:46.552484	2018-02-09 18:16:19.729617	0	book_cover.png	image/png	21149	2017-12-10 22:20:46.318178	1
575	The Yellow Meads of Asphodel 563	Green juice diy jean shorts 3 wolf moon kogi intelligentsia.	67.019999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:47.704818	2018-02-09 18:16:19.749286	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.484838	1
585	The Sun Also Rises 573	Quinoa mumblecore tacos kitsch flexitarian williamsburg tousled sartorial drinking.	14.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:49.97268	2018-02-09 18:16:19.763704	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.712826	1
598	Vile Bodies 586	Tilde cold-pressed plaid master tofu keytar.	58.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:52.947267	2018-02-09 18:16:19.775371	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.744475	1
623	The Stars' Tennis Balls 611	Deep v fingerstache banh mi listicle meggings lo-fi lumbersexual.	36.3200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:58.589743	2018-02-09 18:16:19.805592	0	book_cover.png	image/png	21149	2017-12-10 22:20:58.377749	1
643	The Curious Incident of the Dog in the Night-Time 631	Waistcoat biodiesel wes anderson sriracha seitan loko.	9.40000000000000036	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:03.093588	2018-02-09 18:16:19.826963	0	book_cover.png	image/png	21149	2017-12-10 22:21:02.856884	1
658	Shall not Perish 646	Cray mixtape yolo hashtag locavore asymmetrical pop-up.	44.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:06.527969	2018-02-09 18:16:19.871162	0	book_cover.png	image/png	21149	2017-12-10 22:21:06.305567	1
3	Behold the Man	Health freegan meditation celiac photo booth ramps tote bag 3 wolf moon.	59.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:35.468646	2018-02-09 18:15:44.351842	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.268558	1
6	Pale Kings and Princes	Scenester squid wes anderson offal banjo kitsch meditation aesthetic.	49.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:36.122864	2018-02-09 18:15:44.523497	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.920488	1
11	Stranger in a Strange Land	Master portland chartreuse pug meditation pitchfork photo booth truffaut.	69.9899999999999949	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:37.195751	2018-02-09 18:15:45.024403	1	book_cover.png	image/png	21149	2017-12-10 22:18:36.997752	1
15	Dance Dance Dance 3	Swag taxidermy raw denim cleanse.	9.25999999999999979	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:38.053838	2018-02-09 18:15:45.170808	0	book_cover.png	image/png	21149	2017-12-10 22:18:37.834434	1
18	Tiger! Tiger! 6	Listicle pop-up post-ironic truffaut pork belly swag lo-fi umami.	67.519999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:38.704175	2018-02-09 18:15:45.479625	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.498008	1
23	This Side of Paradise 11	Waistcoat loko bespoke yolo thundercats ethical.	21.4400000000000013	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:40.216923	2018-02-09 18:15:45.65855	0	book_cover.png	image/png	21149	2017-12-10 22:18:39.893064	1
26	East of Eden 14	Organic fixie green juice biodiesel marfa food truck photo booth cardigan.	32.240000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:40.960811	2018-02-09 18:15:45.849762	0	book_cover.png	image/png	21149	2017-12-10 22:18:40.751715	1
690	The Sun Also Rises 678	Yuccie bicycle rights waistcoat small batch you probably haven't heard of them forage gentrify flexitarian.	50.1300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:13.725518	2018-02-09 18:16:19.926419	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.525251	1
700	The Waste Land 688	Knausgaard cold-pressed you probably haven't heard of them artisan wayfarers mixtape chicharrones.	56.7999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:15.956643	2018-02-09 18:16:19.951172	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.732161	1
730	A Farewell to Arms 718	Tilde pickled everyday kinfolk dreamcatcher cliche authentic cleanse.	39.0200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:22.637553	2018-02-09 18:16:19.99752	0	book_cover.png	image/png	21149	2017-12-10 22:21:22.428852	1
743	Tiger! Tiger! 731	Selfies yr letterpress yuccie 8-bit heirloom thundercats hammock hella.	7.79000000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:25.633109	2018-02-09 18:16:20.039211	0	book_cover.png	image/png	21149	2017-12-10 22:21:25.427155	1
764	No Longer at Ease 752	8-bit pickled cleanse muggle magic neutra.	40.7700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:30.414867	2018-02-09 18:16:20.067016	0	book_cover.png	image/png	21149	2017-12-10 22:21:30.181921	1
768	A Handful of Dust 756	Master squid organic letterpress meditation.	50.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:31.336333	2018-02-09 18:16:20.102746	0	book_cover.png	image/png	21149	2017-12-10 22:21:31.123874	1
798	The Green Bay Tree 786	Artisan biodiesel thundercats raw denim hashtag bicycle rights keytar vinegar.	46.740000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:38.311923	2018-02-09 18:16:20.166747	0	book_cover.png	image/png	21149	2017-12-10 22:21:38.100828	1
806	Françoise Sagan 794	Church-key vinegar chia scenester swag twee sartorial echo.	10.4100000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:40.198647	2018-02-09 18:16:20.1994	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.989296	1
836	Let Us Now Praise Famous Men 824	Post-ironic pop-up vinyl kale chips kinfolk portland.	68.5999999999999943	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:46.834047	2018-02-09 18:16:20.271456	0	book_cover.png	image/png	21149	2017-12-10 22:21:46.614332	1
844	In a Dry Season 832	Narwhal post-ironic gentrify tofu bicycle rights.	20.629999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:48.708222	2018-02-09 18:16:20.302337	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.498722	1
849	The Road Less Traveled 837	Kinfolk heirloom jean shorts roof food truck squid cold-pressed trust fund.	50.9500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:49.848816	2018-02-09 18:16:20.337712	0	book_cover.png	image/png	21149	2017-12-10 22:21:49.648922	1
882	Terrible Swift Sword 870	Typewriter hella mumblecore post-ironic bushwick poutine.	36.8800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:56.997184	2018-02-09 18:16:20.378041	0	book_cover.png	image/png	21149	2017-12-10 22:21:56.795245	1
892	Little Hands Clapping 880	Bicycle rights kogi tousled +1 fashion axe cliche gluten-free seitan.	24.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:59.16317	2018-02-09 18:16:20.399264	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.972425	1
910	An Acceptable Time 898	Typewriter pinterest fanny pack pop-up wes anderson offal lomo pickled.	17.379999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:03.033057	2018-02-09 18:16:20.427939	0	book_cover.png	image/png	21149	2017-12-10 22:22:02.818355	1
922	The Golden Apples of the Sun 910	Bushwick before they sold out kale chips freegan yr microdosing blog.	40.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:05.751505	2018-02-09 18:16:20.484945	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.519609	1
944	The Mirror Crack'd from Side to Side 932	Helvetica gentrify iphone paleo drinking brunch.	32.2299999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:10.694831	2018-02-09 18:16:20.506035	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.497187	1
959	The Moving Toyshop 947	Plaid forage five dollar toast truffaut wes anderson post-ironic.	40.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:14.012699	2018-02-09 18:16:20.523717	0	book_cover.png	image/png	21149	2017-12-10 22:22:13.809576	1
990	For Whom the Bell Tolls 978	3 wolf moon kickstarter kale chips meditation dreamcatcher phlogiston pop-up.	47.740000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:20.811971	2018-02-09 18:16:20.581283	0	book_cover.png	image/png	21149	2017-12-10 22:22:20.611076	1
998	That Good Night 986	Farm-to-table fixie banh mi bicycle rights salvia lumbersexual intelligentsia.	47.8100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:22.664308	2018-02-09 18:16:20.617223	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.464206	1
31	Taming a Sea Horse 19	Flannel retro farm-to-table vegan venmo synth.	55.0700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:42.055846	2018-02-09 18:15:46.035383	0	book_cover.png	image/png	21149	2017-12-10 22:18:41.830312	1
34	Jesting Pilate 22	Shoreditch chia biodiesel direct trade.	66.9500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:42.685719	2018-02-09 18:15:46.239365	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.484053	1
38	A Summer Bird-Cage 26	Authentic taxidermy master bitters.	54.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:43.564497	2018-02-09 18:15:46.416303	0	book_cover.png	image/png	21149	2017-12-10 22:18:43.369096	1
42	A Farewell to Arms 30	Kombucha skateboard fanny pack forage bushwick gluten-free.	14.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:44.517836	2018-02-09 18:15:46.520056	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.275689	1
47	Some Buried Caesar 35	Cardigan 3 wolf moon selvage kogi sartorial williamsburg pork belly drinking.	51.5200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:45.7891	2018-02-09 18:15:46.671452	0	book_cover.png	image/png	21149	2017-12-10 22:18:45.547937	1
51	In Death Ground 39	Gentrify vinegar hashtag master fixie gluten-free.	26.129999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:46.651119	2018-02-09 18:15:46.880184	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.443528	1
55	This Lime Tree Bower 43	Street brooklyn tacos migas celiac kale chips irony artisan pork belly.	26.0100000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:47.52687	2018-02-09 18:15:47.059649	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.319338	1
58	Blithe Spirit 46	Distillery readymade food truck chillwave you probably haven't heard of them 90's church-key mustache street.	19.3399999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:18:48.17178	2018-02-09 18:15:47.148932	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.965488	1
63	The Skull Beneath the Skin 51	Before they sold out cleanse forage selvage stumptown butcher.	15.5899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:18:49.250829	2018-02-09 18:15:47.387221	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.049068	1
68	The Heart Is Deceitful Above All Things 56	Seitan 3 wolf moon art party umami street kombucha tousled pop-up.	16.4200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:50.340217	2018-02-09 18:15:47.710084	0	book_cover.png	image/png	21149	2017-12-10 22:18:50.138813	1
72	The House of Mirth 60	Shoreditch literally chillwave slow-carb food truck park aesthetic blue bottle try-hard.	44.0300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:51.197925	2018-02-09 18:15:48.147588	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.000267	1
77	The Heart Is Deceitful Above All Things 65	Small batch williamsburg xoxo you probably haven't heard of them banjo.	39.7199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:52.259567	2018-02-09 18:15:48.652325	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.059659	1
84	The Last Enemy 72	Pinterest wolf vinegar irony polaroid food truck post-ironic health humblebrag.	23.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:18:53.793303	2018-02-09 18:15:48.926369	0	book_cover.png	image/png	21149	2017-12-10 22:18:53.578754	1
88	The Road Less Traveled 76	Sustainable meditation humblebrag kickstarter schlitz flexitarian neutra pug swag.	19.4899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:18:54.66602	2018-02-09 18:15:49.076505	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.45404	1
93	Dulce et Decorum Est 81	Muggle magic deep v semiotics leggings 3 wolf moon.	57.740000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:55.862127	2018-02-09 18:15:49.279635	0	book_cover.png	image/png	21149	2017-12-10 22:18:55.630988	1
96	In Death Ground 84	Health lo-fi wayfarers blog kombucha meh taxidermy you probably haven't heard of them.	21.129999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:56.511556	2018-02-09 18:15:49.428315	0	book_cover.png	image/png	21149	2017-12-10 22:18:56.295487	1
100	A Time to Kill 88	Ennui gentrify drinking chicharrones yuccie brunch bicycle rights.	26.4899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:57.505917	2018-02-09 18:15:49.588957	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.269075	1
106	If Not Now, When? 94	Chia shabby chic literally ethical normcore whatever poutine semiotics fanny pack.	12.1400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:18:58.874704	2018-02-09 18:15:49.724015	0	book_cover.png	image/png	21149	2017-12-10 22:18:58.647478	1
110	For Whom the Bell Tolls 98	Umami lumbersexual readymade vegan farm-to-table mustache thundercats hella vice.	19.5899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:18:59.793055	2018-02-09 18:15:49.932663	0	book_cover.png	image/png	21149	2017-12-10 22:18:59.582021	1
115	After Many a Summer Dies the Swan 103	Vegan authentic hammock normcore humblebrag marfa irony franzen 90's.	24.2300000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:01.043755	2018-02-09 18:15:50.193359	0	book_cover.png	image/png	21149	2017-12-10 22:19:00.83273	1
121	The Violent Bear It Away 109	Keffiyeh vegan pork belly whatever selvage echo typewriter cornhole.	20.1700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:02.413448	2018-02-09 18:15:50.378176	0	book_cover.png	image/png	21149	2017-12-10 22:19:02.208911	1
125	As I Lay Dying 113	Sriracha pitchfork migas distillery cray mumblecore poutine fingerstache blue bottle.	29.2699999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:03.318762	2018-02-09 18:15:50.53641	0	book_cover.png	image/png	21149	2017-12-10 22:19:03.113163	1
131	Antic Hay 119	Pbr&b chia swag trust fund.	40.8500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:04.730388	2018-02-09 18:15:50.711653	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.526708	1
134	Noli Me Tangere 122	Phlogiston cold-pressed freegan disrupt locavore beard pickled.	29.1900000000000013	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:05.403375	2018-02-09 18:15:50.868381	0	book_cover.png	image/png	21149	2017-12-10 22:19:05.187912	1
138	That Hideous Strength 126	Etsy five dollar toast tousled flexitarian schlitz.	38.2000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:06.365619	2018-02-09 18:15:51.027937	0	book_cover.png	image/png	21149	2017-12-10 22:19:06.160051	1
141	The Needle's Eye 129	Cardigan jean shorts gluten-free sustainable kinfolk you probably haven't heard of them franzen venmo.	20.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:06.999943	2018-02-09 18:15:51.171484	0	book_cover.png	image/png	21149	2017-12-10 22:19:06.800904	1
146	I Sing the Body Electric 134	Literally cardigan seitan waistcoat yuccie street helvetica.	43.259999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:08.247163	2018-02-09 18:15:51.467118	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.972606	1
150	The Golden Bowl 138	Blue bottle tacos ugh scenester pop-up 3 wolf moon.	43.5799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:09.320107	2018-02-09 18:15:51.724634	0	book_cover.png	image/png	21149	2017-12-10 22:19:09.116676	1
153	What's Become of Waring 141	Kogi neutra bespoke pour-over cleanse celiac distillery pabst.	46.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:10.03684	2018-02-09 18:15:51.803262	0	book_cover.png	image/png	21149	2017-12-10 22:19:09.820207	1
157	The Golden Apples of the Sun 145	Occupy lumbersexual forage pitchfork tofu farm-to-table raw denim.	51.759999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:11.006569	2018-02-09 18:15:51.848162	0	book_cover.png	image/png	21149	2017-12-10 22:19:10.80504	1
162	Tiger! Tiger! 150	Neutra bicycle rights meh viral williamsburg.	7.12000000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:12.121877	2018-02-09 18:15:51.939382	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.910942	1
166	Frequent Hearses 154	Organic twee disrupt kinfolk.	52.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:12.98748	2018-02-09 18:15:52.039357	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.769344	1
169	Fame Is the Spur 157	Irony distillery cronut ethical blog migas ramps knausgaard iphone.	23.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:13.665126	2018-02-09 18:15:52.111352	0	book_cover.png	image/png	21149	2017-12-10 22:19:13.457174	1
173	The Way Through the Woods 161	Actually tacos drinking austin marfa.	42.7000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:14.574219	2018-02-09 18:15:52.219374	0	book_cover.png	image/png	21149	2017-12-10 22:19:14.359436	1
176	Cabbages and Kings 164	Truffaut cornhole vegan biodiesel tattooed hammock keytar austin.	11.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:15.238367	2018-02-09 18:15:52.287472	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.033481	1
181	Dance Dance Dance 169	Tacos humblebrag cronut beard shabby chic tousled next level.	37.3699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:16.379264	2018-02-09 18:15:52.395139	0	book_cover.png	image/png	21149	2017-12-10 22:19:16.161192	1
185	The Wind's Twelve Quarters 173	Artisan ethical microdosing carry fixie banh mi poutine xoxo.	62.6899999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:17.323139	2018-02-09 18:15:52.528501	0	book_cover.png	image/png	21149	2017-12-10 22:19:17.100953	1
189	Vanity Fair 177	Roof you probably haven't heard of them iphone kogi typewriter occupy swag chicharrones.	15.5099999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:18.236883	2018-02-09 18:15:52.705736	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.027863	1
194	Fair Stood the Wind for France 182	Typewriter 3 wolf moon five dollar toast sartorial yr cray cardigan williamsburg.	39.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:19.355644	2018-02-09 18:15:52.887295	0	book_cover.png	image/png	21149	2017-12-10 22:19:19.149199	1
196	The Grapes of Wrath 184	Actually loko food truck chicharrones you probably haven't heard of them master cold-pressed.	44.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:19:19.805116	2018-02-09 18:15:52.915375	0	book_cover.png	image/png	21149	2017-12-10 22:19:19.588072	1
200	The Lathe of Heaven 188	Shabby chic fingerstache godard tousled cronut kale chips offal.	39.9099999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:20.684685	2018-02-09 18:15:53.039252	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.484003	1
204	What's Become of Waring 192	Forage gentrify cliche messenger bag keytar jean shorts intelligentsia.	32.9399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:21.613016	2018-02-09 18:15:53.169936	0	book_cover.png	image/png	21149	2017-12-10 22:19:21.396523	1
208	The Heart Is a Lonely Hunter 196	Heirloom five dollar toast 3 wolf moon wayfarers trust fund cardigan austin.	8.94999999999999929	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:22.496864	2018-02-09 18:15:53.364168	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.282834	1
213	Mr Standfast 201	Cleanse mumblecore 8-bit pour-over biodiesel cold-pressed pinterest 3 wolf moon hammock.	49.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:23.61532	2018-02-09 18:15:53.559912	0	book_cover.png	image/png	21149	2017-12-10 22:19:23.38718	1
217	The Last Temptation 205	Sriracha leggings sartorial organic neutra stumptown letterpress muggle magic retro.	27.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:24.502711	2018-02-09 18:15:53.721626	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.301758	1
221	Arms and the Man 209	Park gentrify helvetica quinoa vice green juice sriracha humblebrag.	59.8100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:25.373675	2018-02-09 18:15:53.905638	0	book_cover.png	image/png	21149	2017-12-10 22:19:25.176557	1
226	The Line of Beauty 214	Diy vhs celiac blue bottle pinterest distillery.	34.2700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:26.514639	2018-02-09 18:15:54.088188	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.298014	1
229	Down to a Sunless Sea 217	Godard 8-bit paleo bitters.	28.8599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:27.182441	2018-02-09 18:15:54.19527	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.961927	1
236	A Scanner Darkly 224	Farm-to-table pickled synth pbr&b five dollar toast truffaut.	43.509999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:28.810434	2018-02-09 18:15:54.479214	0	book_cover.png	image/png	21149	2017-12-10 22:19:28.585491	1
240	Little Hands Clapping 228	Wolf muggle magic before they sold out shabby chic authentic forage.	27.129999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:30.072106	2018-02-09 18:15:54.627405	0	book_cover.png	image/png	21149	2017-12-10 22:19:29.787134	1
244	His Dark Materials 232	Waistcoat cronut neutra microdosing 90's tilde.	48.3299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:31.178529	2018-02-09 18:15:54.859345	0	book_cover.png	image/png	21149	2017-12-10 22:19:30.922221	1
248	The Little Foxes 236	Offal pour-over kale chips asymmetrical gastropub tousled roof cliche.	7.28000000000000025	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:32.128434	2018-02-09 18:15:54.964902	0	book_cover.png	image/png	21149	2017-12-10 22:19:31.903096	1
252	Cover Her Face 240	Five dollar toast literally pabst farm-to-table skateboard dreamcatcher.	12.5099999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:33.081573	2018-02-09 18:15:55.121208	0	book_cover.png	image/png	21149	2017-12-10 22:19:32.838593	1
256	The Glory and the Dream 244	90's swag scenester twee synth diy xoxo vice mixtape.	23.2800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:34.247559	2018-02-09 18:15:55.19022	0	book_cover.png	image/png	21149	2017-12-10 22:19:33.931629	1
260	In a Dry Season 248	Synth photo booth narwhal kale chips tattooed polaroid organic slow-carb.	57.2999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:35.255266	2018-02-09 18:15:55.364528	0	book_cover.png	image/png	21149	2017-12-10 22:19:35.027659	1
264	Stranger in a Strange Land 252	Flannel pop-up mlkshk chambray kinfolk crucifix.	45.7899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:36.323734	2018-02-09 18:15:55.491372	0	book_cover.png	image/png	21149	2017-12-10 22:19:36.080195	1
271	Beneath the Bleeding 259	Pinterest jean shorts flexitarian meditation kitsch beard craft beer aesthetic.	15.4199999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:37.929279	2018-02-09 18:15:55.658156	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.708897	1
275	The Little Foxes 263	Vhs disrupt kinfolk mustache brunch 8-bit forage.	49.2199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:38.861431	2018-02-09 18:15:55.747054	0	book_cover.png	image/png	21149	2017-12-10 22:19:38.611514	1
276	The Daffodil Sky 264	Tousled pop-up mumblecore humblebrag neutra leggings.	42.1199999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:39.155731	2018-02-09 18:15:55.779106	0	book_cover.png	image/png	21149	2017-12-10 22:19:38.874147	1
282	The Line of Beauty 270	Wayfarers quinoa pour-over before they sold out fashion axe craft beer hella tacos.	32.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:40.552229	2018-02-09 18:15:55.951824	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.335813	1
287	Sleep the Brave 275	Meh pickled deep v chia flexitarian pork belly.	13.0800000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:41.836825	2018-02-09 18:15:56.122137	0	book_cover.png	image/png	21149	2017-12-10 22:19:41.569137	1
291	Beneath the Bleeding 279	Disrupt yolo banjo cliche 90's kickstarter.	12.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:42.744309	2018-02-09 18:15:56.185109	0	book_cover.png	image/png	21149	2017-12-10 22:19:42.504344	1
295	To Say Nothing of the Dog 283	Fashion axe hoodie leggings shoreditch trust fund art party aesthetic venmo.	55.259999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:43.733097	2018-02-09 18:15:56.278387	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.519365	1
299	It's a Battlefield 287	Next level kale chips offal mlkshk hoodie celiac meh heirloom.	53.8999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:44.661326	2018-02-09 18:15:56.415507	0	book_cover.png	image/png	21149	2017-12-10 22:19:44.45832	1
303	The Waste Land 291	Crucifix viral austin yolo you probably haven't heard of them kickstarter.	59.8299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:19:45.654894	2018-02-09 18:15:56.50519	0	book_cover.png	image/png	21149	2017-12-10 22:19:45.439137	1
307	Consider the Lilies 295	Asymmetrical art party beard lumbersexual 8-bit scenester.	54.4299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:46.619099	2018-02-09 18:15:56.679514	0	book_cover.png	image/png	21149	2017-12-10 22:19:46.365204	1
311	Recalled to Life 299	Intelligentsia phlogiston crucifix 90's blog mixtape.	57.9399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:47.668631	2018-02-09 18:15:56.752129	0	book_cover.png	image/png	21149	2017-12-10 22:19:47.440921	1
314	A Confederacy of Dunces 302	Slow-carb farm-to-table heirloom bespoke iphone selfies five dollar toast.	31.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:48.335887	2018-02-09 18:15:56.892074	0	book_cover.png	image/png	21149	2017-12-10 22:19:48.117489	1
318	Where Angels Fear to Tread 306	Master whatever schlitz retro wayfarers literally knausgaard tilde disrupt.	27.4800000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:49.258797	2018-02-09 18:15:57.123276	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.035521	1
322	Consider Phlebas 310	Single-origin coffee chillwave meh freegan street tumblr taxidermy readymade.	47.2199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:50.162357	2018-02-09 18:15:57.364725	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.948081	1
326	In a Dry Season 314	Roof bushwick fanny pack wolf tofu deep v mlkshk ramps polaroid.	9.85999999999999943	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:51.078915	2018-02-09 18:15:57.600686	0	book_cover.png	image/png	21149	2017-12-10 22:19:50.874405	1
331	Everything is Illuminated 319	Wayfarers umami celiac forage stumptown vhs bespoke sriracha chambray.	43.0300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:52.190682	2018-02-09 18:15:57.823299	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.988872	1
336	Fear and Trembling 324	Xoxo skateboard yr vice fixie neutra shoreditch kitsch mumblecore.	26.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:53.345076	2018-02-09 18:15:58.055073	0	book_cover.png	image/png	21149	2017-12-10 22:19:53.121339	1
339	Gone with the Wind 327	Selvage knausgaard flannel gentrify vinegar wolf swag.	41.3599999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:54.068942	2018-02-09 18:15:58.181639	0	book_cover.png	image/png	21149	2017-12-10 22:19:53.814516	1
342	An Instant In The Wind 330	Fingerstache you probably haven't heard of them gastropub franzen cray tumblr flannel synth brunch.	66	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:19:54.751325	2018-02-09 18:15:58.298749	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.550503	1
346	A Time of Gifts 334	Pour-over kinfolk etsy next level kombucha messenger bag authentic single-origin coffee.	43.8299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:55.662283	2018-02-09 18:15:58.433545	0	book_cover.png	image/png	21149	2017-12-10 22:19:55.440766	1
350	From Here to Eternity 338	Yolo cred aesthetic put a bird on it you probably haven't heard of them.	37.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:56.547329	2018-02-09 18:15:58.651807	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.339459	1
354	Of Human Bondage 342	Kitsch jean shorts put a bird on it fixie brunch fashion axe slow-carb wolf.	40.1799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:57.444458	2018-02-09 18:15:58.78743	0	book_cover.png	image/png	21149	2017-12-10 22:19:57.223097	1
359	The Daffodil Sky 347	Fanny pack art party salvia keytar biodiesel banjo pop-up cardigan.	46.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:19:58.583304	2018-02-09 18:15:58.928157	0	book_cover.png	image/png	21149	2017-12-10 22:19:58.373239	1
363	Mother Night 351	Offal marfa retro godard occupy seitan salvia waistcoat.	18.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:19:59.479511	2018-02-09 18:15:59.059377	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.273356	1
366	Precious Bane 354	Shabby chic bushwick slow-carb hashtag.	33.5700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:00.149307	2018-02-09 18:15:59.145215	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.932398	1
371	Pale Kings and Princes 359	Single-origin coffee aesthetic shabby chic skateboard gentrify.	57.4600000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:01.349497	2018-02-09 18:15:59.25885	0	book_cover.png	image/png	21149	2017-12-10 22:20:01.120151	1
375	The Other Side of Silence 363	Meggings microdosing meh occupy bushwick ethical.	55.3999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:02.285484	2018-02-09 18:15:59.366359	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.072415	1
378	A Scanner Darkly 366	Kinfolk green juice tilde biodiesel pop-up ugh gentrify.	35.0200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:02.964947	2018-02-09 18:15:59.4494	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.759881	1
384	By Grand Central Station I Sat Down and Wept 372	Cardigan beard pop-up green juice.	52.7700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:04.257022	2018-02-09 18:15:59.62796	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.051931	1
388	The Stars' Tennis Balls 376	Kickstarter kogi microdosing vinegar tofu fanny pack 90's.	65.5999999999999943	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:05.15002	2018-02-09 18:15:59.782046	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.936186	1
390	Consider Phlebas 378	Disrupt cliche chillwave single-origin coffee asymmetrical try-hard wolf sartorial freegan.	24.4200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:05.580721	2018-02-09 18:15:59.847253	0	book_cover.png	image/png	21149	2017-12-10 22:20:05.371907	1
391	All Passion Spent 379	Mlkshk gastropub forage selfies quinoa tofu venmo.	62.1000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:05.800346	2018-02-09 18:15:59.8763	0	book_cover.png	image/png	21149	2017-12-10 22:20:05.5905	1
392	The Wives of Bath 380	Post-ironic raw denim swag phlogiston etsy actually squid venmo.	22.4899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:06.046391	2018-02-09 18:15:59.903495	0	book_cover.png	image/png	21149	2017-12-10 22:20:05.808621	1
404	The Sun Also Rises 392	Venmo intelligentsia yr street salvia cred cliche art party.	57.2700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:08.726175	2018-02-09 18:16:00.246554	0	book_cover.png	image/png	21149	2017-12-10 22:20:08.509514	1
408	Dying of the Light 396	Salvia chambray muggle magic cleanse irony kinfolk blue bottle.	27.5899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:09.711715	2018-02-09 18:16:00.342348	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.496856	1
412	His Dark Materials 400	Ethical beard kickstarter waistcoat salvia hella ugh knausgaard plaid.	45.0900000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:10.597678	2018-02-09 18:16:00.446622	0	book_cover.png	image/png	21149	2017-12-10 22:20:10.38159	1
417	Alone on a Wide, Wide Sea 405	Messenger bag quinoa asymmetrical offal.	41.0200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:11.655438	2018-02-09 18:16:00.589991	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.455909	1
418	Vanity Fair 406	Semiotics messenger bag post-ironic forage trust fund.	28.879999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:11.864759	2018-02-09 18:16:00.616734	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.665859	1
424	The Little Foxes 412	Semiotics lumbersexual waistcoat cleanse.	19.0799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:13.171309	2018-02-09 18:16:00.709828	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.965809	1
427	Of Mice and Men 415	Bicycle rights skateboard gastropub cliche ugh taxidermy quinoa blue bottle park.	42.3699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:13.834994	2018-02-09 18:16:00.793857	0	book_cover.png	image/png	21149	2017-12-10 22:20:13.621345	1
431	No Longer at Ease 419	Meggings loko diy authentic.	28.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:14.739206	2018-02-09 18:16:00.955946	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.524622	1
435	The Heart Is a Lonely Hunter 423	Bitters crucifix before they sold out 3 wolf moon yolo humblebrag hammock synth.	49.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:15.613055	2018-02-09 18:16:01.15927	0	book_cover.png	image/png	21149	2017-12-10 22:20:15.406143	1
438	The Sun Also Rises 426	Distillery scenester kickstarter plaid fashion axe cliche put a bird on it.	27.9400000000000013	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:16.308063	2018-02-09 18:16:01.27981	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.075212	1
444	The Needle's Eye 432	Park stumptown kogi pork belly kitsch.	9.00999999999999979	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:17.679484	2018-02-09 18:16:01.485975	0	book_cover.png	image/png	21149	2017-12-10 22:20:17.450385	1
447	The Parliament of Man 435	Swag offal chicharrones bitters fanny pack.	45.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:18.393737	2018-02-09 18:16:01.594211	0	book_cover.png	image/png	21149	2017-12-10 22:20:18.185087	1
451	Now Sleeps the Crimson Petal 439	Roof forage umami tacos tote bag artisan.	26.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:19.328977	2018-02-09 18:16:01.692967	0	book_cover.png	image/png	21149	2017-12-10 22:20:19.111035	1
455	If I Forget Thee Jerusalem 443	Selvage narwhal leggings normcore five dollar toast.	37.0200000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:20.296725	2018-02-09 18:16:01.870361	0	book_cover.png	image/png	21149	2017-12-10 22:20:20.085826	1
651	Infinite Jest 639	Meh cornhole cardigan authentic.	12.8399999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:04.917792	2018-02-09 18:16:02.011765	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.707162	1
462	The Golden Bowl 450	Tacos before they sold out quinoa narwhal.	10.0999999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:21.941508	2018-02-09 18:16:02.167378	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.710887	1
465	What's Become of Waring 453	Tattooed bushwick tote bag microdosing pop-up pug.	51.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:22.622462	2018-02-09 18:16:02.253645	0	book_cover.png	image/png	21149	2017-12-10 22:20:22.399432	1
470	A Glass of Blessings 458	Meggings vinyl franzen carry hammock drinking pickled.	36.2199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:23.71408	2018-02-09 18:16:02.336395	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.50321	1
474	Shall not Perish 462	Raw denim keffiyeh vhs yolo literally.	21.9899999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:24.794979	2018-02-09 18:16:02.43513	0	book_cover.png	image/png	21149	2017-12-10 22:20:24.561587	1
477	Infinite Jest 465	Shabby chic lomo whatever distillery cliche tilde.	37.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:25.48165	2018-02-09 18:16:02.500481	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.263462	1
480	The Mirror Crack'd from Side to Side 468	Semiotics iphone viral tattooed aesthetic schlitz brunch retro.	15.9000000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:26.138722	2018-02-09 18:16:02.583551	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.931033	1
485	Lilies of the Field 473	Shoreditch artisan photo booth trust fund semiotics phlogiston mixtape master.	27.1000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:27.290885	2018-02-09 18:16:02.69968	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.068054	1
490	Fair Stood the Wind for France 478	Cred diy tacos chicharrones 8-bit health jean shorts farm-to-table.	43.9399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:28.383035	2018-02-09 18:16:02.831829	0	book_cover.png	image/png	21149	2017-12-10 22:20:28.176948	1
494	Blood's a Rover 482	Try-hard narwhal gastropub meditation aesthetic.	55.0900000000000034	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:29.278423	2018-02-09 18:16:03.022561	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.054593	1
499	When the Green Woods Laugh 487	Retro intelligentsia listicle semiotics selfies cray.	43.0799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:30.418557	2018-02-09 18:16:03.10347	0	book_cover.png	image/png	21149	2017-12-10 22:20:30.184517	1
503	Let Us Now Praise Famous Men 491	Chia scenester mustache hella neutra 3 wolf moon.	66.7600000000000051	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:31.319893	2018-02-09 18:16:03.306916	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.111377	1
508	The Mermaids Singing 496	Banjo scenester polaroid wolf pbr&b.	31.7899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:32.395782	2018-02-09 18:16:03.41544	0	book_cover.png	image/png	21149	2017-12-10 22:20:32.193965	1
511	No Longer at Ease 499	Photo booth leggings single-origin coffee craft beer distillery.	57.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:33.069822	2018-02-09 18:16:03.49545	0	book_cover.png	image/png	21149	2017-12-10 22:20:32.842801	1
516	This Lime Tree Bower 504	Bushwick meditation beard chartreuse typewriter green juice.	22.2300000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:34.188916	2018-02-09 18:16:03.6803	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.982784	1
519	In Dubious Battle 507	Hella cardigan carry raw denim freegan chartreuse vice.	32.6400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:34.862183	2018-02-09 18:16:03.761447	0	book_cover.png	image/png	21149	2017-12-10 22:20:34.647511	1
524	Some Buried Caesar 512	Hammock wolf actually stumptown taxidermy.	51.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:35.984894	2018-02-09 18:16:03.893872	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.753942	1
528	The Far-Distant Oxus 516	Twee biodiesel sustainable semiotics.	64.2000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:36.889464	2018-02-09 18:16:04.035268	0	book_cover.png	image/png	21149	2017-12-10 22:20:36.672061	1
531	The World, the Flesh and the Devil 519	Lumbersexual retro blue bottle kombucha fingerstache cred.	24.9400000000000013	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:37.674345	2018-02-09 18:16:04.124252	0	book_cover.png	image/png	21149	2017-12-10 22:20:37.466533	1
535	Clouds of Witness 523	Trust fund heirloom bicycle rights salvia flexitarian green juice you probably haven't heard of them.	40.7999999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:38.568636	2018-02-09 18:16:04.268524	0	book_cover.png	image/png	21149	2017-12-10 22:20:38.357042	1
543	Jesting Pilate 531	Gentrify pitchfork cold-pressed pinterest hella distillery schlitz knausgaard.	43.6499999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:40.419483	2018-02-09 18:16:04.526729	0	book_cover.png	image/png	21149	2017-12-10 22:20:40.207488	1
547	Those Barren Leaves, Thrones, Dominations 535	Gastropub yolo umami hella blog keytar deep v raw denim food truck.	48.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:41.288345	2018-02-09 18:16:04.62759	0	book_cover.png	image/png	21149	2017-12-10 22:20:41.078715	1
552	If Not Now, When? 540	Marfa fashion axe hella shoreditch next level microdosing disrupt plaid.	66.4899999999999949	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:42.434492	2018-02-09 18:16:04.78377	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.227085	1
556	A Handful of Dust 544	Hoodie actually tumblr brunch knausgaard cronut chia.	51.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:43.323481	2018-02-09 18:16:04.891039	0	book_cover.png	image/png	21149	2017-12-10 22:20:43.10949	1
560	The Waste Land 548	Craft beer neutra tattooed brunch five dollar toast.	18.2699999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:44.227818	2018-02-09 18:16:05.011571	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.014342	1
563	Have His Carcase 551	Bushwick disrupt swag sartorial green juice literally hoodie microdosing.	65.6500000000000057	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:44.912135	2018-02-09 18:16:05.111736	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.70343	1
567	The Skull Beneath the Skin 555	Freegan tattooed cred fixie.	33.6599999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:45.845327	2018-02-09 18:16:05.376668	0	book_cover.png	image/png	21149	2017-12-10 22:20:45.619166	1
573	Where Angels Fear to Tread 561	Fanny pack asymmetrical actually meggings 8-bit loko schlitz truffaut.	23.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:47.228514	2018-02-09 18:16:05.500396	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.024574	1
577	Mr Standfast 565	Next level sartorial ramps 8-bit yuccie.	65.75	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:48.151217	2018-02-09 18:16:05.64865	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.944048	1
581	Fame Is the Spur 569	Ethical photo booth craft beer wolf keffiyeh pork belly.	38.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:49.023716	2018-02-09 18:16:05.826378	0	book_cover.png	image/png	21149	2017-12-10 22:20:48.809721	1
584	Gone with the Wind 572	Kombucha photo booth yolo retro poutine meggings bespoke 8-bit.	45.1199999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:49.703778	2018-02-09 18:16:05.964963	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.492936	1
589	Jesting Pilate 577	Stumptown taxidermy schlitz listicle.	34.5499999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:50.885153	2018-02-09 18:16:06.09697	0	book_cover.png	image/png	21149	2017-12-10 22:20:50.650952	1
592	A Swiftly Tilting Planet 580	Tofu artisan dreamcatcher distillery you probably haven't heard of them paleo.	38.3100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:51.589702	2018-02-09 18:16:06.208133	0	book_cover.png	image/png	21149	2017-12-10 22:20:51.384806	1
597	To Sail Beyond the Sunset 585	Bespoke fingerstache shabby chic chartreuse church-key fanny pack bitters raw denim.	33.8800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:20:52.732059	2018-02-09 18:16:06.409268	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.501956	1
602	No Country for Old Men 590	Fashion axe tousled irony tilde pbr&b.	18.0599999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:53.827761	2018-02-09 18:16:06.555547	0	book_cover.png	image/png	21149	2017-12-10 22:20:53.625315	1
605	Absalom, Absalom! 593	Waistcoat pabst messenger bag listicle trust fund polaroid flexitarian drinking tilde.	28.7600000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:54.512026	2018-02-09 18:16:06.728984	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.302175	1
610	The Needle's Eye 598	Authentic selfies put a bird on it banh mi twee cardigan.	60.6300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:55.644775	2018-02-09 18:16:06.875499	0	book_cover.png	image/png	21149	2017-12-10 22:20:55.382796	1
615	The Cricket on the Hearth 603	Food truck franzen jean shorts forage poutine butcher pickled five dollar toast.	19.6099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:20:56.804448	2018-02-09 18:16:06.987323	0	book_cover.png	image/png	21149	2017-12-10 22:20:56.569894	1
619	The House of Mirth 607	Twee health listicle tofu distillery try-hard pbr&b art party +1.	68.5400000000000063	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:57.689733	2018-02-09 18:16:07.108569	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.485513	1
624	For Whom the Bell Tolls 612	Butcher semiotics godard loko truffaut mumblecore synth pickled park.	41.8800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:58.803945	2018-02-09 18:16:07.202281	0	book_cover.png	image/png	21149	2017-12-10 22:20:58.600002	1
629	I Know Why the Caged Bird Sings 617	Everyday humblebrag cray bushwick post-ironic drinking.	25.6700000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:20:59.915387	2018-02-09 18:16:07.365663	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.716339	1
632	A Handful of Dust 620	Leggings williamsburg meditation pbr&b twee goth schlitz flannel.	35.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:00.587143	2018-02-09 18:16:07.454789	0	book_cover.png	image/png	21149	2017-12-10 22:21:00.35955	1
636	Waiting for the Barbarians 624	Neutra occupy normcore offal tofu readymade.	66.1200000000000045	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:01.503774	2018-02-09 18:16:07.559387	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.282122	1
640	The Stars' Tennis Balls 628	Food truck tousled ennui messenger bag.	23.7800000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:02.403488	2018-02-09 18:16:07.71701	0	book_cover.png	image/png	21149	2017-12-10 22:21:02.186046	1
645	The Torment of Others 633	Cleanse scenester banh mi venmo hoodie actually wayfarers tote bag.	35.4500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:03.550766	2018-02-09 18:16:07.909538	0	book_cover.png	image/png	21149	2017-12-10 22:21:03.348557	1
649	Ego Dominus Tuus 637	Mlkshk street franzen selvage church-key 90's austin beard pitchfork.	15.4800000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:04.471748	2018-02-09 18:16:08.07839	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.264321	1
653	Look to Windward 641	Tacos banjo yuccie keytar drinking.	36.8500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:05.384299	2018-02-09 18:16:08.216352	0	book_cover.png	image/png	21149	2017-12-10 22:21:05.168581	1
657	To a God Unknown 645	Plaid franzen carry kogi.	57.509999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:06.289387	2018-02-09 18:16:08.35649	0	book_cover.png	image/png	21149	2017-12-10 22:21:06.079671	1
662	Death Be Not Proud 650	Craft beer flexitarian messenger bag skateboard hella phlogiston.	32.9299999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:07.471415	2018-02-09 18:16:08.489853	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.257518	1
666	Everything is Illuminated 654	Kogi put a bird on it green juice jean shorts church-key neutra chicharrones helvetica tumblr.	39.4200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:08.378163	2018-02-09 18:16:08.627759	0	book_cover.png	image/png	21149	2017-12-10 22:21:08.180106	1
670	By Grand Central Station I Sat Down and Wept 658	Kickstarter hella cleanse celiac taxidermy.	38.4399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:09.31218	2018-02-09 18:16:08.722644	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.111445	1
675	In Dubious Battle 663	Bicycle rights master biodiesel roof selvage vice dreamcatcher waistcoat.	21.6799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:10.386136	2018-02-09 18:16:08.965176	0	book_cover.png	image/png	21149	2017-12-10 22:21:10.176361	1
678	Lilies of the Field 666	Ennui scenester trust fund +1 single-origin coffee messenger bag street.	10.3900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:11.057447	2018-02-09 18:16:09.091072	0	book_cover.png	image/png	21149	2017-12-10 22:21:10.84259	1
683	The Stars' Tennis Balls 671	Everyday lo-fi authentic normcore gastropub.	42.2199999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:12.177048	2018-02-09 18:16:09.231366	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.969982	1
686	Taming a Sea Horse 674	Kombucha cornhole kickstarter meditation plaid selfies.	9.28999999999999915	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:12.85059	2018-02-09 18:16:09.331153	0	book_cover.png	image/png	21149	2017-12-10 22:21:12.618282	1
729	Blithe Spirit 717	Wes anderson selfies viral kitsch post-ironic lo-fi.	19.5899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:22.410331	2018-02-09 18:16:09.407079	0	book_cover.png	image/png	21149	2017-12-10 22:21:22.189685	1
692	The Line of Beauty 680	Biodiesel park pop-up poutine williamsburg church-key.	58.259999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:14.16721	2018-02-09 18:16:09.43911	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.958086	1
696	To a God Unknown 684	Vinegar godard slow-carb locavore kitsch raw denim.	22.629999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:15.053628	2018-02-09 18:16:09.531191	0	book_cover.png	image/png	21149	2017-12-10 22:21:14.840805	1
701	That Hideous Strength 689	Sustainable gluten-free tattooed cardigan squid bushwick.	16.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:16.17495	2018-02-09 18:16:09.658747	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.968855	1
705	Fair Stood the Wind for France 693	Truffaut wes anderson messenger bag kogi meggings fashion axe.	39.2700000000000031	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:17.063059	2018-02-09 18:16:09.76913	0	book_cover.png	image/png	21149	2017-12-10 22:21:16.848699	1
709	An Instant In The Wind 697	Skateboard banjo microdosing jean shorts disrupt blue bottle banh mi echo.	23.3099999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:17.959565	2018-02-09 18:16:09.892461	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.749892	1
712	The Wind's Twelve Quarters 700	Pabst blue bottle farm-to-table cardigan everyday celiac.	27.5599999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:18.63191	2018-02-09 18:16:10.011282	0	book_cover.png	image/png	21149	2017-12-10 22:21:18.422127	1
717	The Monkey's Raincoat 705	Waistcoat hoodie vinegar chillwave.	27.8500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:19.732345	2018-02-09 18:16:10.163651	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.531261	1
721	Let Us Now Praise Famous Men 709	Cliche flannel single-origin coffee echo +1 chia whatever.	38.7000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:20.59684	2018-02-09 18:16:10.277682	0	book_cover.png	image/png	21149	2017-12-10 22:21:20.394982	1
725	The Road Less Traveled 713	Hashtag distillery pop-up schlitz banh mi salvia vinyl chillwave.	36.8900000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:21.49752	2018-02-09 18:16:10.393679	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.293638	1
732	Beneath the Bleeding 720	Offal phlogiston wes anderson cliche chillwave fixie.	56.2100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:23.090448	2018-02-09 18:16:10.517275	0	book_cover.png	image/png	21149	2017-12-10 22:21:22.885186	1
736	Nectar in a Sieve 724	Put a bird on it semiotics iphone +1 hoodie skateboard readymade.	68.4899999999999949	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:24.025736	2018-02-09 18:16:10.607817	0	book_cover.png	image/png	21149	2017-12-10 22:21:23.811602	1
740	Jacob Have I Loved 728	Chartreuse cliche offal lomo vhs tote bag photo booth.	21.3399999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:24.964521	2018-02-09 18:16:10.796099	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.702729	1
745	Quo Vadis 733	90's distillery mumblecore celiac normcore brooklyn.	8.80000000000000071	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:26.050762	2018-02-09 18:16:10.958255	0	book_cover.png	image/png	21149	2017-12-10 22:21:25.857276	1
748	The Stars' Tennis Balls 736	Street mumblecore try-hard yolo flexitarian vegan.	7.79000000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:26.769723	2018-02-09 18:16:11.027034	0	book_cover.png	image/png	21149	2017-12-10 22:21:26.541125	1
752	Number the Stars 740	Crucifix vhs knausgaard drinking shoreditch godard brooklyn messenger bag.	9.58999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:27.658603	2018-02-09 18:16:11.178006	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.445796	1
756	Many Waters 744	Ennui pinterest tacos ramps pbr&b pork belly messenger bag kinfolk cray.	39	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:28.551349	2018-02-09 18:16:11.255422	0	book_cover.png	image/png	21149	2017-12-10 22:21:28.348433	1
760	All the King's Men 748	Lumbersexual plaid hella locavore park.	20.0899999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:29.495135	2018-02-09 18:16:11.363776	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.285013	1
765	In Death Ground 753	Readymade fixie franzen dreamcatcher.	17.5500000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:30.632259	2018-02-09 18:16:11.515265	0	book_cover.png	image/png	21149	2017-12-10 22:21:30.428309	1
770	The Line of Beauty 758	Pork belly church-key hella goth viral butcher whatever cronut.	14.8300000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:31.82065	2018-02-09 18:16:11.623627	0	book_cover.png	image/png	21149	2017-12-10 22:21:31.574279	1
774	Now Sleeps the Crimson Petal 762	Taxidermy before they sold out umami bushwick kinfolk messenger bag knausgaard.	27.1999999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:32.900608	2018-02-09 18:16:11.779105	0	book_cover.png	image/png	21149	2017-12-10 22:21:32.686162	1
778	A Passage to India 766	Aesthetic kinfolk fashion axe goth cornhole jean shorts selvage +1 locavore.	47.4699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:33.774712	2018-02-09 18:16:12.011441	0	book_cover.png	image/png	21149	2017-12-10 22:21:33.573558	1
784	The Waste Land 772	Portland keffiyeh mumblecore cliche pork belly disrupt.	7.45999999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:35.11877	2018-02-09 18:16:12.11933	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.91105	1
787	If I Forget Thee Jerusalem 775	Vice slow-carb bitters iphone whatever tumblr beard gastropub hashtag.	13.1999999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:35.800978	2018-02-09 18:16:12.267568	0	book_cover.png	image/png	21149	2017-12-10 22:21:35.582709	1
791	A Swiftly Tilting Planet 779	Brunch bespoke bitters messenger bag meggings twee pork belly fixie cold-pressed.	58.9500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:36.71892	2018-02-09 18:16:12.407393	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.488997	1
795	Now Sleeps the Crimson Petal 783	Next level fanny pack ethical kitsch hella meh.	60.2299999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:37.636131	2018-02-09 18:16:12.53509	0	book_cover.png	image/png	21149	2017-12-10 22:21:37.418465	1
801	Waiting for the Barbarians 789	Five dollar toast tilde blue bottle venmo quinoa mustache chartreuse trust fund.	40.0499999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:39.114318	2018-02-09 18:16:12.682252	0	book_cover.png	image/png	21149	2017-12-10 22:21:38.854867	1
805	Pale Kings and Princes 793	Next level five dollar toast kombucha hella mumblecore iphone.	12.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:39.979607	2018-02-09 18:16:12.797207	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.783025	1
808	Far From the Madding Crowd 796	Umami migas marfa put a bird on it small batch raw denim vinyl wayfarers.	47.0499999999999972	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:40.62493	2018-02-09 18:16:12.840902	0	book_cover.png	image/png	21149	2017-12-10 22:21:40.421159	1
812	Dulce et Decorum Est 800	Chia marfa freegan retro kickstarter swag cold-pressed.	61.6300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:41.474166	2018-02-09 18:16:12.959623	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.26346	1
817	To Say Nothing of the Dog 805	Small batch fanny pack fingerstache butcher.	26.6999999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:42.570207	2018-02-09 18:16:13.118518	0	book_cover.png	image/png	21149	2017-12-10 22:21:42.349612	1
821	For Whom the Bell Tolls 809	Yolo cray sriracha small batch.	38.7299999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:43.460032	2018-02-09 18:16:13.263213	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.251342	1
824	The World, the Flesh and the Devil 812	Hashtag blue bottle hoodie jean shorts everyday venmo post-ironic.	51.240000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:44.143055	2018-02-09 18:16:13.369386	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.916776	1
828	A Confederacy of Dunces 816	Hella synth authentic sartorial.	8.98000000000000043	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:45.033793	2018-02-09 18:16:13.543188	0	book_cover.png	image/png	21149	2017-12-10 22:21:44.803286	1
829	Oh! To be in England 817	Narwhal xoxo portland tote bag vinegar.	22.8000000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:45.250913	2018-02-09 18:16:13.570254	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.042622	1
837	Eyeless in Gaza 825	+1 next level small batch fingerstache chicharrones literally iphone church-key carry.	30.9699999999999989	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:47.069526	2018-02-09 18:16:13.771396	0	book_cover.png	image/png	21149	2017-12-10 22:21:46.847714	1
841	The Man Within 829	Fashion axe listicle diy tote bag 90's.	68	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:48.024632	2018-02-09 18:16:13.895325	0	book_cover.png	image/png	21149	2017-12-10 22:21:47.813461	1
845	Everything is Illuminated 833	You probably haven't heard of them keytar normcore scenester vhs cred bespoke pop-up venmo.	56.2299999999999969	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:48.9825	2018-02-09 18:16:13.987391	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.720193	1
851	The Little Foxes 839	Bushwick single-origin coffee flexitarian blog locavore.	46.009999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:50.33252	2018-02-09 18:16:14.135526	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.115111	1
855	Paths of Glory 843	Fashion axe cray chartreuse hoodie try-hard.	16.5199999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:51.207405	2018-02-09 18:16:14.304026	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.99042	1
858	Wildfire at Midnight 846	Heirloom wolf vice selfies slow-carb pbr&b xoxo lumbersexual.	62.7100000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:51.835596	2018-02-09 18:16:14.41762	0	book_cover.png	image/png	21149	2017-12-10 22:21:51.632125	1
862	The Way Through the Woods 850	Chia loko blog vice craft beer wolf sartorial pork belly.	42.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:52.698759	2018-02-09 18:16:14.503497	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.493953	1
866	The Mermaids Singing 854	Food truck pitchfork thundercats keffiyeh.	14.5999999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:53.560267	2018-02-09 18:16:14.648645	0	book_cover.png	image/png	21149	2017-12-10 22:21:53.356256	1
871	The Widening Gyre 859	Master thundercats jean shorts plaid iphone keffiyeh shoreditch pickled celiac.	32.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:21:54.634738	2018-02-09 18:16:14.766988	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.422718	1
875	Specimen Days 863	Quinoa irony meh 3 wolf moon literally lumbersexual five dollar toast synth shabby chic.	69.1200000000000045	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:21:55.498009	2018-02-09 18:16:14.85773	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.286256	1
879	The Last Enemy 867	Pbr&b hammock austin disrupt.	33.8999999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:56.33708	2018-02-09 18:16:14.987483	0	book_cover.png	image/png	21149	2017-12-10 22:21:56.127204	1
884	Those Barren Leaves, Thrones, Dominations 872	Actually occupy 90's franzen vinegar distillery waistcoat slow-carb.	54.1799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:57.433723	2018-02-09 18:16:15.09883	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.224183	1
888	The Moon by Night 876	Pabst trust fund yuccie venmo pop-up selfies biodiesel kogi.	39.1300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:58.301537	2018-02-09 18:16:15.21598	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.103487	1
893	Let Us Now Praise Famous Men 881	Ugh 8-bit offal taxidermy meggings blue bottle williamsburg.	28.4499999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:21:59.366044	2018-02-09 18:16:15.361728	0	book_cover.png	image/png	21149	2017-12-10 22:21:59.171143	1
897	The Heart Is a Lonely Hunter 885	Flannel intelligentsia seitan actually venmo raw denim vice portland cornhole.	18.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:00.226754	2018-02-09 18:16:15.475226	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.023492	1
901	In a Dry Season 889	Lomo godard helvetica scenester mumblecore.	17.379999999999999	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:01.081196	2018-02-09 18:16:15.599394	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.88352	1
904	Butter In a Lordly Dish 892	Vinyl vinegar raw denim locavore polaroid squid leggings.	68.6400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:01.711033	2018-02-09 18:16:15.68325	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.511156	1
909	East of Eden 897	Wolf marfa next level xoxo.	23.0300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:02.81042	2018-02-09 18:16:15.884841	0	book_cover.png	image/png	21149	2017-12-10 22:22:02.588194	1
913	All Passion Spent 901	Hammock chambray five dollar toast post-ironic seitan loko.	54.8800000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:03.70592	2018-02-09 18:16:15.956629	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.477079	1
917	An Evil Cradling 905	Chambray occupy semiotics deep v.	59.759999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:04.596305	2018-02-09 18:16:16.050908	0	book_cover.png	image/png	21149	2017-12-10 22:22:04.39507	1
920	All the King's Men 908	Cliche synth lomo sartorial forage.	59.509999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:05.286602	2018-02-09 18:16:16.150046	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.070191	1
923	The Soldier's Art 911	Listicle mlkshk cliche microdosing portland.	14.0199999999999996	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:05.968085	2018-02-09 18:16:16.182754	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.763477	1
927	The Way of All Flesh 915	Cleanse schlitz occupy salvia polaroid microdosing pour-over ugh.	52.5700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:06.856908	2018-02-09 18:16:16.297469	0	book_cover.png	image/png	21149	2017-12-10 22:22:06.66064	1
930	The Mermaids Singing 918	Vegan keytar poutine dreamcatcher ennui actually distillery heirloom mustache.	8.41000000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:07.542696	2018-02-09 18:16:16.390555	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.312159	1
935	The Man Within 923	Mlkshk crucifix health sartorial freegan humblebrag locavore fashion axe distillery.	20.7899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:08.664762	2018-02-09 18:16:16.535744	0	book_cover.png	image/png	21149	2017-12-10 22:22:08.440083	1
939	Look to Windward 927	Hammock franzen distillery food truck cred.	7.46999999999999975	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:09.590572	2018-02-09 18:16:16.6891	0	book_cover.png	image/png	21149	2017-12-10 22:22:09.388307	1
942	Dance Dance Dance 930	Marfa master helvetica ramps banjo keytar raw denim hella shabby chic.	12.9499999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:10.258877	2018-02-09 18:16:16.780014	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.041666	1
947	The Lathe of Heaven 935	Selfies forage vhs biodiesel distillery keytar farm-to-table scenester tattooed.	19.370000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:11.365484	2018-02-09 18:16:16.871261	0	book_cover.png	image/png	21149	2017-12-10 22:22:11.155012	1
951	Ring of Bright Water 939	Everyday asymmetrical knausgaard tousled keytar chambray kickstarter.	67.9200000000000017	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:12.236539	2018-02-09 18:16:16.951507	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.036805	1
955	Down to a Sunless Sea 943	Synth paleo organic bespoke tousled sriracha iphone meditation.	11.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:22:13.127625	2018-02-09 18:16:17.050885	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.926691	1
961	Nine Coaches Waiting 949	Diy jean shorts sartorial kickstarter slow-carb you probably haven't heard of them shabby chic deep v skateboard.	29.1900000000000013	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:22:14.452277	2018-02-09 18:16:17.172058	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.243252	1
966	All Passion Spent 954	Wayfarers selfies farm-to-table cronut mumblecore kitsch crucifix umami raw denim.	43.6400000000000006	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:15.546964	2018-02-09 18:16:17.299106	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.353883	1
971	The Moving Finger 959	8-bit banjo synth mustache tacos stumptown artisan.	62.8699999999999974	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:16.615336	2018-02-09 18:16:17.424557	0	book_cover.png	image/png	21149	2017-12-10 22:22:16.411284	1
975	The Moving Finger 963	Paleo trust fund blog literally you probably haven't heard of them artisan fanny pack.	21.620000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:17.464598	2018-02-09 18:16:17.49513	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.262935	1
980	Those Barren Leaves, Thrones, Dominations 968	Mlkshk hella mumblecore wolf.	19.5399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:18.551715	2018-02-09 18:16:17.614049	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.357259	1
983	When the Green Woods Laugh 971	Green juice yolo diy semiotics muggle magic vice fingerstache sartorial.	10.6799999999999997	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:19.192353	2018-02-09 18:16:17.728696	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.993807	1
987	Arms and the Man 975	Seitan jean shorts five dollar toast cred portland.	30.1999999999999993	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:22:20.11321	2018-02-09 18:16:17.913343	0	book_cover.png	image/png	21149	2017-12-10 22:22:19.884356	1
992	Everything is Illuminated 980	Distillery banh mi goth tattooed street cred.	16.0500000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:21.295223	2018-02-09 18:16:18.071699	0	book_cover.png	image/png	21149	2017-12-10 22:22:21.085492	1
995	The Wings of the Dove 983	Tofu hammock church-key selvage fixie truffaut chicharrones kombucha asymmetrical.	20.1900000000000013	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:22:22.003441	2018-02-09 18:16:18.183699	0	book_cover.png	image/png	21149	2017-12-10 22:22:21.767071	1
2	Time To Murder And Create	Gluten-free yr keytar knausgaard vhs pour-over blue bottle tattooed.	59.990000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:35.251835	2018-02-09 18:16:18.263629	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.041817	1
44	In Dubious Battle 32	Meggings fashion axe hella shoreditch crucifix banh mi muggle magic sartorial neutra.	69.5799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:18:44.963689	2018-02-09 18:16:18.347033	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.745583	1
103	Frequent Hearses 91	Truffaut ethical cardigan post-ironic carry.	56.3200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	2	2017-12-10 22:18:58.177778	2018-02-09 18:16:18.486138	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.979125	1
154	The Yellow Meads of Asphodel 142	Paleo marfa asymmetrical wayfarers crucifix literally beard everyday heirloom.	12.1199999999999992	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:19:10.319987	2018-02-09 18:16:18.571433	0	book_cover.png	image/png	21149	2017-12-10 22:19:10.053222	1
195	Rosemary Sutcliff 183	Raw denim tofu kogi irony chillwave crucifix park you probably haven't heard of them ramps.	58.5700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:19.578516	2018-02-09 18:16:18.719254	0	book_cover.png	image/png	21149	2017-12-10 22:19:19.367845	1
999	All the King's Men 987	Poutine gluten-free kombucha kogi letterpress gentrify chartreuse cold-pressed blog.	34.3500000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:22:22.869794	2018-02-09 18:16:18.871782	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.674239	1
1003	The Yellow Meads of Asphodel 991	Wayfarers everyday blue bottle brooklyn freegan.	42.1099999999999994	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:22:23.751356	2018-02-09 18:16:18.99141	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.534603	1
1007	An Instant In The Wind 995	Intelligentsia meditation knausgaard irony.	41.2000000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:24.621882	2018-02-09 18:16:19.07948	0	book_cover.png	image/png	21149	2017-12-10 22:22:24.412419	1
1010	The Yellow Meads of Asphodel 998	Five dollar toast mustache helvetica kinfolk hashtag meggings scenester.	17.5700000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:25.279286	2018-02-09 18:16:19.151644	0	book_cover.png	image/png	21149	2017-12-10 22:22:25.07946	1
263	By Grand Central Station I Sat Down and Wept 251	Truffaut umami craft beer wes anderson neutra whatever crucifix fingerstache single-origin coffee.	61.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:36.068983	2018-02-09 18:16:19.206419	0	book_cover.png	image/png	21149	2017-12-10 22:19:35.716014	1
308	Vanity Fair 296	Twee scenester mixtape pork belly beard shoreditch keytar.	42.5399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:19:46.907302	2018-02-09 18:16:19.281124	0	book_cover.png	image/png	21149	2017-12-10 22:19:46.632733	1
345	Little Hands Clapping 333	Direct trade umami put a bird on it roof vinyl humblebrag williamsburg migas.	35.4099999999999966	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:19:55.428649	2018-02-09 18:16:19.368476	0	book_cover.png	image/png	21149	2017-12-10 22:19:55.216059	1
386	The Way of All Flesh 374	Kombucha venmo 90's post-ironic try-hard flannel banjo schlitz fashion axe.	7.15000000000000036	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	7	2017-12-10 22:20:04.699283	2018-02-09 18:16:19.427752	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.499645	1
443	Down to a Sunless Sea 431	Before they sold out dreamcatcher celiac pinterest retro shabby chic chillwave squid 3 wolf moon.	53.509999999999998	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:20:17.438451	2018-02-09 18:16:19.490713	0	book_cover.png	image/png	21149	2017-12-10 22:20:17.234038	1
506	No Highway 494	Before they sold out yuccie celiac twee pickled flannel pabst carry street.	11.8200000000000003	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:20:31.95713	2018-02-09 18:16:19.579453	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.753875	1
542	Blue Remembered Earth 530	Ethical you probably haven't heard of them aesthetic pour-over shabby chic chicharrones bushwick scenester.	22.7600000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:20:40.198227	2018-02-09 18:16:19.660107	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.992698	1
613	No Country for Old Men 601	Lomo fanny pack selfies echo cray pickled diy microdosing stumptown.	66.5699999999999932	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	3	2017-12-10 22:20:56.321257	2018-02-09 18:16:19.789466	0	book_cover.png	image/png	21149	2017-12-10 22:20:56.115183	1
652	The Violent Bear It Away 640	Art party farm-to-table health meh readymade kitsch trust fund normcore sustainable.	63.5300000000000011	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:21:05.155309	2018-02-09 18:16:19.845926	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.931352	1
659	Far From the Madding Crowd 647	Distillery sartorial letterpress flexitarian ramps plaid 90's neutra slow-carb.	14.6899999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:21:06.76675	2018-02-09 18:16:19.903203	0	book_cover.png	image/png	21149	2017-12-10 22:21:06.543523	1
719	Brandy of the Damned 707	Pabst chillwave 3 wolf moon chambray polaroid dreamcatcher godard.	65.5600000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	5	2017-12-10 22:21:20.162968	2018-02-09 18:16:19.975165	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.966307	1
783	When the Green Woods Laugh 771	Humblebrag vinegar leggings cronut.	44.6300000000000026	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	8	2017-12-10 22:21:34.898853	2018-02-09 18:16:20.135383	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.686265	1
814	The Violent Bear It Away 802	Truffaut actually squid kale chips humblebrag irony hashtag pinterest xoxo.	19.4100000000000001	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:41.907522	2018-02-09 18:16:20.227379	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.6985	1
870	Eyeless in Gaza 858	Vinegar pabst heirloom austin tattooed mustache etsy fanny pack neutra.	21.5599999999999987	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	4	2017-12-10 22:21:54.408526	2018-02-09 18:16:20.359562	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.21266	1
921	No Highway 909	Squid mixtape typewriter pickled wes anderson pork belly knausgaard.	14.1899999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	6	2017-12-10 22:22:05.508896	2018-02-09 18:16:20.455464	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.299298	1
974	Great Work of Time 962	Celiac pinterest chicharrones iphone cronut drinking.	18.2899999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png	1	2017-12-10 22:22:17.254214	2018-02-09 18:16:20.548211	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.054009	1
1012	white Flute	["Etsy cred normcore plaid yolo.", "Mumblecore actually poutine dreamcatcher retro bicycle rights sustainable xoxo."]	732.360000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518479957/wzcbhniq6wh9rhiqbyzn.jpg	12	2018-02-13 02:13:37.123751	2018-02-13 02:13:37.123751	0	\N	\N	\N	\N	3
1013	yellow Guitar	["Microdosing readymade photo booth selvage wayfarers.", "Actually narwhal sustainable flexitarian."]	156.860000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 02:13:37.132356	2018-02-13 02:13:37.132356	0	\N	\N	\N	\N	2
1014	white Drum Set	["Tilde irony echo everyday twee thundercats.", "Chambray gentrify typewriter."]	511.620000000000005	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg	10	2018-02-13 02:13:37.145942	2018-02-13 02:13:37.145942	0	\N	\N	\N	\N	3
1015	olive Trumpet	["Direct trade kinfolk meditation butcher sriracha hoodie vegan cliche.", "Plaid slow-carb art party ethical kickstarter."]	730.5	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 02:13:37.159685	2018-02-13 02:13:37.159685	0	\N	\N	\N	\N	3
1016	pink Flute	["Blue bottle bespoke pour-over yolo.", "Pop-up 90's kombucha jean shorts vinyl microdosing taxidermy."]	50	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518479957/wzcbhniq6wh9rhiqbyzn.jpg	12	2018-02-13 02:13:37.165182	2018-02-13 02:13:37.165182	0	\N	\N	\N	\N	4
1017	lime Guitar	["Celiac pitchfork muggle magic ennui cold-pressed.", "Whatever wes anderson taxidermy pickled thundercats chartreuse."]	843.080000000000041	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 02:13:37.171371	2018-02-13 02:13:37.171371	0	\N	\N	\N	\N	4
1018	magenta Drum Set	["Park bitters vhs fingerstache dreamcatcher.", "Chillwave fashion axe sriracha mlkshk locavore xoxo whatever."]	471.970000000000027	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg	10	2018-02-13 02:13:37.176823	2018-02-13 02:13:37.176823	0	\N	\N	\N	\N	3
1019	black Trumpet	["Crucifix freegan diy messenger bag you probably haven't heard of them hammock sriracha carry.", "Farm-to-table pinterest direct trade."]	761.769999999999982	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 02:13:37.18211	2018-02-13 02:13:37.18211	0	\N	\N	\N	\N	4
1020	orange Flute	["Meditation pbr&b pork belly selfies yolo seitan diy scenester.", "Ennui art party kinfolk crucifix umami."]	212.629999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518479957/wzcbhniq6wh9rhiqbyzn.jpg	12	2018-02-13 02:13:37.187652	2018-02-13 02:13:37.187652	0	\N	\N	\N	\N	3
1021	maroon Guitar	["Wolf normcore sartorial.", "Pickled tacos food truck everyday."]	312.360000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 02:13:37.193004	2018-02-13 02:13:37.193004	0	\N	\N	\N	\N	3
1022	gold Drum Set	["Pickled normcore tilde yuccie kitsch flexitarian taxidermy seitan.", "Drinking neutra 90's flexitarian."]	411.879999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg	10	2018-02-13 02:13:37.198615	2018-02-13 02:13:37.198615	0	\N	\N	\N	\N	4
1023	azure Trumpet	["Thundercats disrupt diy.", "Lumbersexual flexitarian cardigan letterpress neutra pitchfork."]	325.470000000000027	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 02:13:37.203735	2018-02-13 02:13:37.203735	0	\N	\N	\N	\N	4
1024	white Guitar	["Ennui celiac phlogiston gluten-free wayfarers beard literally.", "Pour-over meditation brooklyn vhs authentic xoxo craft beer."]	778.07000000000005	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 02:13:37.213851	2018-02-13 02:13:37.213851	0	\N	\N	\N	\N	4
1025	pink Drum Set	["Austin raw denim mixtape biodiesel pabst.", "Chartreuse distillery ramps."]	630.580000000000041	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg	10	2018-02-13 02:13:37.218802	2018-02-13 02:13:37.218802	0	\N	\N	\N	\N	3
1026	grey Trumpet	["Pinterest banjo mlkshk.", "Cliche sustainable blog sriracha post-ironic organic."]	728.379999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 02:13:37.223593	2018-02-13 02:13:37.223593	0	\N	\N	\N	\N	2
1027	black Flute	["Yuccie beard narwhal taxidermy carry flannel knausgaard 90's.", "Flannel fanny pack ethical 8-bit mixtape tousled intelligentsia sartorial."]	527.230000000000018	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518479957/wzcbhniq6wh9rhiqbyzn.jpg	12	2018-02-13 02:13:37.229051	2018-02-13 02:13:37.229051	0	\N	\N	\N	\N	4
1028	azure Guitar	["Vegan photo booth single-origin coffee health cliche.", "90's bicycle rights ethical pbr&b single-origin coffee chia salvia distillery."]	960.990000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 02:13:37.234468	2018-02-13 02:13:37.234468	0	\N	\N	\N	\N	3
1029	orange Drum Set	["Selfies pork belly 8-bit banjo.", "Organic master quinoa cold-pressed five dollar toast neutra cornhole."]	923.450000000000045	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg	10	2018-02-13 02:13:37.239289	2018-02-13 02:13:37.239289	0	\N	\N	\N	\N	2
1030	magenta Trumpet	["Locavore sartorial fixie twee small batch meditation readymade synth.", "Pbr&b williamsburg 8-bit taxidermy health raw denim."]	290.930000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 02:13:37.244736	2018-02-13 02:13:37.244736	0	\N	\N	\N	\N	4
1031	Now That's What I Call Jazz 0	["Forage occupy marfa five dollar toast.", "Freegan shabby chic health mlkshk quinoa green juice."]	832.25	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	13	2018-02-13 02:13:37.250471	2018-02-13 02:13:37.250471	0	\N	\N	\N	\N	3
1032	Now That's What I Call Classic Rock 0	["Cardigan pork belly intelligentsia tote bag.", "Dreamcatcher pour-over fixie salvia."]	402.560000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	14	2018-02-13 02:13:37.255669	2018-02-13 02:13:37.255669	0	\N	\N	\N	\N	3
1033	Now That's What I Call Punk Rock 0	["Taxidermy you probably haven't heard of them phlogiston.", "Trust fund salvia stumptown twee yolo hoodie shabby chic franzen."]	591.080000000000041	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	15	2018-02-13 02:13:37.26189	2018-02-13 02:13:37.26189	0	\N	\N	\N	\N	2
1034	Now That's What I Call Hip Hop 0	["Mustache selvage freegan cliche kickstarter.", "Bespoke fanny pack marfa ethical fixie."]	557.850000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	16	2018-02-13 02:13:37.267543	2018-02-13 02:13:37.267543	0	\N	\N	\N	\N	2
1035	Now That's What I Call Funk 0	["Slow-carb messenger bag vice chia pickled pitchfork salvia.", "Austin cornhole organic asymmetrical hashtag tofu literally."]	97.4500000000000028	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	17	2018-02-13 02:13:37.273152	2018-02-13 02:13:37.273152	0	\N	\N	\N	\N	3
1036	Now That's What I Call Jazz 1	["Taxidermy photo booth meh banjo selvage tousled forage small batch.", "Pour-over seitan pbr&b wes anderson chartreuse polaroid literally salvia."]	26.7399999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	13	2018-02-13 02:13:37.278823	2018-02-13 02:13:37.278823	0	\N	\N	\N	\N	2
1037	Now That's What I Call Classic Rock 1	["Tilde keffiyeh chia.", "Polaroid crucifix everyday pabst."]	543.039999999999964	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	14	2018-02-13 02:13:37.284005	2018-02-13 02:13:37.284005	0	\N	\N	\N	\N	2
1038	Now That's What I Call Punk Rock 1	["Yolo pug semiotics neutra.", "Neutra schlitz hella."]	56.5799999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	15	2018-02-13 02:13:37.289021	2018-02-13 02:13:37.289021	0	\N	\N	\N	\N	2
1039	Now That's What I Call Hip Hop 1	["Church-key five dollar toast heirloom trust fund.", "Fanny pack try-hard helvetica umami chia."]	497.399999999999977	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	16	2018-02-13 02:13:37.294091	2018-02-13 02:13:37.294091	0	\N	\N	\N	\N	2
1040	Now That's What I Call Funk 1	["Sartorial single-origin coffee blue bottle letterpress mustache.", "Messenger bag irony artisan ennui fashion axe polaroid synth etsy."]	801.309999999999945	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	17	2018-02-13 02:13:37.299073	2018-02-13 02:13:37.299073	0	\N	\N	\N	\N	4
1041	Now That's What I Call Jazz 2	["Direct trade banh mi pitchfork xoxo messenger bag.", "Tousled wes anderson five dollar toast gastropub vinyl irony carry."]	969.330000000000041	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	13	2018-02-13 02:13:37.304881	2018-02-13 02:13:37.304881	0	\N	\N	\N	\N	2
1042	Now That's What I Call Classic Rock 2	["Twee vhs offal.", "Schlitz selvage carry dreamcatcher."]	529	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	14	2018-02-13 02:13:37.311212	2018-02-13 02:13:37.311212	0	\N	\N	\N	\N	3
1043	Now That's What I Call Punk Rock 2	["Seitan intelligentsia typewriter tote bag echo aesthetic.", "Put a bird on it dreamcatcher etsy loko meh portland."]	643.200000000000045	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	15	2018-02-13 02:13:37.317121	2018-02-13 02:13:37.317121	0	\N	\N	\N	\N	4
1044	Now That's What I Call Hip Hop 2	["Lo-fi kitsch retro paleo.", "Muggle magic brunch marfa ugh wes anderson skateboard kitsch."]	566.990000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	16	2018-02-13 02:13:37.322214	2018-02-13 02:13:37.322214	0	\N	\N	\N	\N	4
1045	Now That's What I Call Funk 2	["Tousled roof mixtape vinyl trust fund disrupt asymmetrical.", "Intelligentsia taxidermy cray echo yolo."]	710.019999999999982	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	17	2018-02-13 02:13:37.327476	2018-02-13 02:13:37.327476	0	\N	\N	\N	\N	2
1046	Now That's What I Call Jazz 3	["Fanny pack meditation five dollar toast.", "Portland hoodie retro authentic tacos meditation heirloom."]	946.509999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	13	2018-02-13 02:13:37.333122	2018-02-13 02:13:37.333122	0	\N	\N	\N	\N	4
1047	Now That's What I Call Classic Rock 3	["Brunch stumptown goth austin typewriter brooklyn retro.", "Banjo brooklyn single-origin coffee."]	956.379999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	14	2018-02-13 02:13:37.338859	2018-02-13 02:13:37.338859	0	\N	\N	\N	\N	4
1048	Now That's What I Call Punk Rock 3	["Semiotics meh blog muggle magic selvage carry humblebrag.", "Photo booth goth hoodie mixtape."]	542.080000000000041	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	15	2018-02-13 02:13:37.344022	2018-02-13 02:13:37.344022	0	\N	\N	\N	\N	4
1049	Now That's What I Call Hip Hop 3	["Sartorial 8-bit franzen you probably haven't heard of them yolo muggle magic cray.", "Brooklyn chartreuse shoreditch swag microdosing godard chia."]	839.610000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	16	2018-02-13 02:13:37.349822	2018-02-13 02:13:37.349822	0	\N	\N	\N	\N	3
1050	Now That's What I Call Funk 3	["Cliche fingerstache forage tofu thundercats organic.", "Schlitz mixtape whatever pabst photo booth bicycle rights."]	700.039999999999964	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	17	2018-02-13 02:13:37.355101	2018-02-13 02:13:37.355101	0	\N	\N	\N	\N	3
1051	Now That's What I Call Jazz 4	["+1 freegan flannel messenger bag blue bottle vinyl diy.", "Quinoa normcore flannel."]	837.279999999999973	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	13	2018-02-13 02:13:37.361571	2018-02-13 02:13:37.361571	0	\N	\N	\N	\N	3
1052	Now That's What I Call Classic Rock 4	["Kogi yr mixtape stumptown selfies direct trade disrupt.", "Loko keytar diy beard tilde pabst."]	55.3299999999999983	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	14	2018-02-13 02:13:37.367241	2018-02-13 02:13:37.367241	0	\N	\N	\N	\N	2
1053	Now That's What I Call Punk Rock 4	["Quinoa pop-up single-origin coffee.", "Cold-pressed try-hard craft beer squid fingerstache lo-fi."]	200.310000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	15	2018-02-13 02:13:37.372744	2018-02-13 02:13:37.372744	0	\N	\N	\N	\N	3
1054	Now That's What I Call Hip Hop 4	["Kickstarter viral drinking.", "Freegan try-hard sustainable lumbersexual."]	826.169999999999959	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	16	2018-02-13 02:13:37.377767	2018-02-13 02:13:37.377767	0	\N	\N	\N	\N	2
1055	Now That's What I Call Funk 4	["Health +1 butcher wolf phlogiston iphone.", "Bushwick lomo cred sartorial chicharrones."]	819.330000000000041	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg	17	2018-02-13 02:13:37.382833	2018-02-13 02:13:37.382833	0	\N	\N	\N	\N	3
1056	Big Ass Amp V0	["Goth chia selfies lumbersexual shabby chic cliche.", "Vinyl tacos echo."]	688.92999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480098/pp7rlicexfxovpbl7m0c.jpg	18	2018-02-13 02:13:37.387741	2018-02-13 02:13:37.387741	0	\N	\N	\N	\N	4
1057	Loud F-ing Speakers V0	["Bicycle rights sustainable everyday.", "Distillery schlitz artisan seitan migas salvia."]	987.350000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480123/awel0ebqhuj1civcdzcr.jpg	19	2018-02-13 02:13:37.39286	2018-02-13 02:13:37.39286	0	\N	\N	\N	\N	4
1058	Premium DJ Turntable V0	["Put a bird on it franzen health gluten-free truffaut.", "Mixtape tattooed flannel."]	56	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480148/exhahnivcutz48gpcldp.jpg	20	2018-02-13 02:13:37.398874	2018-02-13 02:13:37.398874	0	\N	\N	\N	\N	2
1059	Justin Beiber Mic 0	["Roof taxidermy gluten-free iphone bitters carry.", "Swag keytar keffiyeh goth authentic iphone kinfolk."]	496.850000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480170/hymq3fyjg9vhggxbmrcs.jpg	21	2018-02-13 02:13:37.403824	2018-02-13 02:13:37.403824	0	\N	\N	\N	\N	2
1060	Big Ass Amp V1	["Microdosing flexitarian actually.", "Chicharrones dreamcatcher taxidermy narwhal trust fund brunch post-ironic seitan."]	929.990000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480098/pp7rlicexfxovpbl7m0c.jpg	18	2018-02-13 02:13:37.409316	2018-02-13 02:13:37.409316	0	\N	\N	\N	\N	2
1061	Loud F-ing Speakers V1	["Pitchfork ugh typewriter.", "Sustainable gentrify schlitz keffiyeh cliche irony master."]	183.060000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480123/awel0ebqhuj1civcdzcr.jpg	19	2018-02-13 02:13:37.414817	2018-02-13 02:13:37.414817	0	\N	\N	\N	\N	2
1062	Premium DJ Turntable V1	["Etsy seitan try-hard biodiesel cliche vice waistcoat.", "Tilde 90's disrupt."]	757.379999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480148/exhahnivcutz48gpcldp.jpg	20	2018-02-13 02:13:37.420274	2018-02-13 02:13:37.420274	0	\N	\N	\N	\N	4
1063	Justin Beiber Mic 1	["Austin brunch keytar chillwave ugh iphone twee flannel.", "Dreamcatcher irony banh mi vegan mustache shabby chic."]	467.769999999999982	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480170/hymq3fyjg9vhggxbmrcs.jpg	21	2018-02-13 02:13:37.425552	2018-02-13 02:13:37.425552	0	\N	\N	\N	\N	2
1064	Big Ass Amp V2	["Helvetica slow-carb retro direct trade whatever vhs phlogiston.", "Schlitz selfies craft beer."]	615.590000000000032	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480098/pp7rlicexfxovpbl7m0c.jpg	18	2018-02-13 02:13:37.431288	2018-02-13 02:13:37.431288	0	\N	\N	\N	\N	4
1065	Loud F-ing Speakers V2	["Health you probably haven't heard of them retro.", "Franzen pbr&b raw denim selfies health synth phlogiston."]	992.480000000000018	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480123/awel0ebqhuj1civcdzcr.jpg	19	2018-02-13 02:13:37.436522	2018-02-13 02:13:37.436522	0	\N	\N	\N	\N	4
1066	Premium DJ Turntable V2	["Wayfarers next level photo booth helvetica migas wolf.", "Actually vinegar pork belly kale chips pinterest biodiesel authentic."]	263.329999999999984	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480148/exhahnivcutz48gpcldp.jpg	20	2018-02-13 02:13:37.441492	2018-02-13 02:13:37.441492	0	\N	\N	\N	\N	3
1067	Justin Beiber Mic 2	["Vegan kogi microdosing brooklyn ugh narwhal.", "Migas helvetica letterpress gluten-free ennui hammock."]	272.860000000000014	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480170/hymq3fyjg9vhggxbmrcs.jpg	21	2018-02-13 02:13:37.446774	2018-02-13 02:13:37.446774	0	\N	\N	\N	\N	2
1068	Big Ass Amp V3	["Bicycle rights bitters biodiesel next level photo booth celiac pitchfork.", "Xoxo ennui pickled 8-bit echo trust fund."]	207.139999999999986	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480098/pp7rlicexfxovpbl7m0c.jpg	18	2018-02-13 02:13:37.453529	2018-02-13 02:13:37.453529	0	\N	\N	\N	\N	3
1069	Loud F-ing Speakers V3	["Meditation drinking hella mustache offal.", "Thundercats irony knausgaard."]	79.480000000000004	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480123/awel0ebqhuj1civcdzcr.jpg	19	2018-02-13 02:13:37.459546	2018-02-13 02:13:37.459546	0	\N	\N	\N	\N	3
1070	Premium DJ Turntable V3	["Viral farm-to-table meggings.", "Offal organic single-origin coffee."]	62	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480148/exhahnivcutz48gpcldp.jpg	20	2018-02-13 02:13:37.465118	2018-02-13 02:13:37.465118	0	\N	\N	\N	\N	3
1071	Justin Beiber Mic 3	["Skateboard synth gluten-free franzen health migas biodiesel.", "Art party locavore kale chips everyday cronut meh 3 wolf moon shabby chic."]	541.200000000000045	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480170/hymq3fyjg9vhggxbmrcs.jpg	21	2018-02-13 02:13:37.470539	2018-02-13 02:13:37.470539	0	\N	\N	\N	\N	2
1072	Big Ass Amp V4	["Fingerstache semiotics bushwick skateboard kinfolk.", "Cred before they sold out try-hard mustache."]	198.330000000000013	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480098/pp7rlicexfxovpbl7m0c.jpg	18	2018-02-13 02:13:37.475283	2018-02-13 02:13:37.475283	0	\N	\N	\N	\N	3
1073	Loud F-ing Speakers V4	["Bitters echo marfa blog gastropub.", "Brooklyn ethical small batch."]	501.560000000000002	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480123/awel0ebqhuj1civcdzcr.jpg	19	2018-02-13 02:13:37.480424	2018-02-13 02:13:37.480424	0	\N	\N	\N	\N	3
1074	Premium DJ Turntable V4	["Ethical heirloom sartorial authentic scenester.", "Etsy keytar yolo brunch."]	398.920000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480148/exhahnivcutz48gpcldp.jpg	20	2018-02-13 02:13:37.485461	2018-02-13 02:13:37.485461	0	\N	\N	\N	\N	4
1075	Justin Beiber Mic 4	["Farm-to-table quinoa biodiesel leggings.", "Salvia banh mi godard narwhal tumblr church-key 3 wolf moon sustainable."]	885.879999999999995	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480170/hymq3fyjg9vhggxbmrcs.jpg	21	2018-02-13 02:13:37.490519	2018-02-13 02:13:37.490519	0	\N	\N	\N	\N	3
1076	olive Flute	["Williamsburg disrupt lomo mlkshk.", "90's actually craft beer forage iphone pabst organic irony."]	137.960000000000008	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518479957/wzcbhniq6wh9rhiqbyzn.jpg	12	2018-02-13 18:56:31.16392	2018-02-13 18:56:31.16392	0	\N	\N	\N	\N	4
1077	silver Guitar	["Truffaut literally photo booth hashtag craft beer vegan irony.", "Ethical meditation forage shoreditch loko."]	602	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 18:56:31.173083	2018-02-13 18:56:31.173083	0	\N	\N	\N	\N	3
1078	mint green Drum Set	["Truffaut quinoa etsy chia pork belly messenger bag sriracha williamsburg.", "Hashtag iphone roof irony vice health art party direct trade."]	747.330000000000041	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg	10	2018-02-13 18:56:31.178993	2018-02-13 18:56:31.178993	0	\N	\N	\N	\N	2
1079	purple Trumpet	["Trust fund flannel quinoa tumblr offal readymade.", "Drinking vinyl mustache typewriter locavore pop-up."]	293.259999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 18:56:31.184659	2018-02-13 18:56:31.184659	0	\N	\N	\N	\N	2
1080	salmon Flute	["Chicharrones pork belly keytar before they sold out vinyl cray.", "Messenger bag selvage kickstarter truffaut."]	452.430000000000007	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518479957/wzcbhniq6wh9rhiqbyzn.jpg	12	2018-02-13 18:56:31.190607	2018-02-13 18:56:31.190607	0	\N	\N	\N	\N	2
1081	olive Guitar	["Fanny pack celiac salvia shoreditch hammock cred locavore.", "Five dollar toast irony iphone."]	51.0399999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 18:56:31.196786	2018-02-13 18:56:31.196786	0	\N	\N	\N	\N	2
1082	purple Drum Set	["Pickled cardigan wolf 3 wolf moon selvage pabst.", "Vinyl direct trade mustache freegan phlogiston kombucha pickled hashtag."]	770.169999999999959	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg	10	2018-02-13 18:56:31.203005	2018-02-13 18:56:31.203005	0	\N	\N	\N	\N	3
1083	yellow Trumpet	["Meh pop-up disrupt austin.", "Celiac gastropub gentrify banh mi chartreuse pinterest."]	501.670000000000016	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 18:56:31.209524	2018-02-13 18:56:31.209524	0	\N	\N	\N	\N	2
1084	plum Guitar	["Tilde kombucha tumblr plaid irony street.", "Letterpress five dollar toast meggings etsy narwhal."]	838.100000000000023	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 18:56:31.223592	2018-02-13 18:56:31.223592	0	\N	\N	\N	\N	2
1085	ivory Drum Set	["Tofu leggings wayfarers keytar.", "Messenger bag bushwick mustache knausgaard."]	441.779999999999973	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg	10	2018-02-13 18:56:31.230671	2018-02-13 18:56:31.230671	0	\N	\N	\N	\N	2
1086	tan Trumpet	["Single-origin coffee yr vinyl knausgaard crucifix carry.", "Cardigan 3 wolf moon cleanse narwhal gluten-free chia green juice."]	836.340000000000032	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 18:56:31.23787	2018-02-13 18:56:31.23787	0	\N	\N	\N	\N	4
1087	teal Flute	["Food truck etsy fixie.", "Portland typewriter green juice fingerstache."]	726.620000000000005	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518479957/wzcbhniq6wh9rhiqbyzn.jpg	12	2018-02-13 18:56:31.244663	2018-02-13 18:56:31.244663	0	\N	\N	\N	\N	2
1088	turquoise Guitar	["Tattooed neutra you probably haven't heard of them occupy plaid pour-over flannel diy.", "Mumblecore xoxo mixtape truffaut wayfarers waistcoat yuccie."]	554.700000000000045	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 18:56:31.251836	2018-02-13 18:56:31.251836	0	\N	\N	\N	\N	3
1089	pink Trumpet	["Scenester biodiesel bushwick.", "Vinegar bespoke lumbersexual umami mumblecore 90's."]	869.009999999999991	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 18:56:31.263994	2018-02-13 18:56:31.263994	0	\N	\N	\N	\N	2
1090	violet Flute	["Pork belly deep v crucifix vinegar.", "Mixtape 90's yuccie art party."]	975.82000000000005	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518479957/wzcbhniq6wh9rhiqbyzn.jpg	12	2018-02-13 18:56:31.271787	2018-02-13 18:56:31.271787	0	\N	\N	\N	\N	4
1091	salmon Guitar	["Tousled pop-up brunch shoreditch.", "Shabby chic carry neutra cronut vice."]	364.740000000000009	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg	9	2018-02-13 18:56:31.278373	2018-02-13 18:56:31.278373	0	\N	\N	\N	\N	3
1092	grey Drum Set	["Viral ennui loko.", "Chambray try-hard retro."]	964.080000000000041	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg	10	2018-02-13 18:56:31.28486	2018-02-13 18:56:31.28486	0	\N	\N	\N	\N	2
1093	salmon Trumpet	["Farm-to-table pinterest chicharrones.", "Paleo sartorial twee ethical."]	981.440000000000055	http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg	11	2018-02-13 18:56:31.292139	2018-02-13 18:56:31.292139	0	\N	\N	\N	\N	4
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY order_items (id, item_id, order_id, created_at, updated_at, quantity) FROM stdin;
1	141	1	2017-12-10 22:22:25.656803	2017-12-10 22:22:25.656803	3
2	734	2	2017-12-10 22:22:25.672759	2017-12-10 22:22:25.672759	1
3	387	3	2017-12-10 22:22:25.684212	2017-12-10 22:22:25.684212	3
4	933	4	2017-12-10 22:22:25.696179	2017-12-10 22:22:25.696179	4
5	834	5	2017-12-10 22:22:25.706067	2017-12-10 22:22:25.706067	2
6	331	6	2017-12-10 22:22:25.719045	2017-12-10 22:22:25.719045	4
7	580	7	2017-12-10 22:22:25.730781	2017-12-10 22:22:25.730781	1
8	331	8	2017-12-10 22:22:25.742264	2017-12-10 22:22:25.742264	4
9	336	9	2017-12-10 22:22:25.753373	2017-12-10 22:22:25.753373	4
10	410	10	2017-12-10 22:22:25.76665	2017-12-10 22:22:25.76665	2
11	805	11	2017-12-10 22:22:25.785026	2017-12-10 22:22:25.785026	2
12	126	12	2017-12-10 22:22:25.798145	2017-12-10 22:22:25.798145	4
13	571	13	2017-12-10 22:22:25.809022	2017-12-10 22:22:25.809022	3
14	110	14	2017-12-10 22:22:25.819534	2017-12-10 22:22:25.819534	3
15	276	15	2017-12-10 22:22:25.832219	2017-12-10 22:22:25.832219	3
16	822	16	2017-12-10 22:22:25.847729	2017-12-10 22:22:25.847729	4
17	213	17	2017-12-10 22:22:25.861398	2017-12-10 22:22:25.861398	2
18	223	18	2017-12-10 22:22:25.872855	2017-12-10 22:22:25.872855	2
19	179	19	2017-12-10 22:22:25.882481	2017-12-10 22:22:25.882481	1
20	850	20	2017-12-10 22:22:25.899367	2017-12-10 22:22:25.899367	2
21	757	21	2017-12-10 22:22:25.911992	2017-12-10 22:22:25.911992	2
22	556	22	2017-12-10 22:22:25.923394	2017-12-10 22:22:25.923394	5
23	842	23	2017-12-10 22:22:25.936383	2017-12-10 22:22:25.936383	5
24	327	24	2017-12-10 22:22:25.951404	2017-12-10 22:22:25.951404	2
25	171	25	2017-12-10 22:22:25.963797	2017-12-10 22:22:25.963797	5
26	603	26	2017-12-10 22:22:25.975872	2017-12-10 22:22:25.975872	5
27	380	27	2017-12-10 22:22:25.984987	2017-12-10 22:22:25.984987	2
28	214	28	2017-12-10 22:22:25.998446	2017-12-10 22:22:25.998446	5
29	28	29	2017-12-10 22:22:26.011397	2017-12-10 22:22:26.011397	3
30	604	30	2017-12-10 22:22:26.023184	2017-12-10 22:22:26.023184	5
31	647	31	2017-12-10 22:22:26.036487	2017-12-10 22:22:26.036487	2
32	179	32	2017-12-10 22:22:26.050796	2017-12-10 22:22:26.050796	2
33	507	33	2017-12-10 22:22:26.063777	2017-12-10 22:22:26.063777	4
34	991	34	2017-12-10 22:22:26.076611	2017-12-10 22:22:26.076611	5
35	421	35	2017-12-10 22:22:26.08933	2017-12-10 22:22:26.08933	5
36	477	36	2017-12-10 22:22:26.102691	2017-12-10 22:22:26.102691	3
37	106	37	2017-12-10 22:22:26.117253	2017-12-10 22:22:26.117253	1
38	784	38	2017-12-10 22:22:26.134664	2017-12-10 22:22:26.134664	5
39	233	39	2017-12-10 22:22:26.150423	2017-12-10 22:22:26.150423	3
40	286	40	2017-12-10 22:22:26.163151	2017-12-10 22:22:26.163151	5
41	965	41	2017-12-10 22:22:26.172027	2017-12-10 22:22:26.172027	1
42	849	42	2017-12-10 22:22:26.185345	2017-12-10 22:22:26.185345	1
43	904	43	2017-12-10 22:22:26.198201	2017-12-10 22:22:26.198201	4
44	248	44	2017-12-10 22:22:26.210356	2017-12-10 22:22:26.210356	2
45	268	45	2017-12-10 22:22:26.219851	2017-12-10 22:22:26.219851	2
46	632	46	2017-12-10 22:22:26.23344	2017-12-10 22:22:26.23344	2
47	669	47	2017-12-10 22:22:26.246899	2017-12-10 22:22:26.246899	5
48	915	48	2017-12-10 22:22:26.26032	2017-12-10 22:22:26.26032	2
49	123	49	2017-12-10 22:22:26.272341	2017-12-10 22:22:26.272341	2
50	474	50	2017-12-10 22:22:26.284562	2017-12-10 22:22:26.284562	3
51	187	51	2017-12-10 22:22:26.300372	2017-12-10 22:22:26.300372	4
52	521	52	2017-12-10 22:22:26.314952	2017-12-10 22:22:26.314952	1
53	566	53	2017-12-10 22:22:26.329128	2017-12-10 22:22:26.329128	3
54	410	54	2017-12-10 22:22:26.341476	2017-12-10 22:22:26.341476	1
55	4	55	2017-12-10 22:22:26.36323	2017-12-10 22:22:26.36323	2
56	6	55	2017-12-10 22:22:26.364546	2017-12-10 22:22:26.364546	7
57	1077	56	2018-02-15 18:52:24.576916	2018-02-15 18:52:24.588103	1
58	1031	57	2018-02-15 18:57:08.413191	2018-02-15 18:57:08.429261	1
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY orders (id, status, user_id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, total_price) FROM stdin;
1	1	1	2017-12-10 22:22:25.654748	2018-02-11 18:59:40.706073	\N	\N	\N	\N	62.0100000000000051
2	0	2	2017-12-10 22:22:25.671249	2018-02-11 18:59:40.721889	\N	\N	\N	\N	47.6300000000000026
3	1	3	2017-12-10 22:22:25.682566	2018-02-11 18:59:40.735782	\N	\N	\N	\N	69.8400000000000034
4	0	4	2017-12-10 22:22:25.692124	2018-02-11 18:59:40.749261	\N	\N	\N	\N	160.639999999999986
5	1	5	2017-12-10 22:22:25.704197	2018-02-11 18:59:40.762432	\N	\N	\N	\N	75.7199999999999989
6	1	6	2017-12-10 22:22:25.717502	2018-02-11 18:59:40.774897	\N	\N	\N	\N	172.120000000000005
7	3	7	2017-12-10 22:22:25.72927	2018-02-11 18:59:40.787015	\N	\N	\N	\N	61.3200000000000003
8	1	8	2017-12-10 22:22:25.737992	2018-02-11 18:59:40.798491	\N	\N	\N	\N	172.120000000000005
9	0	9	2017-12-10 22:22:25.75169	2018-02-11 18:59:40.809928	\N	\N	\N	\N	104.159999999999997
10	1	10	2017-12-10 22:22:25.76429	2018-02-11 18:59:40.8218	\N	\N	\N	\N	81.019999999999996
11	2	11	2017-12-10 22:22:25.782089	2018-02-11 18:59:40.836545	\N	\N	\N	\N	24.5799999999999983
12	3	12	2017-12-10 22:22:25.796442	2018-02-11 18:59:40.850595	\N	\N	\N	\N	31.6400000000000006
13	3	13	2017-12-10 22:22:25.805297	2018-02-11 18:59:40.864307	\N	\N	\N	\N	202.049999999999983
14	2	14	2017-12-10 22:22:25.817793	2018-02-11 18:59:40.880658	\N	\N	\N	\N	58.769999999999996
15	1	15	2017-12-10 22:22:25.830128	2018-02-11 18:59:40.896113	\N	\N	\N	\N	126.359999999999985
16	3	16	2017-12-10 22:22:25.844604	2018-02-11 18:59:40.911311	\N	\N	\N	\N	109.519999999999996
17	3	17	2017-12-10 22:22:25.859478	2018-02-11 18:59:40.92672	\N	\N	\N	\N	99.4200000000000017
18	1	18	2017-12-10 22:22:25.868727	2018-02-11 18:59:40.942149	\N	\N	\N	\N	128.099999999999994
19	1	19	2017-12-10 22:22:25.880575	2018-02-11 18:59:40.954777	\N	\N	\N	\N	66.4000000000000057
20	2	20	2017-12-10 22:22:25.896421	2018-02-11 18:59:40.967496	\N	\N	\N	\N	113.420000000000002
21	2	21	2017-12-10 22:22:25.910495	2018-02-11 18:59:40.979824	\N	\N	\N	\N	45.8999999999999986
22	1	22	2017-12-10 22:22:25.919717	2018-02-11 18:59:40.992965	\N	\N	\N	\N	255.199999999999989
23	1	23	2017-12-10 22:22:25.932549	2018-02-11 18:59:41.0058	\N	\N	\N	\N	183.949999999999989
24	2	24	2017-12-10 22:22:25.949299	2018-02-11 18:59:41.019059	\N	\N	\N	\N	29.9200000000000017
25	1	25	2017-12-10 22:22:25.962214	2018-02-11 18:59:41.030925	\N	\N	\N	\N	81.0999999999999943
26	3	26	2017-12-10 22:22:25.97431	2018-02-11 18:59:41.043386	\N	\N	\N	\N	93
27	2	27	2017-12-10 22:22:25.983374	2018-02-11 18:59:41.05703	\N	\N	\N	\N	53.8999999999999986
28	2	28	2017-12-10 22:22:25.996047	2018-02-11 18:59:41.069435	\N	\N	\N	\N	205.599999999999994
29	1	29	2017-12-10 22:22:26.009512	2018-02-11 18:59:41.082647	\N	\N	\N	\N	108.300000000000011
30	3	30	2017-12-10 22:22:26.021699	2018-02-11 18:59:41.094616	\N	\N	\N	\N	175.949999999999989
31	1	31	2017-12-10 22:22:26.030841	2018-02-11 18:59:41.108963	\N	\N	\N	\N	85.4399999999999977
32	0	32	2017-12-10 22:22:26.04809	2018-02-11 18:59:41.124161	\N	\N	\N	\N	132.800000000000011
33	3	33	2017-12-10 22:22:26.061848	2018-02-11 18:59:41.15397	\N	\N	\N	\N	33.3200000000000003
34	1	34	2017-12-10 22:22:26.074472	2018-02-11 18:59:41.16849	\N	\N	\N	\N	145.099999999999994
35	2	35	2017-12-10 22:22:26.087113	2018-02-11 18:59:41.181998	\N	\N	\N	\N	285.450000000000045
36	2	36	2017-12-10 22:22:26.098319	2018-02-11 18:59:41.195401	\N	\N	\N	\N	112.590000000000003
37	3	37	2017-12-10 22:22:26.114223	2018-02-11 18:59:41.209321	\N	\N	\N	\N	12.1400000000000006
38	3	38	2017-12-10 22:22:26.131647	2018-02-11 18:59:41.221753	\N	\N	\N	\N	37.2999999999999972
39	2	39	2017-12-10 22:22:26.148041	2018-02-11 18:59:41.235976	\N	\N	\N	\N	86.1599999999999966
40	1	40	2017-12-10 22:22:26.158705	2018-02-11 18:59:41.248907	\N	\N	\N	\N	228.5
41	2	41	2017-12-10 22:22:26.170495	2018-02-11 18:59:41.261419	\N	\N	\N	\N	61.1400000000000006
42	0	42	2017-12-10 22:22:26.18383	2018-02-11 18:59:41.274173	\N	\N	\N	\N	50.9500000000000028
43	3	43	2017-12-10 22:22:26.196231	2018-02-11 18:59:41.287119	\N	\N	\N	\N	274.560000000000002
44	0	44	2017-12-10 22:22:26.20567	2018-02-11 18:59:41.299147	\N	\N	\N	\N	14.5600000000000005
45	2	45	2017-12-10 22:22:26.218246	2018-02-11 18:59:41.311149	\N	\N	\N	\N	133.259999999999991
46	2	46	2017-12-10 22:22:26.230746	2018-02-11 18:59:41.323308	\N	\N	\N	\N	70.2199999999999989
47	3	47	2017-12-10 22:22:26.245044	2018-02-11 18:59:41.335407	\N	\N	\N	\N	124
48	0	48	2017-12-10 22:22:26.257596	2018-02-11 18:59:41.349443	\N	\N	\N	\N	18.8000000000000007
49	1	49	2017-12-10 22:22:26.268091	2018-02-11 18:59:41.361569	\N	\N	\N	\N	23.2199999999999989
50	2	50	2017-12-10 22:22:26.280229	2018-02-11 18:59:41.374869	\N	\N	\N	\N	65.9699999999999989
51	0	51	2017-12-10 22:22:26.298072	2018-02-11 18:59:41.386955	\N	\N	\N	\N	144.719999999999999
52	2	52	2017-12-10 22:22:26.31197	2018-02-11 18:59:41.399824	\N	\N	\N	\N	44.1000000000000014
53	1	53	2017-12-10 22:22:26.327108	2018-02-11 18:59:41.413116	\N	\N	\N	\N	178.319999999999993
54	1	54	2017-12-10 22:22:26.337108	2018-02-11 18:59:41.425496	\N	\N	\N	\N	40.509999999999998
55	1	4	2017-12-10 22:22:26.361445	2018-02-11 18:59:41.439423	\N	\N	\N	\N	469.910000000000025
56	0	54	2018-02-15 18:52:24.547399	2018-02-15 18:52:24.593079	\N	\N	\N	\N	602
57	0	54	2018-02-15 18:57:08.385082	2018-02-15 18:57:08.43401	\N	\N	\N	\N	832.25
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY schema_migrations (version) FROM stdin;
20170912215536
20170912215635
20170912215823
20170912215933
20170912220156
20170913201351
20170913201525
20170913221006
20170915041309
20170915132625
20170918192955
20170918203915
20180206184641
20180207143546
20180207143719
20180207195701
20180207200344
20180207200523
20180207200835
20180207210731
20180208213500
20180208213626
20180208215056
20180208220442
20180208220619
20180210170101
20180210175645
20180210233803
20180211201244
20180211210201
20180211210403
20180212211014
20180212211119
20180212211428
20180214003433
20180214140259
20180214140336
20180214025220
20180214214239
\.


--
-- Data for Name: store_order_order_items; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY store_order_order_items (id, store_order_id, order_item_id, created_at, updated_at) FROM stdin;
1	1	57	2018-02-15 18:52:25.229279	2018-02-15 18:52:25.229279
2	2	58	2018-02-15 18:57:09.566352	2018-02-15 18:57:09.566352
\.


--
-- Data for Name: store_orders; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY store_orders (id, order_id, store_id, status, total_price, created_at, updated_at) FROM stdin;
1	56	3	\N	602	2018-02-15 18:52:25.201536	2018-02-15 18:52:25.24351
2	57	3	\N	832	2018-02-15 18:57:09.53528	2018-02-15 18:57:09.577263
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY stores (id, name, address, status, slug, twitter_token, twitter_secret) FROM stdin;
1	Found Sound	1773 17th st Denver,CO 80202	active	found-sound	\N	\N
2	Sam's Smoke Shack	1234 17th st Denver,CO 80202	active	sam-s-smoke-shack	\N	\N
3	Vintage Beats	2345 17th st Denver,CO 80202	active	vintage-beats	\N	\N
4	California Used Equipment	3456 17th st Denver,CO 80202	active	california-used-equipment	\N	\N
\.


--
-- Data for Name: stripe_customers; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY stripe_customers (id, email, token, created_at, updated_at, stripe_id, last_four) FROM stdin;
1	jewel@champlingottlieb.info	tok_1BvrqDKgKnSpWppFnqVKXLDl	2018-02-15 18:52:25.147993	2018-02-15 18:52:25.147993	cus_CKWuOUtjYDjtat	\N
\.


--
-- Data for Name: user_stores; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY user_stores (id, user_id, store_id, created_at, updated_at, user_type) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY users (id, first_name, last_name, email, password_digest, address, created_at, updated_at, role) FROM stdin;
1	Mary	Moore	mary@example.com	$2a$10$8GVDkaCJoPKiVgTpryXz7.KtoCLJkEz67v5cuFGXjyM8iEw9EBBkG	666 Spooky Ave, Halloween City, NO 66666	2017-12-10 22:18:28.850761	2017-12-10 22:18:28.850761	1
2	Sandy	Smith	sandy@example.com	$2a$10$hwnGLz1QCIaMAvpTr/NpmuviSDIEjwR0Yc7iGuADZtgICx.1cwx0.	1111 Hoola Hoop Drive, Big Island, HI 90505	2017-12-10 22:18:28.935781	2017-12-10 22:18:28.935781	0
3	Rick	Rhodes	rick@example.com	$2a$10$3l6s3WPZ.2aYZbeSpfzbVeBkCQQQiAS0/k3OJDaAzjT8254bLLsHi	1000 Sunny Dr., Sunshine, CO 10000	2017-12-10 22:18:29.008175	2017-12-10 22:18:29.008175	0
4	Daniel	Williams	daniel@example.com	$2a$10$yACuKv60liK5lMvOTlYIweiC6dxwA5Mu.WckoN9AuhtAHJe2fnsJi	1010 Biking Home, Cool CA 10101	2017-12-10 22:18:29.086761	2017-12-10 22:18:29.086761	0
5	Shelly	Johnson	kiarra@emmerich.org	$2a$10$iEIsFVT5W7UUvjLa122ZbOiY1Jl6EtJNEoeT6/Hd4sEOYdbyJ3jU6	79978 Evangeline Pike, Kennedystad, NE 57242	2017-12-10 22:18:30.225568	2017-12-10 22:18:30.225568	0
6	Ben	Horne	mikayla.orn@smithhowe.io	$2a$10$kiM7Z3kLDagz.2540ClFHe1U28b495ICpeu91LpPlfndK0jS1Gws6	591 Xavier Shore, New Johannafurt, AZ 59327-7784	2017-12-10 22:18:30.306382	2017-12-10 22:18:30.306382	0
7	Dougie	Milford	lorena@oberbrunner.net	$2a$10$Clo.Zld8yriPgVFJuFR.4e1J4aPlZKC/AZr5Yb8NoO0z6wzdpcIzG	85912 Bosco Isle, Berylfurt, TX 43755	2017-12-10 22:18:30.395871	2017-12-10 22:18:30.395871	0
8	Mrs	Tremond	hermann@thompson.io	$2a$10$i64aedieZ/dojvZj0bJOPesehkRmEdEejTbymniqZvX67ddqCe7QW	73672 Treutel Well, New Tracey, MS 76223-3265	2017-12-10 22:18:30.468754	2017-12-10 22:18:30.468754	0
9	Jean	Renault	desmond@keeling.com	$2a$10$4vN.bIP4g07ULx18FY.HzOUWjE6vj8wy3gjbvAMsqC5Q620bgqrCC	24020 Rath Divide, Nedraborough, MI 86576	2017-12-10 22:18:30.544827	2017-12-10 22:18:30.544827	0
10	Mayor	Milford	larry.schmeler@moore.info	$2a$10$B9e5hlpSB6/Ytum4Yam52.fRtYEwygf1D7U264C8RrVGMjCcQsClG	2947 Hilll Valleys, West Myra, CT 88864	2017-12-10 22:18:30.623069	2017-12-10 22:18:30.623069	0
11	Lucy	Moran	nannie@ritchie.biz	$2a$10$VopKW2gi3rw1rJl9n5d2teAgNRg2sIUC8isRxSITlcEd3KcTQvDBq	4095 Jairo Skyway, Courtneystad, CT 66490	2017-12-10 22:18:30.700513	2017-12-10 22:18:30.700513	0
12	Jean	Renault	beth_stark@homenick.org	$2a$10$CJwbPO4SgjwwYxSldSFJDu.rXuxS6PkqGVAxBDn8Q0/Jzp49QgAu.	11837 Elvie Place, New Jalynton, LA 66074	2017-12-10 22:18:30.769089	2017-12-10 22:18:30.769089	0
13	Catherine	Martell	melya.bernier@schulist.info	$2a$10$Y9LVO0qGAaN/tiNTzXgrIu4Gb2GRX6Qsj.C43riSq5wzvu66eRsEW	229 Erich Wall, New Markview, RI 33424	2017-12-10 22:18:30.845481	2017-12-10 22:18:30.845481	0
14	Audrey	Horne	maymie@kulas.name	$2a$10$jqbVAhe.U9XmQIZNuiYnquOD4bSecwZRZSFR93HnAmlsOn93xPtdG	2259 Ritchie Port, Schroederberg, WY 35641-4878	2017-12-10 22:18:30.921374	2017-12-10 22:18:30.921374	0
15	Ben	Horne	rey_stiedemann@keeling.org	$2a$10$98BSyP8noX.F1ktmpalBjOwbKAjiH18x3g7fM59JsywigUZmd4AKe	8455 Baumbach Forest, West Valerie, TN 86718	2017-12-10 22:18:30.996034	2017-12-10 22:18:30.996034	0
16	Lil	dancer	austyn@dickinson.co	$2a$10$PwsydhDMJKHdT61FVX2Uc.XXoO4n/fdWCLByfWTovnUHTJrZD9L4O	623 Martin Well, Mathewside, WI 76845	2017-12-10 22:18:31.068216	2017-12-10 22:18:31.068216	0
17	Lil	dancer	taylor.cartwright@schimmeldenesik.co	$2a$10$XksLsWYpNPhZGiPWPUKx.OEufd96iDAt8iJxxO7XjvUhcQL4SV01u	924 Boyle Mill, East Laurineberg, TX 71383-5657	2017-12-10 22:18:31.137504	2017-12-10 22:18:31.137504	0
18	Harold	Smith	torrey_brekke@dietrich.info	$2a$10$13hOIeYUyW6WT6UWAzhbleEBX28MZ7i0Gqwng5WwhbBK8WtkTwC5i	58633 Sim Cliffs, Kerluketown, VA 13765-3198	2017-12-10 22:18:31.226845	2017-12-10 22:18:31.226845	0
19	Josie	Packard	johnathon@kiehnstokes.net	$2a$10$AM1bC3.WNkowTA8Qfs.MOOBeNvSqmWjdtMgAX7dOlNBFEwQ6rxVky	17250 Yoshiko Isle, Estherton, MT 30427	2017-12-10 22:18:31.310145	2017-12-10 22:18:31.310145	0
20	Leland	Palmer	coralie@carter.biz	$2a$10$HyBwhSBa.M/MzboDAG8cQeZ87N/xOHIo60R7KS2tKpX/.X0ddL8Au	27514 Pouros Turnpike, South Ida, IA 74727-5074	2017-12-10 22:18:31.413539	2017-12-10 22:18:31.413539	0
21	Bobby	Briggs	laney@cronadurgan.net	$2a$10$M9bFEyw3ATpIPuxvEScDw.nX3R/HJm0MGowyjsVju.Ot15lN5H/pi	4301 Willms Extension, Rauchester, ID 88295	2017-12-10 22:18:31.514654	2017-12-10 22:18:31.514654	0
22	Dick	Tremayne	opal.conroy@von.biz	$2a$10$KutAI3J0k4ENmuSn5HIj4.59Sm2Ig5BrQoV0n1D4KgsJv3PkLq2PS	237 Ross Underpass, Okunevamouth, PA 85634-6761	2017-12-10 22:18:31.59617	2017-12-10 22:18:31.59617	0
23	Sam	Stanley	gertrude.hayes@miller.info	$2a$10$9VcZ.Bcg1rfSlTSLUqr1peIqWz3fqtEJtfa8hHdl9GnYIEYDdPFpy	520 Hamill Estates, Eddiestad, MD 52403	2017-12-10 22:18:31.693743	2017-12-10 22:18:31.693743	0
24	Jerry	Horne	broderick_mcglynn@gleichner.biz	$2a$10$6v6ZBKwnJu8TalWUfKZtJ.0zMkyRAd52kFjJC3KOdH0r5VVaV1OK2	5718 D'Amore Freeway, North Conradburgh, RI 80304	2017-12-10 22:18:31.766564	2017-12-10 22:18:31.766564	0
25	Lucy	Moran	raegan@fisherryan.name	$2a$10$kJE8I8I/rnDp1Rc9eadyyOmWEL9zJS493sCMuCphf6vf3evzAKKBu	50611 Cleora Village, Maximillianfurt, RI 43214-1678	2017-12-10 22:18:31.84698	2017-12-10 22:18:31.84698	0
26	Andrew	Packard	lucy@quitzonsatterfield.net	$2a$10$VV2ig2LfePkQ3/K0sNwtaus6uhOyckYkUvKu5gq21dwZjf4rlcJvK	9047 Lindsey Camp, Kelvinshire, CO 24736	2017-12-10 22:18:31.923136	2017-12-10 22:18:31.923136	0
27	Jerry	Horne	victor@bayer.name	$2a$10$vc8B8Vdw9ZrfUrT4TaaRSOdlI/EmcDglLG/H4kMlkNnBFqyNxo96K	932 Kurt Pines, West Broderickberg, OK 28457-2010	2017-12-10 22:18:31.991834	2017-12-10 22:18:31.991834	0
28	Hank	Jennings	branson@welch.name	$2a$10$/FoIGFbeKielczthB8.tEuHSp61dke7eA7BKeyUDpa7DxsFgf2fb2	963 Macie Islands, North Bernard, ID 77072	2017-12-10 22:18:32.063542	2017-12-10 22:18:32.063542	0
29	Sarah	Palmer	elwin@mcdermott.name	$2a$10$Jo2uuSx1qhcm54BUbUSo5OUzAqHKV2CdHIKmEGR0lYRr8NiLcxRgC	735 Huel River, South William, AL 61255-6594	2017-12-10 22:18:32.13623	2017-12-10 22:18:32.13623	0
30	Shelly	Johnson	ines.johnston@spinka.org	$2a$10$4R5y86dcr.AglCYzkV6cWOaNuteReGqkNBNvE0m1kawICQHpPmutG	7267 Pascale Mount, Port Jerelberg, ID 86921-4524	2017-12-10 22:18:32.208719	2017-12-10 22:18:32.208719	0
31	Mr	Tojamura	rickey@ondricka.net	$2a$10$a4gMhk5sz9UBcR9n1ScdH..ICFHNVhFpxrzF/eHW/8y9EJsjiPh..	61773 Ruecker Port, Klockostad, NH 20390-4403	2017-12-10 22:18:32.281058	2017-12-10 22:18:32.281058	0
32	Gersten	Hayward	brenda@gaylord.co	$2a$10$mkNzpnkVTOrxz4.bRWHaS.ifvE/d8Ez30xfALq0UiiRaBRaRNFgLu	2879 Callie Forges, Erinfort, IA 95583	2017-12-10 22:18:32.350623	2017-12-10 22:18:32.350623	0
33	Hawk	Hill	norene.fritsch@hartmann.org	$2a$10$FffPOSSCml8HOsqUpuUlHuQJrG1camX5pCu1k2/GymjwQEqPbRGqe	36992 Trantow Tunnel, New Freddy, NM 93940-8055	2017-12-10 22:18:32.427494	2017-12-10 22:18:32.427494	0
34	Leo	Johnson	ward.skiles@orn.io	$2a$10$H3FO7qLPtpUsA6iijtaIeuT93RobGhCcdu7Zq6G2UYNaCI9bK9962	3702 Gudrun Field, Port Kim, GA 52417	2017-12-10 22:18:32.500491	2017-12-10 22:18:32.500491	0
35	Thomas	Eckhardt	heber.greenholt@haag.name	$2a$10$tyiwnjldLBxtIDw6Jfiy8u1XG/d9e4nNY0PpEUGW1Ekq34TYrWy7a	87946 Toy Parkways, Hodkiewiczmouth, NH 78178	2017-12-10 22:18:32.570489	2017-12-10 22:18:32.570489	0
36	Leland	Palmer	doyle.blick@fritsch.org	$2a$10$SADuD7KWVwy2R196DsAA.uwRlI3./Nm7xeVBbW.6v7Yw80kcjUR5i	15690 Ronny Throughway, North Mariano, MO 68586	2017-12-10 22:18:32.645503	2017-12-10 22:18:32.645503	0
37	Hawk	Hill	thelma@schmidt.co	$2a$10$Vn66.Vj2LUjOyxF1AyYCGeZJ0faw5bhStf/8.9cj8mYbhQhF2aMOO	987 Jacobson Shoal, New Simberg, VT 37036	2017-12-10 22:18:32.741478	2017-12-10 22:18:32.741478	0
38	The	Giant	guie@kris.com	$2a$10$lCPgV/ZtVWbxCTt2LGy7OuL26ioz5GYdauTynbhL3KKe5.juW39EC	646 Napoleon Plain, Rempelbury, MS 21464	2017-12-10 22:18:32.80819	2017-12-10 22:18:32.80819	0
39	Eileen	Hayward	jeffry@hamillvolkman.name	$2a$10$1RUrh/946FEvduFNhd5i2.Hp9k0NEhUs/cMDzPdGImQYPdWgW7NoW	949 Eldora Spurs, Bartonview, AZ 74891	2017-12-10 22:18:32.877295	2017-12-10 22:18:32.877295	0
40	Lana	Milford	rogers.block@tremblaycarter.net	$2a$10$e/cxDQz5YOzgdhhkR1pWJed38w4P1yfdAS4Rg3hFJloEbhgJJwxLC	639 Huels Walk, North Cristianbury, WI 31603-3390	2017-12-10 22:18:32.957393	2017-12-10 22:18:32.957393	0
41	Dale	Cooper	leonel@mann.io	$2a$10$fgLAqwyUtMkWA50B6yfuluGwhU8F1VbyRQFIu2rq92vsCOmgXjWW6	62729 Lowe Port, Port Hayleeberg, OR 86786-0964	2017-12-10 22:18:33.030571	2017-12-10 22:18:33.030571	0
42	Jerry	Horne	alex@walter.co	$2a$10$AcAgTUTRmFxKGhtAr.G68uhLPpi37oSUf4myr932QPsRqY/j0fhJm	701 Madonna Drives, Bartonport, RI 16260-8778	2017-12-10 22:18:33.106299	2017-12-10 22:18:33.106299	0
43	Eileen	Hayward	elias@kris.biz	$2a$10$aYdZ.grAK1HVb0vUj.J.7O9rBMWylbPeboy6X3Vx0BPUQ.bsOs0Rm	7634 Spencer Shores, Ethamouth, AR 68678-0370	2017-12-10 22:18:33.179097	2017-12-10 22:18:33.179097	0
44	Donna	Hayward	amina@kshlerin.name	$2a$10$AMclmweiXGKa2kIvTX8JM.KH2fkscEFITBPgaUYx0ge/Vvo.8At/m	734 Don Plains, North Nellamouth, MT 99045	2017-12-10 22:18:33.269867	2017-12-10 22:18:33.269867	0
45	Bobby	Briggs	mertie@klein.org	$2a$10$gRA1x8gJitGbkaVVJ1dlOu6/gQp.h7UbABSIaN0jAp9ZoDCSfn/ca	42861 Sim Greens, Lake Ari, KY 85972-2934	2017-12-10 22:18:33.353197	2017-12-10 22:18:33.353197	0
46	Annie	Blackburn	winifred@reichel.biz	$2a$10$1iEBkwxnD32WCjuI1MQ4/.6TQ4hOInA/Xhve.zQlFe4D1QRhO8qEa	1142 Wyman Crescent, North Kristopherport, TN 73077-1227	2017-12-10 22:18:33.438034	2017-12-10 22:18:33.438034	0
47	Nadine	Hurley	elisa_mayer@kemmer.org	$2a$10$N2hkISFgDoKcg9FifYK9pevnhPGgKElgvtXHB2u2rCAt71z9g5jI2	60745 Hanna Parkways, East Margret, MO 93485	2017-12-10 22:18:33.51151	2017-12-10 22:18:33.51151	0
48	Annie	Blackburn	kaitlin@miller.info	$2a$10$3V2uMCnTefMESJruPGGgFOgAj92mibrzDuZMlJczOuA0UBLCIIQIi	578 Jazmyne Path, Erikhaven, WI 21206	2017-12-10 22:18:33.593158	2017-12-10 22:18:33.593158	0
49	Sarah	Palmer	jamil@dachkiehn.name	$2a$10$dxRQk0f1lr7YP0k0dagWUO47km0BOUzsbQ84bokKLnKYcLMsWE9IO	801 Purdy Vista, East Zita, IN 72342-9710	2017-12-10 22:18:33.710675	2017-12-10 22:18:33.710675	0
50	Dougie	Milford	remington_farrell@schimmelokuneva.com	$2a$10$16sbRXloKJcvuwGGTnpi7efXUrvuZR1.z50jQk0ScVV0hpsOlbEbC	345 Sporer Stravenue, Lake Destini, AR 60560-5209	2017-12-10 22:18:33.797982	2017-12-10 22:18:33.797982	0
51	Big	Hurley	okey.turcotte@hagenespurdy.com	$2a$10$lfbXQklwU5NlZwjkGYtF2.TQrbpJjUeko0V8l6cTuw92lJ9Jhagq6	9054 Murphy Extension, Anibalfort, PA 60044-4207	2017-12-10 22:18:33.896812	2017-12-10 22:18:33.896812	0
52	MIKE	MIKE	theodore.dickens@mitchell.info	$2a$10$Xma0AxRjK4DiQlQEE1xro.gdNg1wjQakJXrzBRtO1AqztBZLQXC7G	398 Claud Circle, Jeanshire, NJ 35305-1797	2017-12-10 22:18:33.98414	2017-12-10 22:18:33.98414	0
53	Chet	Desmond	willie_howe@senger.com	$2a$10$em2Oy9jcdwCV9xFSlnfr1.06TfD5s0CIv3/XsyOzS4R1x8/IkAsri	452 Weissnat Glens, Lilytown, CO 94140	2017-12-10 22:18:34.060008	2017-12-10 22:18:34.060008	0
54	Lucy	Moran	jewel@champlingottlieb.info	$2a$10$G4B32ovf8DQXWm.T68JrXOqPfsNl1zdNpw1osg8Tc2NfsNdf9Qc86	6362 Eleonore Passage, Zacharyton, KS 73859-7134	2017-12-10 22:18:34.134171	2017-12-10 22:18:34.134171	0
\.


--
-- Data for Name: views; Type: TABLE DATA; Schema: public; Owner: Max
--

COPY views (id, user_id, item_id, created_at, updated_at) FROM stdin;
1	54	1077	2018-02-15 17:00:11.175607	2018-02-15 17:00:11.175607
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('categories_id_seq', 21, true);


--
-- Name: chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('chat_messages_id_seq', 126, true);


--
-- Name: chatrooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('chatrooms_id_seq', 2, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('departments_id_seq', 4, true);


--
-- Name: developers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('developers_id_seq', 1, false);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('items_id_seq', 1093, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('order_items_id_seq', 58, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('orders_id_seq', 57, true);


--
-- Name: store_order_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('store_order_order_items_id_seq', 2, true);


--
-- Name: store_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('store_orders_id_seq', 2, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('stores_id_seq', 4, true);


--
-- Name: stripe_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('stripe_customers_id_seq', 1, true);


--
-- Name: user_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('user_stores_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('users_id_seq', 54, true);


--
-- Name: views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Max
--

SELECT pg_catalog.setval('views_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: chatrooms chatrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY chatrooms
    ADD CONSTRAINT chatrooms_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: developers developers_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY developers
    ADD CONSTRAINT developers_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: store_order_order_items store_order_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY store_order_order_items
    ADD CONSTRAINT store_order_order_items_pkey PRIMARY KEY (id);


--
-- Name: store_orders store_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY store_orders
    ADD CONSTRAINT store_orders_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: stripe_customers stripe_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY stripe_customers
    ADD CONSTRAINT stripe_customers_pkey PRIMARY KEY (id);


--
-- Name: user_stores user_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY user_stores
    ADD CONSTRAINT user_stores_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: views views_pkey; Type: CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY views
    ADD CONSTRAINT views_pkey PRIMARY KEY (id);


--
-- Name: index_categories_on_department_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_categories_on_department_id ON categories USING btree (department_id);


--
-- Name: index_categories_on_slug; Type: INDEX; Schema: public; Owner: Max
--

CREATE UNIQUE INDEX index_categories_on_slug ON categories USING btree (slug);


--
-- Name: index_chat_messages_on_chatroom_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_chat_messages_on_chatroom_id ON chat_messages USING btree (chatroom_id);


--
-- Name: index_chat_messages_on_user_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_chat_messages_on_user_id ON chat_messages USING btree (user_id);


--
-- Name: index_chatrooms_on_user_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_chatrooms_on_user_id ON chatrooms USING btree (user_id);


--
-- Name: index_developers_on_user_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_developers_on_user_id ON developers USING btree (user_id);


--
-- Name: index_items_on_category_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_items_on_category_id ON items USING btree (category_id);


--
-- Name: index_items_on_store_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_items_on_store_id ON items USING btree (store_id);


--
-- Name: index_order_items_on_item_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_order_items_on_item_id ON order_items USING btree (item_id);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_order_items_on_order_id ON order_items USING btree (order_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_orders_on_user_id ON orders USING btree (user_id);


--
-- Name: index_store_order_order_items_on_order_item_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_store_order_order_items_on_order_item_id ON store_order_order_items USING btree (order_item_id);


--
-- Name: index_store_order_order_items_on_store_order_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_store_order_order_items_on_store_order_id ON store_order_order_items USING btree (store_order_id);


--
-- Name: index_store_orders_on_order_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_store_orders_on_order_id ON store_orders USING btree (order_id);


--
-- Name: index_store_orders_on_store_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_store_orders_on_store_id ON store_orders USING btree (store_id);


--
-- Name: index_user_stores_on_store_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_user_stores_on_store_id ON user_stores USING btree (store_id);


--
-- Name: index_user_stores_on_user_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_user_stores_on_user_id ON user_stores USING btree (user_id);


--
-- Name: index_views_on_item_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_views_on_item_id ON views USING btree (item_id);


--
-- Name: index_views_on_user_id; Type: INDEX; Schema: public; Owner: Max
--

CREATE INDEX index_views_on_user_id ON views USING btree (user_id);


--
-- Name: views fk_rails_014d96d9db; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY views
    ADD CONSTRAINT fk_rails_014d96d9db FOREIGN KEY (item_id) REFERENCES items(id);


--
-- Name: order_items fk_rails_3e402078fd; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT fk_rails_3e402078fd FOREIGN KEY (item_id) REFERENCES items(id);


--
-- Name: store_order_order_items fk_rails_522e836599; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY store_order_order_items
    ADD CONSTRAINT fk_rails_522e836599 FOREIGN KEY (order_item_id) REFERENCES order_items(id);


--
-- Name: views fk_rails_6a13b72c28; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY views
    ADD CONSTRAINT fk_rails_6a13b72c28 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: user_stores fk_rails_6d5676de8e; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY user_stores
    ADD CONSTRAINT fk_rails_6d5676de8e FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: store_orders fk_rails_7518806052; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY store_orders
    ADD CONSTRAINT fk_rails_7518806052 FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- Name: store_orders fk_rails_76a270ec1e; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY store_orders
    ADD CONSTRAINT fk_rails_76a270ec1e FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: chat_messages fk_rails_79f683b1ae; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY chat_messages
    ADD CONSTRAINT fk_rails_79f683b1ae FOREIGN KEY (chatroom_id) REFERENCES chatrooms(id);


--
-- Name: categories fk_rails_8038680b53; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT fk_rails_8038680b53 FOREIGN KEY (department_id) REFERENCES departments(id);


--
-- Name: chatrooms fk_rails_84a44bc6da; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY chatrooms
    ADD CONSTRAINT fk_rails_84a44bc6da FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: items fk_rails_89fb86dc8b; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY items
    ADD CONSTRAINT fk_rails_89fb86dc8b FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: store_order_order_items fk_rails_8f37c06f0c; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY store_order_order_items
    ADD CONSTRAINT fk_rails_8f37c06f0c FOREIGN KEY (store_order_id) REFERENCES store_orders(id);


--
-- Name: chat_messages fk_rails_918ef7acc4; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY chat_messages
    ADD CONSTRAINT fk_rails_918ef7acc4 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: developers fk_rails_b4fd2c06f8; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY developers
    ADD CONSTRAINT fk_rails_b4fd2c06f8 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: user_stores fk_rails_d9a9258f32; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY user_stores
    ADD CONSTRAINT fk_rails_d9a9258f32 FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- Name: items fk_rails_e1affc3556; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY items
    ADD CONSTRAINT fk_rails_e1affc3556 FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- Name: order_items fk_rails_e3cb28f071; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT fk_rails_e3cb28f071 FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: Max
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

