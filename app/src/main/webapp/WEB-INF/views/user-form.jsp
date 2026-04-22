<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            padding: 10px 20px;
            margin-right: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><c:if test="${user != null}">Edit</c:if><c:if test="${user == null}">Add</c:if> User</h1>
        
        <form action="users" method="post">
            <input type="hidden" name="action" value="${user != null ? 'update' : 'add'}">
            <c:if test="${user != null}">
                <input type="hidden" name="id" value="${user.id}">
            </c:if>
            
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" 
                       value="${user != null ? user.username : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" 
                       value="${user != null ? user.firstname : ''}">
            </div>
            
            <div class="form-group">
                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" 
                       value="${user != null ? user.lastname : ''}">
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" 
                       value="${user != null ? user.email : ''}" required>
            </div>
            
            <button type="submit" class="btn btn-primary">
                <c:if test="${user != null}">Update</c:if><c:if test="${user == null}">Add</c:if> User
            </button>
            <a href="users?action=list" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
