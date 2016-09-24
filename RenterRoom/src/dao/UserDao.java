package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.Users;

public class UserDao {
	Database db = new Database();
	public ArrayList<Users> getListUser() {
		ArrayList<Users> listUser = new ArrayList<Users>();
		String query = "SELECT idUser,username, password, phoneNumber, role,email, address from users ";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			Users user;
			while(rs.next()){
				user = new Users(rs.getInt("idUser"),rs.getString("username"), rs.getString("password"),
						rs.getString("phoneNumber"), rs.getInt("role"), rs.getString("email"), rs.getString("address"));
				listUser.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listUser;
	}
	public boolean addUser(Users users) {
		String query = "INSERT INTO users(username, password,phoneNumber, role, email, address) VALUES (?,?,?,?,?,?)";
		int check=0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(query);
			pstm.setString(1, users.getUsername());
			pstm.setString(2, users.getPassword());
			pstm.setString(3, users.getPhoneNumber());
			pstm.setInt(4, users.getRole());
			pstm.setString(5, users.getEmail());
			pstm.setString(6, users.getAddress());
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
	public boolean delUser(int id) {
		// TODO Auto-generated method stub
		String query = "delete from users where idUser=?";
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
	public Users getUserDetail(int idUser) {
		String query = "SELECT idUser,username, password, phoneNumber, role, email, address from users where idUser = "+idUser;
		Users user = null;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			
			while(rs.next()){
				user = new Users(rs.getInt("idUser"),rs.getString("username"), rs.getString("password"),
						rs.getString("phoneNumber"), rs.getInt("role"), rs.getString("email"), rs.getString("address"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public boolean editUser(Users user) {
        String query = "UPDATE users set username= '"+user.getUsername()+"'"
        		+ ",password = '"+user.getPassword()+"'"
        		+ ", phoneNumber = '"+user.getPhoneNumber()+"'"
        		+ ", role = '"+user.getRole()+"'"
        		+ ", email = '"+user.getEmail()+"'"
        		+ ", address = '"+user.getAddress()+"' where idUser= "+user.getIdUser();
		
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
