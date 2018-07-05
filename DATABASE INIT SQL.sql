CREATE SCHEMA `spring-security-demo` ;
use `spring-security-demo`;

CREATE TABLE users(
	username varchar(50) not null,
    password varchar(50) not null,
    enabled tinyint(1) not null,
    
    PRIMARY KEY(username)
);

INSERT INTO users values
('johnDb', '{noop}test123',1),
('johnDb1', '{noop}test123',1),
('johnDb2', '{noop}test123',1);

CREATE TABLE authorities(
	username varchar(50) not null,
    authority varchar(50) not null,
    
    unique key `uk_usr_auth` (username, authority),
    constraint `fk_auth_usr`
		FOREIGN KEY (username) REFERENCES users(username)
) ;

INSERT INTO authorities VALUESauthorities
('johnDb', 'ROLE_EMPLOYEE'),
('johnDb1', 'ROLE_EMPLOYEE'),
('johnDb1', 'ROLE_MANAGER'),
('johnDb2', 'ROLE_EMPLOYEE'),
('johnDb2', 'ROLE_ADMIN');