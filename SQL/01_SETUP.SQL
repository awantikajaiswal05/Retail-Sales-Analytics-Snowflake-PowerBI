create or replace database retail_db;
use database retail_db;
CREATE OR REPLACE FILE FORMAT CSV_FORMAT
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"';
show file formats;
