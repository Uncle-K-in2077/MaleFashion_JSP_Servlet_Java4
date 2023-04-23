package com.mff.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.mff.DAO.LikesDAO;
import com.mff.entities.Likes;
import com.mff.util.HibernateUtil;

/**
 * Servlet implementation class LikedByUser
 */
@WebServlet("/LikedByUser")
public class LikedByUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LikedByUser() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session ss = HibernateUtil.getSessionFactory().openSession();
		ss.beginTransaction();

		int idUser = Integer.parseInt(request.getParameter("id"));
		LikesDAO likes = new LikesDAO();
		List<Likes> likeList = likes.getLikesByUserId(idUser);
		for (Likes likesVideos : likeList) {
			System.out.println(likesVideos.getVideos().getTitle() + likesVideos.getId());
		}
		ss.close();

		request.setAttribute("likeList", likeList);
		request.getRequestDispatcher("./LikedVideosbyUser.jsp").forward(request, response);
	}

}
