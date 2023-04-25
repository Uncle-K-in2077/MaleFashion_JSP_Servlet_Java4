package com.mff.servlet;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;

import com.mff.DAO.VideosDAO;
import com.mff.entities.Videos;
import com.mff.util.HibernateUtil;

/**
 * Servlet implementation class LoadVideosServlet2
 */
@WebServlet("/videoss")
public class LoadVideosServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sortType = request.getParameter("sort");
		System.out.println(sortType);
		List<Videos> list = null;
		list = VideosDAO.getVideosSortedByViewDesc();

		request.setAttribute("listVideos", list);
		request.getRequestDispatcher("VideosManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			request.setCharacterEncoding("utf-8");
			response.setContentType("text/json; charset=UTF-8");

			String title = request.getParameter("title");
			String linkVideo = request.getParameter("linkVideo");
			String descrip = request.getParameter("descrip");
			if (title == null || title.isEmpty()) {
				showError2(request, response, "Your Video's title is NULL");
				return;
			}
			if (linkVideo == null || linkVideo.trim().isEmpty()) {
				showError2(request, response, "Link video is null or empty");
				return;
			}

			if (descrip == null || descrip.trim().isEmpty()) {
				showError2(request, response, "Description is null or empty");
				return;
			}

			String thumbnail = "";

			Part part = request.getPart("thumbnail");

			String realPath = request.getServletContext().getRealPath("/images");
			thumbnail = Path.of(part.getSubmittedFileName()).getFileName().toString();

			if (!Files.exists(Path.of(realPath))) {
				Files.createDirectories(Path.of(realPath));
			}

			part.write(realPath + "/" + thumbnail);

			// Khai báo các thông tin cần để tạo video mới
//			String title = request.getParameter("title");
//			String linkVideo = request.getParameter("linkVideo");
//			String descrip = request.getParameter("descrip");
//			if (title == null) {
//				showError2(request, response, "you crazy Bitch. Your input is NULL");
//				return;
//			}

			Integer views = 0;
			Integer likes = 0;
			Videos vd = new Videos();
			vd.setTitle(title);
			vd.setThumbnail(thumbnail);
			vd.setLinkVideo(linkVideo);
			vd.setDescrip(descrip);
			vd.setViews(views);
			vd.setLikes(likes);
			vd.setStatus(true);

			Session ss = HibernateUtil.getSessionFactory().openSession();
			ss.beginTransaction();

			ss.save(vd);
			ss.getTransaction().commit();
			// commit xong thì close cái session lại không sẽ bị đầy pool
			ss.close();

			doGet(request, response);
		} catch (Exception e) {
			System.out.println("Error at Servlet Thêm Video mới: " + e.getMessage());
		}
	}

	private void showError2(HttpServletRequest request, HttpServletResponse response, String message)
			throws ServletException, IOException {
		request.setAttribute("error2", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("VideosManagement.jsp");
		dispatcher.forward(request, response);
	}

}
