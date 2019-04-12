package com.cored.framework.pojo;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;

import com.cored.framework.util.MessageRepository_File;

/**
 * 通用的Bean, 所有POJO实体类务必实现些类
 * 
 * @author aaron
 *
 */
public class GeneralBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2768471114934649845L;
	@Id
	private String id;
	private Boolean isDelete; // 是否删除(默认为：false)
	private Date createTime; // 创建时间（详细时间）
	private String createDate;//创建日期
	
	private String schoolForId;//学校ID
	private String schoolId;// 学校id
	public SchoolRoleType schoolRoleType;// 学校权限类型。schoolAdminRole, schoolUserRole
	public Long idForUser;// 用户自定义ID,用于保存添加时间。
	
	
	
	 List<MessageRepository_File> fileList;// 文件集合
	
	public GeneralBean(){
		this.createTime=new Date();//创建时间 
		this.isDelete=false;	//
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		this.createDate=sdf.format(new Date());//创建日期
	}
	
	

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	/**
	 * 是否删除(默认为：false)
	 * @return
	 */
	public Boolean getIsDelete() {
		return isDelete;
	}
	/**
	 * 是否删除(默认为：false)
	 * @param isDelete
	 */
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	/**
	 * 创建时间
	 * @return
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * 创建时间
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	

	public String getSchoolForId() {
		return schoolForId;
	}


	public void setSchoolForId(String schoolForId) {
		this.schoolForId = schoolForId;
	}


	public SchoolRoleType getSchoolRoleType() {
		return schoolRoleType;
	}

	public void setSchoolRoleType(SchoolRoleType schoolRoleType) {
		this.schoolRoleType = schoolRoleType;
	}

	public Long getIdForUser() {
		return idForUser;
	}

	public void setIdForUser(Long idForUser) {
		this.idForUser = idForUser;
	}
	@Override
	public String toString() {
		return "GeneralBean [  isDelete=" + isDelete
				+ ", createTime=" + createTime + "]";
	}
	
	
	public enum SchoolRoleType{
		schoolAdminRole, schoolUserRole
	}


	public String getCreateDate() {
		return createDate;
	}


	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}



	public List getFileList() {
		return fileList;
	}



	public void setFileList(List fileList) {
		this.fileList = fileList;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
