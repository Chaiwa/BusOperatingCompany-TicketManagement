package sos.pojo.dto;


//Route Station Stop
/*EN - For example Route is Istanbul-Izmir(Cities between these are yalova,bursa,balýkesir,manisa)
 *  but a passenger buys a ticket in Bursa which cheaper than a Istanbul ticket,
		so Bursa is our RouteStation to specify price of ticket. Indeed, cities
		between these cities are RouteStations.
*/
/*TR - Ýstanbul-Ýzmir seferini yapan otobüsten Bursa'da bilet alacak kiþi için
 * fiyat belirlemeye yarýyor bu bilgi. Yani seferin duraklarýný tutuyor.
 * Yalova,Bursa,Balýkesir,Manisa bunlar bilet alýnabilecek yerler. 
 * 
 */
public class RouteStation {
	
	private long id;
	private Route route;
	private Station stop;
	private double price;
	private String routeStationName;
	
	public RouteStation(){}
	public RouteStation(Route route, Station stop, double price,String routeStationName) {
		super();
		this.route = route;
		this.stop = stop;
		this.price = price;
		this.routeStationName=routeStationName;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Route getRoute() {
		return route;
	}
	public void setRoute(Route route) {
		this.route = route;
	}
	public Station getStop() {
		return stop;
	}
	public void setStop(Station stop) {
		this.stop = stop;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getRouteStationName() {
		return routeStationName;
	}
	public void setRouteStationName(String routeStationName) {
		this.routeStationName = routeStationName;
	}
}
