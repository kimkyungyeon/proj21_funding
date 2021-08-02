package proj21_funding.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.exception.CategoryException;
import proj21_funding.exception.EmptySpaceException;
import proj21_funding.mapper.MyListMapper;
import proj21_funding.mapper.PrjOptionMapper;
import proj21_funding.mapper.ProjectMapper;
import proj21_funding.service.ProjectAndPrjOptionService;
@Service
public class ProjectAndPrjOptionServiceImpl implements ProjectAndPrjOptionService {
	
	//web.xml에 있는 multipart-config 주소랑 동일시하게 
	private static final String UPLOAD_PATH = "C:\\workspace_web\\proj21_funding\\src\\main\\webapp\\images\\project";
	
	@Autowired
	private ProjectMapper pMapper;
	
	@Autowired
	private PrjOptionMapper prjOptMapper;
	
	@Autowired
	private MyListMapper myMapper;

	@Override
	public void trJoinPrjAndPrjOpt(Project project, PrjOption prjoption, MultipartFile uploadfile ) {
	
		int prjName =  project.getPrjName().trim().length();
		int prjContent =  project.getPrjContent().trim().length();
		int optName =  prjoption.getOptName().trim().length();
		int optContent =  prjoption.getOptContent().trim().length();
		
		int categoryNo = project.getpCategoryNo().getpCategoryNo();
		System.out.println("categoryNo >> "+ categoryNo);
		
		if(prjName ==0 || prjContent == 0 || optName == 0 || optContent == 0 ) {
			throw new EmptySpaceException("문자를 등록 해야됩니다.");
		}else if(categoryNo == 0){
			throw new CategoryException("카테고리를 입력해주세요.");
		}else {
			//트렌젝션 prjNo 찾아오기 위함.
			int res = pMapper.insertProject(project);
			prjoption.setPrjNo(project);				
			
			if(uploadfile.getSize() !=0) {
				  
			      String saveName = "project"+prjoption.getPrjNo().getPrjNo()+".jpg";	     
			      
			      File saveFile = new File(UPLOAD_PATH, saveName);
			      try {
			         uploadfile.transferTo(saveFile);
			      }catch (IOException e) {
			      e.printStackTrace();
			      }      
			  }		
		      
		      res += prjOptMapper.insertPrjOption(prjoption);	      
		      
		      if(res != 2) throw new RuntimeException();            
		}

	
	      
//			날짜비교
//			LocalDate now = project.getStartDate();
//			LocalDate EndDate = project.getEndDate();
			
//			int compareEtoP = EndDate.compareTo(PayDate);
			
//			int res;
//			if(compareEtoP <= 0) {
//				 
//			}else {
//				throw new DateTimeOverException("결제일이 마감일보다 빠를 수 없습니다.");
//			}	
	}

	@Override
	public void trremovePrjAndPrjOpt(int prjNo) {
		int res = prjOptMapper.removePrjOption(prjNo);
		
		res += pMapper.removeProject(prjNo);
		
	    if(res != 2) throw new RuntimeException();        
	      
		
	}
	//등록업데이트
	@Override
	public void trUpdateAddOptionsOfFourTimes(Map<String, Object> map) {
		int res = prjOptMapper.updateAllAddOptionsByMap(map);
		System.out.println("map >> "+ map);
		res += prjOptMapper.updateSubOptByMap(map);
		System.out.println("res >> "+ res);
		if(res != 3) throw new RuntimeException();
	}
	
	//myList 업데이트
	@Override
	public void trUpdateListAddOptionsOfFourTimes(Map<String, Object> map) {
		int res = myMapper.updateListAllAddOptionsByMap(map);
		res += myMapper.updateListSubOptByMap(map);
		
		if(res != 3) throw new RuntimeException();
	}
	}
