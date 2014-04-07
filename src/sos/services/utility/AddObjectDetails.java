package sos.services.utility;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

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

public class AddObjectDetails {

	// This class adds details,from request, to object and returns back

	private HttpServletRequest request = null;
	private DbOperation dbOperation = null;

	public AddObjectDetails(HttpServletRequest request, DbOperation dbOperation) {
		this.request = request;
		this.dbOperation = dbOperation;
	}

	public Object addStation() {
		String name = Util.charToTurkish(request.getParameter("name"));
		Object object = new Station(name);
		return object;
	}

	public Object addPassenger() {
		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String gender = Util.charToTurkish(request.getParameter("gender"));
		Object object = new Passenger(name, surname, phone, gender);
		return object;
	}

	public Object addUserAdmin() {
		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		Object object = new UserAdmin(name, surname, phone, username, password);
		return object;
	}

	public Object addBus() {
		String brand = Util.charToTurkish(request.getParameter("brand"));
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		String model = Util.charToTurkish(request.getParameter("model"));
		String plate = request.getParameter("plate");
		int modelYear = Integer.parseInt(request.getParameter("modelYear"));
		Object object = new Bus(plate, brand, model, capacity, modelYear);
		return object;
	}

	public Object addBranch() {
		String branchName = Util.charToTurkish(request
				.getParameter("branchName"));
		String country = Util.charToTurkish(request.getParameter("country"));
		String city = Util.charToTurkish(request.getParameter("city"));
		String county = Util.charToTurkish(request.getParameter("county"));
		String district = Util.charToTurkish(request.getParameter("district"));
		String phone = request.getParameter("phone");
		Object object = new Branch(branchName, country, city, county, district,
				phone);
		return object;
	}

	public Object addDriver() {
		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String tcno = request.getParameter("tcno");
		int birthYear = Integer.parseInt(request.getParameter("birthYear"));
		Object object = new Driver(name, surname, phone, tcno, birthYear);
		return object;
	}

	public Object addRoute() {
		String routeName = Util
				.charToTurkish(request.getParameter("routeName"));
		long fromStationId = Long.parseLong(request.getParameter("fStationId"));
		long toStationId = Long.parseLong(request.getParameter("tStationId"));

		Station from = (Station) dbOperation.getSession().get(Station.class,
				fromStationId);
		Station to = (Station) dbOperation.getSession().get(Station.class,
				toStationId);

		Object object = new Route(routeName, from, to);
		return object;

	}

	public Object addRouteStation() {
		Double price = Double.parseDouble(request.getParameter("price"));
		long routeId = Long.parseLong(request.getParameter("routeId"));
		long stopId = Long.parseLong(request.getParameter("stopId"));
		String routeStationName = Util.charToTurkish(request
				.getParameter("routeStationName"));

		Route route = (Route) dbOperation.getSession()
				.get(Route.class, routeId);
		Station stop = (Station) dbOperation.getSession().get(Station.class,
				stopId);

		Object object = new RouteStation(route, stop, price, routeStationName);
		return object;
	}

	public Object addJourney() {

		String journeyNo = Util
				.charToTurkish(request.getParameter("journeyNo"));
		long driverId1 = Long.parseLong(request.getParameter("driverId1"));
		long driverId2 = Long.parseLong(request.getParameter("driverId2"));
		long routeId = Long.parseLong(request.getParameter("routeId"));
		long busId = Long.parseLong(request.getParameter("busId"));

		// getting Objects according to their Id's
		Driver driver1 = (Driver) dbOperation.getSession().get(Driver.class,
				driverId1);
		Driver driver2;
		if (request.getParameter("driverId2").equalsIgnoreCase("null")) {
			driver2 = null;
		} else {
			driver2 = (Driver) dbOperation.getSession().get(Driver.class,
					driverId2);
		}
		Route route = (Route) dbOperation.getSession()
				.get(Route.class, routeId);
		Bus bus = (Bus) dbOperation.getSession().get(Bus.class, busId);

		// Formatting times and dates
		String departureTime = request.getParameter("departureTime");
		String departureDate = request.getParameter("departureDate");
		String arrivalTime = request.getParameter("arrivalTime");
		String arrivalDate = request.getParameter("arrivalDate");

		Date dArrivalTime = null, dDepartureTime = null;
		dArrivalTime = Util.productDate(arrivalTime, arrivalDate);
		dDepartureTime = Util.productDate(departureTime, departureDate);

		Object object = new Journey(bus, driver1, driver2, route, journeyNo,
				dDepartureTime, dArrivalTime);
		return object;
	}

	public Object addTicket() {

		long employeeId = Long.parseLong(request.getParameter("employeeId"));
		long journeyId = Long.parseLong(request.getParameter("journeyId"));
		long routeStationId = Long.parseLong(request
				.getParameter("routeStationId"));
		int seatNumber = Integer.parseInt(request.getParameter("seatNumber"));

		// Adding passenger to Db and getting Passenger Id if there is not
		// passenger=>
		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String gender = Util.charToTurkish(request.getParameter("gender"));
		Object obj = new Passenger(name, surname, phone, gender);

		// Adding restrictions to criteria and getting Passenger Id if there is
		// a passenger
		Criteria criteria = dbOperation.getSession().createCriteria(
				Passenger.class);
		criteria.add(Restrictions.eq("name", name));
		criteria.add(Restrictions.eq("surname", surname));
		criteria.add(Restrictions.eq("phone", phone));
		criteria.add(Restrictions.eq("gender", gender));
		ArrayList<Object> passengers = dbOperation.listObjects(criteria);
		Passenger psngr = new Passenger(name, surname, phone, gender);

		long passengerId;
		if (!passengers.isEmpty()) { // Get passengerId, if there is
										// passenger
			for (Object p : passengers) {
				psngr = ((Passenger) (p));
			}
			passengerId = psngr.getId();
		} else { // Add passenger and get Id if there is not passenger
			dbOperation.saveObject(psngr);
			passengers = dbOperation.listObjects(criteria);
			for (Object p : passengers) {
				psngr = ((Passenger) (p));
			}
			passengerId = psngr.getId();
		}

		// <=got PassengerId

		// Get and Add details
		Journey journey = (Journey) dbOperation.getSession().get(Journey.class,
				journeyId);
		Passenger passenger = (Passenger) dbOperation.getSession().get(
				Passenger.class, passengerId);
		RouteStation routeStation = (RouteStation) dbOperation.getSession()
				.get(RouteStation.class, routeStationId);
		UserEmployee employee = (UserEmployee) dbOperation.getSession().get(
				UserEmployee.class, employeeId);
		Date takenDate = new Date();

		Object object = new Ticket(journey, passenger, routeStation, takenDate,
				employee, seatNumber);
		return object;
	}

	public Object addUserEmployee() {
		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		long branchId = Long.parseLong(request.getParameter("branchId"));

		Branch branch = (Branch) dbOperation.getSession().get(Branch.class,
				branchId);
		Object object = new UserEmployee(name, surname, phone, username,
				password, branch);
		return object;
	}
}
