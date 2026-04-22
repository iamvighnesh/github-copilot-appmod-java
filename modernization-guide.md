# Step-by-Step Modernization Guide

## Using GitHub Copilot App Modernization for Java

**Duration:** 90 minutes (guided exercises)  
**Prerequisites:** Completed [Pre-requisites](./hackathon-prerequisites.md) and reviewed [App Background](./legacy-app-background.md)

---

## Table of Contents

1. [Getting Started with GitHub Copilot](#1-getting-started-with-github-copilot)
2. [Opening and Understanding the Legacy Application](#2-opening-and-understanding-the-legacy-application)
3. [Using GitHub Copilot App Modernization Extension](#3-using-github-copilot-app-modernization-extension)
4. [Running Assessment and Analysis](#4-running-assessment-and-analysis)
5. [Understanding Assessment Results](#5-understanding-assessment-results)
6. [Modernization Planning](#6-modernization-planning)
7. [Framework Migration (Servlet to Spring Boot)](#7-framework-migration-servlet-to-spring-boot)
8. [Database Migration](#8-database-migration)
9. [Building REST APIs](#9-building-rest-apis)
10. [Testing and Validation](#10-testing-and-validation)
11. [Preparing for Cloud Deployment](#11-preparing-for-cloud-deployment)
12. [Best Practices and Tips](#12-best-practices-and-tips)

---

## 1. Getting Started with GitHub Copilot

### What is GitHub Copilot?

GitHub Copilot is an **AI pair programmer** that helps you write code faster and smarter. It uses AI models trained on billions of lines of public code to suggest:
- Complete functions
- Code snippets
- Tests
- Documentation
- Entire files

### Using Claude Sonnet 4.6 (Recommended)

For this hackathon, we **strongly recommend** using **Claude Sonnet 4.6** as your Copilot model for superior Java modernization assistance.

**Quick Verification:**
1. Open Copilot Chat panel (click chat icon in Activity Bar or press `Ctrl + Alt + I`)
2. Check the model dropdown at the top of the chat panel
3. It should show **"Claude Sonnet 4.6"** or **"Claude 3.7 Sonnet"**
4. If not, refer to the [Prerequisites guide](./hackathon-prerequisites.md#43-select-claude-sonnet-46-as-your-model-recommended) for setup steps

**Why Claude Sonnet 4.6 for this hackathon?**
- Excellent at understanding legacy Java patterns
- Superior Spring Boot code generation
- Better modernization strategy recommendations
- More accurate assessment analysis
- Clearer explanations of complex migrations

### How GitHub Copilot Works

**Input:** You provide context through:
- Comments describing what you want
- Function signatures
- Existing code in your file
- Open files in your workspace

**Output:** Copilot suggests:
- Gray "ghost text" as you type
- Multiple suggestions you can cycle through
- Code completions

### Basic Copilot Keyboard Shortcuts

| Action                      | Windows/Linux    | macOS           |
|-----------------------------|------------------|-----------------|
| Accept suggestion           | `Tab`            | `Tab`           |
| Dismiss suggestion          | `Esc`            | `Esc`           |
| Show next suggestion        | `Alt + ]`        | `Option + ]`    |
| Show previous suggestion    | `Alt + [`        | `Option + [`    |
| Trigger suggestion manually | `Alt + \`        | `Option + \`    |
| Open Copilot chat           | `Ctrl + Alt + I` | `Cmd + Alt + I` |

---

### Exercise 1.0: Verify Claude Sonnet 4.6 (2 minutes)

Before we begin, let's confirm you're using the recommended model.

1. **Open Copilot Chat:**
   - Click the chat icon in the Activity Bar (left side)
   - OR press `Ctrl + Alt + I` (Windows/Linux) or `Cmd + Alt + I` (macOS)

2. **Check the model:**
   - Look at the model dropdown at the top of the chat panel
   - Should display: **"Claude Sonnet 4.6"** or similar

3. **Verify with a question:**
   ```
   What model are you using?
   ```
   - Copilot should confirm it's using Claude Sonnet 4.6

4. **If wrong model is selected:**
   - Click the model dropdown
   - Select "Claude Sonnet 4.6" from the list
   - If not available, see [Prerequisites](./hackathon-prerequisites.md#43-select-claude-sonnet-46-as-your-model-recommended)

**✓ Checkpoint:** Claude Sonnet 4.6 is selected and verified.

---

### Exercise 1.1: Test GitHub Copilot (5 minutes)

Let's verify Copilot is working before we start modernization.

1. **Create a new Java file for testing:**
   - In VS Code, create a new file: `File > New File`
   - Save it as `CopilotTest.java` in the `app/src/main/java/com/example` folder

2. **Write a comment to trigger Copilot:**
   ```java
   // Function to calculate the factorial of a number recursively
   ```

3. **Press Enter and wait 1-2 seconds**
   - You should see gray "ghost text" appear
   - This is Copilot's suggestion

4. **Accept the suggestion:**
   - Press `Tab` to accept
   - Copilot should generate the factorial function

5. **Try another example:**
   ```java
   // Function to check if a string is a palindrome
   ```

6. **See alternative suggestions:**
   - Start typing: `public boolean isPalindrome(`
   - Press `Alt + ]` (Windows/Linux) or `Option + ]` (macOS) to cycle through alternatives

**Expected Result:** You see code suggestions appearing and can accept them with Tab.

**✓ Checkpoint:** If Copilot is not working, check:
- Status bar icon (bottom-right) shows Copilot is active
- You're signed in to GitHub in VS Code
- Internet connection is stable

**Delete `CopilotTest.java` when done - we don't need it.**

---

### Exercise 1.2: Using GitHub Copilot Chat (5 minutes)

Copilot Chat lets you have a conversation with AI about your code.

1. **Open Copilot Chat:**
   - Press `Ctrl + I` (Windows/Linux) or `Cmd + I` (macOS)
   - OR click the chat icon in the Activity Bar (left side)

2. **Ask a question about Java:**
   ```
   What are the benefits of Spring Boot over traditional Java servlets?
   ```

3. **Review the response:**
   - Copilot explains Spring Boot advantages
   - This helps understand what we'll be doing in modernization

4. **Ask about your workspace:**
   ```
   @workspace Explain the structure of this Java application
   ```
   
   The `@workspace` prefix tells Copilot to analyze your entire workspace.

5. **Ask for code explanation:**
   - Open `app/src/main/java/com/example/servlet/UserServlet.java`
   - Select the `doGet` method (lines 19-35)
   - Right-click > "Copilot" > "Explain This"
   - OR press `Ctrl + I` and type `/explain`

**✓ Checkpoint:** You can chat with Copilot and ask questions about code.

---

## 2. Opening and Understanding the Legacy Application

### Exercise 2.1: Open the Project (3 minutes)

1. **Open the workspace in VS Code:**
   ```bash
   cd c:\github\github-copilot-appmod-java
   code .
   ```
   
   OR in VS Code: `File > Open Folder > Select 'github-copilot-appmod-java'`

2. **Trust the workspace:**
   - If prompted, click "Yes, I trust the authors"
   - This enables full VS Code features

3. **Wait for Java Language Server to initialize:**
   - Look for "Java: Ready" in the status bar (bottom)
   - This may take 30-60 seconds on first open

4. **Open integrated terminal:**
   - Press `` Ctrl + ` `` (backtick) or `Terminal > New Terminal`
   - Navigate to app directory: `cd app`

---

### Exercise 2.2: Build the Legacy Application (5 minutes)

1. **Run Maven compile:**
   ```bash
   mvn clean compile
   ```

2. **Expected output:**
   ```
   [INFO] BUILD SUCCESS
   [INFO] Total time: 10.5 s
   ```

3. **If build fails:**
   - Check Java version: `java -version` (should be 11+)
   - Check Maven version: `mvn -version` (should be 3.6+)
   - Delete target folder: `rm -r target` and retry

4. **Package the application:**
   ```bash
   mvn clean package
   ```

5. **Verify WAR file created:**
   ```bash
   ls target/sybase-web-app.war
   ```

**✓ Checkpoint:** Application compiles successfully with no errors.

---

### Exercise 2.3: Explore the Codebase with Copilot (10 minutes)

Use Copilot to understand the application faster.

**Codebase at a Glance:**
- **~800 lines** of application code (472 Java, 281 JSP, 46 SQL)
- **7 Java files** (servlets, DAOs, models, utilities)
- **3 JSP view files** (server-side rendered UI)
- **2 SQL files** (schema and stored procedures)

1. **Open Copilot Chat panel** (if not already open)

2. **Ask about the overall structure:**
   ```
   @workspace Provide a summary of this Java web application including its architecture, technologies used, and main components
   ```

3. **Ask about specific files:**
   ```
   @workspace What does UserServlet.java do? Explain its responsibilities and methods.
   ```

4. **Identify modernization candidates:**
   ```
   @workspace What parts of this application use outdated or legacy patterns that should be modernized?
   ```

5. **Ask about dependencies:**
   ```
   @workspace Analyze the pom.xml file and identify which dependencies are outdated or should be replaced in a modern application
   ```

6. **Document your findings:**
   - Create a new file: `modernization-notes.md`
   - Use Copilot to help document:
   ```
   # Modernization Notes
   
   ## Current State
   // Ask Copilot to fill this in based on workspace analysis
   
   ## Issues Identified
   // List issues found
   
   ## Modernization Goals
   // What we want to achieve
   ```

**💡 Tip:** Use `@workspace` to give Copilot context about your entire project, not just the current file.

---

## 3. Using GitHub Copilot App Modernization Extension

### What is GitHub Copilot App Modernization for Java?

This extension provides specialized capabilities for Java application modernization:

- **Automated Assessment:** Scans your codebase for modernization opportunities
- **Migration Guidance:** Suggests patterns and frameworks
- **Code Generation:** Generates Spring Boot equivalents
- **Best Practices:** Applies modern Java patterns
- **Azure Integration:** Prepares apps for cloud deployment

---

### Exercise 3.1: Access the Extension (3 minutes)

1. **Verify extension is installed:**
   - Press `Ctrl + Shift + X` to open Extensions view
   - Search for "App Modernization" or "Migrate Java to Azure"
   - Should show "GitHub Copilot App Modernization for Java" as installed

2. **Open the extension panel:**
   - Look for the App Modernization icon in the Activity Bar (left side)
   - It looks like a migration/transformation icon
   - Click to open the panel

3. **Alternative access:**
   - Press `Ctrl + Shift + P` (Command Palette)
   - Type "App Modernization"
   - See available commands

**✓ Checkpoint:** Extension panel is visible and accessible.

---

### Exercise 3.2: Configure Extension Settings (3 minutes)

1. **Open Settings:**
   - `File > Preferences > Settings` (Windows/Linux)
   - `Code > Preferences > Settings` (macOS)
   - OR press `Ctrl + ,`

2. **Search for "App Modernization" or "Java Migrate"**

3. **Key settings to verify/configure:**
   - **Target Framework:** Spring Boot
   - **Target Java Version:** Java 17 or Java 21
   - **Target Database:** Azure SQL Database
   - **Assessment Level:** Full (for comprehensive analysis)

4. **Azure settings (optional for deployment):**
   - Sign in to Azure (if you have subscription)
   - Select target subscription
   - Select target region (e.g., East US)

**Note:** For hackathon, we'll focus on modernization first. Azure deployment is optional based on time.

---

## 4. Running Assessment and Analysis

### What is Application Assessment?

Assessment scans your Java application to identify:
- Legacy patterns and anti-patterns
- Security vulnerabilities
- Outdated dependencies
- Database dependencies
- Modernization opportunities
- Estimated migration effort

---

### Exercise 4.1: Run Full Assessment (5 minutes)

1. **Open Command Palette:**
   - Press `Ctrl + Shift + P` (Windows/Linux) or `Cmd + Shift + P` (macOS)

2. **Run assessment:**
   - Type: `GitHub Copilot modernization: Open Assessment List`
   - Press Enter

3. **Select assessment scope:**
   - Choose "Recommended Assessment" (analyzes entire codebase)

4. **Wait for assessment to complete:**
   - Progress shown in status bar
   - Typically takes 1-3 minutes
   - Watch the Output panel: `View > Output > App Modernization`

5. **Assessment complete notification:**
   - Toast notification appears when done
   - Click "View Results" to see report

**✓ Checkpoint:** Assessment completes without errors and report is generated.

---

### Exercise 4.2: Review Assessment Dashboard (5 minutes)

The assessment generates a detailed report.

1. **Open the Assessment Report:**
   - Should open automatically after assessment
   - OR find in `.appmodernization` folder
   - Look for `assessment-report.html` or `assessment.json`

2. **Review key sections:**

   **a) Overview Summary:**
   - Total files analyzed
   - Overall health score
   - Recommended modernization strategy

   **b) Technology Stack:**
   - Current Java version (Java 8)
   - Current frameworks (Servlets, JSP)
   - Database (Sybase)
   - Dependencies inventory

   **c) Issues Found:**
   - Critical: Security vulnerabilities
   - High: Deprecated APIs
   - Medium: Code smells
   - Low: Minor improvements

   **d) Modernization Opportunities:**
   - Framework migration (Servlet → Spring Boot)
   - Database migration (Sybase → Azure SQL)
   - API creation (Add REST endpoints)
   - Security improvements (Add authentication)

3. **Export findings:**
   - Save assessment report for reference
   - You'll use this to prioritize modernization tasks

**💡 Tip:** Keep this report open in a browser tab for reference throughout the hackathon.

---

## 5. Understanding Assessment Results

### Exercise 5.1: Analyze Critical Findings (10 minutes)

Let's dig into the issues found and understand what they mean.

#### Finding #1: Hardcoded Database Credentials

**Location:** `DatabaseConnection.java:11-13`

```java
dataSource.setUsername("sa");
dataSource.setPassword("Welcome1234!");  // ⚠️ Security Risk
```

**Risk Level:** CRITICAL  
**Category:** Security Vulnerability

**Why it's a problem:**
- Credentials committed to source control
- Anyone with repo access can see password
- Password visible in compiled code
- Compliance violations (PCI, SOC2, HIPAA)

**Recommended fix:**
- Use environment variables
- Use Azure Key Vault for production
- Never commit secrets to Git

**Ask Copilot:**
```
How do I externalize database credentials in Spring Boot?
```

---

#### Finding #2: Old Java Version (Java 8)

**Location:** `pom.xml:17-18`

```xml
<maven.compiler.source>1.8</maven.compiler.source>
<maven.compiler.target>1.8</maven.compiler.target>
```

**Risk Level:** HIGH  
**Category:** Outdated Technology

**Why it's a problem:**
- Java 8 public updates ended in 2019
- Missing modern language features
- Performance improvements in newer versions
- Security vulnerabilities

**Recommended fix:**
- Upgrade to Java 17 LTS (or Java 21)
- Update pom.xml compiler settings
- Test for breaking changes

---

#### Finding #3: Legacy Servlet Architecture

**Location:** `UserServlet.java` (entire file)

**Risk Level:** MEDIUM  
**Category:** Architectural Debt

**Why it's a problem:**
- Verbose boilerplate code
- Manual request routing
- No REST API support
- Hard to test
- Limited functionality

**Recommended fix:**
- Migrate to Spring Boot with Spring MVC
- Use `@RestController` and `@RequestMapping`
- Auto-configuration benefits
- Reduce code by 50%+

---

#### Finding #4: Sybase Database Dependency

**Location:** `pom.xml:43-47`, `DatabaseConnection.java:11`

**Risk Level:** HIGH  
**Category:** Vendor Lock-in

**Why it's a problem:**
- Proprietary database (expensive)
- Non-standard SQL syntax
- Limited cloud support
- Shrinking community

**Recommended fix:**
- Migrate to PostgreSQL (open source)
- OR Azure SQL Database (managed)
- Use Spring Data JPA (database agnostic)
- Abstract SQL dialects

---

#### Finding #5: No Authentication/Authorization

**Location:** Entire application

**Risk Level:** CRITICAL  
**Category:** Security Vulnerability

**Why it's a problem:**
- Anyone can access all endpoints
- No user identity verification
- No access control
- Data breach risk

**Recommended fix:**
- Implement Spring Security
- Add Azure AD integration
- Role-based access control (RBAC)
- OAuth 2.0 / OpenID Connect

---

### Exercise 5.2: Prioritize Modernization Tasks (5 minutes)

Based on assessment results, let's prioritize what to modernize.

1. **Use Copilot to create a task list:**
   - Open Copilot Chat
   - Ask:
   ```
   Based on the assessment results for this Java application, create a prioritized modernization roadmap with tasks ordered by importance and dependencies. Include estimated effort for each task.
   ```

2. **Review the suggested roadmap:**
   
   **Example output:**
   ```markdown
   # Modernization Roadmap
   
   ## Phase 1: Foundation (30 min)
   1. ✓ Setup Spring Boot project structure
   2. ✓ Migrate User model to JPA Entity
   3. ✓ Update pom.xml to Java 17 and Spring Boot
   
   ## Phase 2: Framework Migration (40 min)
   4. ☐ Replace UserDAO with Spring Data JPA Repository
   5. ☐ Convert UserServlet to Spring REST Controller
   6. ☐ Remove JSP pages (or replace with Thymeleaf)
   
   ## Phase 3: Database Migration (20 min)
   7. ☐ Update schema for Azure SQL compatibility
   8. ☐ Fix Sybase-specific SQL queries
   9. ☐ Prepare for Azure SQL deployment
   
   ## Phase 4: Security & Config (20 min)
   10. ☐ Externalize configuration to application.properties
   11. ☐ Remove hardcoded credentials
   12. ☐ Add Spring Security (time permitting)
   ```

3. **Save this roadmap:**
   - Copy to `modernization-roadmap.md` in your workspace
   - Use it to track progress during hackathon

**✓ Checkpoint:** You have a clear, prioritized list of modernization tasks.

---

## 6. Modernization Planning

Before we start coding, let's plan the modernization strategy.

### Exercise 6.1: Choose Modernization Strategy (5 minutes)

There are several approaches to modernization:

#### Strategy A: Big Bang (Full Rewrite)
**Approach:** Rewrite application from scratch in Spring Boot  
**Pros:** Clean slate, modern patterns  
**Cons:** High risk, time-consuming, hard to validate  
**Best for:** Small apps, complete architecture change

#### Strategy B: Strangler Fig (Incremental)
**Approach:** Gradually replace old code with new  
**Pros:** Lower risk, continuous delivery  
**Cons:** Longer timeline, both systems running  
**Best for:** Large apps, production systems

#### Strategy C: Hybrid (Lift and Modernize)
**Approach:** Keep structure, upgrade technologies  
**Pros:** Fast, lower risk, maintains functionality  
**Cons:** Some legacy patterns remain  
**Best for:** Time-constrained modernizations, POCs

**For this hackathon, we'll use Strategy C (Hybrid):**
- Keep User model and business logic structure
- Replace Servlet with Spring Boot controller
- Replace JDBC DAO with Spring Data JPA
- Update dependencies and Java version
- Add REST API endpoints

---

### Exercise 6.2: Define Success Criteria (5 minutes)

What does "success" look like after modernization?

**Use Copilot to help define criteria:**
```
Based on this legacy Java servlet application, what should be the success criteria for modernization to Spring Boot? List functional, non-functional, and technical success metrics.
```

**Suggested success criteria:**

**Functional Requirements:**
- [ ] All CRUD operations work (Create, Read, Update, Delete users)
- [ ] Data is preserved during migration
- [ ] No loss of existing features
- [ ] REST API endpoints respond correctly

**Non-Functional Requirements:**
- [ ] Application starts in < 10 seconds
- [ ] Response time < 500ms for API calls
- [ ] Zero security vulnerabilities (high/critical)
- [ ] Code reduced by 40%+ (through Spring Data)

**Technical Requirements:**
- [ ] Java 17+ compilation target
- [ ] Spring Boot 3.x framework
- [ ] Azure SQL Database or H2 (in-memory) compatibility
- [ ] No hardcoded credentials
- [ ] Unit tests for core functionality (80% coverage)
- [ ] Passes Maven build: `mvn clean test`

---

## 7. Framework Migration (Servlet to Spring Boot)

Now the fun begins! We'll use GitHub Copilot to help migrate from Servlets to Spring Boot.

---

### Exercise 7.1: Generate Spring Boot Project Structure (10 minutes)

1. **Create a new Spring Boot project folder:**
   ```bash
   cd c:\github\github-copilot-appmod-java
   mkdir app-modernized
   cd app-modernized
   ```

2. **Use Copilot to generate pom.xml:**
   - Create new file: `pom.xml`
   - Write a comment:
   ```xml
   <!-- Spring Boot 3.2 Maven POM for user management application
        - Java 17
        - Spring Boot Starter Web
        - Spring Boot Starter Data JPA
        - Azure SQL Database driver (mssql-jdbc)
        - H2 database for local testing
        - Spring Boot Starter Test
   -->
   ```

3. **Press Enter and let Copilot generate:**
   - Accept Copilot's suggestion
   - It should generate a complete Spring Boot pom.xml

4. **Review and adjust if needed:**
   ```xml
   <parent>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-parent</artifactId>
       <version>3.2.0</version>
   </parent>
   
   <properties>
       <java.version>17</java.version>
   </properties>
   ```

5. **Alternative: Use Spring Initializr via Copilot:**
   - In Copilot Chat:
   ```
   Generate a Spring Boot project configuration for a user management REST API with JPA and Azure SQL Database
   ```

6. **Verify Maven build:**
   ```bash
   mvn clean compile
   ```

**✓ Checkpoint:** Spring Boot project structure created with valid pom.xml.

---

### Exercise 7.2: Migrate User Model to JPA Entity (10 minutes)

Let's convert the plain Java `User` class to a JPA entity.

1. **Open the legacy User.java:**
   ```bash
   code ../app/src/main/java/com/example/model/User.java
   ```

2. **Create new User entity:**
   - In `app-modernized`, create: `src/main/java/com/example/model/User.java`

3. **Copy the legacy User class content**

4. **Ask Copilot to convert to JPA entity:**
   - Select all code in the file
   - Press `Ctrl + I` to open inline chat
   - Type:
   ```
   Convert this plain Java class to a JPA entity with proper annotations for Azure SQL Database
   ```

5. **Copilot should add:**
   ```java
   @Entity
   @Table(name = "users")
   public class User {
       @Id
       @GeneratedValue(strategy = GenerationType.IDENTITY)
       private Integer id;
       
       @Column(nullable = false, unique = true, length = 50)
       private String username;
       
       @Column(name = "firstname", length = 50)
       private String firstname;
       
       // ... other fields with annotations
   }
   ```

6. **Add Lombok to reduce boilerplate (optional but recommended):**
   - In pom.xml, add dependency (ask Copilot for Lombok dependency)
   - Add to User class:
   ```java
   @Data
   @NoArgsConstructor
   @AllArgsConstructor
   @Entity
   @Table(name = "users")
   public class User {
       // Fields only - getters/setters generated by Lombok
   }
   ```

7. **Ask Copilot to explain what changed:**
   ```
   Explain the differences between the legacy User class and this JPA entity version
   ```

**✓ Checkpoint:** User class is now a JPA entity with proper annotations.

---

### Exercise 7.3: Create Spring Data JPA Repository (5 minutes)

Replace the entire UserDAO with a Spring Data JPA Repository interface.

1. **Create repository interface:**
   - New file: `src/main/java/com/example/repository/UserRepository.java`

2. **Write a comment:**
   ```java
   // Spring Data JPA repository for User entity with standard CRUD operations
   ```

3. **Let Copilot generate:**
   ```java
   package com.example.repository;
   
   import com.example.model.User;
   import org.springframework.data.jpa.repository.JpaRepository;
   import org.springframework.stereotype.Repository;
   
   @Repository
   public interface UserRepository extends JpaRepository<User, Integer> {
       // Spring Data auto-implements:
       // - findAll()
       // - findById()
       // - save()
       // - deleteById()
       // - and 20+ more methods!
   }
   ```

4. **Ask Copilot about the benefits:**
   ```
   How many lines of code did we eliminate by using Spring Data JPA instead of the UserDAO?
   ```

**Result:** 126 lines of JDBC code (UserDAO.java) replaced by ~5 lines! This is the power of modern frameworks.

**✓ Checkpoint:** Repository interface created - no implementation needed!

---

### Exercise 7.4: Create Spring Boot REST Controller (15 minutes)

Replace UserServlet with a modern Spring Boot REST controller.

1. **Create controller class:**
   - New file: `src/main/java/com/example/controller/UserController.java`

2. **Start with a comment describing what we need:**
   ```java
   /*
    * REST Controller for User management
    * Endpoints:
    * - GET /api/users - Get all users
    * - GET /api/users/{id} - Get user by ID
    * - POST /api/users - Create new user
    * - PUT /api/users/{id} - Update user
    * - DELETE /api/users/{id} - Delete user
    */
   ```

3. **Let Copilot generate the controller:**
   - Press Enter after comment
   - Copilot should suggest the class structure

4. **If Copilot needs help, start with class definition:**
   ```java
   @RestController
   @RequestMapping("/api/users")
   public class UserController {
       
       @Autowired
       private UserRepository userRepository;
       
       // Copilot will suggest methods...
   }
   ```

5. **Accept Copilot suggestions for each endpoint:**

   **Example - Get all users:**
   ```java
   // Type comment:
   // GET endpoint to retrieve all users
   
   // Copilot suggests:
   @GetMapping
   public List<User> getAllUsers() {
       return userRepository.findAll();
   }
   ```

   **Example - Get by ID:**
   ```java
   // GET endpoint to retrieve user by ID with error handling
   @GetMapping("/{id}")
   public ResponseEntity<User> getUserById(@PathVariable Integer id) {
       return userRepository.findById(id)
           .map(ResponseEntity::ok)
           .orElse(ResponseEntity.notFound().build());
   }
   ```

6. **Ask Copilot to complete the rest:**
   - In Copilot Chat:
   ```
   Complete the UserController with POST, PUT, and DELETE endpoints following REST best practices
   ```

7. **Review generated code:**
   - Ensure proper HTTP status codes (201 for created, 204 for deleted)
   - Error handling with ResponseEntity
   - Validation annotations (optional: `@Valid`)

**✓ Checkpoint:** Complete REST controller with all CRUD endpoints.

---

### Exercise 7.5: Create Spring Boot Application Class (5 minutes)

Every Spring Boot app needs a main application class.

1. **Create main class:**
   - New file: `src/main/java/com/example/Application.java`

2. **Ask Copilot:**
   ```java
   // Spring Boot main application class with embedded Tomcat
   ```

3. **Accept suggestion:**
   ```java
   package com.example;
   
   import org.springframework.boot.SpringApplication;
   import org.springframework.boot.autoconfigure.SpringBootApplication;
   
   @SpringBootApplication
   public class Application {
       public static void main(String[] args) {
           SpringApplication.run(Application.class, args);
       }
   }
   ```

4. **That's it!** No web.xml, no Tomcat configuration needed.

**✓ Checkpoint:** Application can start with `mvn spring-boot:run`.

---

## 8. Database Migration

### Exercise 8.1: Create application.properties (10 minutes)

Externalize all configuration - no more hardcoded values!

1. **Create configuration file:**
   - New file: `src/main/resources/application.properties`

2. **Ask Copilot for database configuration:**
   ```properties
   # Spring Boot configuration for Azure SQL Database
   # with connection pooling and JPA settings
   ```

3. **Copilot should generate:**
   ```properties
   # Database Configuration
   spring.datasource.url=${DATABASE_URL:jdbc:sqlserver://localhost:1433;databaseName=userdb}
   spring.datasource.username=${DATABASE_USERNAME:sa}
   spring.datasource.password=${DATABASE_PASSWORD:}
   spring.datasource.driver-class-name=com.microsoft.sqlserver.jdbc.SQLServerDriver
   
   # JPA Configuration
   spring.jpa.hibernate.ddl-auto=update
   spring.jpa.show-sql=true
   spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.SQLServerDialect
   spring.jpa.properties.hibernate.format_sql=true
   
   # Connection Pool
   spring.datasource.hikari.maximum-pool-size=10
   spring.datasource.hikari.minimum-idle=5
   
   # Application
   server.port=8080
   ```

4. **Notice the environment variable pattern:**
   ```properties
   ${DATABASE_URL:jdbc:sqlserver://localhost:1433;databaseName=userdb}
   #   ^             ^
   #   |             |
   #   |             Default value if env var not set
   #   Environment variable name
   ```

5. **For development, create application-dev.properties:**
   ```properties
   # Development profile with H2 in-memory database (SQL Server compatible mode)
   spring.datasource.url=jdbc:h2:mem:testdb;MODE=MSSQLServer
   spring.datasource.driver-class-name=org.h2.Driver
   spring.jpa.hibernate.ddl-auto=create-drop
   spring.h2.console.enabled=true
   ```

**Note:** For this hackathon, we're using H2 in-memory database with SQL Server compatibility mode for local testing. The actual Azure SQL Database connection will be configured during Azure deployment.

**✓ Checkpoint:** Configuration externalized, no hardcoded credentials!

---

### Exercise 8.2: Create Database Schema (5 minutes)

Spring Boot with JPA can auto-create schema, but for production we prefer explicit DDL.

1. **Create schema file:**
   - New file: `src/main/resources/schema.sql`

2. **Ask Copilot to convert Sybase schema:**
   - Open `../app/src/main/resources/database.sql`
   - Copy the Sybase DDL
   - In Copilot Chat:
   ```
   Convert this Sybase DDL to Azure SQL-compatible DDL:
   [paste Sybase DDL]
   ```

3. **Copilot converts Sybase specifics:**
   - `IDENTITY` → `SERIAL` or `GENERATED ALWAYS AS IDENTITY`
   - `GETDATE()` → `CURRENT_TIMESTAMP`
   - `VARCHAR` sizes adjusted if needed
   - Removes Sybase-specific keywords

4. **Example conversion:**
   
   **Before (Sybase):**
   ```sql
   CREATE TABLE users (
       id INT IDENTITY PRIMARY KEY,
       username VARCHAR(50) NOT NULL UNIQUE,
       created_date DATETIME DEFAULT GETDATE()
   )
   ```

   **After (Azure SQL):**
   ```sql
   CREATE TABLE users (
       id INT IDENTITY(1,1) PRIMARY KEY,
       username VARCHAR(50) NOT NULL UNIQUE,
       created_date DATETIME2 DEFAULT GETDATE()
   );
   ```

5. **Create sample data:**
   - New file: `src/main/resources/data.sql`
   - Ask Copilot to generate INSERT statements

**✓ Checkpoint:** Database schema ready for Azure SQL Database.

**Note:** During the hackathon, you won't deploy an actual Azure SQL database. The code modernization prepares the application to be Azure SQL-ready for future deployment.

---

### Exercise 8.3: Handle Database-Specific SQL (5 minutes)

The `getTopUsers()` method uses Sybase-specific SQL. Let's fix it.

1. **Review the problematic code:**
   ```java
   // In UserDAO.java
   stmt.execute("SET ROWCOUNT 3");  // Sybase-specific!
   ```

2. **With Spring Data JPA, this becomes trivial:**
   - Open `UserRepository.java`
   
   - Add a method:
   ```java
   // Spring Data JPA query to get top 3 users ordered by ID
   ```

3. **Copilot should suggest:**

   ```java
   List<User> findTop3ByOrderByIdAsc();
   ```

4. **That's it!** Spring Data JPA:
   - Parses the method name
   - Generates the SQL query
   - Handles database dialect differences
   - Works on any database (Azure SQL, MySQL, H2, etc.)

5. **No more database-specific SQL!**

**✓ Checkpoint:** Database-agnostic queries using Spring Data JPA.

---

## 9. Building REST APIs

### Exercise 9.1: Test REST Endpoints (10 minutes)

Let's verify our new REST API works.

1. **Start the application:**

   ```bash
   mvn spring-boot:run
   ```

2. **Wait for startup:**

   ```text
   Started Application in 3.254 seconds
   ```

3. **Test with curl (or Postman):**

   **Get all users:**

   ```bash
   curl http://localhost:8080/api/users
   ```

   **Create a user:**

   ```bash
   curl -X POST http://localhost:8080/api/users \
     -H "Content-Type: application/json" \
     -d '{
       "username": "johndoe",
       "firstname": "John",
       "lastname": "Doe",
       "email": "john@example.com"
     }'
   ```

   **Get user by ID:**

   ```bash
   curl http://localhost:8080/api/users/1
   ```

   **Update user:**

   ```bash
   curl -X PUT http://localhost:8080/api/users/1 \
     -H "Content-Type: application/json" \
     -d '{
       "id": 1,
       "username": "johndoe",
       "firstname": "John",
       "lastname": "Doe Updated",
       "email": "john.updated@example.com"
     }'
   ```

   **Delete user:**

   ```bash
   curl -X DELETE http://localhost:8080/api/users/1
   ```

4. **Use VS Code REST Client (optional):**

   - Install "REST Client" extension
   - Create `test-api.http` file:

   ```http
   ### Get all users
   GET http://localhost:8080/api/users
   
   ### Create user
   POST http://localhost:8080/api/users
   Content-Type: application/json
   
   {
     "username": "testuser",
     "firstname": "Test",
     "lastname": "User",
     "email": "test@example.com"
   }
   ```
   - Click "Send Request" above each request

**✓ Checkpoint:** All REST endpoints respond correctly.

---

### Exercise 9.2: Add API Documentation with Swagger (Optional, 10 minutes)

Spring Boot makes it easy to add interactive API documentation.

1. **Add Swagger dependency:**

   - Ask Copilot:

   ```text
   Add springdoc-openapi dependency to pom.xml for Swagger UI
   ```

2. **Copilot adds to pom.xml:**

   ```xml
   <dependency>
       <groupId>org.springdoc</groupId>
       <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
       <version>2.2.0</version>
   </dependency>
   ```

3. **Add API documentation annotations:**
   - In `UserController.java`, above class:

   ```java
   @RestController
   @RequestMapping("/api/users")
   @Tag(name = "User Management", description = "APIs for managing users")
   public class UserController {
   ```

4. **Document an endpoint:**

   ```java
   @Operation(summary = "Get all users", description = "Retrieves a list of all users")
   @ApiResponse(responseCode = "200", description = "Successfully retrieved users")
   @GetMapping
   public List<User> getAllUsers() {
       return userRepository.findAll();
   }
   ```

5. **Restart app and visit:**
   - **Swagger UI:** http://localhost:8080/swagger-ui.html
   - **OpenAPI spec:** http://localhost:8080/v3/api-docs

6. **Test APIs directly from Swagger UI!**

**✓ Checkpoint:** Interactive API documentation available.

---

## 10. Testing and Validation

### Exercise 10.1: Generate Unit Tests with Copilot (15 minutes)

Let's use Copilot to generate tests for our modernized code.

1. **Create test for UserController:**
   - New file: `src/test/java/com/example/controller/UserControllerTest.java`

2. **Ask Copilot to generate tests:**

   ```java
   // JUnit 5 test class for UserController
   // Using MockMvc and Mockito
   // Test all CRUD endpoints with success and error cases
   ```

3. **Copilot generates comprehensive tests:**

   ```java
   @WebMvcTest(UserController.class)
   public class UserControllerTest {
       
       @Autowired
       private MockMvc mockMvc;
       
       @MockBean
       private UserRepository userRepository;
       
       @Test
       void testGetAllUsers() throws Exception {
           // Copilot generates test...
       }
       
       @Test
       void testCreateUser() throws Exception {
           // Copilot generates test...
       }
       
       // More tests...
   }
   ```

4. **Ask Copilot for repository tests:**
   - New file: `src/test/java/com/example/repository/UserRepositoryTest.java`
   - Comment: `// Spring Data JPA test for UserRepository using H2 database`

5. **Run tests:**

   ```bash
   mvn test
   ```

6. **Check coverage:**

   ```bash
   mvn clean test jacoco:report
   # Report in target/site/jacoco/index.html
   ```

**✓ Checkpoint:** Tests passing with >70% coverage.

---

### Exercise 10.2: Integration Testing (10 minutes)

Test the full stack together.

1. **Create integration test:**
   - New file: `src/test/java/com/example/UserIntegrationTest.java`

2. **Ask Copilot:**

   ```java
   // Spring Boot integration test using TestRestTemplate
   // Testing full CRUD flow with real database
   // Use @SpringBootTest annotation
   ```

3. **Copilot generates:**

   ```java
   @SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
   public class UserIntegrationTest {
       
       @Autowired
       private TestRestTemplate restTemplate;
       
       @Test
       void testCreateAndRetrieveUser() {
           // Create user
           User newUser = new User();
           newUser.setUsername("testuser");
           newUser.setFirstname("Test");
           newUser.setLastname("User");
           newUser.setEmail("test@example.com");
           
           ResponseEntity<User> response = restTemplate.postForEntity(
               "/api/users", newUser, User.class);
           
           assertEquals(HttpStatus.CREATED, response.getStatusCode());
           assertNotNull(response.getBody().getId());
           
           // Retrieve user
           User retrieved = restTemplate.getForObject(
               "/api/users/" + response.getBody().getId(), User.class);
           
           assertEquals("testuser", retrieved.getUsername());
       }
   }
   ```

4. **Run integration tests:**

   ```bash
   mvn verify
   ```

**✓ Checkpoint:** Integration tests pass, confirming end-to-end functionality.

---

## 11. Preparing for Cloud Deployment

### Exercise 11.1: Create Dockerfile (10 minutes)

Containerize the application for cloud deployment.

1. **Create Dockerfile:**
   - New file: `Dockerfile` (in app-modernized root)

2. **Ask Copilot:**

   ```dockerfile
   # Multi-stage Dockerfile for Spring Boot application
   # Stage 1: Build with Maven
   # Stage 2: Runtime with OpenJDK 17
   # Optimize for Azure Container Apps
   ```

3. **Copilot generates:**

   ```dockerfile
   # Build stage
   FROM maven:3.9-eclipse-temurin-17 AS build
   WORKDIR /app
   COPY pom.xml .
   COPY src ./src
   RUN mvn clean package -DskipTests
   
   # Runtime stage
   FROM eclipse-temurin:17-jre-alpine
   WORKDIR /app
   COPY --from=build /app/target/*.jar app.jar
   EXPOSE 8080
   ENTRYPOINT ["java", "-jar", "app.jar"]
   ```

4. **Build Docker image:**

   ```bash
   docker build -t user-management-api:latest .
   ```

5. **Run locally:**

   ```bash
   docker run -p 8080:8080 \
     -e DATABASE_URL=jdbc:h2:mem:testdb \
     user-management-api:latest
   ```

6. **Test:** [http://localhost:8080/api/users](http://localhost:8080/api/users)

**✓ Checkpoint:** Application runs in Docker container.

---

### Exercise 11.2: Create Azure Deployment Configuration (Optional, 10 minutes)

If time permits and you have Azure access.

1. **Use App Modernization extension:**
   - Open Command Palette: `Ctrl + Shift + P`
   - Run: `App Modernization: Generate Azure Configuration`
   - Select deployment target:
     - Azure App Service (simpler)
     - Azure Container Apps (modern, recommended)
     - Azure Kubernetes Service (advanced)

2. **Extension generates:**
   - `azure.yaml` - Azure Developer CLI config
   - `bicep/` - Infrastructure as Code files
   - GitHub Actions workflow
   - Environment configuration

3. **Deploy to Azure (if configured):**

   ```bash
   # Install Azure Developer CLI (azd)
   winget install Microsoft.AzureDeveloperCLI
   
   # Login
   azd auth login
   
   # Initialize (if not already done)
   azd init
   
   # Deploy
   azd up
   ```

4. **Extension handles:**
   - Creating resource group
   - Provisioning database
   - Deploying application
   - Configuring networking
   - Setting up CI/CD

**✓ Checkpoint:** Application deployed to Azure (optional).

---

## 12. Best Practices and Tips

### Using GitHub Copilot Effectively

#### 1. Write Clear Comments

**Good:**

```java
// REST endpoint to retrieve user by ID with error handling for not found
```

**Bad:**

```java
// get user
```

#### 2. Provide Context

- Keep related files open in tabs
- Use `@workspace` in chat for project-wide context
- Reference existing code patterns

#### 3. Iterate and Refine

- Accept suggestion, then ask for improvements
- Example: "Make this code more efficient" or "Add error handling"

#### 4. Use Chat for Explanations

```
Explain what @Transactional does in Spring Boot
```

#### 5. Generate Tests Easily

- Select a method
- Right-click > Copilot > Generate Tests

---

### Common Copilot Shortcuts

| Task                  | How to Use Copilot                   |
|-----------------------|--------------------------------------|
| Generate from comment | Write comment, press Enter           |
| Generate entire class | Write class comment at top           |
| Complete method       | Type signature, let Copilot complete |
| Generate tests        | Select method, ask Copilot chat      |
| Refactor code         | Select code, Ctrl+I, ask to refactor |
| Explain code          | Select code, right-click > Explain   |
| Fix errors            | Click error, Copilot suggests fix    |

---

### Troubleshooting Tips

#### Copilot Not Suggesting

1. Check internet connection
2. Verify Copilot icon in status bar is active
3. Try manual trigger: `Alt + \` or `Option + \`
4. Reload VS Code window

#### Build Failures

1. Check Java version: `java -version`
2. Clean Maven cache: `mvn clean`
3. Update dependencies: `mvn dependency:resolve`
4. Check pom.xml for typos

#### Application Won't Start

1. Check port 8080 is not in use
2. Verify database connection in application.properties
3. Check logs in console
4. Use `mvn spring-boot:run -X` for debug logs

---

## Wrap-Up and Next Steps

### What You've Accomplished

Congratulations! In 2 hours, you've:

✅ **Mastered GitHub Copilot** for code generation and assistance  
✅ **Leveraged Copilot Chat** with Claude Sonnet 4.6 for modernization guidance  
✅ **Used App Modernization extension** to assess legacy code  
✅ Assessed a legacy Java application  
✅ Migrated from Java Servlets to Spring Boot  
✅ Replaced 126 lines of JDBC code with 5 lines using Spring Data JPA  
✅ Created modern REST APIs  
✅ Externalized configuration (security best practice)  
✅ Generated comprehensive tests with Copilot  
✅ Containerized the application  
✅ Prepared for cloud deployment  

**Lines of code reduced:** ~50%  
**Development time saved with Copilot:** ~70%  
**Modernization goals achieved:** 8/10  
**AI-assisted code generation:** ~80% of new code  

---

### Continue Learning

1. **GitHub Copilot Mastery:**
   - **Copilot Chat Advanced Features:** Multi-file edits, slash commands, agents
   - **Copilot Enterprise Features:** Knowledge bases, custom instructions
   - **Copilot for CLI:** AI-powered terminal assistance
   - **Copilot Workspace:** Collaborative AI-driven development
   - **Best Practices:** Writing effective prompts and context management

2. **App Modernization Patterns:**
   - **Microservices Architecture:** Breaking monoliths into services
   - **Strangler Fig Pattern:** Incremental modernization strategies
   - **Legacy Migration:** COBOL, .NET Framework, Python 2 to 3
   - **Cross-Platform Migration:** AWS to Azure, GCP to Azure

3. **Spring Boot Advanced (for Java developers):**
   - Spring Security integration
   - Caching with Redis
   - Message queues (RabbitMQ, Kafka)
   - Reactive programming with WebFlux

4. **Azure Cloud Deployment:**
   - Deploy to Azure Container Apps
   - Use Azure SQL Database in production
   - Implement Azure AD authentication
   - Set up Application Insights monitoring

5. **DevOps and CI/CD:**
   - GitHub Actions with Copilot
   - Infrastructure as Code (Bicep/Terraform)
   - Automated testing pipelines
   - Blue-green deployments

---

### Resources

**GitHub Copilot Learning:**

- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [GitHub Copilot Enterprise Guide](https://docs.github.com/enterprise-cloud@latest/copilot/github-copilot-enterprise)
- [Copilot Best Practices](https://docs.github.com/copilot/using-github-copilot/best-practices-for-using-github-copilot)
- [Prompt Engineering for Copilot](https://docs.github.com/copilot/using-github-copilot/prompt-engineering-for-github-copilot)
- [GitHub Copilot in VS Code](https://code.visualstudio.com/docs/copilot/overview)

**App Modernization with Copilot:**

- [GitHub Copilot App Modernization for Java Extension](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-java-modernization)
- [Azure App Modernization](https://azure.microsoft.com/solutions/application-modernization/)
- **Java Modernization Patterns:** Search in Copilot Chat with `@workspace` for project-specific guidance

**AI-Assisted Development:**

- **Using Copilot for Code Migration:** Ask Copilot "How do I migrate X to Y?" for pattern-specific guidance
- **Testing with Copilot:** Generate tests by asking "Generate unit tests for [class/method]"
- **Documentation with Copilot:** Ask Copilot to explain complex code sections
- **Refactoring with Copilot:** Select code and ask "How can I improve this code?"

**Spring Boot Reference (for self-study):**

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Spring Data JPA](https://spring.io/projects/spring-data-jpa)
- [Spring Boot Guides](https://spring.io/guides)

**Community:**

- [GitHub Copilot Community Discussions](https://github.com/orgs/community/discussions/categories/copilot)
- [VS Code Copilot Chat](https://code.visualstudio.com/docs/copilot/overview) - Use `@github` to ask questions within VS Code
- [Azure Community](https://techcommunity.microsoft.com/azure)

---

### Feedback

Help us improve this hackathon!

**What worked well?**  
**What was confusing?**  
**What would you like to see next?**

---

**Thank you for participating! Keep modernizing! 🚀**
