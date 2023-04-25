package com.mff.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mff.entities.Likes;
import com.mff.util.HibernateUtil;

public class LikesDAO {
	public void addLike(Likes like) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(like);
			transaction.commit();

		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public void removeLike(Likes like) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.delete(like);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public static Likes getLikeById(int id) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.get(Likes.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Likes> getLikesByUserId(int userId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			String hql = "FROM Likes WHERE idUser = :userId";
			Query<Likes> query = session.createQuery(hql, Likes.class);
			query.setParameter("userId", userId);
			return query.getResultList();
		} finally {
			session.close();
		}
	}

	// Get all like
	public static List<Likes> getLikes() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("select likes from Likes as likes", Likes.class).list();

		}
	}

	// get videos like by idUser truyền vào
//	public static void main(String[] args) {
//		List<Likes> list = getLikesByUserId(1);
//		for (Likes likes : list) {
//			System.out.println(likes.getVideos());
//		}
//	}

}
