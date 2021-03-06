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

	public int lockHost(int idLockHost) {
		return userDAO.lockHost(idLockHost);
	}

	public int unlockHost(int idLockHost) {
		return userDAO.unlockHost(idLockHost);
	}

	public Users getUserByUsernamePassword(String userName, String password) {
		return userDAO.getUserByUsernamePassword(userName,password);
	}

	public Users getUserByUserName(String username) {
		return userDAO.getUserByUserName(username);
	}
}
