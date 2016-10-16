package bo;

import java.sql.Date;
import java.util.ArrayList;

import bean.Rooms;
import dao.RoomDao;

public class RoomBo {
	RoomDao roomDAO = new RoomDao();

	public ArrayList<Rooms> getListRoom() {
		return roomDAO.getListRoom();
	}

	public boolean addRoom(int idUser, int idCategory, int cost,
			String description, int isActive, Date timeCreated,
			Date timeUpdate, int isEmpty, String nameRoom, String image,
			String street, String district) {
		return roomDAO.addRoom(idUser, idCategory, cost, description, isActive,
				timeCreated, timeUpdate, isEmpty, nameRoom, image, street,
				district);

	}

	public boolean delRoom(int id) {
		return roomDAO.delRoom(id);
	}

	public Rooms getRoomDetail(int idRoom) {
		return roomDAO.getRoomDetail(idRoom);
	}

	public boolean editIsEmptyRoom(int isEmpty, int idRoom) {
		return roomDAO.editIsEmptyRoom(isEmpty, idRoom);
	}

	public Rooms getIsEmpty(int idRoom) {
		return roomDAO.getIsEmpty(idRoom);
	}

}
