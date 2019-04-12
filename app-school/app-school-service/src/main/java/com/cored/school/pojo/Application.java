package com.cored.school.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

/**
 * 
 * @author 各类申请，（请假，报修，专用室，用车）
 *
 */
@Document(collection = "Application")
public class Application extends GeneralBean {
	private static final long serialVersionUID = 2610821809977616872L;
	private String name;// 申请人
	private String nameid;// 申请人的ID

	private String type;// 请假类型，设备的类型，会议室类型（会议室1，会议室2）
	private String dempartment;// （会议室使用的部门，用车申请）

	private String sdate;// 开始时间（请假使用,专用室，用车申请）
	private String edate;// 结束时间（请假使用,专用室，用车申请）

	private String message;// 申请理由，报修的内容，申请专用室的理由，用车申请理由
	private String repairsAddredd;// 报修的地址，申请专用室需要准备的工作

	private String status;// 申请的状态
	private String isHK;// 是否需要安排换课

	private String idCode;// 标识id,1:请假，2：报修，3：专用室，4：用车


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameid() {
		return nameid;
	}

	public void setNameid(String nameid) {
		this.nameid = nameid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDempartment() {
		return dempartment;
	}

	public void setDempartment(String dempartment) {
		this.dempartment = dempartment;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getRepairsAddredd() {
		return repairsAddredd;
	}

	public void setRepairsAddredd(String repairsAddredd) {
		this.repairsAddredd = repairsAddredd;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIsHK() {
		return isHK;
	}

	public void setIsHK(String isHK) {
		this.isHK = isHK;
	}

	public String getIdCode() {
		return idCode;
	}

	public void setIdCode(String idCode) {
		this.idCode = idCode;
	}



	@Override
	public String toString() {
		return "Application [name=" + name + ", nameid=" + nameid + ", type="
				+ type + ", dempartment=" + dempartment + ", sdate=" + sdate
				+ ", edate=" + edate + ", message=" + message
				+ ", repairsAddredd=" + repairsAddredd + ", status=" + status
				+ ", isHK=" + isHK + ", idCode=" + idCode + "]";
	}

}
