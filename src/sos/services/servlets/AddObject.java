package sos.services.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sos.services.DbOperation;
import sos.services.utility.AddObjectDetails;

@WebServlet("/AddObject")
public class AddObject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final DbOperation dbOperation = new DbOperation();

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (session.getAttribute("Admin") != null
				|| session.getAttribute("addTicket") != null) { // Login control

			int election = Integer.parseInt(request.getParameter("fid"));
			Object object = null;
			AddObjectDetails aod = new AddObjectDetails(request, dbOperation);
			switch (election) {
			case 1:// Add Station Details
				object = aod.addStation();
				break;
			case 2:// Add Passenger Details
				object = aod.addPassenger();
				break;
			case 3: // Add Driver Details
				object = aod.addDriver();
				break;
			case 4: // Add UserAdmin Details
				object = aod.addUserAdmin();
				break;
			case 5: // Add Bus Details
				object = aod.addBus();
				break;
			case 6: // Add Branch Details
				object = aod.addBranch();
				break;
			case 7: // Add Route Details
				object = aod.addRoute();
				break;
			case 8: // Add RouteStation Details
				object = aod.addRouteStation();
				break;
			case 9: // Add User Employee Details
				object = aod.addUserEmployee();
				break;
			case 10: // Add Journey Details
				object = aod.addJourney();
				break;
			case 11: // Add Ticket Details
				object = aod.addTicket();
				break;
			}

			// Save the result object

			dbOperation.saveObject(object);

			// Notice User
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("Record was Saved...");
		} else {
			response.sendRedirect("index.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
