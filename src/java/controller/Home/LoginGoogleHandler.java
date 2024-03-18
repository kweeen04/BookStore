package controller.Home;

import model.Constants;
import model.User;
import model.UserGoogleDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

@WebServlet(urlPatterns = { "/LoginGoogleHandler" })
public class LoginGoogleHandler extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDto user = getUserInfo(accessToken);
        System.out.println(user);

        UserDAO userDao = new UserDAO();
        User existingUser = userDao.checkAcc(user.getEmail());

        if (existingUser != null) {
            // Email exists, allow the user to log in
            HttpSession session = request.getSession();
            session.setAttribute("user", existingUser);
            response.sendRedirect("home");
        } else {
            // Email does not exist, you can perform actions like creating a new account or display error message
            // For example: Redirect to login page and display error message
            request.setAttribute("error", "Email has not been registered. Please register before logging in.");
            request.setAttribute("googleEmail", user.getEmail());
            request.getRequestDispatcher("user?action=login").forward(request, response);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // Call API to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        return jobj.get("access_token").toString().replaceAll("\"", "");
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return new Gson().fromJson(response, UserGoogleDto.class);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
