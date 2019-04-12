package com.cored.school.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

/**
 * 学科: 语文，数学，历史，化学等。
 * 
 * @author mac
 *
 */
@Document(collection = "Subject")
public class Subject extends GeneralBean {
	private static final long serialVersionUID = 3926662821271775169L;
	private String name;// 科目名字
	private String subjectNum;// 科目编号
	String remark;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubjectNum() {
		return subjectNum;
	}

	public void setSubjectNum(String subjectNum) {
		this.subjectNum = subjectNum;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	

}
