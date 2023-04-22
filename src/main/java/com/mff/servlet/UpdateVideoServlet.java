package com.mff.servlet;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mff.DAO.VideosDAO;
import com.mff.entities.Videos;

@MultipartConfig
@WebServlet("/video/update")
public class UpdateVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json; charset=UTF-8");
		System.out.println("update");
		int idVd = Integer.parseInt(request.getParameter("id"));
		String newThumbnail = "";
		try {
			Part part = request.getPart("newThumbnail");
			if (part == null) {
				newThumbnail = request.getParameter("oldThumbnail");
			} else {

				String realPath = request.getServletContext().getRealPath("/images");
				newThumbnail = Path.of(part.getSubmittedFileName()).getFileName().toString();

				System.out.println(newThumbnail);

				if (!Files.exists(Path.of(realPath))) {
					Files.createDirectories(Path.of(realPath));
				}

				part.write(realPath + "/" + newThumbnail);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		String title = request.getParameter("title");
		String linkVideo = request.getParameter("linkVideo");
		String Descrip = request.getParameter("descrip");

		Videos vd = VideosDAO.findById(idVd);

		vd.setTitle(title);
		vd.setThumbnail(newThumbnail);
		vd.setLinkVideo(linkVideo);
		vd.setDescrip(Descrip);

		System.out.println("asd :" + vd.toString());

		if (title == null || newThumbnail == null || linkVideo == null || Descrip == null) {
			System.out.println("update fail");
			return;
		} else {
			VideosDAO.update(vd);
		}
		request.setAttribute("videos", vd);
		request.getRequestDispatcher("../VideoDetail.jsp").forward(request, response);
	}

}
