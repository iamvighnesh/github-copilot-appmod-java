<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sybase Web Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
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
        h1 {
            color: #333;
        }
        .menu {
            list-style: none;
            padding: 0;
        }
        .menu li {
            margin: 10px 0;
        }
        .menu a {
            display: block;
            padding: 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .menu a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Sybase Web Application</h1>
        <p>This is a Java web application using JSP, running on Tomcat with Sybase database.</p>
        
        <ul class="menu">
            <li><a href="users?action=list">Manage Users</a></li>
            <li><a href="users?action=new">Add New User</a></li>
            <li><a href="users?action=topUsers">Get Top Users</a></li>
        </ul>
        
        <hr>
        <p><small>Server Time: <%= new java.util.Date() %></small></p>
    </div>
</body>
</html>
