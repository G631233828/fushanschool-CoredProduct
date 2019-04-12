package com.cored.framework.util;

public class MessageRepository_File {

	
	private String id;// ID
	private String originalName;// 原文件的名字
	private String generateName;// 生成的文件名称
	private String originalPath;// 文件的原地址
	private String compressPicName;// 文件的压缩地址（图片使用）
	private String extension;// 文件扩展名
	private String fileType;// 文件夹，图片，文档等
	private String videoImage;
	

	public String getVideoImage() {
		return videoImage;
	}

	public void setVideoImage(String videoImage) {
		this.videoImage = videoImage;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getGenerateName() {
		return generateName;
	}

	public void setGenerateName(String generateName) {
		this.generateName = generateName;
	}

	public String getOriginalPath() {
		return originalPath;
	}

	public void setOriginalPath(String originalPath) {
		this.originalPath = originalPath;
	}

	public String getCompressPicName() {
		return compressPicName;
	}

	public void setCompressPicName(String compressPicName) {
		this.compressPicName = compressPicName;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	@Override
	public String toString() {
		return "MessageRepository_File [id=" + id + ", originalName="
				+ originalName + ", generateName=" + generateName
				+ ", originalPath=" + originalPath + ", compressPicName="
				+ compressPicName + ", extension=" + extension + ", fileType="
				+ fileType + "]";
	}

}
