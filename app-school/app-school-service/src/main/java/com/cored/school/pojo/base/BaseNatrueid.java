package com.cored.school.pojo.base;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@Document(collection = "BaseNatrueid")
public class BaseNatrueid extends GeneralBean{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7053471933036859837L;
	@Id
	private String id;// id
	private String codeNumber;// 编号
	private String name;// 学校性质
	private List<BaseGrade> baseGrade;
	private String reamrk;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCodeNumber() {
		return codeNumber;
	}

	public void setCodeNumber(String codeNumber) {
		this.codeNumber = codeNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<BaseGrade> getBaseGrade() {
		return baseGrade;
	}

	public void setBaseGrade(List<BaseGrade> baseGrade) {
		this.baseGrade = baseGrade;
	}

	public String getReamrk() {
		return reamrk;
	}

	public void setReamrk(String reamrk) {
		this.reamrk = reamrk;
	}

	@Override
	public String toString() {
		return "BaseNatrueid [id=" + id + ", codeNumber=" + codeNumber
				+ ", name=" + name + ", baseGrade=" + baseGrade + "]";
	}

}
