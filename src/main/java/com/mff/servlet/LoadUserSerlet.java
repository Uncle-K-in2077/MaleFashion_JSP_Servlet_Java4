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

import org.hibernate.Session;

import com.mff.DAO.UserDAO;
import com.mff.entities.User;
import com.mff.util.HibernateUtil;

/**
 * Servlet implementation class LoadUserSerlet
 */
@WebServlet("/user")
public class LoadUserSerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoadUserSerlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json; charset=UTF-8");
		Session ss = HibernateUtil.getSessionFactory().openSession();
		ss.beginTransaction();

		UserDAO UserDAO = new UserDAO();
		List<User> list = UserDAO.getUsers();
		ss.close();

		HttpSession session = request.getSession();
		session.setAttribute("listUser", list);
		// System.out.println(list.toString());
		request.getRequestDispatcher("UserManagement.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/json; charset=UTF-8");

			String email = request.getParameter("email");
			String fullname = request.getParameter("fullname");
			String password = request.getParameter("password");
			String rePassword = request.getParameter("repassword");

			if (email == null || email.equals("")) {
				showError(request, response, "Email can not be Null");
				return;
			} else if (!email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
				showError(request, response, "Email is Not Valid ");
				return;
			}

			if (password == null || password.equals("")) {
				showError(request, response, "Password can not be Null");
				return;
			} else if (password.length() < 6) {
				showError(request, response, "Password must be more than 6 characters");
				return;
			} else if (!password.equals(rePassword)) {
				showError(request, response, "Confirm Password does not Match");
				return;
			}
			UserDAO UserDAO = new UserDAO();
			List<User> list = UserDAO.getUsers();
			for (User user : list) {
				if (user.getEmail().equals(email)) {
					showError(request, response, "Email had been Taken");
					return;
				}

			}

			User user = new User();
			user.setEmail(request.getParameter("email"));
			user.setFullname(request.getParameter("fullname"));
			user.setPassword(request.getParameter("password"));
			user.setRole(true);
			user.setStatus(true);

			Session ss = HibernateUtil.getSessionFactory().openSession();
			ss.beginTransaction();

			ss.save(user);
			ss.getTransaction().commit();
			ss.close();

			request.getRequestDispatcher("./home.jsp").forward(request, response);
			HttpSession session = request.getSession();
			session.setAttribute("username", user.getFullname());
			session.setAttribute("password", user.getPassword());
			session.setAttribute("email", user.getEmail());

			System.out.println(user.getFullname());

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	private void showError(HttpServletRequest request, HttpServletResponse response, String message)
			throws ServletException, IOException {
		request.setAttribute("error", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("signUp.jsp");
		dispatcher.forward(request, response);
	}

}
