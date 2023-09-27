--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-09-26 22:31:49

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
-- TOC entry 5027 (class 1262 OID 16399)
-- Name: dcss; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE dcss WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1251';


\connect dcss

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 246 (class 1259 OID 16811)
-- Name: address_addressid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.address_addressid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 241 (class 1259 OID 16739)
-- Name: Address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Address" (
    "AddressId" integer DEFAULT nextval('public.address_addressid_seq'::regclass) NOT NULL,
    "Street1" character varying(255),
    "Street2" character varying(255),
    "CountryId" integer NOT NULL,
    "City" character varying(255),
    "ZipCode" integer
);


--
-- TOC entry 247 (class 1259 OID 16813)
-- Name: buyer_buyerid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.buyer_buyerid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 244 (class 1259 OID 16791)
-- Name: Buyer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Buyer" (
    "BuyerId" integer DEFAULT nextval('public.buyer_buyerid_seq'::regclass) NOT NULL,
    "PhotoId" uuid,
    "AddressId" integer,
    "PhoneNumber" character varying(50),
    "Email" character varying(100),
    "FirstName" character varying(255),
    "MiddleName" character varying(255),
    "LastName" character varying(255)
);


--
-- TOC entry 248 (class 1259 OID 16815)
-- Name: color_colorid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.color_colorid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 237 (class 1259 OID 16697)
-- Name: Color; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Color" (
    "ColorId" integer DEFAULT nextval('public.color_colorid_seq'::regclass) NOT NULL,
    "Title" character varying(50)
);


--
-- TOC entry 249 (class 1259 OID 16817)
-- Name: country_countryid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.country_countryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 239 (class 1259 OID 16712)
-- Name: Country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Country" (
    "CountryId" integer DEFAULT nextval('public.country_countryid_seq'::regclass) NOT NULL,
    "Code" character varying(10) NOT NULL,
    "Name" character varying(255) NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16458)
-- Name: DayVariant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."DayVariant" (
    "DayVariantId" integer NOT NULL,
    "VariantName" character varying(50) NOT NULL,
    "CreatedBy" integer,
    "UpdatedBy" integer,
    "CreatedAt" timestamp with time zone DEFAULT now(),
    "UpdatedAt" timestamp with time zone DEFAULT now(),
    "CustomDate" date
);


--
-- TOC entry 217 (class 1259 OID 16457)
-- Name: DayVariants_DayVariantId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."DayVariants_DayVariantId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 217
-- Name: DayVariants_DayVariantId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."DayVariants_DayVariantId_seq" OWNED BY public."DayVariant"."DayVariantId";


--
-- TOC entry 250 (class 1259 OID 16818)
-- Name: distrybutor_distrybutorid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.distrybutor_distrybutorid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 240 (class 1259 OID 16717)
-- Name: Distrybutor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Distrybutor" (
    "DistrybutorId" integer DEFAULT nextval('public.distrybutor_distrybutorid_seq'::regclass) NOT NULL,
    "Name" character varying(255),
    "AddressId" integer,
    "Note" character varying(255)
);


--
-- TOC entry 216 (class 1259 OID 16435)
-- Name: Employee; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Employee" (
    "EmployeeId" integer NOT NULL,
    "EmployeeCode" character varying(10) NOT NULL,
    "LastName" character varying(255) NOT NULL,
    "FirstName" character varying(255) NOT NULL,
    "MiddleName" character varying(255),
    "DateOfBirth" date NOT NULL,
    "Position" character varying(255),
    "Username" character varying(255) NOT NULL,
    "Password" character varying(255) NOT NULL,
    "CreatedBy" integer,
    "UpdatedBy" integer,
    "CreatedAt" timestamp with time zone DEFAULT now(),
    "UpdatedAt" timestamp with time zone DEFAULT now(),
    "StoreWorkedAtId" integer,
    "ImageId" uuid,
    "HomeAddressId" integer,
    "Email" character varying,
    "PhoneNumber" character varying
);


--
-- TOC entry 215 (class 1259 OID 16434)
-- Name: Employee_EmployeeId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Employee_EmployeeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 215
-- Name: Employee_EmployeeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Employee_EmployeeId_seq" OWNED BY public."Employee"."EmployeeId";


