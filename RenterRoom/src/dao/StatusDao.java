package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.Status;

public class StatusDao {
	Database db = new Database();
	public ArrayList<Status> getListStatus() {
		ArrayList<Status> listStatus = new ArrayList<Status>();
		String query = "SELECT idStatus,nameStatus from status ";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			Status status;
			while(rs.next()){
				status = new Status(rs.getInt("idStatus"),rs.getString("nameStatus"));
				listStatus.add(status);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listStatus;
	}
	public boolean addStatus(String nameStatus) {
		String query = "INSERT INTO status(nameStatus) VALUES (?)";
		int check=0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(query);
			pstm.setString(1, nameStatus);
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
	public boolean delStatus(int id) {
		// TODO Auto-generated method stub
		String query = "delete from status where idStatus=?";
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
	public Status getStatusDetail(int idStatus) {
		String query = "SELECT idStatus,nameStatus from status where idStatus = "+idStatus;
		Status status = null;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			
			while(rs.next()){
				status = new Status(rs.getInt("idStatus"),rs.getString("nameStatus"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	public boolean editStatus(Status status) {
        String query = "UPDATE status set nameStatus= '"+status.getNameStatus()+"' where idStatus= "+status.getIdStatus();
		
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
