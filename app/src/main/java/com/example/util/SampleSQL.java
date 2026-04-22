package com.example.util;

/**
 * Sybase SQL statements for migration scenarios
 */
public class SampleSQL {
    
    // Scenario 1: String Concatenation
    public static final String CONCAT_COLUMNS = 
        "SELECT id, firstname + ' ' + lastname as displayname, username, email, created_date FROM users";
    
    // Scenario 2: TOP N with ROWCOUNT
    public static final String SELECT_TOP_WITH_ROWCOUNT = 
        "SET ROWCOUNT 10; " +
        "SELECT * FROM users ORDER BY id; " +
        "SET ROWCOUNT 0";
    
    // Scenario 3: ISNULL Function
    public static final String SELECT_WITH_ISNULL = 
        "SELECT id, username, ISNULL(email, 'no-email@example.com') as email FROM users";

    
    // Scenario 4: Get Last Identity Value (Sybase ASE)
    public static final String INSERT_AND_GET_IDENTITY = 
        "INSERT INTO users (username, email) VALUES ('newuser', 'newuser@example.com'); " +
        "SELECT @@IDENTITY as last_id";  // Sybase uses @@IDENTITY; Azure SQL has SCOPE_IDENTITY() which is safer
    
    // Scenario 5: Transaction with Error Handling
    public static final String TRANSACTION_WITH_ERROR_CHECK = 
        "BEGIN TRANSACTION " +
        "    UPDATE users SET email = 'updated@email.com' WHERE id = 1 " +
        "    IF @@ERROR <> 0 " +
        "        ROLLBACK TRANSACTION " +
        "    ELSE " +
        "        COMMIT TRANSACTION";
    
    // Scenario 6: Pagination with TOP START AT (Sybase ASE 16.0+)
    public static final String SELECT_WITH_PAGINATION = 
        "SELECT TOP 10 START AT 21 " +
        "    id, username, email, created_date " +
        "FROM users " +
        "ORDER BY id";
}