--
-- TOC entry 232 (class 1259 OID 16664)
-- Name: Image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Image" (
    "ImageId" integer NOT NULL,
    "ImageGuid" uuid NOT NULL,
    "Path" character varying NOT NULL,
    "CreatedBy" integer,
    "CreatedAt" timestamp with time zone DEFAULT now()
);


--
-- TOC entry 235 (class 1259 OID 16685)
-- Name: Item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Item" (
    "ItemId" integer NOT NULL,
    "DateOfManufacture" date,
    "Note" character varying(500)
);


--
-- TOC entry 251 (class 1259 OID 16821)
-- Name: material_materialid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.material_materialid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 238 (class 1259 OID 16702)
-- Name: Material; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Material" (
    "MaterialId" integer DEFAULT nextval('public.material_materialid_seq'::regclass) NOT NULL,
    "Title" character varying(255),
    "Color" integer
);


--
-- TOC entry 245 (class 1259 OID 16803)
-- Name: PaymentType; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."PaymentType" (
    "PaymentTypeId" integer NOT NULL,
    "Title" character varying
);


--
-- TOC entry 226 (class 1259 OID 16536)
-- Name: Product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Product" (
    "ProductId" integer NOT NULL,
    "ProductName" character varying(255) NOT NULL,
    "ClassificationId" integer NOT NULL,
    "PriceUsd" money NOT NULL,
    "Quantity" integer NOT NULL,
    "CreatedBy" integer,
    "UpdatedBy" integer,
    "CreatedAt" timestamp with time zone DEFAULT now(),
    "UpdatedAt" timestamp with time zone DEFAULT now(),
    "ExpirationDate" timestamp without time zone,
    "DistrybutonId" integer
);


--
-- TOC entry 224 (class 1259 OID 16527)
-- Name: ProductClassification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductClassification" (
    "ClassificationId" integer NOT NULL,
    "ClassificationName" character varying(255) NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16526)
-- Name: ProductClassification_ClassificationId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ProductClassification_ClassificationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 223
-- Name: ProductClassification_ClassificationId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ProductClassification_ClassificationId_seq" OWNED BY public."ProductClassification"."ClassificationId";


--
-- TOC entry 234 (class 1259 OID 16681)
-- Name: ProductItem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductItem" (
    "ProductItemId" integer NOT NULL,
    "ItemId" integer NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 16578)
-- Name: ProductTransaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductTransaction" (
    "TransactionId" integer NOT NULL,
    "TransactionDate" timestamp with time zone DEFAULT now() NOT NULL,
    "TransactionTypeId" integer NOT NULL,
    "StoreId" integer NOT NULL,
    "EmployeePerformedTransaction" integer NOT NULL,
    "Note" text,
    "CreatedBy" integer,
    "UpdatedBy" integer,
    "CreatedAt" timestamp with time zone DEFAULT now(),
    "UpdatedAt" timestamp with time zone DEFAULT now(),
    "Price" money NOT NULL,
    "BuyerId" integer
);


--
-- TOC entry 252 (class 1259 OID 16823)
-- Name: producttransactioninfo_producttransactioninfoid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.producttransactioninfo_producttransactioninfoid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 243 (class 1259 OID 16766)
-- Name: ProductTransactionInfo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductTransactionInfo" (
    "ProductTransactionInfoId" integer DEFAULT nextval('public.producttransactioninfo_producttransactioninfoid_seq'::regclass) NOT NULL,
    "TransactionId" integer,
    "ProductId" integer,
    "Quantity" integer,
    "PricePerItem" money
);


--
-- TOC entry 229 (class 1259 OID 16577)
-- Name: ProductTransaction_TransactionId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ProductTransaction_TransactionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 229
-- Name: ProductTransaction_TransactionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ProductTransaction_TransactionId_seq" OWNED BY public."ProductTransaction"."TransactionId";


--
-- TOC entry 225 (class 1259 OID 16535)
-- Name: Product_ProductId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Product_ProductId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 225
-- Name: Product_ProductId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Product_ProductId_seq" OWNED BY public."Product"."ProductId";


--
-- TOC entry 253 (class 1259 OID 16825)
-- Name: receipt_receiptid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.receipt_receiptid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 242 (class 1259 OID 16756)
-- Name: Receipt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Receipt" (
    "ReceiptId" integer DEFAULT nextval('public.receipt_receiptid_seq'::regclass) NOT NULL,
    "Path" character varying(255),
    "TransactionId" integer
);


