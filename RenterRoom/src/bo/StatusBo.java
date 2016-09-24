package bo;

import java.util.ArrayList;

import bean.Status;
import dao.StatusDao;

public class StatusBo {
	StatusDao statusDAO = new StatusDao();
	public ArrayList<Status> getListStatus() {
		// TODO Auto-generated method stub
		return statusDAO.getListStatus();
	}
	public boolean addStatus(String nameStatus) {
		// TODO Auto-generated method stub
		return statusDAO.addStatus(nameStatus);
	}
	public boolean delStatus(int id) {
		// TODO Auto-generated method stub
		return statusDAO.delStatus(id);
	}
	public Status getStatusDetail(int idStatus) {
		
		return statusDAO.getStatusDetail(idStatus);
	}
	public boolean editStatus(Status status) {
		// TODO Auto-generated method stub
		return statusDAO.editStatus(status);
	}

	

}
