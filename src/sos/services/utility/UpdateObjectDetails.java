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

public class UpdateObjectDetails {

	// this class updates object details with its Id and returns back the object
	private HttpServletRequest request = null;
	private DbOperation dbOperation = null;

	public UpdateObjectDetails(HttpServletRequest request,
			DbOperation dbOperation) {
		this.request = request;
		this.dbOperation = dbOperation;
	}

	public Object updateStation() {
		long id = Long.parseLong(request.getParameter("id"));

		String name = Util.charToTurkish(request.getParameter("name"));

		Station object = (Station) dbOperation.getSession().get(Station.class,
				id);
		object.setName(name);
		return object;
	}

	public Object updatePassenger() {
		long id = Long.parseLong(request.getParameter("id"));

		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String gender = Util.charToTurkish(request.getParameter("gender"));

		Passenger object = (Passenger) dbOperation.getSession().get(
				Passenger.class, id);
		object.setGender(gender);
		object.setName(surname);
		object.setPhone(phone);
		object.setSurname(surname);

		return object;
	}

	public Object updateUserAdmin() {
		long id = Long.parseLong(request.getParameter("id"));

		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String username = request.getParameter("username");

		UserAdmin object = (UserAdmin) dbOperation.getSession().get(
				UserAdmin.class, id);
		object.setName(name);
		object.setPassword(password);
		object.setPhone(phone);
		object.setSurname(surname);
		object.setUsername(username);

		return object;
	}

	public Object updateBus() {
		long id = Long.parseLong(request.getParameter("id"));

		String brand = Util.charToTurkish(request.getParameter("brand"));
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		String model = Util.charToTurkish(request.getParameter("model"));
		String plate = request.getParameter("plate");
		int modelYear = Integer.parseInt(request.getParameter("modelYear"));

		Bus object = (Bus) dbOperation.getSession().get(Bus.class, id);
		object.setBrand(brand);
		object.setCapacity(capacity);
		object.setModel(model);
		object.setModelYear(modelYear);
		object.setPlate(plate);

		return object;
	}

	public Object updateBranch() {
		long id = Long.parseLong(request.getParameter("id"));

		String branchName = Util.charToTurkish(request
				.getParameter("branchName"));
		String country = Util.charToTurkish(request.getParameter("country"));
		String city = Util.charToTurkish(request.getParameter("city"));
		String county = Util.charToTurkish(request.getParameter("county"));
		String district = Util.charToTurkish(request.getParameter("district"));
		String phone = request.getParameter("phone");

		Branch object = (Branch) dbOperation.getSession().get(Branch.class, id);
		object.setBranchName(branchName);
		object.setCity(city);
		object.setCountry(country);
		object.setCounty(county);
		object.setDistrict(district);
		object.setPhone(phone);

		return object;
	}

	public Object updateDriver() {
		long id = Long.parseLong(request.getParameter("id"));

		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String tcno = request.getParameter("tcno");
		int birthYear = Integer.parseInt(request.getParameter("birthYear"));

		Driver object = (Driver) dbOperation.getSession().get(Driver.class, id);
		object.setBirthYear(birthYear);
		object.setName(name);
		object.setPhone(phone);
		object.setSurname(surname);
		object.setTcno(tcno);

		return object;
	}

	public Object updateRoute() {
		long id = Long.parseLong(request.getParameter("id"));

		String routeName = Util
				.charToTurkish(request.getParameter("routeName"));
		long fromStationId = Long.parseLong(request.getParameter("fStationId"));
		long toStationId = Long.parseLong(request.getParameter("tStationId"));

		Station from = (Station) dbOperation.getSession().get(Station.class,
				fromStationId);
		Station to = (Station) dbOperation.getSession().get(Station.class,
				toStationId);

		Route object = (Route) dbOperation.getSession().get(Route.class, id);
		object.setFrom(from);
		object.setRouteName(routeName);
		object.setTo(to);

		return object;

	}

