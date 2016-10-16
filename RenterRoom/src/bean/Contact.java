package bean;

public class Contact {
	private int idContact;
	private String nameContact;
	private String email;
	private String phoneNumber;
	private String content;

	public Contact() {
		super();
	}

	public Contact(int idContact, String nameContact, String email,
			String phoneNumber, String content) {
		super();
		this.idContact = idContact;
		this.nameContact = nameContact;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.content = content;
	}

	public int getIdContact() {
		return idContact;
	}

	public void setIdContact(int idContact) {
		this.idContact = idContact;
	}

	public String getNameContact() {
		return nameContact;
	}

	public void setNameContact(String nameContact) {
		this.nameContact = nameContact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
