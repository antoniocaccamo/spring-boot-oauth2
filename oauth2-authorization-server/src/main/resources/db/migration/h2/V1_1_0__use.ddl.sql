DROP TABLE IF EXISTS AUTHORITY;

CREATE TABLE AUTHORITY (
  ID          INTEGER,
  AUTHORITY   VARCHAR(255),
  PRIMARY KEY (ID)
);


DROP TABLE IF EXISTS CREDENTIALS;

CREATE TABLE CREDENTIALS (
  ID        INTEGER,
  ENABLED   BOOLEAN NOT NULL,
  NAME      VARCHAR(255) NOT NULL,
  PASSWORD  VARCHAR(255) NOT NULL,
  VERSION   INTEGER,
  PRIMARY   KEY (ID)
);


DROP TABLE IF EXISTS CREDENTIALS_AUTHORITIES;

CREATE TABLE CREDENTIALS_AUTHORITIES (
  CREDENTIALS_ID BIGINT NOT NULL,
  AUTHORITIES_ID BIGINT NOT NULL,
  PRIMARY KEY (CREDENTIALS_ID, AUTHORITIES_ID)
);

ALTER TABLE CREDENTIALS_AUTHORITIES
  ADD CONSTRAINT CREDENTIALS_AUTHORITIES_AUTHORITY
    FOREIGN KEY (AUTHORITIES_ID) REFERENCES AUTHORITY
;

ALTER TABLE CREDENTIALS_AUTHORITIES
  ADD CONSTRAINT CREDENTIALS_AUTHORITIES_USER
    FOREIGN KEY (CREDENTIALS_ID) REFERENCES CREDENTIALS
;


