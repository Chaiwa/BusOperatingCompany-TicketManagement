package sos.pojo.dto;

public class Bus {
	private long id;
	private String plate,brand,model;
	private int capacity,modelYear;
	
	public Bus(){}
	public Bus(String plate, String brand, String model, int capacity,
			int modelYear) {
		super();
		this.plate = plate;
		this.brand = brand;
		this.model = model;
		this.capacity = capacity;
		this.modelYear = modelYear;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPlate() {
		return plate;
	}
	public void setPlate(String plate) {
		this.plate = plate;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getModelYear() {
		return modelYear;
	}
	public void setModelYear(int modelYear) {
		this.modelYear = modelYear;
	}
	
}
