package autocomplete;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezenCine.MovieDDL;




@WebServlet("/AvailableTags")
public class AvailableTags extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MovieDDL ddl = new MovieDDL();
        List<String> movieTitles = ddl.selectTitle();

        res.setContentType("application/json");
        PrintWriter out = res.getWriter();
        out.print("{\"titles\":" + movieTitles.toString() + "}");
        out.flush();
	}

}
