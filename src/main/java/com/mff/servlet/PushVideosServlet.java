package com.mff.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.mff.DAO.VideosDAO;
import com.mff.entities.Videos;
import com.mff.util.HibernateUtil;

/**
 * Servlet implementation class PushVideosServlet
 */
@WebServlet("/pushvideo")
public class PushVideosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PushVideosServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

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
		request.getRequestDispatcher("./include/Blogs.jsp").forward(request, response);
	}

	List<Videos> data = VideosDAO.getVideos();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
