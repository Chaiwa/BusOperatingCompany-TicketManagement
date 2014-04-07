package sos.pojo.dto;

import java.util.Calendar;

public class Driver extends Person {
	private String tcno;
	private int birthYear;

	public Driver(){}
	public Driver(String name, String surname, String phone, String tcno,
			int birthYear) {
		super(name, surname, phone);
		this.tcno = tcno;
		this.birthYear = birthYear;
	}

	public String getTcno() {
		return tcno;
	}

	public void setTcno(String tcno) {
		this.tcno = tcno;
	}

	public int getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(int birthYear) {
		this.birthYear = birthYear;
	}
	public int getAge(){
		int year=Calendar.getInstance().get(Calendar.YEAR);
		return year-this.birthYear;
	}
}
