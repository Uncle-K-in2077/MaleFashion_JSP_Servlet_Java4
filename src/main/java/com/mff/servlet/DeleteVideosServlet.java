package com.mff.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.mff.DAO.VideosDAO;
import com.mff.util.HibernateUtil;

/**
 * Servlet implementation class DeleteVideosServlet
 */
@WebServlet("/videos/delete")
public class DeleteVideosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Session ss = HibernateUtil.getSessionFactory().openSession();
		ss.beginTransaction();

		int idVD = Integer.parseInt(request.getParameter("id"));
		VideosDAO video = new VideosDAO();
		video.delete(idVD);
		ss.close();

		// Redirect về trang quản lý video luôn
		response.sendRedirect(request.getContextPath() + "/videos");

	}

}
