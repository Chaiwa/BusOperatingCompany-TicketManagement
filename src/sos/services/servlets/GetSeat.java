package sos.services.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import sos.pojo.dto.Journey;
import sos.pojo.dto.Ticket;
import sos.pojo.dto.UserEmployee;
import sos.services.DbOperation;

@WebServlet("/GetSeat")
public class GetSeat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession sess = request.getSession();

		if (sess.getAttribute("Employee") != null
				|| sess.getAttribute("Admin") != null) { // Login Control
			// On addObject servlet to access code, setting a session.
			sess.setAttribute("addTicket", "true");
			DbOperation dbOperation = new DbOperation();

			long routeStationId = Long.parseLong(request
					.getParameter("routeStationId"));
			long journeyId = Long.parseLong(request.getParameter("journeyId"));

			Journey journey = (Journey) dbOperation.getSession().get(
					Journey.class, journeyId);
			// Get Taken tickets and seats
			Criteria criteria = dbOperation.getSession().createCriteria(
					Ticket.class);
			criteria.add(Restrictions.eq("journey", journey));
			ArrayList<Object> takenTickets = dbOperation.listObjects(criteria);

			ArrayList<Integer> busSeats = new ArrayList<Integer>();
			ArrayList<Integer> takenBusSeats = new ArrayList<Integer>();

			int busCapacity = journey.getBus().getCapacity();

			for (int i = 1; i <= busCapacity; i++) {
				busSeats.add(i);
			}
			if (takenTickets != null) {
				for (Object t : takenTickets) {
					Ticket ticket = (Ticket) (t);
					takenBusSeats.add(ticket.getSeatNumber());
				}
			}

			HttpSession session = request.getSession();
			session.setAttribute("busSeats", busSeats);
			session.setAttribute("takenBusSeats", takenBusSeats);
			session.setAttribute("journey", journey);

			UserEmployee employee = (UserEmployee) session
					.getAttribute("Employee");

			// Prepare codes to return back AJAX.
			String passengerHTML = "<input type='text' name='name' id='name' placeholder='Passenger Name' onblur='nameControl(this.value)'/>"
					+ "<input type='text' name='surname' id='surname' placeholder='Passenger Surname' onblur='nameControl(this.value)'/>"
					+ "<input type='text' name='phone' id='phone' placeholder='Passenger Phone' onblur='phoneControl(this.value)'/>"
					+ "<input type='radio' name='gender' value='Male' checked/>Male"
					+ "<input type='radio' name='gender' value='Female'/>Female<br/>";
			String hiddenObjectIDsHTML = "<input type='hidden' name='employeeId' value='"
					+ employee.getId()
					+ "'/>"
					+ "<input type='hidden' name='journeyId' value='"
					+ journey.getId()
					+ "'/>"
					+ "<input type='hidden' name='routeStationId' value='"
					+ routeStationId
					+ "'/>"
					+ "<input type='hidden' name='fid' value='11'/>";
			String journeyNoHTML = "Journey No : " + journey.getJourneyNo()
					+ "<br/>";
			StringBuilder seatNumberHTML = new StringBuilder(
					"Seat Number :<select name='seatNumber'>");

			// Prepare untaken seats
			Boolean checkSeat = false;
			if (takenTickets != null) {
				for (int i = 1; i <= busCapacity; i++) {
					for (Object t : takenTickets) {
						Ticket ticket = (Ticket) (t);
						if (ticket.getSeatNumber() == i) {
							checkSeat = true;
						}
					}
					if (!checkSeat) {
						seatNumberHTML.append("<option value='" + i + "'>" + i
								+ "</option>");
					}
					checkSeat = false;
				}

			} else {
				for (int i = 1; i <= busCapacity; i++) {
					seatNumberHTML.append("<option value='" + i + "'>" + i
							+ "</option>");
				}
			}
			seatNumberHTML.append("</select><br/>");

			String buttonHTML = "<input type='button' value='Take Ticket' onclick=\"doAddObject('ticket')\" class='btnClass' />";

			// Prepare form
			StringBuilder ajaxHTML = new StringBuilder("<form id='ticket'>");
			ajaxHTML.append(hiddenObjectIDsHTML);
			ajaxHTML.append(journeyNoHTML);
			ajaxHTML.append(seatNumberHTML.toString());
			ajaxHTML.append(passengerHTML);
			ajaxHTML.append(buttonHTML);
			ajaxHTML.append("</form>");

			// Return to ajax
			PrintWriter out = response.getWriter();
			out.print(ajaxHTML.toString());
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
