<%-- 
    Document   : viewProfiles
    Created on : Dec 26, 2025, 11:37:51 PM
    Author     : syazw
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Students Profiles</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        
        <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .profile-box {
            max-width: 1100px;
            margin: 30px auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        }
        .section-title {
            font-size: 20px;
            font-weight: bold;
            border-bottom: 2px solid #ccc;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }
        .label-title {
            font-weight: bold;
            color: #000;
        }
        
        .profile-table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            font-size: 15px;
        }

        .profile-table thead th {
            text-align: left;
            font-weight: 600;
            color: #333;
            padding: 12px 15px;
            border-bottom: 2px solid #dee2e6;
        }

        .profile-table tbody td {
            padding: 12px 15px;
            color: #555;
            border-bottom: 1px solid #eee;
        }

        .profile-table tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        .nowrap {
            white-space: nowrap;
        }
    </style>
    </head>
    
    <body>
        <div class="profile-box">
        <h2 class="text-center mb-4">Registered Student Profiles</h2>
        
        <div class="table-responsive">
        <table class="profile-table">
            <thead>
                <tr>
                    <th class="text-center">Student ID</th>
                    <th class="text-center">Name</th>
                    <th class="text-center">Program</th>
                    <th class="text-center">Email</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String dbURL = "jdbc:derby://localhost:1527/StudentProfiles";
                    String dbUser = "app";
                    String dbPass = "app";
                    
                    try{
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                        
                        String sql = "SELECT * FROM profile";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        
                        while (rs.next()){
                %>
                           <tr>
                               <td class="text-center"><%= rs.getString("studentID") %></td>
                               <td class="nowrap"><%= rs.getString("name") %></td>
                               <td class="text-center nowrap"><%= rs.getString("program") %></td>
                               <td class="text-center"><%= rs.getString("email") %></td>
                               <td class="text-center">
                                   <div class="d-flex justify-content-center">
                                    <a href="profile.jsp?id=<%= rs.getString("studentID") %>" 
                                        class="btn btn-outline-info btn-sm mr-2">
                                        View
                                    </a>
                               
                                    <a href="DeleteProfileServlet?id=<%= rs.getString("studentID") %>" 
                                       class="btn btn-outline-danger btn-sm" 
                                       onclick="return confirm('Are you sure you want to delete this profile?')">
                                       Delete
                                    </a>
                                    </div>   
                               </td>
                           </tr>
                <%
                        }
                            conn.close();
                    }catch(Exception e){
                        out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                    }  
                %>
            </tbody>
        </table>
                
                <div class="d-flex justify-content-center mt-3">
                    <a href="profile.html" class="btn btn-primary">Add New Profile</a>
                </div>    
        </div>    
    </body>
</html>
