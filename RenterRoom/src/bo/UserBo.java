package bo;

import java.util.ArrayList;

import bean.Users;
import dao.UserDao;

public class UserBo {
	UserDao userDAO = new UserDao();

	public ArrayList<Users> getListUser() {
		return userDAO.getListUser();
	}

	public boolean addUser(String username, String password,
			String phoneNumber, int role, String email, String address) {
		return userDAO.addUser(username, password, phoneNumber, role, email,
				address);

	}

	public boolean delUser(int id) {
		return userDAO.delUser(id);
	}

	public Users getUserDetail(int idUser) {
		return userDAO.getUserDetail(idUser);
	}

	public ArrayList<Users> getListHost() {
		return userDAO.getListHost();
	}
}
