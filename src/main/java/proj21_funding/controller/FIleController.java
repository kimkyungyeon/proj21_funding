package proj21_funding.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FIleController {
	
	private static final String UPLOAD_PATH = "C:\\workspace_web\\proj21_funding\\src\\main\\webapp\\images\\project";
	
	@GetMapping("/form")
	public String form() {
		return "upload/uploadfile_form";
	}
	
	@PostMapping("/fileUpload")
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		
		Map map = new HashMap();
		
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		
		List fileList = fileProcess(multipartRequest);
		System.out.println("map >> "+ map);
		map.put("fileList", fileList);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("result");		
		return mav;
		
	}

	private List fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(UPLOAD_PATH + "\\" + fileName);
			
			System.out.println("originalFileName >> "+  originalFileName);
			if(mFile.getSize() != 0) {
				if(file.getParentFile().mkdir()) {
					file.createNewFile();
				}
			}
			mFile.transferTo(new File(UPLOAD_PATH + "\\" + originalFileName));
			System.out.println("mFile >> "+ mFile);
		}
		
		return fileList;
	}
	
}
