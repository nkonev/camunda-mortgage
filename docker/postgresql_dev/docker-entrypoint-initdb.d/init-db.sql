-- ALTER SYSTEM SET max_connections = 400;
-- Uncomment if you need to view the full postgres logs (SQL statements, ...) via `docker logs -f postgresql-test`
ALTER SYSTEM SET log_statement = 'all';
ALTER SYSTEM SET synchronous_commit = 'off'; -- https://postgrespro.ru/docs/postgrespro/9.5/runtime-config-wal.html#GUC-SYNCHRONOUS-COMMIT
-- ALTER SYSTEM SET shared_buffers='512MB';
ALTER SYSTEM SET fsync=FALSE;
ALTER SYSTEM SET full_page_writes=FALSE;
ALTER SYSTEM SET commit_delay=100000;
ALTER SYSTEM SET commit_siblings=10;
-- ALTER SYSTEM SET work_mem='50MB';
ALTER SYSTEM SET log_line_prefix = '%a %u@%d ';

create user camunda with password 'camundapassword';
create database camunda with owner camunda;
\connect camunda;
-- create extension if not exists "hstore" schema pg_catalog;
-- https://www.endpoint.com/blog/2012/10/30/postgresql-autoexplain-module
-- ALTER SYSTEM set client_min_messages = notice;
-- ALTER SYSTEM set log_min_messages = notice;
-- ALTER SYSTEM set log_min_duration_statement = -1;
-- ALTER SYSTEM set log_connections = on;
-- ALTER SYSTEM set log_disconnections = on;
-- ALTER SYSTEM set log_duration = on;
--

\connect camunda camunda;
create table mortgage_application (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    property TEXT,
    price DECIMAL,
    status VARCHAR(128) NOT NULL,
    sent BOOL NOT NULL DEFAULT FALSE,
    created_date_time TIMESTAMP NOT NULL
);