--
-- TOC entry 220 (class 1259 OID 16477)
-- Name: Store; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Store" (
    "StoreId" integer NOT NULL,
    "StoreName" character varying(255) NOT NULL,
    "Phone" character varying(20) NOT NULL,
    "CreatedBy" integer,
    "UpdatedBy" integer,
    "CreatedAt" timestamp with time zone DEFAULT now(),
    "UpdatedAt" timestamp with time zone DEFAULT now(),
    "LogoId" uuid,
    "CountryId" integer,
    "AddressId" integer
);


--
-- TOC entry 222 (class 1259 OID 16498)
-- Name: StoreHour; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."StoreHour" (
    "StoreHoursId" integer NOT NULL,
    "StoreId" integer NOT NULL,
    "DayVariantId" integer NOT NULL,
    "StartTime" time without time zone NOT NULL,
    "EndTime" time without time zone NOT NULL,
    "CreatedBy" integer,
    "UpdatedBy" integer,
    "CreatedAt" timestamp with time zone DEFAULT now(),
    "UpdatedAt" timestamp with time zone DEFAULT now()
);


--
-- TOC entry 221 (class 1259 OID 16497)
-- Name: StoreHours_StoreHoursId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."StoreHours_StoreHoursId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 221
-- Name: StoreHours_StoreHoursId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."StoreHours_StoreHoursId_seq" OWNED BY public."StoreHour"."StoreHoursId";


--
-- TOC entry 219 (class 1259 OID 16476)
-- Name: Store_StoreId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Store_StoreId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 219
-- Name: Store_StoreId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Store_StoreId_seq" OWNED BY public."Store"."StoreId";


--
-- TOC entry 228 (class 1259 OID 16569)
-- Name: TransactionType; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TransactionType" (
    "TransactionTypeId" integer NOT NULL,
    "TypeName" character varying(50) NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 16568)
-- Name: TransactionType_TransactionTypeId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."TransactionType_TransactionTypeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 227
-- Name: TransactionType_TransactionTypeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."TransactionType_TransactionTypeId_seq" OWNED BY public."TransactionType"."TransactionTypeId";


--
-- TOC entry 231 (class 1259 OID 16663)
-- Name: image_ImageId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."image_ImageId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 231
-- Name: image_ImageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."image_ImageId_seq" OWNED BY public."Image"."ImageId";


--
-- TOC entry 236 (class 1259 OID 16688)
-- Name: item_itemid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 236
-- Name: item_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_itemid_seq OWNED BY public."Item"."ItemId";


--
-- TOC entry 233 (class 1259 OID 16680)
-- Name: productitem_productitemid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.productitem_productitemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 233
-- Name: productitem_productitemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.productitem_productitemid_seq OWNED BY public."ProductItem"."ProductItemId";


--
-- TOC entry 4731 (class 2604 OID 16461)
-- Name: DayVariant DayVariantId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DayVariant" ALTER COLUMN "DayVariantId" SET DEFAULT nextval('public."DayVariants_DayVariantId_seq"'::regclass);


--
-- TOC entry 4728 (class 2604 OID 16438)
-- Name: Employee EmployeeId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee" ALTER COLUMN "EmployeeId" SET DEFAULT nextval('public."Employee_EmployeeId_seq"'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16667)
-- Name: Image ImageId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Image" ALTER COLUMN "ImageId" SET DEFAULT nextval('public."image_ImageId_seq"'::regclass);


--
-- TOC entry 4752 (class 2604 OID 16689)
-- Name: Item ItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Item" ALTER COLUMN "ItemId" SET DEFAULT nextval('public.item_itemid_seq'::regclass);


--
-- TOC entry 4741 (class 2604 OID 16539)
-- Name: Product ProductId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product" ALTER COLUMN "ProductId" SET DEFAULT nextval('public."Product_ProductId_seq"'::regclass);


--
-- TOC entry 4740 (class 2604 OID 16530)
-- Name: ProductClassification ClassificationId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductClassification" ALTER COLUMN "ClassificationId" SET DEFAULT nextval('public."ProductClassification_ClassificationId_seq"'::regclass);


