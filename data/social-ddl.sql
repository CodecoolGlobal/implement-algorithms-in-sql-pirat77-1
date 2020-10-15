-- Creating the social network's database objects
DROP SCHEMA IF EXISTS social CASCADE;
CREATE SCHEMA social;
SET search_path TO social;
CREATE TYPE GENDER_TYPE AS ENUM (
  'male',
  'female'
);
CREATE TABLE person (
  id         SERIAL       NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name  VARCHAR(255) NOT NULL,
  gender     GENDER_TYPE  NOT NULL
);
CREATE TYPE STATUS_TYPE AS ENUM (
  'pending',
  'accepted',
  'rejected',
  'hidden'
);
CREATE TABLE friend_request (
  sender   INT         NOT NULL,
  receiver INT         NOT NULL,
  status   STATUS_TYPE NOT NULL
);
RESET ALL;
