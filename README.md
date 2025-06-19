# Complaint Management System (CMS)

## Project Overview

The Complaint Management System (CMS) is a full-stack web application built using **Jakarta EE, JSP, MySQL/MariaDB, DBCP, HTML, CSS, JavaScript, and Apache Tomcat**. The system allows internal employees to submit, view, edit, and delete their complaints, while administrative users can manage all complaints, update statuses, add remarks, and delete entries. Authentication is implemented with role-based access and session management. All backend interactions are synchronous and form-based, strictly avoiding AJAX or asynchronous HTTP requests.

## Setup and Configuration

### Prerequisites

  - **Java 21 JDK** or compatible version
  - **Apache Tomcat 11** or compatible
  - **MariaDB or MySQL** database server
  - **Maven** for dependency management

### Project Setup

1.  Clone the repository or download the project files.
2.  Ensure your `pom.xml` has compatible dependencies for JSP, Servlet API, DBCP, and MariaDB Connector.
3.  Configure database connection in `DBUtil` or your `ServletContextListener`:
    ```java
    String dbUrl = "jdbc:mariadb://localhost:3306/cms";
    String dbUser = "root"; 
    String dbPassword = "<your_password>";
    ```
4.  Build the project using Maven:
    ```sh
    mvn clean package
    ```
    This generates a `.war` file under the `target/` folder.

### Deployment

1.  Copy the `.war` file to Tomcat’s `webapps/` directory.
2.  Start Tomcat:
    ```sh
    ./catalina.sh run
    ```
3.  Access the application in a browser:
    ```
    http://localhost:8080/<your_war_name>/login
    ```

### Usage

  - **Employee Login:** `emp1` / `123`
  - **Admin Login:** `admin` / `admin`

### Notes

  - All interactions are form-based (`GET/POST`) to comply with synchronous backend requirements.
  - Minimal inline CSS is used for basic styling. You can enhance the UI as needed.
  - Ensure `target/` is ignored in `.gitignore` to avoid committing compiled files.
