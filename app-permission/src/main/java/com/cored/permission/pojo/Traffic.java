package com.cored.permission.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@SuppressWarnings("serial")
@Document(collection = "Traffic")
public class Traffic extends GeneralBean {

	private int traffic;//访问量

	public int getTraffic() {
		return traffic;
	}

	public void setTraffic(int traffic) {
		this.traffic = traffic;
	}

}
