# Spring Security Demo Application

This is Demo Spring Java application which uses **Spring Security** for:
* Handling User Login-in and Log-outs
* Handling User Roles
* Custom 403 Error page information
* Getting users credentials from database source
* Give access to sites only for users with Roles with permissions
* Use BCrypt one-way hash algorithm

Uses **Spring Tags** for:
* showing user Role and home-page menu depending on authorities
* uses form tag to prevent Cross Site Request Forgery

## Test users:
Users saved in programs memory for testing  
( user | password | role )
* john | test123| EMPLOYEE
* maria | test1234 | EMPLOYEE, MANAGER
* maks | test12345 | EMPLOYEE, ADMIN
* testEncrypted | test123 | EMPLOYEE, MANAGER, ADMIN (available with DB connection)
##### App is build with maven