drop schema if EXISTS snapshots CASCADE;
drop schema if EXISTS int_cust_n_affl CASCADE;
drop schema if EXISTS dwh_cust_n_affl CASCADE;
DO $$
DECLARE tabname RECORD;
BEGIN FOR tabname IN (
    SELECT tablename
    FROM pg_tables
    WHERE schemaname = 'public'
) LOOP EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(tabname.tablename) || ' CASCADE';
END LOOP;
END $$;

select count(1) from dwh_cust_n_affl.customers;

select * from dwh_cust_n_affl.customers where id = 1;