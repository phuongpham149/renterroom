package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.Contact;

public class ContactDao {
	Database db = new Database();
	public ArrayList<Contact> getListContact() {
		ArrayList<Contact> listContact = new ArrayList<Contact>();
		String query = "SELECT idContact,nameContact,email, phoneNumber, content  FROM contact ";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			Contact contact;
			while(rs.next()){
				contact=  new Contact(rs.getInt("idContact"),rs.getString("nameContact"),rs.getString("email"),rs.getString("phoneNumber"),rs.getString("content"));
				listContact.add(contact);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listContact;
	}
	public boolean addContact(Contact contact ) {
		String query = "INSERT INTO contact(nameContact, email, phoneNumber, content) VALUES (?,?,?,?)";
		int check=0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(query);
			pstm.setString(1, contact.getNameContact());
			pstm.setString(2, contact.getEmail());
			pstm.setString(3, contact.getPhoneNumber());
			pstm.setString(4, contact.getContent());
			check=pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(check>0){
			return true;
		}
		else{
			return false;
		}
		
	}
	public boolean delContact(int id) {
		// TODO Auto-generated method stub
		String query = "DELETE FROM contact WHERE idContact=?";
		int check=0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(query);
			pstm.setInt(1, id);
			check=pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(check>0){
			return true;
		}
		else{
			return false;
		}
	}
	public Contact getContactDetail(int idContact) {
		String query = "SELECT idContact,nameContact, email, phoneNumber, content FROM contact WHERE idContact = "+idContact;
		Contact contact = null;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			
			while(rs.next()){
				contact = new Contact(rs.getInt("idContact"),rs.getString("nameContact"),rs.getString("email"),rs.getString("phoneNumber"),rs.getString("content"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return contact;
	}
	public boolean editContact(Contact contact) {
        String query = "UPDATE contact SET nameContact= '"+contact.getNameContact()+"'"
        		+ ", email = '"+contact.getEmail()+"'"
        		+ ", phoneNumber = '"+contact.getPhoneNumber()+"'"
        		+ ", content = '"+contact.getContent()+"' WHERE idContact= "+contact.getIdContact();
		
		int check=0;
		try {
			Statement pstm = db.connectDB().createStatement();
			check = pstm.executeUpdate(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(check>0){
			return true;
		}
		else{
			return false;
		}
	}


}
