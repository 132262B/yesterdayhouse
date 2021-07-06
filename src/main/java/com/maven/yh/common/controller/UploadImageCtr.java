package com.maven.yh.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Controller
public class UploadImageCtr {
	
	@RequestMapping(value="/uploadImage", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadImage(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req)  {
		JsonObject jsonObject = new JsonObject();
		
		// 이미지 저장 폴더 위치 지정
		String directory = req.getParameter("directory");
		if(directory.equals("") || directory.equals(null)) {
			directory = "image";
		}
		
		
		// 내부경로로 저장
		String MainDirectory = "Yesterdayhouse_image"; // 이미지 저장소 메인 폴더
		String rootPath = "C:\\"+MainDirectory; // 이미지 저장소 경로
		String fileRoot = rootPath+File.separator+directory+File.separator; // File.separator 는 운영체제에 따라 간결하게 (/,\,.) 등으로 변환해준다.
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", File.separator+MainDirectory+File.separator+directory+File.separator+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
}