	public Object updateRouteStation() {
		long id = Long.parseLong(request.getParameter("id"));

		Double price = Double.parseDouble(request.getParameter("price"));
		long routeId = Long.parseLong(request.getParameter("routeId"));
		long stopId = Long.parseLong(request.getParameter("stopId"));
		String routeStationName = Util.charToTurkish(request
				.getParameter("routeStationName"));

		Route route = (Route) dbOperation.getSession()
				.get(Route.class, routeId);
		Station stop = (Station) dbOperation.getSession().get(Station.class,
				stopId);

		RouteStation object = (RouteStation) dbOperation.getSession().get(
				RouteStation.class, id);
		object.setPrice(price);
		object.setRoute(route);
		object.setRouteStationName(routeStationName);
		object.setStop(stop);

		return object;
	}

	public Object updateJourney() {
		long id = Long.parseLong(request.getParameter("id"));

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
		dArrivalTime = Util.productUpdatedDate(arrivalTime, arrivalDate);
		dDepartureTime = Util.productUpdatedDate(departureTime, departureDate);

		Journey object = (Journey) dbOperation.getSession().get(Journey.class,
				id);

		object.setArrivalTime(dArrivalTime);
		object.setBus(bus);
		object.setDepartureTime(dDepartureTime);
		object.setDriver1(driver1);
		object.setDriver2(driver2);
		object.setJourneyNo(journeyNo);
		object.setRoute(route);

		return object;
	}

	public Object updateTicket() {
		long id = Long.parseLong(request.getParameter("id"));

		long employeeId = Long.parseLong(request.getParameter("employeeId"));
		long journeyId = Long.parseLong(request.getParameter("journeyId"));
		long routeStationId = Long.parseLong(request
				.getParameter("routeStationId"));
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		int seatNumber = Integer.parseInt(request.getParameter("seatNumber"));

		// Adding passenger to Db and getting Passenger Id =>
		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String gender = Util.charToTurkish(request.getParameter("gender"));
		Object obj = new Passenger(name, surname, phone, gender);
		dbOperation.saveObject(obj);

		// Adding restrictions to criteria and getting Passenger Id
		Criteria criteria = dbOperation.getSession().createCriteria(
				Passenger.class);
		criteria.add(Restrictions.eq("name", name));
		criteria.add(Restrictions.eq("surname", surname));
		criteria.add(Restrictions.eq("phone", phone));
		criteria.add(Restrictions.eq("gender", gender));
		ArrayList<Object> passengers = dbOperation.listObjects(criteria);
		Passenger psngr = new Passenger();

		for (Object p : passengers) {
			psngr = ((Passenger) (p));
		}
		long passengerId = psngr.getId();
		// <=got PassengerId

		Journey journey = (Journey) dbOperation.getSession().get(Journey.class,
				journeyId);
		Passenger passenger = (Passenger) dbOperation.getSession().get(
				Passenger.class, passengerId);
		RouteStation routeStation = (RouteStation) dbOperation.getSession()
				.get(RouteStation.class, routeStationId);
		UserEmployee employee = (UserEmployee) dbOperation.getSession().get(
				UserEmployee.class, employeeId);
		Date takenDate = Util.productDate(time, date);

		Ticket object = (Ticket) dbOperation.getSession().get(Ticket.class, id);
		object.setEmployee(employee);
		object.setJourney(journey);
		object.setPassenger(passenger);
		object.setRouteStation(routeStation);
		object.setTakenDate(takenDate);
		object.setSeatNumber(seatNumber);

		return object;
	}

	public Object updateUserEmployee() {
		long id = Long.parseLong(request.getParameter("id"));

		String name = Util.charToTurkish(request.getParameter("name"));
		String surname = Util.charToTurkish(request.getParameter("surname"));
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		long branchId = Long.parseLong(request.getParameter("branchId"));

		Branch branch = (Branch) dbOperation.getSession().get(Branch.class,
				branchId);

		UserEmployee object = (UserEmployee) dbOperation.getSession().get(
				UserEmployee.class, id);
		object.setBranch(branch);
		;
		object.setName(name);
		object.setPassword(password);
		object.setPhone(phone);
		object.setSurname(surname);
		object.setUsername(username);

		return object;
	}
}
