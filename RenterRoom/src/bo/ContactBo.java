package bo;

import java.util.ArrayList;

import bean.Contact;
import dao.ContactDao;

public class ContactBo {
	ContactDao contactDao = new ContactDao();
	public ArrayList<Contact> getListContact() {
		// TODO Auto-generated method stub
		return contactDao.getListContact();
	}
	public boolean addContact(Contact contact) {
		// TODO Auto-generated method stub
		return contactDao.addContact(contact);
	}
	public boolean delContact(int id) {
		// TODO Auto-generated method stub
		return contactDao.delContact(id);
	}
	public Contact getContactDetail(int idContact) {
		
		return contactDao.getContactDetail(idContact);
	}
	public boolean editContact(Contact contact) {
		// TODO Auto-generated method stub
		return contactDao.editContact(contact);
	}	

}
