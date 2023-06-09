package com.mff.DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mff.entities.Videos;
import com.mff.util.HibernateUtil;

public class VideosDAO {
	public static void saveVideo(Videos vd) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the User object
			session.save(vd);
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
	public static List<Videos> getVideos() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("select videos from Videos as videos", Videos.class).list();
		}
	}

	// ASC sort
	public static List<Videos> getVideosSortedByViewAsc() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("select videos from Videos as videos ORDER BY videos.views ASC", Videos.class)
					.list();
		}
	}

	// DESC sort
	public static List<Videos> getVideosSortedByViewDesc() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("select videos from Videos as videos ORDER BY videos.views DESC", Videos.class)
					.list();
		}
	}

	// AddLike
	public void increaseLikes(int videoId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction ss = null;
		try {
			ss = session.beginTransaction();
			Videos video = session.get(Videos.class, videoId);
			if (video != null) {
				int currentLikes = video.getLikes() != null ? video.getLikes() : 0;
				video.setLikes(currentLikes + 1);
				session.update(video);
			}
			ss.commit();
		} catch (HibernateException e) {
			if (ss != null) {
				ss.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	// DeleteLike
	public void decreaseLikeCount(int videoId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction ss = null;
		try {
			ss = session.beginTransaction();

			// Lấy thông tin video từ database
			Videos video = (Videos) session.get(Videos.class, videoId);

			// Lấy số lượt thích hiện tại
			int currentLikes = video.getLikes();
			System.out.println("current like is : " + currentLikes);

			// Giảm số lượt thích
			if (currentLikes > 0) {
				video.setLikes(currentLikes - 1);
			}

			session.update(video);
			ss.commit();
		} catch (HibernateException e) {
			if (ss != null)
				ss.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	// hàm tìm kiếm theo keyword
	public static List<Videos> findVideosByKW(String keyword) {
		try (Session ss = (Session) HibernateUtil.getSessionFactory().openSession()) {
			Query query = ss.createQuery("select videos from Videos as videos " + "where videos.title LIKE :keyword ",
					Videos.class);
			query.setParameter("keyword", "%" + keyword + "%");
			return query.list();
		}
	}

	public static void delete(int id) {
		Transaction transaction = null;
		try (Session ss = HibernateUtil.getSessionFactory().openSession()) {
			transaction = ss.beginTransaction();

			Videos video = ss.get(Videos.class, id);
			ss.delete(video);

			transaction.commit();
			ss.close();

		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
				System.out.println("delete FAIL");
			}
			e.printStackTrace();
		}
	}

	public static Videos findById(int id) {
		try (Session ss = HibernateUtil.getSessionFactory().openSession()) {
			Videos vd = ss.load(Videos.class, id);
			System.out.print(vd);
			return vd;
		}
	}

	public static void update(Videos vd) {
		Transaction transaction = null;
		try (Session ss = HibernateUtil.getSessionFactory().openSession()) {
			transaction = ss.beginTransaction();
			ss.update(vd);
			transaction.commit();
			ss.close();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public static List<Videos> getVideosPagination(int page, int limit) {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			Query query = session.createQuery("select videos from Videos as videos order by id asc", Videos.class);
			query.setFirstResult(page);
			query.setMaxResults(limit);
			return query.list();
		}
	}

	public static void increamentView(int id) {
		Videos video = findById(id);
		video.setViews(video.getViews() + 1);
		update(video);
	}

	public static long getTotal() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			Query query = session.createQuery("select count(videos.id) from Videos videos");
			return (Long) query.uniqueResult();
		}
	}

	public static void main(String[] args) {
		System.out.println(findById(1).toString());
	}

}