--
-- TOC entry 4751 (class 2604 OID 16684)
-- Name: ProductItem ProductItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductItem" ALTER COLUMN "ProductItemId" SET DEFAULT nextval('public.productitem_productitemid_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 16581)
-- Name: ProductTransaction TransactionId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransaction" ALTER COLUMN "TransactionId" SET DEFAULT nextval('public."ProductTransaction_TransactionId_seq"'::regclass);


--
-- TOC entry 4734 (class 2604 OID 16480)
-- Name: Store StoreId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Store" ALTER COLUMN "StoreId" SET DEFAULT nextval('public."Store_StoreId_seq"'::regclass);


--
-- TOC entry 4737 (class 2604 OID 16501)
-- Name: StoreHour StoreHoursId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StoreHour" ALTER COLUMN "StoreHoursId" SET DEFAULT nextval('public."StoreHours_StoreHoursId_seq"'::regclass);


--
-- TOC entry 4744 (class 2604 OID 16572)
-- Name: TransactionType TransactionTypeId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TransactionType" ALTER COLUMN "TransactionTypeId" SET DEFAULT nextval('public."TransactionType_TransactionTypeId_seq"'::regclass);


--
-- TOC entry 5009 (class 0 OID 16739)
-- Dependencies: 241
-- Data for Name: Address; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5012 (class 0 OID 16791)
-- Dependencies: 244
-- Data for Name: Buyer; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5005 (class 0 OID 16697)
-- Dependencies: 237
-- Data for Name: Color; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5007 (class 0 OID 16712)
-- Dependencies: 239
-- Data for Name: Country; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4986 (class 0 OID 16458)
-- Dependencies: 218
-- Data for Name: DayVariant; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."DayVariant" VALUES (1, 'Working Days', NULL, NULL, '2023-09-16 20:54:55.885573+03', '2023-09-16 20:54:55.885573+03', NULL);
INSERT INTO public."DayVariant" VALUES (2, 'Weekends', NULL, NULL, '2023-09-16 20:54:55.885573+03', '2023-09-16 20:54:55.885573+03', NULL);
INSERT INTO public."DayVariant" VALUES (3, 'State Holidays', NULL, NULL, '2023-09-16 20:54:55.885573+03', '2023-09-16 20:54:55.885573+03', NULL);
INSERT INTO public."DayVariant" VALUES (4, 'Church Holidays', NULL, NULL, '2023-09-16 20:54:55.885573+03', '2023-09-16 20:54:55.885573+03', NULL);


--
-- TOC entry 5008 (class 0 OID 16717)
-- Dependencies: 240
-- Data for Name: Distrybutor; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4984 (class 0 OID 16435)
-- Dependencies: 216
-- Data for Name: Employee; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Employee" VALUES (1, 'ADMIN001', 'Admin', 'Super', 'User', '1980-01-01', 'Admin', 'admin', 'admin_password', 1, 1, '2023-09-16 20:53:25.695617+03', '2023-09-16 20:53:25.695617+03', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Employee" VALUES (4, 'ADMIN002', 'Polishchuk', 'Anna', 'Mykolaivna', '2004-01-31', 'w', 'e', 'w', 1, 1, '2023-09-20 20:16:27.439737+03', '2023-09-20 20:16:27.439737+03', 1, NULL, NULL, NULL, NULL);


--
-- TOC entry 5000 (class 0 OID 16664)
-- Dependencies: 232
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5003 (class 0 OID 16685)
-- Dependencies: 235
-- Data for Name: Item; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5006 (class 0 OID 16702)
-- Dependencies: 238
-- Data for Name: Material; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5013 (class 0 OID 16803)
-- Dependencies: 245
-- Data for Name: PaymentType; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."PaymentType" VALUES (1, 'cash');
INSERT INTO public."PaymentType" VALUES (2, 'card');
INSERT INTO public."PaymentType" VALUES (3, 'check');


--
-- TOC entry 4994 (class 0 OID 16536)
-- Dependencies: 226
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Product" VALUES (2, 'Door handle', 4, '$20.00', 100, 4, 4, '2023-09-20 20:33:59.009668+03', '2023-09-20 20:33:59.009668+03', NULL, NULL);
INSERT INTO public."Product" VALUES (1, 'Ceramic Sink', 1, '$100.00', 25, 1, 1, '2023-09-16 20:57:57.863222+03', '2023-09-16 20:57:57.863222+03', NULL, NULL);


