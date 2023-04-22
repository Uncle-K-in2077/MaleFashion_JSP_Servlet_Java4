package com.mff.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mff.entities.User;
import com.mff.util.HibernateUtil;

public class UserDAO {
	public static void saveUser(User user) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the User object
			session.save(user);
			// commit transaction
			transaction.commit();
			session.close();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	// Tạo hàm lấy dữ liệu
	public static List<User> getUsers() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("select user from User as user", User.class).list();
		}
	}

}
