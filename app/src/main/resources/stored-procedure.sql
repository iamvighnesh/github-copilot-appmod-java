-- Stored Procedure with Error Handling (Sybase ASE)
CREATE PROCEDURE update_user_email
    @user_id INT,
    @new_email VARCHAR(100)
AS
BEGIN
    UPDATE users SET email = @new_email WHERE id = @user_id
    IF @@ERROR <> 0  -- Sybase error handling; Azure SQL recommends TRY...CATCH
        RETURN -1
    RETURN 0
END