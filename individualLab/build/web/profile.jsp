<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.profile.model.ProfileBean" %>
<%@ page import="java.sql.*" %>
<%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
    String viewId = request.getParameter("id");
    if (profile == null && viewId != null) {
        profile = new ProfileBean();
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfiles", "app", "app");
            
            // Using your manual String ID to find the specific student
            String sql = "SELECT * FROM profile WHERE studentID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, viewId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                profile.setStudentID(rs.getString("studentID"));
                profile.setName(rs.getString("name"));
                profile.setEmail(rs.getString("email"));
                profile.setProgram_code(rs.getString("program_code"));
                profile.setProgram(rs.getString("program"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setSelfIntroduction(rs.getString("selfIntroduction"));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile Details</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .profile-box {
            max-width: 800px;
            margin: 30px auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
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
    </style>
</head>

<body>

<div class="profile-box">

    <h2 class="text-center mb-4">Profile Summary</h2>
    
    <% if (profile != null) { %>

    <%-- Personal Information --%>
    <div class="section-title">Personal Information</div>
    
    <%
        String name = (String) request.getAttribute("name");
        String email = (String) request.getAttribute("email");
    %>
    
    <p><span class="label-title">Name:</span> <%= profile.getName() %></p>
    <p><span class="label-title">Email:</span> <%= profile.getEmail() %></p>

    <%-- Academic Details --%>
    <div class="section-title mt-4">Academic Details</div>
    
    <%
        String studentID = (String) request.getAttribute("studentID");
        String program_code = (String) request.getAttribute("program_code");
        String program = (String) request.getAttribute("program");
    %>
    
    <p><span class="label-title">Student ID:</span> <%= profile.getStudentID() %></p>
    <p><span class="label-title">Program Code:</span> <%= profile.getProgram_code() %></p>
    <p><span class="label-title">Program:</span> <%= profile.getProgram() %></p>

    <%-- Hobbies --%>
    <div class="section-title mt-4">Hobbies</div>
    
    <%
        String hobbies = (String) request.getAttribute("hobbies");
    %>
    
    <p><%= (profile.getHobbies() != null && !profile.getHobbies().isEmpty() ? profile.getHobbies() : "None listed") %></p>

    <%-- About Me --%>
    <div class="section-title mt-4">About Me</div>
    
    <%
        String selfIntroduction = (String) request.getAttribute("selfIntroduction");
    %>
    
    <p><%= (profile.getSelfIntroduction() != null && !profile.getSelfIntroduction().isEmpty() ? profile.getSelfIntroduction() : "No introduction provided") %></p>

    <% } else { %>
        <p class="text-danger">Error: No profile data found. Please submit the form first.</p>
    <% } %>
    
    <div class="mt-4 text-center">
        <a href="profile.html" class="btn btn-primary">Back to Form</a>
        <a href="viewProfiles.jsp" class="btn btn-secondary">View All Profiles</a>
    </div>

</div>

</body>
</html>
