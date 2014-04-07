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
import sos.pojo.dto.RouteStation;
import sos.pojo.dto.Station;
import sos.services.DbOperation;
import sos.services.utility.Util;

@WebServlet("/SearchJourney")
public class SearchJourney extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession sess = request.getSession();

		if (sess.getAttribute("Admin") != null
				|| sess.getAttribute("Employee") != null) { // Login control

			String fromString = Util
					.charToTurkish(request.getParameter("from"));
			String toString = Util.charToTurkish(request.getParameter("to")
					.toLowerCase());
			String dateString = request.getParameter("date");

			DbOperation dbOperation = new DbOperation();
			// Get Station for RouteStation's "to"
			Criteria criteriaStation = dbOperation.getSession().createCriteria(
					Station.class);
			criteriaStation.add(Restrictions.eq("name", toString));
			ArrayList<Object> result = dbOperation.listObjects(criteriaStation);
			Station s = null;

			ArrayList<Object> resultRSlist = null;
			ArrayList<Journey> resultJourneyList = new ArrayList<Journey>();
			if (result != null) {

				for (Object o : result) {
					s = (Station) (o);
				}

				// Get RouteStation which has "to"
				Criteria criteriaRoute = dbOperation.getSession()
						.createCriteria(RouteStation.class);
				criteriaRoute.add(Restrictions.eq("stop", s));
				ArrayList<Object> resultRoutes = dbOperation
						.listObjects(criteriaRoute);

				// Get RouteStations which routeIds are equals resultRoutes id
				// and
				// stop station equals
				// fromString Station

				for (Object o : resultRoutes) {

					Criteria criteriaRS = dbOperation.getSession()
							.createCriteria(RouteStation.class);
					criteriaRS.add(Restrictions.eq("route",
							(((RouteStation) (o))).getRoute()));
					criteriaStation = dbOperation.getSession().createCriteria(
							Station.class);
					criteriaStation.add(Restrictions.eq("name", fromString));
					result = dbOperation.listObjects(criteriaStation);
					if (result != null) {

						for (Object z : result) {
							s = (Station) (z);
						}
					} else {
						PrintWriter out = response.getWriter();
						out.write("No Result");
						return;
					}
					criteriaRS.add(Restrictions.eq("stop", s));
					resultRSlist = dbOperation.listObjects(criteriaRS);

				}
				if (resultRSlist != null) {
					for (Object r : resultRSlist) {
						// Get Journeys with same Route from RouteStation
						Criteria criteriaJourney = dbOperation.getSession()
								.createCriteria(Journey.class);
						criteriaJourney.add(Restrictions.eq("route",
								((RouteStation) (r)).getRoute()));
						ArrayList<Object> jList = dbOperation
								.listObjects(criteriaJourney);
						for (Object j : jList) {
							// Get Journeys on dateString
							String departureTimeString = ((Journey) (j))
									.getDepartureTime().toString();
							String dDate = departureTimeString.split(" ")[0];
							String[] aDate = dDate.split("-");
							StringBuilder journeyDate = new StringBuilder("");
							journeyDate.append(aDate[2]);
							journeyDate.append("-");
							journeyDate.append(aDate[1]);
							journeyDate.append("-");
							journeyDate.append(aDate[0]);

							if (journeyDate.toString().equalsIgnoreCase(
									dateString)) {
								if (!(resultJourneyList.contains(j))) {
									resultJourneyList.add((Journey) j);
								}
							}

						}
					}
				} else {
					PrintWriter out = response.getWriter();
					out.print("There is No Journey...");
					return;
				}
				if (!resultJourneyList.isEmpty()) {
					HttpSession session = request.getSession();
					session.setAttribute("journeyList", resultJourneyList);
					session.setAttribute("routeStationList", resultRSlist);
					response.sendRedirect("listJourney.jsp");
				} else {
					PrintWriter out = response.getWriter();
					out.print("There is No Journey...");
					return;
				}

			} else {
				PrintWriter out = response.getWriter();
				out.print("There is No Journey...");
				return;
			}
		} else {
			response.sendRedirect("index.jsp");
		}
	}
}
