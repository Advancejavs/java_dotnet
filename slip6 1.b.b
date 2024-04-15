import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VisitCounterServlet")
public class VisitCounterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get the array of cookies associated with this domain
        Cookie[] cookies = request.getCookies();

        // Flag to check if the user has visited the page before
        boolean visitedBefore = false;
        int visitCount = 0;

        if (cookies != null) {
            // Loop through cookies to find the visit count cookie
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("visitCount")) {
                    // If visit count cookie is found, set the flag to true and get the visit count
                    visitedBefore = true;
                    visitCount = Integer.parseInt(cookie.getValue());
                    break;
                }
            }
        }

        // Increment visit count
        visitCount++;

        // Create a new cookie or update existing cookie
        Cookie visitCountCookie = new Cookie("visitCount", String.valueOf(visitCount));
        response.addCookie(visitCountCookie);

        out.println("<html><head><title>Visit Counter Servlet</title></head><body>");
        if (visitedBefore) {
            out.println("<h1>Welcome back!</h1>");
            out.println("<p>You have visited this page " + visitCount + " times.</p>");
        } else {
            out.println("<h1>Welcome!</h1>");
            out.println("<p>This is your first visit to this page.</p>");
        }
        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
