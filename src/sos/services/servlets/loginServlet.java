package sos.services.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import sos.pojo.dto.UserAdmin;
import sos.pojo.dto.UserEmployee;
import sos.services.DbOperation;
import sos.services.utility.Util;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username = Util.charToTurkish(request.getParameter("username"));
		String password = Util.charToTurkish(request.getParameter("password"));

		DbOperation dbOperation = new DbOperation();

		Criteria criteria = dbOperation.getSession().createCriteria(
				UserAdmin.class);
		criteria.add(Restrictions.eq("username", username));
		criteria.add(Restrictions.eq("password", password));

		ArrayList<Object> result = dbOperation.listObjects(criteria);
		if (result.size() != 0) {
			HttpSession session = request.getSession();
			session.setAttribute("Admin", result.get(0));
			response.sendRedirect("adminPanel.jsp");
		} else {
			criteria = dbOperation.getSession().createCriteria(
					UserEmployee.class);
			criteria.add(Restrictions.eq("username", username));
			criteria.add(Restrictions.eq("password", password));
			result = dbOperation.listObjects(criteria);

			if (result.size() != 0) {
				HttpSession session = request.getSession();
				session.setAttribute("Employee", result.get(0));
				response.sendRedirect("searchJourney.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}

		}

	}

}
