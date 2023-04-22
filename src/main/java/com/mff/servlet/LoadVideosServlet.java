package com.mff.servlet;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;

import com.mff.DAO.VideosDAO;
import com.mff.entities.Videos;
import com.mff.util.HibernateUtil;

@MultipartConfig
@WebServlet("/videos")
public class LoadVideosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final List<Videos> data = VideosDAO.getVideos();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("utf-8");
		}
		response.setContentType("text/json; charset=UTF-8");

		// Tao 1 hibernate session tu hibernateUltil
		VideosDAO videosDAO = new VideosDAO();
		Session ss = HibernateUtil.getSessionFactory().openSession();
		ss.beginTransaction();

		List<Videos> list = videosDAO.getVideos();

		ss.close();

		HttpSession session = request.getSession();
		session.setAttribute("listVideos", list);
		request.getRequestDispatcher("VideosManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			request.setCharacterEncoding("utf-8");
			response.setContentType("text/json; charset=UTF-8");
			String thumbnail = "";

			Part part = request.getPart("thumbnail");

			String realPath = request.getServletContext().getRealPath("/images");
			thumbnail = Path.of(part.getSubmittedFileName()).getFileName().toString();

			if (!Files.exists(Path.of(realPath))) {
				Files.createDirectories(Path.of(realPath));
			}

			part.write(realPath + "/" + thumbnail);

			// Khai báo các thông tin cần để tạo video mới
			String title = request.getParameter("title");
			String linkVideo = request.getParameter("linkVideo");
			String descrip = request.getParameter("descrip");
			Integer views = 0;
			Videos vd = new Videos();
			vd.setTitle(title);
			vd.setThumbnail(thumbnail);
			vd.setLinkVideo(linkVideo);
			vd.setDescrip(descrip);
			vd.setViews(views);
			vd.setStatus(true);

			Session ss = HibernateUtil.getSessionFactory().openSession();
			ss.beginTransaction();

			ss.save(vd);
			ss.getTransaction().commit();
			// commit xong thì close cái session lại không sẽ bị đầy pool
			ss.close();

			doGet(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
