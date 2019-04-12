package com.cored.school.pojo;

import java.util.List;

import com.cored.framework.util.MessageRepository_File;

public class WockClasses_UploadFile {

	String name;// 上传人的姓名
	public List<MessageRepository_File> listUploadMessage;// 上传资料

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<MessageRepository_File> getListUploadMessage() {
		return listUploadMessage;
	}

	public void setListUploadMessage(
			List<MessageRepository_File> listUploadMessage) {
		this.listUploadMessage = listUploadMessage;
	}

	@Override
	public String toString() {
		return "WockClasses_UploadFile [name=" + name + ", listUploadMessage="
				+ listUploadMessage + "]";
	}

}
