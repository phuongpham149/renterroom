package bo;

import java.util.ArrayList;

import bean.Rooms;
import dao.RoomDao;

public class RoomBo {
	RoomDao roomDAO = new RoomDao();

	public ArrayList<Rooms> getListRoom() {
		// TODO Auto-generated method stub
		return roomDAO.getListRoom();
	}

	public boolean addRoom(Rooms room) {
		// TODO Auto-generated method stub
		return roomDAO.addRoom(room);

	}

	public boolean delRoom(int id) {
		// TODO Auto-generated method stub
		return roomDAO.delRoom(id);
	}

	public Rooms getRoomDetail(int idRoom) {

		return roomDAO.getRoomDetail(idRoom);
	}

	public boolean editRoom(Rooms room) {
		// TODO Auto-generated method stub
		return roomDAO.editRoom(room);
	}
	
	public Rooms getIsActiveByIdRoom(int idRoom ) {
		// TODO Auto-generated method stub
		return roomDAO.getIsActiveByIdRoom(idRoom);
	}
	public int updateActiveRoom(Rooms room) {
		// TODO Auto-generated method stub
		return roomDAO.updateActiveRoom(room);
	}

	public boolean editIsEmptyRoom(Rooms room) {
		// TODO Auto-generated method stub
		return roomDAO.editIsEmptyRoom(room);
	}

	public Rooms getIsEmpty(int idRoom) {

		return roomDAO.getIsEmpty(idRoom);
	}

}
