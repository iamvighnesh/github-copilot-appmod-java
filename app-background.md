# Sybase Web Application

A Java web application using JSP, Servlet, and Sybase database, designed to run on Apache Tomcat.

## Project Structure

```text
app/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/
│   │   │       ├── dao/          # Data Access Objects
│   │   │       ├── model/        # Model classes
│   │   │       ├── servlet/      # Servlets
│   │   │       └── util/         # Utility classes
│   │   ├── resources/
│   │   │   └── database.sql      # Database schema
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── views/        # JSP pages
│   │       │   └── web.xml       # Web application config
│   │       └── index.jsp         # Home page
└── pom.xml                       # Maven configuration
```

## Prerequisites

- JDK 11 or higher
- Apache Maven 3.6+
- Apache Tomcat 9.0+
- Sybase ASE database

## Configuration

### Database Setup

1. Execute the SQL script in `src/main/resources/database.sql` to create the required tables
2. Update database connection settings in `src/main/java/com/example/util/DatabaseConnection.java`:
   - URL: `jdbc:sybase:Tds:localhost:5000/database_name`
   - Username: your database username
   - Password: your database password

### Sybase JDBC Driver

The Sybase jConnect JDBC driver (jconn4.jar) is specified in the pom.xml. If it's not available in Maven Central, you need to:

1. Download jconn4.jar from Sybase/SAP
2. Install it to your local Maven repository:

```bash
mvn install:install-file -Dfile=jconn4.jar -DgroupId=com.sybase.jdbc4.jdbc -DartifactId=jconn4 -Dversion=7.0 -Dpackaging=jar
```

Or place it in your Tomcat's `lib` folder.

## Build and Deploy

### Build the WAR file

```bash
mvn clean package
```

This will create `sybase-web-app.war` in the `target` directory.

### Deploy to Tomcat

1. Copy the WAR file to Tomcat's `webapps` directory:

   ```bash
   cp target/sybase-web-app.war $TOMCAT_HOME/webapps/
   ```

2. Start Tomcat:

   ```bash
   $TOMCAT_HOME/bin/startup.sh   # Linux/Mac
   $TOMCAT_HOME/bin/startup.bat  # Windows
   ```

3. Access the application at: `http://localhost:8080/sybase-web-app/`

## Features

- User management (CRUD operations)
- Connection pooling with Apache DBCP
- JSP views with JSTL
- Servlet-based MVC architecture
- Sybase database integration

## Application Endpoints

- `/` - Home page
- `/users?action=list` - List all users
- `/users?action=edit&id=<id>` - Edit user
- `/users?action=delete&id=<id>` - Delete user
- `/WEB-INF/views/user-form.jsp` - Add new user

## Troubleshooting

### Connection Issues

- Verify Sybase server is running and accessible
- Check firewall settings
- Verify database credentials in DatabaseConnection.java

### ClassNotFoundException for Sybase driver

- Ensure jconn4.jar is in the classpath
- Install the driver to Maven local repository as shown above

### 404 Errors

- Verify the WAR is deployed correctly in Tomcat
- Check Tomcat logs in `$TOMCAT_HOME/logs/`
