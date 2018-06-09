# coffeShop
Coffe ordering system
Project Description

Goal:

The goal of this project is to give hands on practical experience with building a Spring Boot Web Application and Web Services using the technologies we have been discussing during in class.


NOTE: In the resources/application.properties file, modify the properties for your database and run the application once (or do Maven Install for the test to execute the application). Then go comment out the line bellow, to avoid recreating the database every time it runs.

#Comment out the ddl-auto line after the first time you run the application
spring.jpa.hibernate.ddl-auto=create
Before you Start Development

Use the services provided to:

    Create, List, Delete, Update products

    Create, List, Update persons

    Create and List orders

Your web application has to:

    Provide a REST API to perform the operations above listed

    A Java client application using Spring templates or web application using Spring templates to demonstrate/test how to consume your REST services

    Provide a web application (if you use REST services to create your pages with JavaScript, do not implement this technique in more than 20% of your pages - meaning use more JSP or Thymeleaf for the web pages)

        A public area, where visitors can see the list of products

        Users can login to:

            Place orders

            Update their personal information (Users will be related to persons by email)

        Administrators can login to:

            Maintain the list of products

            Create and List persons

            List Orders
        Add a page to allow visitors (in public) to register and become users that could login to place orders. You will need to add database tables and corresponding maintenance code to support this functionality, besides adjusting the authentication provider.

