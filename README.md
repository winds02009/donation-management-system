# Donation Management System (eDonor)

Team project (SEHS4701). A web application for managing online donations, built with J2EE and Spring Boot on MySQL.

## Features
- Donor registration and login, admin page
- Create and view donations; donor/donation records stored in MySQL via Spring Data JPA
- Email notification service (Spring Mail)
- Earlier J2EE (Servlet/JSP) version with catalogue, shopping-cart style checkout and order confirmation

## Tech stack
Java 21, Spring Boot 3.4 (Web, Data JPA, Mail), JSP/JSTL, MySQL; J2EE Servlets/JSP (Tomcat) for the earlier version

## Structure
- `spring-boot/` - Spring Boot app (`edu.sehs4701.edonor`: controller, domain, repository, service; JSP views in `WEB-INF/views`)
- `j2ee-version/` - Servlet/JSP version (`edonor` package, `shop_create.sql` / `shop_populate.sql`)
- `docs/requirements.pdf` - project specification

## How to run
Spring Boot: create MySQL database `speed`, set `spring.datasource.password` (and mail settings) in `application.properties`, then `cd spring-boot && mvnw spring-boot:run` and open http://localhost:8090.

J2EE: run `shop_create.sql` and `shop_populate.sql` in MySQL, set `dbPassword` in `web.xml`, deploy to Tomcat.