package com.cored.school.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class FileOperateUtil {
	private static final Logger log = LoggerFactory
			.getLogger(FileOperateUtil.class);
	private static final int BUFFER_SIZE = 16 * 1024;

	private static final String REALNAME = "realname";
	private static final String PATH = "path";
	private static final String SIZE = "size";
	private static final String SUFFIX = "suffix";
	private static final String CONTENTTYPE = "contentType";
	private static final String CREATETIME = "createTime";
	private static final String HASSUFFIX = "hassuffix";
	
	/**
	 * 添加文件集合中的图片类型。
	 * @param filetype
	 * @param type
	 * @return
	 */
	public static String fileTypeScreening(String filetype, String type) {
		if (filetype.indexOf(type) != -1)
			return filetype;
		else
			return filetype+type+",";
	}
	
	
	/**
	 * 获取文件的后缀名
	 * @param fileName
	 * @return
	 */
	public static String getFilePrefix(String fileName){
	      return fileName.substring(fileName.lastIndexOf("."));
	}
	

	/***
	 * 将上传的文件进行重命名
	 * @param name
	 * @return
	 */
	private static String rname(String name) {
		Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date()));
		Long random = (long) (Math.random() * now);
		String fileName = now + "" + random;

		if (name.indexOf(".") != -1) {
			fileName += name.substring(0,name.lastIndexOf("."))+name.substring(name.lastIndexOf("."));
		}
		return fileName;

	}
	
	
	public static String uploadFile(File file, String fileName,String upLoadPath) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		File newFile = new File(upLoadPath+fileName);//新文件的目录
		copy(file, newFile);

		ImageTool imageTool = new ImageTool();
//		imageTool.compressPic(SystemConfig.getProjectPath() + "\\"
//				+ SystemConfig.getLinePath() + "\\", SystemConfig
//				.getProjectPath()
//				+ "\\" + SystemConfig.getLinePath() + "\\", fileName, "1_"
//				+ fileName, 200, 200, true);
		log.info("上传文件的路径："+upLoadPath + fileName);

		return upLoadPath + fileName;
	}
	 
	 
	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				// in = new BufferedInputStream( new FileInputStream(src),
				// BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				// out = new BufferedOutputStream(new FileOutputStream(dst),
				// BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
	 
	 
	 
	

}
