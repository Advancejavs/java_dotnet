import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class RequestInfoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<html><head><title>Request Information</title></head><body>");

        // Client request information
        out.println("<h2>Client Request Information:</h2>");
        out.println("<b>Client IP Address:</b> " + request.getRemoteAddr() + "<br>");
        out.println("<b>Browser Type:</b> " + request.getHeader("User-Agent") + "<br>");

        // Server information
        out.println("<h2>Server Information:</h2>");
        out.println("<b>Server Name:</b> " + request.getServerName() + "<br>");
        out.println("<b>Server Port:</b> " + request.getServerPort() + "<br>");
        out.println("<b>Server Software:</b> " + getServletContext().getServerInfo() + "<br>");

        // Currently loaded servlets
        out.println("<h2>Currently Loaded Servlets:</h2>");
        Enumeration<String> servletNames = getServletContext().getServletNames();
        while (servletNames.hasMoreElements()) {
            String servletName = servletNames.nextElement();
            out.println("<b>" + servletName + "</b><br>");
        }

        out.println("</body></html>");
        out.close();
    }
}
