package bean;

public class Users {
	private int idUser;
	private String username;
	private String password;
	private String phoneNumber;
	private int role;
	private String email;
	private String address;
	private int status;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Users() {
		super();
	}

	public Users(int idUser, String username, String password,
			String phoneNumber, int role, String email, String address, int status) {
		super();
		this.idUser = idUser;
		this.username = username;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.role = role;
		this.email = email;
		this.address = address;
		this.status=status;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