--
-- TOC entry 4992 (class 0 OID 16527)
-- Dependencies: 224
-- Data for Name: ProductClassification; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."ProductClassification" VALUES (1, 'Sanitary Ware');
INSERT INTO public."ProductClassification" VALUES (2, 'Pipes');
INSERT INTO public."ProductClassification" VALUES (3, 'Windows');
INSERT INTO public."ProductClassification" VALUES (4, 'Doors');
INSERT INTO public."ProductClassification" VALUES (5, 'Ceramic Tiles');
INSERT INTO public."ProductClassification" VALUES (6, 'Silicate Bricks');
INSERT INTO public."ProductClassification" VALUES (7, 'Facade Bricks');
INSERT INTO public."ProductClassification" VALUES (8, 'Fire-Resistant Bricks');


--
-- TOC entry 5002 (class 0 OID 16681)
-- Dependencies: 234
-- Data for Name: ProductItem; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4998 (class 0 OID 16578)
-- Dependencies: 230
-- Data for Name: ProductTransaction; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."ProductTransaction" VALUES (2, '2023-09-20 20:47:13.632149+03', 2, 1, 4, '-', 4, 4, '2023-09-20 20:47:13.632149+03', '2023-09-20 20:47:13.632149+03', '$200.50', NULL);


--
-- TOC entry 5011 (class 0 OID 16766)
-- Dependencies: 243
-- Data for Name: ProductTransactionInfo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5010 (class 0 OID 16756)
-- Dependencies: 242
-- Data for Name: Receipt; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4988 (class 0 OID 16477)
-- Dependencies: 220
-- Data for Name: Store; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Store" VALUES (1, 'BuidMarket', '0973242447', 4, 4, '2023-09-20 20:27:29.171318+03', '2023-09-20 20:27:29.171318+03', NULL, NULL, NULL);
INSERT INTO public."Store" VALUES (2, 'BudMaterial', '0688321330', 1, 1, '2023-09-20 20:29:17.918141+03', '2023-09-20 20:29:17.918141+03', NULL, NULL, NULL);


--
-- TOC entry 4990 (class 0 OID 16498)
-- Dependencies: 222
-- Data for Name: StoreHour; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."StoreHour" VALUES (1, 1, 1, '07:00:00', '18:00:00', 4, 4, '2023-09-20 20:40:40.792472+03', '2023-09-20 20:40:40.792472+03');
INSERT INTO public."StoreHour" VALUES (2, 2, 2, '09:00:00', '16:00:00', 1, 1, '2023-09-20 20:40:40.795566+03', '2023-09-20 20:40:40.795566+03');


--
-- TOC entry 4996 (class 0 OID 16569)
-- Dependencies: 228
-- Data for Name: TransactionType; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."TransactionType" VALUES (1, 'Sale');
INSERT INTO public."TransactionType" VALUES (2, 'Purchase');


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 217
-- Name: DayVariants_DayVariantId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."DayVariants_DayVariantId_seq"', 4, true);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 215
-- Name: Employee_EmployeeId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Employee_EmployeeId_seq"', 4, true);


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 223
-- Name: ProductClassification_ClassificationId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ProductClassification_ClassificationId_seq"', 9, true);


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 229
-- Name: ProductTransaction_TransactionId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ProductTransaction_TransactionId_seq"', 2, true);


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 225
-- Name: Product_ProductId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Product_ProductId_seq"', 2, true);


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 221
-- Name: StoreHours_StoreHoursId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."StoreHours_StoreHoursId_seq"', 2, true);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 219
-- Name: Store_StoreId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Store_StoreId_seq"', 2, true);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 227
-- Name: TransactionType_TransactionTypeId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."TransactionType_TransactionTypeId_seq"', 2, true);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 246
-- Name: address_addressid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.address_addressid_seq', 1, false);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 247
-- Name: buyer_buyerid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.buyer_buyerid_seq', 1, false);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 248
-- Name: color_colorid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.color_colorid_seq', 1, false);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 249
-- Name: country_countryid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.country_countryid_seq', 1, false);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 250
-- Name: distrybutor_distrybutorid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.distrybutor_distrybutorid_seq', 1, false);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 231
-- Name: image_ImageId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."image_ImageId_seq"', 1, false);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 236
-- Name: item_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_itemid_seq', 1, false);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 251
-- Name: material_materialid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.material_materialid_seq', 1, false);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 233
-- Name: productitem_productitemid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.productitem_productitemid_seq', 1, false);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 252
-- Name: producttransactioninfo_producttransactioninfoid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.producttransactioninfo_producttransactioninfoid_seq', 1, false);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 253
-- Name: receipt_receiptid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.receipt_receiptid_seq', 1, false);


