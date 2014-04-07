package sos.pojo.dto;

public class UserEmployee extends Person {
	private String username,password;
	private Branch branch;
	
	public UserEmployee(){}
	public UserEmployee(String name, String surname, String phone,
			String username, String password, Branch branch) {
		super(name, surname, phone);
		this.username = username;
		this.password = password;
		this.branch = branch;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Branch getBranch() {
		return branch;
	}
	public void setBranch(Branch branch) {
		this.branch = branch;
	}
	
}
