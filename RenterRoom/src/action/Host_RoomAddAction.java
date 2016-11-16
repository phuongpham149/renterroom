package action;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import FileUtils.DateUtils;
import bean.Rooms;
import bo.CatBo;
import bo.RoomBo;
import dao.LibraryPer;

/**
 * Servlet implementation class Host_RoomAddAction
 */
@WebServlet("/Host_RoomAddAction")
public class Host_RoomAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Host_RoomAddAction() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LibraryPer lPermission = new LibraryPer();
		if (!lPermission.isLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		CatBo catBo = new CatBo();
		request.setAttribute("alCat", catBo.getListCat());

		if ("load".equals(request.getParameter("type"))) {
			RequestDispatcher rd = request.getRequestDispatcher("/host/RoomAdd.jsp");
			rd.forward(request, response);
		} else {// khi nhan submit
			DateUtils dateUtils = new DateUtils();
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			String dateTime = sdf.format(cal.getTime()).toString();
			Date timeCreated, timeUpdate;
			timeCreated = dateUtils.convertToSDate(dateTime);
			timeUpdate = dateUtils.convertToSDate(dateTime);
			int idUser = 1;
			int idCategory = 0, cost = 0;
			int isActive = 0;
			int isEmpty = 0;
			String nameRoom = "", description = "", image = "", street = "", district = "";
			if (ServletFileUpload.isMultipartContent(request)) {
				// lay cac thuoc tinh cua form va cac thuoc tinh cua no
				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
				List<FileItem> items = null;
				try {
					items = upload.parseRequest(request);
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				for (FileItem formItem : items) {
					if (formItem.isFormField()) {
						String fieldName = formItem.getFieldName();
						String fieldValue = formItem.getString();
						switch (fieldName) {
						case "nameRoom":
							nameRoom = fieldValue;
							break;
						case "idCategory":
							idCategory = Integer.parseInt(fieldValue);
							break;
						case "cost":
							cost = Integer.parseInt(fieldValue);
							break;
						case "description":
							description = fieldValue;
							break;
						case "street":
							street = fieldValue;
							break;
						case "district":
							district = fieldValue;
							break;
						}
					} else { // hinh anh
						String pictureName = formItem.getName();
						// doi ten hinh anh
						image = "vne-" + System.nanoTime() + "." + FilenameUtils.getExtension(pictureName);
						// tien hanh up load anh len file
						String pathFile = request.getServletContext().getRealPath("") + File.separator + "files"
								+ File.separator + image;
						File fileUpload = new File(pathFile);
						try {
							formItem.write(fileUpload);
						} catch (Exception e) {
							System.out.println("Co loi trong qua trinh upload file ");
						}
					}
				}
				Rooms obj = new Rooms(0, idUser, idCategory, cost, description, isActive, timeCreated, timeUpdate,
						isEmpty, nameRoom, image, street, district);
				RoomBo roomBo = new RoomBo();
				boolean result = roomBo.addRoom(idUser, idCategory, cost, description, isActive, timeCreated,
						timeUpdate, isEmpty, nameRoom, image, street, district);

				if (result) {
					response.sendRedirect(request.getContextPath() + "/Host_RoomListAction?msg=1");
				} else {
					response.sendRedirect(request.getContextPath() + "/Host_RoomListAction?msg=0");
				}
			} else {
				System.out.println("Form khong thoa man de upload");
			}
		}

	}

}
