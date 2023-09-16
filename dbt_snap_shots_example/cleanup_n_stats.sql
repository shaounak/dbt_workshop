DO $$
DECLARE tabname RECORD;
BEGIN FOR tabname IN (
    SELECT tablename
    FROM pg_tables
    WHERE schemaname = 'public'
) LOOP EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(tabname.tablename) || ' CASCADE';
END LOOP;
END $$;

DO $$
DECLARE schemaname RECORD;
BEGIN FOR schemaname IN (
    SELECT nspname as schemaname
    FROM pg_catalog.pg_namespace
    WHERE (nspname not in  ('public', 'information_schema')
    and nspname not like 'pg%')
) LOOP EXECUTE 'DROP SCHEMA IF EXISTS ' || quote_ident(schemaname.schemaname) || ' CASCADE';
END LOOP;
END $$;


select count(1) from dwh_cust_n_affl.customers;

select * from dwh_cust_n_affl.customers where id = 1;