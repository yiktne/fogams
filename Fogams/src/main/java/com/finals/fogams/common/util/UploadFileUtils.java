package com.finals.fogams.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {
		
		String originalFileName = file.getOriginalFilename();
		byte[] fileData = file.getBytes();
		
		// 파일명 중복 방지 처리
		String uuidFileName = getUuidFileName(originalFileName);
		
		// 파일 업로드 경로 설정
		String rootPath = getRootPath(originalFileName, request);
		String datePath = getDatePath(rootPath);
		
		// 서버에 파일 저장
		File target = new File(rootPath + datePath, uuidFileName);
		FileCopyUtils.copy(fileData, target);
		
		// 이미지 파일인 경우 썸네일 이미지생성
		if(MediaUtils.getMediaType(originalFileName) != null) {
			uuidFileName = makeThumbnail(rootPath, datePath, uuidFileName);
		}
		
		
		return replaceSacedFilePath(datePath, uuidFileName);
	}
	
	public static void deleteFile(String fileName, HttpServletRequest request) {
		
		String rootPath = getRootPath(fileName, request);
		
		MediaType mediaType = MediaUtils.getMediaType(fileName);
		if(mediaType != null) {
			String originalImg = fileName.substring(0, 12) + fileName.substring(14);
			new File(rootPath + originalImg.replace("/", File.separatorChar)).delete();
		}
		new File(rootPath + fileName.replace("/", File.separatorChar)).delete();
	}
	
	public static HttpHeaders getHttpHeaders(String fileName) throws Exception {
		
		MediaType mediaType = MediaUtils.getMediaType(fileName);
		HttpHeaders httpHeaders = new HttpHeaders();
		
		if(mediaType != null) {
			httpHeaders.setContentType(mediaType);
			return httpHeaders;
		}
		fileName = fileName.substring(fileName.indexOf("_") + 1);
		httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		
		httpHeaders.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
		
		return httpHeaders;
	}
	
	// 기본경로
	public static String getRootPath(String fileName, HttpServletRequest request) {
		
		String rootPath = "/resources/upload";
		MediaType mediaType = MediaUtils.getMediaType(fileName);
		if(mediaType != null) {
			return request.getSession().getServletContext().getRealPath(rootPath + "/images");
			
		}
		
		return request.getSession().getServletContext().getRealPath(rootPath + "/files");
		
	}
	
	//날짜 폴더명
	private static String getDatePath(String uploadPath) {
		
		Calendar calendar = Calendar.getInstance();
		String yearPath = File.separator + calendar.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(calendar.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(calendar.get(Calendar.DATE));
		
		makeDateDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
		
	}
	
	private static void makeDateDir(String uploadPath, String...paths ) {
		
		if(new File(uploadPath + paths[paths.length - 1]).exists())
			return;
		
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists())
				dirPath.mkdir();
		}
		
	}
	
	private static String replaceSacedFilePath(String datePath, String fileName) {
		String savedFilePath = datePath + File.separator + fileName;
		return savedFilePath.replace(File.separatorChar, "/");
	}
	
	private static String getUuidFileName(String originalFileName) {
		return UUID.randomUUID().toString() + "_" + originalFileName;
	}
	
	private static String makeThumbnail(String uploadRootPath, String datePath, String fileName) throws Exception{
		

		return "";
		
	}
	
	
	
}
