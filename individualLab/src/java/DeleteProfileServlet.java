/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author syazw
 */
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get the ID from the URL parameter
        String id = request.getParameter("id");
        
        if (id != null && !id.isEmpty()) {       
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfiles", "app", "app");
                
                String sql = "DELETE FROM profile WHERE studentID = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, id);
                ps.executeUpdate();
                
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        // After deleting, go back to the list
        response.sendRedirect("viewProfiles.jsp");
    }
}
