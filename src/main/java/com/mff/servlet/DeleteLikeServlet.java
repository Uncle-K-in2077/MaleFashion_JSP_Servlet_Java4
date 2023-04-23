package com.mff.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mff.DAO.LikesDAO;
import com.mff.entities.Likes;

/**
 * Servlet implementation class DeleteLikeServlet
 */
@WebServlet("/deleteLike")
public class DeleteLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();

			Integer idUser = (Integer) session.getAttribute("idUser");

			int likeId = Integer.parseInt(request.getParameter("idLike"));
			LikesDAO likeDAO = new LikesDAO();
			Likes like = likeDAO.getLikeById(likeId);
			if (like != null) {
				likeDAO.removeLike(like);
			}
			response.sendRedirect(request.getContextPath() + "/LikedByUser?id=" + idUser);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Delete Like servlet error: " + e.getMessage());
		}
	}

}
