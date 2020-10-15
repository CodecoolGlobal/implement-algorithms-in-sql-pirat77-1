DROP SCHEMA IF EXISTS soundex CASCADE;
CREATE SCHEMA soundex;
SET search_path TO soundex;
CREATE TABLE word (
  word VARCHAR(255)
);
RESET ALL;
