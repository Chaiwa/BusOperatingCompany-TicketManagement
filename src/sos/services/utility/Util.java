package sos.services.utility;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import sos.pojo.dto.Branch;
import sos.pojo.dto.Bus;
import sos.pojo.dto.Driver;
import sos.pojo.dto.Route;
import sos.pojo.dto.Station;
import sos.services.DbOperation;

public class Util {
	public Util() {
	}

	@SuppressWarnings("finally")
	public static String charToTurkish(String str) {

		// To add Turkish chars correctly on Database this function was
		// implemented

		String name = null;
		try {
			name = URLDecoder.decode(new String(str.getBytes("iso-8859-1")),
					"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			return name;
		}
	}

	public static ArrayList<String[]> getQueryStringAsList(String queryString) {

		// Get QueryString independetly

		String[] seperate = queryString.split("&");

		System.out.println(seperate.length);
		ArrayList<String[]> str = new ArrayList<String[]>();
		for (int i = 1; i < seperate.length; i++) {
			str.add(seperate[i].split("="));
		}

		return str;
	}

	public static Criteria getCriteriaWithRestrictionsEq(
			ArrayList<String[]> queryString, Criteria criteria) {

		// According to queryString get Criteria

		DbOperation dbOperation = new DbOperation();
		Station station = null;
		Route route = null;
		Driver driver = null;
		Bus bus = null;
		Branch branch = null;

		for (String[] s : queryString) {
			if (s[0].equalsIgnoreCase("fStationId")
					|| s[0].equalsIgnoreCase("tStationId")) {
				// Stations for Route
				station = (Station) dbOperation.getSession().get(Station.class,
						Long.parseLong(s[1]));
				if (s[0].equalsIgnoreCase("fStationId")) {
					criteria.add(Restrictions.eq("from", station));
				} else {
					criteria.add(Restrictions.eq("to", station));
				}
			} else if (s[0].equalsIgnoreCase("routeId")) { // Route for
															// RouteStation and
															// Journey
				route = (Route) dbOperation.getSession().get(Route.class,
						Long.parseLong(s[1]));
				criteria.add(Restrictions.eq("route", route));
			} else if (s[0].equalsIgnoreCase("stopId")) { // Stop Station for
															// RouteStation
				station = (Station) dbOperation.getSession().get(Station.class,
						Long.parseLong(s[1]));
				criteria.add(Restrictions.eq("stop", station));
			} else if (s[0].equalsIgnoreCase("driverId1")
					|| s[0].equalsIgnoreCase("driverId2")) {
				// Drivers for Journey
				driver = (Driver) dbOperation.getSession().get(Driver.class,
						Long.parseLong(s[1]));
				if (s[0].equalsIgnoreCase("driverId1")) {
					criteria.add(Restrictions.eq("driver1", driver));
				} else {
					criteria.add(Restrictions.eq("driver2", driver));
				}
			} else if (s[0].equalsIgnoreCase("busId")) {
				bus = (Bus) dbOperation.getSession().get(Bus.class,
						Long.parseLong(s[1]));
				criteria.add(Restrictions.eq("bus", bus));
			} else if (s[0].equalsIgnoreCase("branchId")) {
				branch = (Branch) dbOperation.getSession().get(Branch.class,
						Long.parseLong(s[1]));
				criteria.add(Restrictions.eq("branch", branch));
			} else {
				criteria.add(Restrictions.eq(s[0], Util.charToTurkish(s[1])));
			}
		}
		return criteria;
	}

	public static Date productDate(String time, String date) {

		// Formatting date to save on Database

		StringBuilder sDate = new StringBuilder("");
		sDate.append(date);
		sDate.append(" ");
		sDate.append(time);
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");

		Date rDate = null;
		try {
			rDate = formatter.parse(sDate.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return rDate;

	}

	public static Date productUpdatedDate(String time, String date) {

		// To format Date from Database

		StringBuilder sDate = new StringBuilder("");
		sDate.append(date);
		sDate.append(" ");
		sDate.append(time);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		Date rDate = null;
		try {
			rDate = formatter.parse(sDate.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return rDate;

	}

	public static int getClassNameCondition(Object object) {

		// Get Class name and returns result to notify which class is object

		if (object == null) {
			return 0;
		}
		String s = object.getClass().toString();
		s = s.split("\\.")[s.split("\\.").length - 1];
		int election = 0;
		if (s.equalsIgnoreCase("Station")) {
			election = 1;
		} else if (s.equalsIgnoreCase("Passenger")) {
			election = 2;
		} else if (s.equalsIgnoreCase("Driver")) {
			election = 3;
		} else if (s.equalsIgnoreCase("UserAdmin")) {
			election = 4;
		} else if (s.equalsIgnoreCase("Bus")) {
			election = 5;
		} else if (s.equalsIgnoreCase("Branch")) {
			election = 6;
		} else if (s.equalsIgnoreCase("Route")) {
			election = 7;
		} else if (s.equalsIgnoreCase("RouteStation")) {
			election = 8;
		} else if (s.equalsIgnoreCase("UserEmployee")) {
			election = 9;
		} else if (s.equalsIgnoreCase("Journey")) {
			election = 10;
		} else if (s.equalsIgnoreCase("Ticket")) {
			election = 11;
		}
		return election;

	}
}
