package sos.services.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;

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
import sos.services.utility.Util;

public class ListObject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final DbOperation dbOperation = new DbOperation();

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession sess = request.getSession();

		if (sess.getAttribute("Admin") != null) { // Login control

			// Split QueryString to columns and values =>
			ArrayList<String[]> queryString = Util.getQueryStringAsList(Util
					.charToTurkish(request.getQueryString()));

			ArrayList<Object> list = new ArrayList<Object>();

			int election = Integer.parseInt(request.getParameter("fid"));

			Criteria criteria = null;

			switch (election) {
			case 1:// List Station Details
				criteria = dbOperation.getSession().createCriteria(
						Station.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 2:// List Passenger Details
				criteria = dbOperation.getSession().createCriteria(
						Passenger.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 3: // List Driver Details
				criteria = dbOperation.getSession()
						.createCriteria(Driver.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 4: // ListUserAdmin Details
				criteria = dbOperation.getSession().createCriteria(
						UserAdmin.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 5: // List Bus Details
				criteria = dbOperation.getSession().createCriteria(Bus.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 6: // List Branch Details
				criteria = dbOperation.getSession()
						.createCriteria(Branch.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 7: // List Route Details
				criteria = dbOperation.getSession().createCriteria(Route.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 8: // List RouteStation Details
				criteria = dbOperation.getSession().createCriteria(
						RouteStation.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 9: // List User Employee Details
				criteria = dbOperation.getSession().createCriteria(
						UserEmployee.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 10: // List Journey Details
				criteria = dbOperation.getSession().createCriteria(
						Journey.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			case 11: // List Ticket Details
				criteria = dbOperation.getSession()
						.createCriteria(Ticket.class);
				criteria = Util.getCriteriaWithRestrictionsEq(queryString,
						criteria);
				list = (ArrayList<Object>) criteria.list();
				break;
			}
			Object o = null;
			for (Object c : list) {
				o = c;
				break;
			}

			int classNameCondition = Util.getClassNameCondition(o); // To create
																	// table

			HttpSession session = request.getSession();
			session.setAttribute("list", list); // To list results
			session.setAttribute("class", classNameCondition); // To create
																// table

			response.sendRedirect("listObject.jsp");
			return;
		} else {
			response.sendRedirect("index.jsp");
		}

	}

}
