package sos.pojo.dto;

import sos.pojo.dto.Person;

public class Passenger extends Person {
	private String gender;
	
	public Passenger(){}
	public Passenger(String name, String surname, String phone, String gender) {
		super(name, surname, phone);
		this.gender = gender;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
}
