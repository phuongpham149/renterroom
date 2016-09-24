package bo;

import java.util.ArrayList;

import bean.Users;
import dao.UserDao;


public class UserBo {
	UserDao userDAO = new UserDao();
	public ArrayList<Users> getListUser() {
		// TODO Auto-generated method stub
		return userDAO.getListUser();
	}
	public boolean addUser(Users users) {
		// TODO Auto-generated method stub
		return userDAO.addUser(users);
				
	}
	public boolean delUser(int id) {
		// TODO Auto-generated method stub
		return userDAO.delUser(id);
	}
	public Users getUserDetail(int idUser) {
		
		return userDAO.getUserDetail(idUser);
	}
	public boolean editUser(Users user) {
		// TODO Auto-generated method stub
		return userDAO.editUser(user);
	}

}
