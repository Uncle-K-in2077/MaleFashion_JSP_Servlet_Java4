package com.mff.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mff.DAO.LikesDAO;
import com.mff.DAO.UserDAO;
import com.mff.DAO.VideosDAO;
import com.mff.entities.Likes;
import com.mff.entities.User;
import com.mff.entities.Videos;

/**
 * Servlet implementation class AddLike
 */
@WebServlet("/addlike")
public class AddLike extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddLike() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();

			Integer idUser = (Integer) session.getAttribute("idUser");
			System.out.println("user: " + idUser);

			if (idUser != null) {
				int userId = idUser.intValue();
				System.out.println("user is : " + userId);
			} else {
				response.sendRedirect("./login.jsp");
				return;
			}

			int idVideo = Integer.parseInt(request.getParameter("idvd"));
			System.out.println("video: " + idVideo);

			// check
			List<Likes> LikeList = LikesDAO.getLikes();
			for (Likes likes : LikeList) {
				if (likes.getUser().getId().equals(idUser) && likes.getVideos().getId().equals(idVideo)) {
					showNotify(request, response, "You liked this video already!");
					return;
				}
			}

			// get User
			UserDAO userDAO = new UserDAO();
			User user = userDAO.findById(idUser);

			// get Videos
			VideosDAO videoDAO = new VideosDAO();
			Videos vd = videoDAO.findById(idVideo);

			// add like
			Likes likes = new Likes(user, vd);
			LikesDAO likeDAO = new LikesDAO();
			likeDAO.addLike(likes);

			videoDAO.increaseLikes(idVideo);
//			int likeCount = likes.getVideos().getLikes();
//			System.out.println("like + 1 = : " + likeCount);
//			vd.setLikes(vd.getLikes() + 1);
//			videoDAO.update(vd);

			response.sendRedirect(request.getContextPath() + "/home.jsp");
		} catch (Exception e) {
			System.out.println("Lỗi Add Like = : " + e.getMessage());
		}

	}

	private void showNotify(HttpServletRequest request, HttpServletResponse response, String message)
			throws ServletException, IOException {
		request.setAttribute("notify", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		dispatcher.forward(request, response);
	}

}
