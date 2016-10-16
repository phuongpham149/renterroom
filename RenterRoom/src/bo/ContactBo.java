package bo;

import java.util.ArrayList;

import bean.Contact;
import dao.ContactDao;

public class ContactBo {
	ContactDao contactDao = new ContactDao();

	public ArrayList<Contact> getListContact() {
		return contactDao.getListContact();
	}

	public boolean addContact(String nameContact, String email,
			String phoneNumber, String Content) {
		return contactDao.addContact(nameContact, email, phoneNumber, Content);
	}

	public boolean delContact(int id) {
		return contactDao.delContact(id);
	}

	public Contact getContactDetail(int idContact) {
		return contactDao.getContactDetail(idContact);
	}
}
