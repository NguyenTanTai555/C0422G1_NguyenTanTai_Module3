import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        writer.println("<html>");
        if ("admin".equals(username) && "admin".equals(password)){
            writer.println("<h1>Welcome" +username + "to website</h1>");
        }else {
            writer.println("<h1>Login Error</h1>");
        }
//        writer.println("</html>");
    }
}
