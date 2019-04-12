package com.cored.school.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@Document(collection = "Student")
public class Student extends GeneralBean {
	private static final long serialVersionUID = 5838826781193168730L;
	private String classesId;// 班级id
	private String name;// 姓名
	private String sex; // 性别
	private Integer age;//年龄
	private String entranceYear;// 入学年份
	private String cardId;// 身份证Id（证件号）
	private String fileCode;// 学籍号
	private String nativePlace;// 籍贯
	private String code;// 学号
	private String address;// 居住地址
	private String health;// 建康状态
	private String contactsPerson;// 联系人
	private String contactsPhone;// 联系电话
	private String contactsmobile;// 联系手机
	private User User;
	private String remark;

	

	public String getClassesId() {
		return classesId;
	}

	public void setClassesId(String classesId) {
		this.classesId = classesId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEntranceYear() {
		return entranceYear;
	}

	public void setEntranceYear(String entranceYear) {
		this.entranceYear = entranceYear;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getFileCode() {
		return fileCode;
	}

	public void setFileCode(String fileCode) {
		this.fileCode = fileCode;
	}

	public String getNativePlace() {
		return nativePlace;
	}

	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHealth() {
		return health;
	}

	public void setHealth(String health) {
		this.health = health;
	}

	public String getContactsPerson() {
		return contactsPerson;
	}

	public void setContactsPerson(String contactsPerson) {
		this.contactsPerson = contactsPerson;
	}

	public String getContactsPhone() {
		return contactsPhone;
	}

	public void setContactsPhone(String contactsPhone) {
		this.contactsPhone = contactsPhone;
	}

	public String getContactsmobile() {
		return contactsmobile;
	}

	public void setContactsmobile(String contactsmobile) {
		this.contactsmobile = contactsmobile;
	}

	public User getUser() {
		return User;
	}

	public void setUser(User user) {
		User = user;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Student [classesId=" + classesId + ", name=" + name + ", sex="
				+ sex + ", age=" + age + ", entranceYear=" + entranceYear
				+ ", cardId=" + cardId + ", fileCode=" + fileCode
				+ ", nativePlace=" + nativePlace + ", code=" + code
				+ ", address=" + address + ", health=" + health
				+ ", contactsPerson=" + contactsPerson + ", contactsPhone="
				+ contactsPhone + ", contactsmobile=" + contactsmobile
				+ ", User=" + User + ", remark=" + remark + "]";
	}

	
	
	
}
