package com.mff.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mff.DAO.VideosDAO;
import com.mff.entities.Videos;

/**
 * Servlet implementation class DetailVideoAdminServlet
 */
@WebServlet("/videosAdmin/detail")
public class DetailVideoAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		if (username == null) {
			response.sendRedirect("../login.jsp");
			return;
		}

		int id = Integer.parseInt(request.getParameter("id"));
		VideosDAO.increamentView(id);
		Videos vd = VideosDAO.findById(id);
		System.out.println(vd.toString());
		request.setAttribute("videos", vd);
		request.getRequestDispatcher("../VideoDetail.jsp").forward(request, response);
	}

}
