package com.cored.school.pojo;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

/**
 * 用户（重要操作日志）操作日志
 * 
 * @author mac
 *
 */
@Document(collection = "UserLog")
public class UserLog extends GeneralBean {
	private static final long serialVersionUID = -725718410367972308L;
	@Id
	private String id; // ID
	private String userid;// 用户
	private String ip;// ip地址
	private String message;// 信息描述
	private String reamrk;// 备注
	private String time;// 时间
	private Long order;// 排序
	private String schoolid;//学校ID

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getReamrk() {
		return reamrk;
	}

	public void setReamrk(String reamrk) {
		this.reamrk = reamrk;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Long getOrder() {
		return order;
	}

	public void setOrder(Long order) {
		this.order = order;
	}
	

	public String getSchoolid() {
		return schoolid;
	}

	public void setSchoolid(String schoolid) {
		this.schoolid = schoolid;
	}

	@Override
	public String toString() {
		return "UserLog [id=" + id + ", userid=" + userid + ", ip=" + ip
				+ ", message=" + message + ", reamrk=" + reamrk + ", time="
				+ time + ", order=" + order + ", getId()=" + getId()
				+ ", getUserid()=" + getUserid() + ", getIp()=" + getIp()
				+ ", getMessage()=" + getMessage() + ", getReamrk()="
				+ getReamrk() + ", getTime()=" + getTime() + ", getOrder()="
				+ getOrder() + ", getIsDelete()=" + getIsDelete()
				+ ", getCreateTime()=" + getCreateTime() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}

}
