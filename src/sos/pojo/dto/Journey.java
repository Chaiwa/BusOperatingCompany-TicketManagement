package sos.pojo.dto;

import java.util.Date;

public class Journey {
	private long id;
	private Bus bus;
	private Driver driver1,driver2;
	private Route route;
	private String journeyNo;
	private Date departureTime,arrivalTime;
	public Journey(Bus bus, Driver driver1, Driver driver2, Route route,
			String journeyNo, Date departureTime, Date arrivalTime) {
		super();
		this.bus = bus;
		this.driver1 = driver1;
		this.driver2 = driver2;
		this.route = route;
		this.journeyNo = journeyNo;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
	}
	public Journey() {	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Bus getBus() {
		return bus;
	}
	public void setBus(Bus bus) {
		this.bus = bus;
	}
	public Driver getDriver1() {
		return driver1;
	}
	public void setDriver1(Driver driver1) {
		this.driver1 = driver1;
	}
	public Driver getDriver2() {
		return driver2;
	}
	public void setDriver2(Driver driver2) {
		this.driver2 = driver2;
	}
	public Route getRoute() {
		return route;
	}
	public void setRoute(Route route) {
		this.route = route;
	}
	public String getJourneyNo() {
		return journeyNo;
	}
	public void setJourneyNo(String journeyNo) {
		this.journeyNo = journeyNo;
	}
	
	public Date getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(Date departureTime) {
		this.departureTime = departureTime;
	}
	public Date getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}


}
