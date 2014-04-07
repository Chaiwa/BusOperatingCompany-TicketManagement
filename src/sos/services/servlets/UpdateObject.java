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
import sos.services.utility.UpdateObjectDetails;

/**
 * Servlet implementation class UpdateObject
 */
@WebServlet("/UpdateObject")
public class UpdateObject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final DbOperation dbOperation = new DbOperation();

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (session.getAttribute("Admin") != null) { // Login control

			int election = Integer.parseInt(request.getParameter("fid"));
			Object object = null;
			UpdateObjectDetails uod = new UpdateObjectDetails(request,
					dbOperation);
			switch (election) {
			case 1:// Add Station Details
				object = uod.updateStation();
				break;
			case 2:// Add Passenger Details
				object = uod.updatePassenger();
				break;
			case 3: // Add Driver Details
				object = uod.updateDriver();
				break;
			case 4: // Add UserAdmin Details
				object = uod.updateUserAdmin();
				break;
			case 5: // Add Bus Details
				object = uod.updateBus();
				break;
			case 6: // Add Branch Details
				object = uod.updateBranch();
				break;
			case 7: // Add Route Details
				object = uod.updateRoute();
				break;
			case 8: // Add RouteStation Details
				object = uod.updateRouteStation();
				break;
			case 9: // Add User Employee Details
				object = uod.updateUserEmployee();
				break;
			case 10: // Add Journey Details
				object = uod.updateJourney();
				break;
			case 11: // Add Ticket Details
				object = uod.updateTicket();
				break;
			}

			// Save the result object

			dbOperation.updateObject(object);

			// Notice User
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("Record was Updated...");
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
