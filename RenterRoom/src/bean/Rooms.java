package bean;

import java.sql.Date;

public class Rooms {
	private int idRoom;
	private int idUser;
	private int idCategory;
	private int cost;
	private String description;
	private int isActive;
	private Date timeCreated;
	private Date timeUpdate;
	private int isEmpty;
	private String nameRoom;
	private String image;
	private String street;
	private String district;
	private String nameCategory;

	public String getNameCategory() {
		return nameCategory;
	}

	public void setNameCategory(String nameCategory) {
		this.nameCategory = nameCategory;
	}

	public Rooms() {
		super();
	}

	public Rooms(int idRoom, int idUser, int idCategory, int cost,
			String description, int isActive, Date timeCreated,
			Date timeUpdate, int isEmpty, String nameRoom, String image,
			String street, String district) {
		super();
		this.idRoom = idRoom;
		this.idUser = idUser;
		this.idCategory = idCategory;
		this.cost = cost;
		this.description = description;
		this.isActive = isActive;
		this.timeCreated = timeCreated;
		this.timeUpdate = timeUpdate;
		this.isEmpty = isEmpty;
		this.nameRoom = nameRoom;
		this.image = image;
		this.street = street;
		this.district = district;
	}

	public int getIdRoom() {
		return idRoom;
	}

	public void setIdRoom(int idRoom) {
		this.idRoom = idRoom;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public int getIdCategory() {
		return idCategory;
	}

	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	public Date getTimeCreated() {
		return timeCreated;
	}

	public void setTimeCreated(Date timeCreated) {
		this.timeCreated = timeCreated;
	}

	public Date getTimeUpdate() {
		return timeUpdate;
	}

	public void setTimeUpdate(Date timeUpdate) {
		this.timeUpdate = timeUpdate;
	}

	public int getIsEmpty() {
		return isEmpty;
	}

	public void setIsEmpty(int isEmpty) {
		this.isEmpty = isEmpty;
	}

	public String getNameRoom() {
		return nameRoom;
	}

	public void setNameRoom(String nameRoom) {
		this.nameRoom = nameRoom;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public Rooms(int idRoom, int idUser, int idCategory, int cost,
			String description, int isActive, Date timeCreated,
			Date timeUpdate, int isEmpty, String nameRoom, String image,
			String street, String district, String nameCategory) {
		super();
		this.idRoom = idRoom;
		this.idUser = idUser;
		this.idCategory = idCategory;
		this.cost = cost;
		this.description = description;
		this.isActive = isActive;
		this.timeCreated = timeCreated;
		this.timeUpdate = timeUpdate;
		this.isEmpty = isEmpty;
		this.nameRoom = nameRoom;
		this.image = image;
		this.street = street;
		this.district = district;
		this.nameCategory = nameCategory;
	}

}