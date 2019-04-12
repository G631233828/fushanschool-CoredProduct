package com.cored.school.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@Document(collection = "Grade")
public class Grade extends GeneralBean {

	private static final long serialVersionUID = 4433713805563582024L;
	private String gradenum;
	private String name;
	private String reamrk;

	public String getGradenum() {
		return gradenum;
	}

	public void setGradenum(String gradenum) {
		this.gradenum = gradenum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	

	public String getReamrk() {
		return reamrk;
	}

	public void setReamrk(String reamrk) {
		this.reamrk = reamrk;
	}

	@Override
	public String toString() {
		return "Grade [gradenum=" + gradenum + ", name=" + name + ", reamrk="
				+ reamrk + "]";
	}

}
