# Java Application Modernization with GitHub Copilot

> **A hands-on hackathon guide for modernizing legacy Java applications using GitHub Copilot and AI-assisted development**

Transform a legacy Java Servlet application running on Sybase into a modern Spring Boot REST API ready for Azure SQL Database—all in 2 hours with the power of GitHub Copilot!

---

## 🎯 Hackathon Overview

**Duration:** 2 hours (90 minutes guided exercises + 30 minutes for deployment)  
**Level:** Intermediate (Basic Java knowledge required)  
**Focus:** AI-assisted application modernization with GitHub Copilot

### What You'll Learn

✅ **GitHub Copilot mastery** - Code generation, chat, and AI-powered development  
✅ **App Modernization patterns** - Legacy to modern architecture migration  
✅ **Spring Boot migration** - Servlets → REST APIs with Spring Boot 3.x  
✅ **Database modernization** - Sybase → Azure SQL Database  
✅ **Cloud readiness** - Containerization and Azure deployment preparation  
✅ **AI-assisted testing** - Generate comprehensive tests with Copilot  

### What You'll Build

Transform **~800 lines** of legacy code into **~400 lines** of modern Spring Boot code while adding:
- 🔄 RESTful APIs (replacing JSP views)
- 🗄️ Spring Data JPA (replacing 126 lines of JDBC)
- 🔒 Externalized configuration (no hardcoded credentials)
- 🧪 Unit and integration tests
- 🐳 Docker containerization
- ☁️ Azure deployment readiness

**Code reduction:** 50% | **Time saved with Copilot:** 70% | **AI-generated code:** 80%

---

## 📚 Documentation

Follow these guides in order:

| Document | Purpose | Time |
|----------|---------|------|
| **[1. Prerequisites](./hackathon-prerequisites.md)** | Setup guide - complete BEFORE hackathon | 60-90 min |
| **[2. App Background](./legacy-app-background.md)** | Legacy application context and architecture | 15 min read |
| **[3. Modernization Guide](./modernization-guide.md)** | Step-by-step hands-on exercises | 90 min |

### Quick Links

- 🚀 [Get Started: Prerequisites Setup](./hackathon-prerequisites.md)
- 🏗️ [Understand the Legacy App](./legacy-app-background.md)
- 💻 [Start Modernization Exercises](./modernization-guide.md)

---

## 🛠️ Prerequisites

### Required Tools

- **Visual Studio Code** with extensions:
  - GitHub Copilot Chat (with Enterprise license)
  - GitHub Copilot App Modernization for Java
  - Extension Pack for Java
- **Java 11+** (JDK 17 or 21 recommended)
- **Apache Maven 3.9+**
- **Git**
- **Azure subscription** (provided by organizer)

### Recommended AI Model

🤖 **Claude Sonnet 4.6** - Optimized for Java modernization tasks

[Complete setup instructions →](./hackathon-prerequisites.md)

---

## 🏗️ Repository Structure

```
github-copilot-appmod-java/
├── README.md                           # 👈 You are here
├── hackathon-prerequisites.md          # Setup guide
├── legacy-app-background.md            # Legacy app context
├── modernization-guide.md              # Hands-on exercises
│
└── app/                                # Legacy application
    ├── pom.xml                         # Maven configuration
    └── src/
        ├── main/
        │   ├── java/com/example/
        │   │   ├── dao/                # JDBC data access
        │   │   ├── model/              # POJOs
        │   │   ├── servlet/            # Servlet controllers
        │   │   └── util/               # Database utilities
        │   ├── resources/              # SQL scripts
        │   └── webapp/                 # JSP views
        └── test/                       # (You'll add tests!)
```

---

## 🚀 Quick Start

### For Participants

1. **Fork this repository** to your GitHub account
   ```bash
   # Click "Fork" button at top-right of this page
   ```

2. **Clone your fork** to your local machine
   ```bash
   git clone https://github.com/YOUR-USERNAME/github-copilot-appmod-java.git
   cd github-copilot-appmod-java
   ```

3. **Complete prerequisites setup**
   - Follow the [Prerequisites Guide](./hackathon-prerequisites.md)
   - Verify all tools are installed
   - Test GitHub Copilot with Claude Sonnet 4.6

4. **Review the legacy application**
   - Read [App Background](./legacy-app-background.md)
   - Explore the code in `app/` directory

5. **Start modernizing!**
   - Follow the [Modernization Guide](./modernization-guide.md)
   - Use GitHub Copilot Chat throughout
   - Complete exercises at your pace

---

## 📖 The Legacy Application

### What You're Modernizing

A classic **Java Servlet web application** (circa 2008-2012) with:

| Component | Technology | Lines | Status |
|-----------|-----------|-------|--------|
| **Web Layer** | Java Servlets + JSP | 406 | ⚠️ Legacy |
| **Data Layer** | JDBC with Commons DBCP | 126 | ⚠️ Manual |
| **Database** | Sybase ASE | - | ⚠️ Proprietary |
| **Java Version** | Java 8 (1.8) | - | ⚠️ EOL 2019 |
| **Deployment** | Apache Tomcat WAR | - | ⚠️ Traditional |