--
-- TOC entry 4800 (class 2606 OID 16745)
-- Name: Address Address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY ("AddressId");


--
-- TOC entry 4806 (class 2606 OID 16797)
-- Name: Buyer Buyer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Buyer"
    ADD CONSTRAINT "Buyer_pkey" PRIMARY KEY ("BuyerId");


--
-- TOC entry 4792 (class 2606 OID 16701)
-- Name: Color Color_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Color"
    ADD CONSTRAINT "Color_pkey" PRIMARY KEY ("ColorId");


--
-- TOC entry 4796 (class 2606 OID 16716)
-- Name: Country Country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Country"
    ADD CONSTRAINT "Country_pkey" PRIMARY KEY ("CountryId");


--
-- TOC entry 4766 (class 2606 OID 16465)
-- Name: DayVariant DayVariants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DayVariant"
    ADD CONSTRAINT "DayVariants_pkey" PRIMARY KEY ("DayVariantId");


--
-- TOC entry 4798 (class 2606 OID 16723)
-- Name: Distrybutor Distrybutor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Distrybutor"
    ADD CONSTRAINT "Distrybutor_pkey" PRIMARY KEY ("DistrybutorId");


--
-- TOC entry 4762 (class 2606 OID 16446)
-- Name: Employee Employee_EmployeeCode_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_EmployeeCode_key" UNIQUE ("EmployeeCode");


--
-- TOC entry 4764 (class 2606 OID 16444)
-- Name: Employee Employee_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("EmployeeId");


--
-- TOC entry 4786 (class 2606 OID 16672)
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY ("ImageId");


--
-- TOC entry 4794 (class 2606 OID 16706)
-- Name: Material Material_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Material"
    ADD CONSTRAINT "Material_pkey" PRIMARY KEY ("MaterialId");


--
-- TOC entry 4808 (class 2606 OID 16809)
-- Name: PaymentType PaymentType_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."PaymentType"
    ADD CONSTRAINT "PaymentType_pkey" PRIMARY KEY ("PaymentTypeId");


--
-- TOC entry 4774 (class 2606 OID 16534)
-- Name: ProductClassification ProductClassification_ClassificationName_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductClassification"
    ADD CONSTRAINT "ProductClassification_ClassificationName_key" UNIQUE ("ClassificationName");


--
-- TOC entry 4776 (class 2606 OID 16532)
-- Name: ProductClassification ProductClassification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductClassification"
    ADD CONSTRAINT "ProductClassification_pkey" PRIMARY KEY ("ClassificationId");


--
-- TOC entry 4804 (class 2606 OID 16770)
-- Name: ProductTransactionInfo ProductTransactionItem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransactionInfo"
    ADD CONSTRAINT "ProductTransactionItem_pkey" PRIMARY KEY ("ProductTransactionInfoId");


--
-- TOC entry 4784 (class 2606 OID 16588)
-- Name: ProductTransaction ProductTransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransaction"
    ADD CONSTRAINT "ProductTransaction_pkey" PRIMARY KEY ("TransactionId");


--
-- TOC entry 4778 (class 2606 OID 16543)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("ProductId");


--
-- TOC entry 4802 (class 2606 OID 16760)
-- Name: Receipt Receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Receipt"
    ADD CONSTRAINT "Receipt_pkey" PRIMARY KEY ("ReceiptId");


--
-- TOC entry 4770 (class 2606 OID 16505)
-- Name: StoreHour StoreHours_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StoreHour"
    ADD CONSTRAINT "StoreHours_pkey" PRIMARY KEY ("StoreHoursId");


