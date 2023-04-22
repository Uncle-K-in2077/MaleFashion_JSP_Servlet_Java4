package com.mff.entities;
// Generated Apr 22, 2023, 3:20:05 PM by Hibernate Tools 4.3.6.Final

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Videos generated by hbm2java
 */
@Entity
@Table(name = "videos", catalog = "malefashion")
public class Videos implements java.io.Serializable {

	private Integer id;
	private String title;
	private String thumbnail;
	private String linkVideo;
	private String descrip;
	private Integer views;
	private Boolean status;

	public Videos() {
	}

	public Videos(String title, String thumbnail, String linkVideo, String descrip, Integer views, Boolean status) {
		this.title = title;
		this.thumbnail = thumbnail;
		this.linkVideo = linkVideo;
		this.descrip = descrip;
		this.views = views;
		this.status = status;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "Title", length = 200)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "Thumbnail", length = 400)
	public String getThumbnail() {
		return this.thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Column(name = "LinkVideo", length = 400)
	public String getLinkVideo() {
		return this.linkVideo;
	}

	public void setLinkVideo(String linkVideo) {
		this.linkVideo = linkVideo;
	}

	@Column(name = "Descrip", length = 400)
	public String getDescrip() {
		return this.descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	@Column(name = "Views")
	public Integer getViews() {
		return this.views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	@Column(name = "Status")
	public Boolean getStatus() {
		return this.status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

}