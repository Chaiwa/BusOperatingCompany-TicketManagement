package sos.pojo.dto;

import java.util.Date;

public class Ticket {
	private long id;
	private Journey journey;
	private Passenger passenger;
	private RouteStation routeStation;
	private Date takenDate;
	private UserEmployee employee;
	private int seatNumber;
	
	public Ticket(Journey journey, Passenger passenger,
			RouteStation routeStation, Date takenDate, UserEmployee employee, int seatNumber) {
		super();
		this.journey = journey;
		this.passenger = passenger;
		this.routeStation = routeStation;
		this.takenDate = takenDate;
		this.employee = employee;
		this.seatNumber = seatNumber;
	}
	public Ticket() {	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Journey getJourney() {
		return journey;
	}
	public void setJourney(Journey journey) {
		this.journey = journey;
	}
	public Passenger getPassenger() {
		return passenger;
	}
	public void setPassenger(Passenger passenger) {
		this.passenger = passenger;
	}
	public RouteStation getRouteStation() {
		return routeStation;
	}
	public void setRouteStation(RouteStation routeStation) {
		this.routeStation = routeStation;
	}
	public Date getTakenDate() {
		return takenDate;
	}
	public void setTakenDate(Date takenDate) {
		this.takenDate = takenDate;
	}
	public UserEmployee getEmployee() {
		return employee;
	}
	public void setEmployee(UserEmployee employee) {
		this.employee = employee;
	}
	public int getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}
}
