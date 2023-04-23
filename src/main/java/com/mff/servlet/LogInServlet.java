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

import com.mff.DAO.UserDAO;
import com.mff.entities.User;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet("/LogIn")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogInServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/json; charset=UTF-8");

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDAO UserDAO = new UserDAO();
		List<User> list = UserDAO.getUsers();
		try {
			for (User user : list) {
				if (email.equals(user.getEmail()) && password.equals(user.getPassword())) {
					HttpSession session = request.getSession();
					session.setAttribute("username", user.getFullname());
					session.setAttribute("email", user.getEmail());
					session.setAttribute("password", user.getPassword());
					session.setAttribute("role", user.getRole());
					session.setAttribute("idUser", user.getId());
					System.out.println("idUser: " + session.getAttribute("idUser"));

					response.sendRedirect("./home.jsp");
				}
			}
			showError(request, response, "We can't find you account!");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	private void showError(HttpServletRequest request, HttpServletResponse response, String message)
			throws ServletException, IOException {
		request.setAttribute("error", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

}
