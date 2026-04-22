<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .btn {
            padding: 8px 16px;
            margin: 2px;
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
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-success {
            background-color: #28a745;
            color: white;
        }
        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Management</h1>
        <a href="users?action=new" class="btn btn-success">Add New User</a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Back to Home</a>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <c:choose>
                        <c:when test="${isTopUsers}">
                            <th>Display Name</th>
                        </c:when>
                        <c:otherwise>
                            <th>First Name</th>
                            <th>Last Name</th>
                        </c:otherwise>
                    </c:choose>
                    <th>Email</th>
                    <th>Created Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <c:choose>
                            <c:when test="${isTopUsers}">
                                <td>${user.displayname}</td>
                            </c:when>
                            <c:otherwise>
                                <td>${user.firstname}</td>
                                <td>${user.lastname}</td>
                            </c:otherwise>
                        </c:choose>
                        <td>${user.email}</td>
                        <td>${user.createdDate}</td>
                        <td>
                            <a href="users?action=edit&id=${user.id}" class="btn btn-primary">Edit</a>
                            <a href="users?action=delete&id=${user.id}" 
                               class="btn btn-danger" 
                               onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
