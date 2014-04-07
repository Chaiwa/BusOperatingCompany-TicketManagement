package sos.pojo.dto;

public class UserAdmin extends Person {
	private String username,password;
	
	public UserAdmin(){}
	public UserAdmin(String name, String surname, String phone,
			String username, String password) {
		super(name, surname, phone);
		this.username = username;
		this.password = password;
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
}