--
-- TOC entry 4768 (class 2606 OID 16486)
-- Name: Store Store_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Store"
    ADD CONSTRAINT "Store_pkey" PRIMARY KEY ("StoreId");


--
-- TOC entry 4780 (class 2606 OID 16576)
-- Name: TransactionType TransactionType_TypeName_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TransactionType"
    ADD CONSTRAINT "TransactionType_TypeName_key" UNIQUE ("TypeName");


--
-- TOC entry 4782 (class 2606 OID 16574)
-- Name: TransactionType TransactionType_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TransactionType"
    ADD CONSTRAINT "TransactionType_pkey" PRIMARY KEY ("TransactionTypeId");


--
-- TOC entry 4772 (class 2606 OID 16645)
-- Name: StoreHour UQ_StoreDayVariant; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StoreHour"
    ADD CONSTRAINT "UQ_StoreDayVariant" UNIQUE ("StoreId", "DayVariantId");


--
-- TOC entry 4788 (class 2606 OID 16679)
-- Name: Image image_un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT image_un UNIQUE ("ImageGuid");


--
-- TOC entry 4790 (class 2606 OID 16694)
-- Name: Item item_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT item_pk PRIMARY KEY ("ItemId");


--
-- TOC entry 4836 (class 2606 OID 16746)
-- Name: Address AddressCountry_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "AddressCountry_fk" FOREIGN KEY ("CountryId") REFERENCES public."Country"("CountryId");


--
-- TOC entry 4835 (class 2606 OID 16786)
-- Name: Distrybutor AddressDistrybutor_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Distrybutor"
    ADD CONSTRAINT "AddressDistrybutor_fk" FOREIGN KEY ("AddressId") REFERENCES public."Address"("AddressId") NOT VALID;


--
-- TOC entry 4834 (class 2606 OID 16707)
-- Name: Material Color_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Material"
    ADD CONSTRAINT "Color_fk" FOREIGN KEY ("Color") REFERENCES public."Color"("ColorId") NOT VALID;


--
-- TOC entry 4813 (class 2606 OID 16466)
-- Name: DayVariant DayVariants_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DayVariant"
    ADD CONSTRAINT "DayVariants_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4814 (class 2606 OID 16471)
