package com.system.po;

import java.util.List;

public class Goods {
	private Integer id;
	private String courseid;
	private String coursename;
	private String coursetime;
	private String classroom;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getCoursetime() {
		return coursetime;
	}
	public void setCoursetime(String coursetime) {
		this.coursetime = coursetime;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public Goods(Integer id, String courseid, String coursename, String coursetime, String classroom) {
		super();
		this.id = id;
		this.courseid = courseid;
		this.coursename = coursename;
		this.coursetime = coursetime;
		this.classroom = classroom;
	}
	public Goods() {
		super();
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", courseid=" + courseid + ", coursename=" + coursename + ", coursetime="
				+ coursetime + ", classroom=" + classroom + "]";
	}

	
}
