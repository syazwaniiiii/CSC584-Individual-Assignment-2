import java.io.IOException;
import java.sql.*;
import com.profile.model.ProfileBean;        
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/ProfileServlet"})
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProfileBean profile = new ProfileBean();
        profile.setStudentID(request.getParameter("studentID"));
        profile.setName(request.getParameter("name"));
        profile.setEmail(request.getParameter("email"));
        profile.setProgram_code(request.getParameter("program_code"));
        profile.setProgram(request.getParameter("program"));
        profile.setHobbies(request.getParameter("hobbies"));
        profile.setSelfIntroduction(request.getParameter("selfIntroduction"));
        
        String dbURL = "jdbc:derby://localhost:1527/StudentProfiles";
        String dbUser = "app";
        String dbPass = "app";
        
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String sql = "INSERT INTO profile (studentID, name, email, program_code, program, hobbies, selfIntroduction) VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, profile.getStudentID());
            ps.setString(2, profile.getName());
            ps.setString(3, profile.getEmail());
            ps.setString(4, profile.getProgram_code());
            ps.setString(5, profile.getProgram());
            ps.setString(6, profile.getHobbies());
            ps.setString(7, profile.getSelfIntroduction());
            
            ps.executeUpdate();
            conn.close();            
        }catch (Exception e){
            e.printStackTrace();
        }

        // Set attributes for JSP
        request.setAttribute("profile", profile);
        // Forward to JSP
        RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
        rd.forward(request, response);
    }
}
