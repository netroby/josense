create table jo_article
(
  aid            bigserial not null
    constraint jo_article_pkey
    primary key,
  title          varchar(65536),
  content        text,
  publish_status integer,
  publish_time   bigint,
  views          bigint
);

alter table jo_article
  owner to postgres;

