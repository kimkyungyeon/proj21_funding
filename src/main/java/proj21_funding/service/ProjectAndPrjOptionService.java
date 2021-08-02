package proj21_funding.service;

import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
@Service
public interface ProjectAndPrjOptionService {	
	void trJoinPrjAndPrjOpt(Project project, PrjOption prjoption , MultipartFile uploadfile);	
	void trremovePrjAndPrjOpt(int prjNo);
	void trUpdateAddOptionsOfFourTimes(Map<String, Object> map);
	
	void trUpdateListAddOptionsOfFourTimes(Map<String, Object> map);
	
}
