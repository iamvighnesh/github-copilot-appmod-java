package com.example.util;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

public class DatabaseInitializer {
    
    public static void initializeDatabase() {
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            
            // Check if table exists, if not create it
            try {
                stmt.execute("SELECT COUNT(*) FROM users");
                System.out.println("Table 'users' already exists.");
                
            } catch (SQLException e) {
                // Table doesn't exist, create it
                System.out.println("Creating 'users' table...");
                
                stmt.execute("CREATE TABLE users (" +
                    "id INT IDENTITY PRIMARY KEY, " +
                    "username VARCHAR(50) NOT NULL, " +
                    "firstname VARCHAR(50), " +
                    "lastname VARCHAR(50), " +
                    "email VARCHAR(100) NOT NULL, " +
                    "created_date DATETIME DEFAULT GETDATE())");
                
                stmt.execute("CREATE INDEX idx_username ON users(username)");
                
                // Insert sample data
                stmt.execute("INSERT INTO users (username, firstname, lastname, email) VALUES ('john_doe', 'John', 'Doe', 'john@example.com')");
                stmt.execute("INSERT INTO users (username, firstname, lastname, email) VALUES ('jane_smith', 'Jane', 'Smith', 'jane@example.com')");
                stmt.execute("INSERT INTO users (username, firstname, lastname, email) VALUES ('bob_wilson', 'Bob', 'Wilson', 'bob@example.com')");
                
                System.out.println("Table 'users' created successfully with sample data.");
            }
            
        } catch (SQLException e) {
            System.err.println("Error initializing database: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
