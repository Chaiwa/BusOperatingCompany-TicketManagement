package sos.services.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sos.pojo.dto.Branch;
import sos.pojo.dto.Bus;
import sos.pojo.dto.Driver;
import sos.pojo.dto.Journey;
import sos.pojo.dto.Passenger;
import sos.pojo.dto.Route;
import sos.pojo.dto.RouteStation;
import sos.pojo.dto.Station;
import sos.pojo.dto.Ticket;
import sos.pojo.dto.UserAdmin;
import sos.pojo.dto.UserEmployee;
import sos.services.DbOperation;

/**
 * Servlet implementation class DeleteObject
 */
@WebServlet("/DeleteObject")
public class DeleteObject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (session.getAttribute("Admin") != null) { // Login control

			int election = Integer.parseInt(request.getParameter("fid"));
			long id = Long.parseLong(request.getParameter("id"));

			DbOperation dbOperation = new DbOperation();

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			switch (election) {
			case 1: // Delete Station
				Station s = (Station) dbOperation.getSession().get(
						Station.class, id);
				if (dbOperation.deleteObject(s)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 2:// Delete Passenger
				Passenger p = (Passenger) dbOperation.getSession().get(
						Passenger.class, id);
				if (dbOperation.deleteObject(p)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 3: // Delete Driver
				Driver d = (Driver) dbOperation.getSession().get(Driver.class,
						id);
				if (dbOperation.deleteObject(d)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 4: // Delete User Admin
				UserAdmin ua = (UserAdmin) dbOperation.getSession().get(
						UserAdmin.class, id);
				if (dbOperation.deleteObject(ua)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 5: // Delete Bus
				Bus bus = (Bus) dbOperation.getSession().get(Bus.class, id);
				if (dbOperation.deleteObject(bus)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 6: // Delete Branch
				Branch b = (Branch) dbOperation.getSession().get(Branch.class,
						id);
				if (dbOperation.deleteObject(b)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 7: // Delete Route
				Route r = (Route) dbOperation.getSession().get(Route.class, id);
				if (dbOperation.deleteObject(r)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 8: // Delete RouteStation
				RouteStation rs = (RouteStation) dbOperation.getSession().get(
						RouteStation.class, id);
				if (dbOperation.deleteObject(rs)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 9: // Delete User Employee
				UserEmployee u = (UserEmployee) dbOperation.getSession().get(
						UserEmployee.class, id);
				if (dbOperation.deleteObject(u)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 10: // Delete Journey
				Journey j = (Journey) dbOperation.getSession().get(
						Journey.class, id);
				if (dbOperation.deleteObject(j)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			case 11: // Dekete Ticket
				Ticket t = (Ticket) dbOperation.getSession().get(Ticket.class,
						id);
				if (dbOperation.deleteObject(t)) {
					out.println("Record was Deleted...");
					return;
				} else {
					out.println("Deleting Record is not succeeded !");
					return;
				}
			}
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
