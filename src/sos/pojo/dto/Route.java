package sos.pojo.dto;

public class Route {
	private long id;
	private String routeName;
	private Station from,to;
	
	public Route(){}
	public Route(String routeName, Station from, Station to) {
		super();
		this.routeName = routeName;
		this.from = from;
		this.to = to;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	public Station getFrom() {
		return from;
	}
	public void setFrom(Station from) {
		this.from = from;
	}
	public Station getTo() {
		return to;
	}
	public void setTo(Station to) {
		this.to = to;
	}
	
}
