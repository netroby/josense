CREATE TABLE public.jo_article
(
    aid bigserial PRIMARY KEY NOT NULL,
    title varchar(65536),
    content text,
    publish_status integer,
    publish_time bigint,
    views bigint
);
CREATE UNIQUE INDEX jo_article_aid_uindex ON public.jo_article (aid);