-- Name: DayVariant DayVariants_UpdatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DayVariant"
    ADD CONSTRAINT "DayVariants_UpdatedBy_fkey" FOREIGN KEY ("UpdatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4809 (class 2606 OID 16447)
-- Name: Employee Employee_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4810 (class 2606 OID 16452)
-- Name: Employee Employee_UpdatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_UpdatedBy_fkey" FOREIGN KEY ("UpdatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4833 (class 2606 OID 16673)
-- Name: Image Image_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4823 (class 2606 OID 16729)
-- Name: Product ProductDistrybutor_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "ProductDistrybutor_fk" FOREIGN KEY ("DistrybutonId") REFERENCES public."Distrybutor"("DistrybutorId") NOT VALID;


--
-- TOC entry 4838 (class 2606 OID 16776)
-- Name: ProductTransactionInfo ProductTransactionItemProduct_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransactionInfo"
    ADD CONSTRAINT "ProductTransactionItemProduct_fk" FOREIGN KEY ("ProductId") REFERENCES public."Product"("ProductId") NOT VALID;


--
-- TOC entry 4839 (class 2606 OID 16771)
-- Name: ProductTransactionInfo ProductTransactionItemTransaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransactionInfo"
    ADD CONSTRAINT "ProductTransactionItemTransaction_fk" FOREIGN KEY ("TransactionId") REFERENCES public."ProductTransaction"("TransactionId");


--
-- TOC entry 4827 (class 2606 OID 16798)
-- Name: ProductTransaction ProductTransaction_Buyer_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransaction"
    ADD CONSTRAINT "ProductTransaction_Buyer_fk" FOREIGN KEY ("BuyerId") REFERENCES public."Buyer"("BuyerId") NOT VALID;


--
-- TOC entry 4828 (class 2606 OID 16604)
-- Name: ProductTransaction ProductTransaction_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransaction"
    ADD CONSTRAINT "ProductTransaction_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4829 (class 2606 OID 16599)
-- Name: ProductTransaction ProductTransaction_EmployeePerformedTransaction_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransaction"
    ADD CONSTRAINT "ProductTransaction_EmployeePerformedTransaction_fkey" FOREIGN KEY ("EmployeePerformedTransaction") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4830 (class 2606 OID 16594)
-- Name: ProductTransaction ProductTransaction_StoreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransaction"
    ADD CONSTRAINT "ProductTransaction_StoreId_fkey" FOREIGN KEY ("StoreId") REFERENCES public."Store"("StoreId");


--
-- TOC entry 4831 (class 2606 OID 16589)
-- Name: ProductTransaction ProductTransaction_TransactionTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransaction"
    ADD CONSTRAINT "ProductTransaction_TransactionTypeId_fkey" FOREIGN KEY ("TransactionTypeId") REFERENCES public."TransactionType"("TransactionTypeId");


--
-- TOC entry 4832 (class 2606 OID 16609)
-- Name: ProductTransaction ProductTransaction_UpdatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductTransaction"
    ADD CONSTRAINT "ProductTransaction_UpdatedBy_fkey" FOREIGN KEY ("UpdatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4824 (class 2606 OID 16544)
-- Name: Product Product_ClassificationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_ClassificationId_fkey" FOREIGN KEY ("ClassificationId") REFERENCES public."ProductClassification"("ClassificationId");


--
-- TOC entry 4825 (class 2606 OID 16549)
-- Name: Product Product_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4826 (class 2606 OID 16554)
-- Name: Product Product_UpdatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_UpdatedBy_fkey" FOREIGN KEY ("UpdatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4837 (class 2606 OID 16761)
-- Name: Receipt ReceiptTransaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Receipt"
    ADD CONSTRAINT "ReceiptTransaction_fk" FOREIGN KEY ("TransactionId") REFERENCES public."ProductTransaction"("TransactionId");


--
-- TOC entry 4815 (class 2606 OID 16751)
-- Name: Store StoreAddress_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Store"
    ADD CONSTRAINT "StoreAddress_fk" FOREIGN KEY ("AddressId") REFERENCES public."Address"("AddressId") NOT VALID;


--
-- TOC entry 4816 (class 2606 OID 16734)
-- Name: Store StoreCountry_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Store"
    ADD CONSTRAINT "StoreCountry_fk" FOREIGN KEY ("CountryId") REFERENCES public."Country"("CountryId") NOT VALID;


--
-- TOC entry 4819 (class 2606 OID 16516)
-- Name: StoreHour StoreHours_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StoreHour"
    ADD CONSTRAINT "StoreHours_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4820 (class 2606 OID 16511)
-- Name: StoreHour StoreHours_DayVariantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StoreHour"
    ADD CONSTRAINT "StoreHours_DayVariantId_fkey" FOREIGN KEY ("DayVariantId") REFERENCES public."DayVariant"("DayVariantId");


--
-- TOC entry 4821 (class 2606 OID 16506)
-- Name: StoreHour StoreHours_StoreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StoreHour"
    ADD CONSTRAINT "StoreHours_StoreId_fkey" FOREIGN KEY ("StoreId") REFERENCES public."Store"("StoreId");


--
-- TOC entry 4822 (class 2606 OID 16521)
-- Name: StoreHour StoreHours_UpdatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StoreHour"
    ADD CONSTRAINT "StoreHours_UpdatedBy_fkey" FOREIGN KEY ("UpdatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4817 (class 2606 OID 16487)
-- Name: Store Store_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Store"
    ADD CONSTRAINT "Store_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4818 (class 2606 OID 16492)
-- Name: Store Store_UpdatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Store"
    ADD CONSTRAINT "Store_UpdatedBy_fkey" FOREIGN KEY ("UpdatedBy") REFERENCES public."Employee"("EmployeeId");


--
-- TOC entry 4811 (class 2606 OID 16781)
-- Name: Employee employeeAddresshome_flk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "employeeAddresshome_flk" FOREIGN KEY ("HomeAddressId") REFERENCES public."Address"("AddressId") NOT VALID;


--
-- TOC entry 4812 (class 2606 OID 16647)
-- Name: Employee employee_storeworkatid_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT employee_storeworkatid_fk FOREIGN KEY ("StoreWorkedAtId") REFERENCES public."Store"("StoreId");


-- Completed on 2023-09-26 22:31:50

--
-- PostgreSQL database dump complete
--

