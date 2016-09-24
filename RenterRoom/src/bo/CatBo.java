package bo;

import java.util.ArrayList;

import bean.Category;
import dao.CatDao;

public class CatBo {
	CatDao catDAO = new CatDao();
	public ArrayList<Category> getListCat() {
		// TODO Auto-generated method stub
		return catDAO.getListCat();
	}
	public boolean addCat(String nameCat) {
		// TODO Auto-generated method stub
		return catDAO.addCat(nameCat);
	}
	public boolean delCat(int id) {
		// TODO Auto-generated method stub
		return catDAO.delCat(id);
	}
	public Category getCatDetail(int idCat) {
		
		return catDAO.getCatDetail(idCat);
	}
	public boolean editCat(Category cat) {
		// TODO Auto-generated method stub
		return catDAO.editCat(cat);
	}

}
