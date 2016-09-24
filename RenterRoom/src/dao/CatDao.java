package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;

public class CatDao {
	Database db = new Database();
	public ArrayList<Category> getListCat() {
		ArrayList<Category> listCat = new ArrayList<Category>();
		String query = "SELECT idCategory,nameCategory from category ";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			Category cat;
			while(rs.next()){
				cat = new Category(rs.getInt("idCategory"),rs.getString("nameCategory"));
				listCat.add(cat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listCat;
	}
	public boolean addCat(String nameCategory) {
		String query = "INSERT INTO category(nameCategory) VALUES (?)";
		int check=0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(query);
			pstm.setString(1, nameCategory);
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
	public boolean delCat(int id) {
		// TODO Auto-generated method stub
		String query = "DELETE FROM category WHERE idCategory=?";
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
	public Category getCatDetail(int idCat) {
		String query = "SELECT idCategory,nameCategory FROM category WHERE idCategory = "+idCat;
		Category cat = null;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			
			while(rs.next()){
				cat = new Category(rs.getInt("idCategory"),rs.getString("nameCategory"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cat;
	}
	public boolean editCat(Category cat) {
        String query = "UPDATE category SET nameCategory= '"+cat.getNameCategory()+"' WHERE idCategory= "+cat.getIdCategory();
		
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
