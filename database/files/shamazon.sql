PGDMP     $                    y            shamazon    13.3    13.3 W               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    shamazon    DATABASE     l   CREATE DATABASE shamazon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE shamazon;
                postgres    false                       0    0    DATABASE shamazon    COMMENT     A   COMMENT ON DATABASE shamazon IS 'Shamazon multivendor database';
                   postgres    false    3091            �            1259    16407    address    TABLE     c  CREATE TABLE public.address (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    street character varying(255),
    pincode integer,
    city character varying(255),
    state character varying(255),
    landmark character varying(255),
    country character varying(255),
    is_default smallint,
    created_on time(6) with time zone NOT NULL
);
    DROP TABLE public.address;
       public         heap    postgres    false                       0    0    TABLE address    COMMENT     ;   COMMENT ON TABLE public.address IS 'address of each user';
          public          postgres    false    204                       0    0    COLUMN address.user_id    COMMENT     O   COMMENT ON COLUMN public.address.user_id IS 'id of user table as foreign key';
          public          postgres    false    204                       0    0    COLUMN address.is_default    COMMENT     V   COMMENT ON COLUMN public.address.is_default IS 'determines if it''s default address';
          public          postgres    false    204                       0    0    COLUMN address.created_on    COMMENT     B   COMMENT ON COLUMN public.address.created_on IS 'time created on';
          public          postgres    false    204            �            1259    16419    address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.address_id_seq;
       public          postgres    false    204                       0    0    address_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;
          public          postgres    false    208            �            1259    16428    address_user_id_seq    SEQUENCE     �   ALTER TABLE public.address ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.address_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            �            1259    16514 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    16512    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    219                       0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    218            �            1259    16401    orders    TABLE     4  CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    vendor_id integer NOT NULL,
    product_id integer NOT NULL,
    price character varying(20) NOT NULL,
    quantity integer NOT NULL,
    status smallint NOT NULL,
    order_on timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false                       0    0    TABLE orders    COMMENT     A   COMMENT ON TABLE public.orders IS 'store orders from customers';
          public          postgres    false    202            �            1259    16437    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    202                       0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    210            �            1259    16413    product_category    TABLE     u   CREATE TABLE public.product_category (
    id integer NOT NULL,
    category_name character varying(255) NOT NULL
);
 $   DROP TABLE public.product_category;
       public         heap    postgres    false                       0    0    TABLE product_category    COMMENT     I   COMMENT ON TABLE public.product_category IS 'category of each products';
          public          postgres    false    206            �            1259    16446    product_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.product_category_id_seq;
       public          postgres    false    206                       0    0    product_category_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_category.id;
          public          postgres    false    211            �            1259    16506    product_details    TABLE     )   CREATE TABLE public.product_details (
);
 #   DROP TABLE public.product_details;
       public         heap    postgres    false                       0    0    TABLE product_details    COMMENT     L   COMMENT ON TABLE public.product_details IS 'product details such as image';
          public          postgres    false    217            �            1259    16398    products    TABLE     �  CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    unit_price numeric(12,2) NOT NULL,
    currency character varying(10) NOT NULL,
    available_quantity integer NOT NULL,
    added_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    status smallint NOT NULL,
    description text,
    product_category integer
);
    DROP TABLE public.products;
       public         heap    postgres    false                        0    0    TABLE products    COMMENT     L   COMMENT ON TABLE public.products IS 'store products data from all vendors';
          public          postgres    false    201            !           0    0    COLUMN products.description    COMMENT     H   COMMENT ON COLUMN public.products.description IS 'product description';
          public          postgres    false    201            "           0    0     COLUMN products.product_category    COMMENT     M   COMMENT ON COLUMN public.products.product_category IS 'category of product';
          public          postgres    false    201            �            1259    16455    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    201            #           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    212            �            1259    16416    shop    TABLE     �   CREATE TABLE public.shop (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    vendor_id integer NOT NULL,
    created_on timestamp without time zone NOT NULL
);
    DROP TABLE public.shop;
       public         heap    postgres    false            $           0    0 
   TABLE shop    COMMENT     ?   COMMENT ON TABLE public.shop IS 'shop details of each vendor';
          public          postgres    false    207            �            1259    16464    shop_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.shop_id_seq;
       public          postgres    false    207            %           0    0    shop_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.shop_id_seq OWNED BY public.shop.id;
          public          postgres    false    213            �            1259    16410 
   user_phone    TABLE     �   CREATE TABLE public.user_phone (
    id integer NOT NULL,
    user_id integer NOT NULL,
    phone character varying(15) NOT NULL,
    is_default smallint NOT NULL
);
    DROP TABLE public.user_phone;
       public         heap    postgres    false            &           0    0    TABLE user_phone    COMMENT     @   COMMENT ON TABLE public.user_phone IS 'phone details of users';
          public          postgres    false    205            �            1259    16473    user_phone_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.user_phone_id_seq;
       public          postgres    false    205            '           0    0    user_phone_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_phone_id_seq OWNED BY public.user_phone.id;
          public          postgres    false    214            �            1259    16404 	   user_type    TABLE     W   CREATE TABLE public.user_type (
    id integer NOT NULL,
    type smallint NOT NULL
);
    DROP TABLE public.user_type;
       public         heap    postgres    false            (           0    0    TABLE user_type    COMMENT     L   COMMENT ON TABLE public.user_type IS 'saves if user is customer or vendor';
          public          postgres    false    203            �            1259    16482    user_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_type_id_seq;
       public          postgres    false    203            )           0    0    user_type_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.user_type_id_seq OWNED BY public.user_type.id;
          public          postgres    false    215            �            1259    16395    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_type smallint,
    address_id integer,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    token character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status smallint
);
    DROP TABLE public.users;
       public         heap    postgres    false            *           0    0    TABLE users    COMMENT     G   COMMENT ON TABLE public.users IS 'users data (vendors and customers)';
          public          postgres    false    200            �            1259    16491    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    200            +           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            _           2604    16421 
   address id    DEFAULT     h   ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);
 9   ALTER TABLE public.address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    204            c           2604    16517    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            ]           2604    16439 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    202            a           2604    16448    product_category id    DEFAULT     z   ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);
 B   ALTER TABLE public.product_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    206            \           2604    16457    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    201            b           2604    16466    shop id    DEFAULT     b   ALTER TABLE ONLY public.shop ALTER COLUMN id SET DEFAULT nextval('public.shop_id_seq'::regclass);
 6   ALTER TABLE public.shop ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    207            `           2604    16475    user_phone id    DEFAULT     n   ALTER TABLE ONLY public.user_phone ALTER COLUMN id SET DEFAULT nextval('public.user_phone_id_seq'::regclass);
 <   ALTER TABLE public.user_phone ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    205            ^           2604    16484    user_type id    DEFAULT     l   ALTER TABLE ONLY public.user_type ALTER COLUMN id SET DEFAULT nextval('public.user_type_id_seq'::regclass);
 ;   ALTER TABLE public.user_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    203            [           2604    16493    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    200            �          0    16407    address 
   TABLE DATA           w   COPY public.address (id, user_id, street, pincode, city, state, landmark, country, is_default, created_on) FROM stdin;
    public          postgres    false    204   #[                 0    16514 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    219   @[       �          0    16401    orders 
   TABLE DATA           g   COPY public.orders (id, user_id, vendor_id, product_id, price, quantity, status, order_on) FROM stdin;
    public          postgres    false    202   ][                  0    16413    product_category 
   TABLE DATA           =   COPY public.product_category (id, category_name) FROM stdin;
    public          postgres    false    206   z[                 0    16506    product_details 
   TABLE DATA           )   COPY public.product_details  FROM stdin;
    public          postgres    false    217   �[       �          0    16398    products 
   TABLE DATA           �   COPY public.products (id, name, unit_price, currency, available_quantity, added_on, updated_on, status, description, product_category) FROM stdin;
    public          postgres    false    201   �[                 0    16416    shop 
   TABLE DATA           ?   COPY public.shop (id, name, vendor_id, created_on) FROM stdin;
    public          postgres    false    207   q_       �          0    16410 
   user_phone 
   TABLE DATA           D   COPY public.user_phone (id, user_id, phone, is_default) FROM stdin;
    public          postgres    false    205   �_       �          0    16404 	   user_type 
   TABLE DATA           -   COPY public.user_type (id, type) FROM stdin;
    public          postgres    false    203   �_       �          0    16395    users 
   TABLE DATA           x   COPY public.users (id, name, user_type, address_id, email, password, token, created_at, updated_at, status) FROM stdin;
    public          postgres    false    200   �_       ,           0    0    address_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.address_id_seq', 1, false);
          public          postgres    false    208            -           0    0    address_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.address_user_id_seq', 1, false);
          public          postgres    false    209            .           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);
          public          postgres    false    218            /           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public          postgres    false    210            0           0    0    product_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.product_category_id_seq', 1, false);
          public          postgres    false    211            1           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 31, true);
          public          postgres    false    212            2           0    0    shop_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.shop_id_seq', 1, false);
          public          postgres    false    213            3           0    0    user_phone_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_phone_id_seq', 1, false);
          public          postgres    false    214            4           0    0    user_type_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_type_id_seq', 1, false);
          public          postgres    false    215            5           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    216            o           2606    16423    address address_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    204            w           2606    16519    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    219            k           2606    16441    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    202            s           2606    16450 &   product_category product_category_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.product_category DROP CONSTRAINT product_category_pkey;
       public            postgres    false    206            i           2606    16459    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    201            u           2606    16468    shop shop_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.shop DROP CONSTRAINT shop_pkey;
       public            postgres    false    207            q           2606    16477    user_phone user_phone_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_phone
    ADD CONSTRAINT user_phone_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_phone DROP CONSTRAINT user_phone_pkey;
       public            postgres    false    205            m           2606    16486    user_type user_type_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_type
    ADD CONSTRAINT user_type_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_type DROP CONSTRAINT user_type_pkey;
       public            postgres    false    203            e           2606    16501    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    200            g           2606    16495    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    200            �      x������ � �            x������ � �      �      x������ � �             x������ � �            x������ � �      �   �  x��U�n�F<7���Ƽ���Éb)RlA.#r���f����OW+g)n �@-������z����{�Ar��18��)��'P�Ǫw�#��V�b��������A[��y�|�{=j�qD@)9��[�-Լ~[3���m�5�n��v��F�2�r��G������>j��&���'���ZŎ���~6����ؙ���,տ�h����D]-kV{�=c���������<LD$H�~6�˩�F���*��ڑ��í�J��Z��U�����Qh�~���Ug��AΖ�c�9��b;�!qx3<SC���%�m���� �mE�0��1�g�uo&�'s̪2�z�h<^[�[��"ќ�T�qQ�EɼZfq�Q�iMl#�7�$�5˄�k�[�_�x��4�]�	
U/���o�f��'7����~�����Ȅ�K�7���:���nl.`0v �J�bcpJ�#�[��e
!�vr�#����x仩����,����Ne�>53��D.�z�ġ\?�ڗ.I1�,u�k�L�R�00�#�%e<��i�.�{Q�h��h��7dh��DT+(�bY�l�%i�H���I�_M|�O$QTp����?���x����F�WZHP�ղnٰu��r�퀝	Ƨ�����K�S�����H�y��8�jYLR>��t�FU���)�vح�Ze��m�'����/~L���l�������>n��wּ�b�$+i�^N-y8��q��Q{yyP�h��-V1)��H���:��L��.�E��L�����禔�J,�����*j&ݖ�����M���f�Ӯd4�vCTW��}�z��k��ϑI��"H�h&-d��,���9�F)�m��M�x�mw�����B��SF����h�t��S��M˧�p�0���Y���zG;            x������ � �      �      x������ � �      �      x������ � �      �   �   x�3�t��N-�PJ����D�@Qb���Cznbf�^r~.��Q������QH��[���^�G�{R�s^���^I��_XJY~drVN�kH���kJ��^���O�yj.�T##C]]C#3+CK+C�b1~\1z\\\ �)/     