package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Rooms;
import bean.Users;

public class RoomDao {
	Database db = new Database();
	public ArrayList<Rooms> getListRoom() {
		ArrayList<Rooms> listRoom = new ArrayList<Rooms>();
		String query = "SELECT idRoom, idUser,category.idCategory,nameCategory,cost,description,isActive,timeCreated, timeUpdate,isEmpty, nameRoom, image, street, district from rooms, category where category.idCategory = rooms.idCategory ";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			Rooms room;
			while(rs.next()){
				room = new Rooms(rs.getInt("idRoom"),rs.getInt("idUser"),rs.getInt("idCategory"),rs.getInt("cost"), rs.getString("description"),rs.getInt("isActive"),
						rs.getString("timeCreated"),rs.getString("timeUpdate"), rs.getInt("isEmpty"),rs.getString("nameRoom"),rs.getString("image"),rs.getString("street"), rs.getString("district"),rs.getString("nameCategory"));
				listRoom.add(room);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listRoom;
	}
	public boolean addRoom(Rooms room) {
		String query = "INSERT INTO rooms( idUser, idCategory, cost,  description,isActive,timeCreated, timeUpdate, isEmpty, nameRoom, image,street,district) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		int check=0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(query);
			pstm.setInt(1, room.getIdUser());
			pstm.setInt(2, room.getIdCategory());
			pstm.setInt(3, room.getCost());
			pstm.setString(4, room.getDescription());
			pstm.setInt(5, room.getIsActive());
			pstm.setString(6, room.getTimeCreated());
			pstm.setString(7, room.getTimeUpdate());
			pstm.setInt(8, room.getIsEmpty());
			pstm.setString(9, room.getNameRoom());
			pstm.setString(10, room.getImage());
			pstm.setString(11, room.getStreet());
			pstm.setString(12, room.getDistrict());
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
	public boolean delRoom(int id) {
		// TODO Auto-generated method stub
		String query = "delete FROM rooms WHERE idRoom=?";
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
	public Rooms getRoomDetail(int idRoom) {
		String query = "SELECT idRoom,idUser,idCategory,cost,description,isActive, timeCreated, timeUpdate,isEmpty,nameRoom,image,street,district from rooms where idRoom = "+idRoom;
		Rooms room = null;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			
			while(rs.next()){
				room = new Rooms(rs.getInt("idRoom"),rs.getInt("idUser"),rs.getInt("idCategory"),rs.getInt("cost"), rs.getString("description"),rs.getInt("isActive"),
						rs.getString("timeCreated"),rs.getString("timeUpdate"), rs.getInt("isEmpty"),rs.getString("nameRoom"),rs.getString("image"),rs.getString("street"), rs.getString("district"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return room;
	}
	public boolean editRoom(Rooms room) {
        String query = "UPDATE rooms set idUser= '"+room.getIdUser()+"'"
        		+ ",idCategory = '"+room.getIdCategory()+"'"
        		+ ", cost = '"+room.getCost()+"'"
        		+ ", description = '"+room.getDescription()+"'"
        		+ ", isActive = '"+room.getIsActive()+"'"
        		+ ", timeCreated = '"+room.getTimeCreated()+"'"
        		+ ", timeUpdate = '"+room.getTimeUpdate()+"'"
        		+ ", isEmpty = '"+room.getIsActive()+"'"
        		+ ", nameRoom = '"+room.getNameRoom()+"'"
        		+ ", image = '"+room.getImage()+"'"
        		+ ", street = '"+room.getStreet()+"'"
        		+ ", district = '"+room.getDistrict()+"' where idRoom= "+room.getIdRoom();
		
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
