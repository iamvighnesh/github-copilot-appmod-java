package com.example.dao;

import com.example.model.User;
import com.example.util.DatabaseConnection;
import com.example.util.SampleSQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    
    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String query = "SELECT id, username, firstname, lastname, email, created_date FROM users";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstname(rs.getString("firstname"));
                user.setLastname(rs.getString("lastname"));
                user.setEmail(rs.getString("email"));
                user.setCreatedDate(rs.getString("created_date"));
                users.add(user);
            }
        }
        return users;
    }
    
    public User getUserById(int id) throws SQLException {
        String query = "SELECT id, username, firstname, lastname, email, created_date FROM users WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, id);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setFirstname(rs.getString("firstname"));
                    user.setLastname(rs.getString("lastname"));
                    user.setEmail(rs.getString("email"));
                    user.setCreatedDate(rs.getString("created_date"));
                    return user;
                }
            }
        }
        return null;
    }
    
    public boolean addUser(User user) throws SQLException {
        String query = "INSERT INTO users (username, firstname, lastname, email, created_date) VALUES (?, ?, ?, ?, GETDATE())";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getFirstname());
            pstmt.setString(3, user.getLastname());
            pstmt.setString(4, user.getEmail());
            
            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean updateUser(User user) throws SQLException {
        String query = "UPDATE users SET username = ?, firstname = ?, lastname = ?, email = ? WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getFirstname());
            pstmt.setString(3, user.getLastname());
            pstmt.setString(4, user.getEmail());
            pstmt.setInt(5, user.getId());
            
            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean deleteUser(int id) throws SQLException {
        String query = "DELETE FROM users WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, id);
            
            return pstmt.executeUpdate() > 0;
        }
    }
    
    public List<User> getTopUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            
            // Execute the Sybase-specific TOP query using CONCAT_COLUMNS pattern
            // Note: jTDS doesn't support multiple statements in one execute(), so we split them
            stmt.execute("SET ROWCOUNT 3");
            
            try (ResultSet rs = stmt.executeQuery(SampleSQL.CONCAT_COLUMNS + " ORDER BY id")) {
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setDisplayname(rs.getString("displayname"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setCreatedDate(rs.getString("created_date"));
                    users.add(user);
                }
            } finally {
                // Reset ROWCOUNT to 0 to avoid affecting other queries
                stmt.execute("SET ROWCOUNT 0");
            }
        }
        return users;
    }
}