### Known Issues

🔴 **Critical:**
- Hardcoded database credentials in source code
- No authentication or authorization
- SQL injection vulnerabilities

🟡 **High Priority:**
- Outdated Java version (8)
- Vendor lock-in (Sybase database)
- No REST API support

[Full assessment →](./legacy-app-background.md)

---

## 🎓 What You'll Achieve

By the end of this hackathon, you will have:

### Technical Skills

- ✅ Mastered **GitHub Copilot** for code generation and chat
- ✅ Used **AI-powered assessment** tools for legacy applications
- ✅ Migrated **Servlets → Spring Boot** REST controllers
- ✅ Replaced **JDBC → Spring Data JPA** (96% code reduction!)
- ✅ Converted **Sybase SQL → Azure SQL** compatible syntax
- ✅ Externalized configuration with **Spring profiles**
- ✅ Generated **unit and integration tests** with Copilot
- ✅ Containerized application with **Docker**

### Modernization Patterns

- 🎯 **Lift and Modernize** - Hybrid approach for time-constrained migrations
- 🎯 **Database abstraction** - Using JPA for database portability
- 🎯 **REST API design** - Modern API endpoints replacing JSP
- 🎯 **Security best practices** - Secrets management and authentication readiness

### Metrics

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| **Lines of Code** | ~800 | ~400 | ⬇️ 50% |
| **Java Version** | Java 8 | Java 17+ | ✅ Modern |
| **Data Access** | 126 lines JDBC | 5 lines JPA | ⬇️ 96% |
| **API Support** | None | REST APIs | ✅ Added |
| **Test Coverage** | 0% | 70%+ | ✅ Added |
| **Cloud Ready** | ❌ No | ✅ Yes | ✅ Ready |

---

## 💡 Key Learning Highlights

### GitHub Copilot Best Practices

Throughout the hackathon, you'll learn:

- 📝 **Writing effective prompts** - Get better code suggestions
- 💬 **Using Copilot Chat** - Ask questions, explain code, generate tests
- 🎯 **Context awareness** - Using `@workspace` for project-wide understanding
- 🔄 **Iterative refinement** - Improving generated code step-by-step
- 🧪 **Test generation** - Creating comprehensive test suites automatically

### App Modernization Techniques

- 🔍 **Assessment** - Identifying technical debt and modernization candidates
- 📋 **Planning** - Choosing the right migration strategy
- 🏗️ **Incremental migration** - Modernizing components step-by-step
- ✅ **Validation** - Testing throughout the migration process
- 🚀 **Cloud preparation** - Making applications cloud-ready

---

## 🤝 Contributing

This is a hackathon training repository. If you find issues or have suggestions:

1. Open an issue describing the problem or enhancement
2. For documentation fixes, submit a pull request
3. Share your feedback after the hackathon!

---

## 📄 License

This project is intended for educational purposes as part of the Java Application Modernization Hackathon.

---

## 🆘 Support

### During the Hackathon

- 🙋 Ask facilitators for help
- 💬 Use the dedicated Slack/Teams channel
- 📖 Refer to the [Troubleshooting Guide](./hackathon-prerequisites.md#9-troubleshooting-common-setup-issues)

### GitHub Copilot Issues

- 📚 [GitHub Copilot Documentation](https://docs.github.com/copilot)
- 💡 [Best Practices Guide](https://docs.github.com/copilot/using-github-copilot/best-practices-for-using-github-copilot)
- 🔧 Check status bar in VS Code for Copilot activation

---

## 🌟 Additional Resources

### GitHub Copilot Learning

- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [Copilot Enterprise Guide](https://docs.github.com/enterprise-cloud@latest/copilot/github-copilot-enterprise)
- [Prompt Engineering Tips](https://docs.github.com/copilot/using-github-copilot/prompt-engineering-for-github-copilot)
- [VS Code Integration](https://code.visualstudio.com/docs/copilot/overview)

### App Modernization

- [GitHub Copilot App Modernization Extension](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-java-modernization)
- [Azure App Modernization](https://azure.microsoft.com/solutions/application-modernization/)
- [Spring Boot Migration Guide](https://spring.io/guides)

---

## 🎉 Ready to Start?

### Pre-Hackathon Checklist

- [ ] Fork this repository to your account
- [ ] Clone your fork locally
- [ ] Complete [Prerequisites Setup](./hackathon-prerequisites.md)
- [ ] Verify GitHub Copilot works with Claude Sonnet 4.6
- [ ] Read [App Background](./legacy-app-background.md)
- [ ] Build the legacy app successfully (`mvn clean compile`)

### On Hackathon Day

- [ ] Open VS Code with your fork
- [ ] Verify Copilot is active
- [ ] Join the hackathon session
- [ ] Start with [Modernization Guide](./modernization-guide.md)
- [ ] Ask questions and have fun! 🚀

---

**Let's modernize some code! 💻✨**

*Powered by GitHub Copilot and Claude Sonnet 4.6*
