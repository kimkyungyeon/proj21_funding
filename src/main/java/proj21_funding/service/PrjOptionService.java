package proj21_funding.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.project.PrjPlusOption;
@Service
public interface PrjOptionService {
	List<PrjOption> showPrjOptionListAll();
	
	List<PrjOption> showPrjOptionByPrjNo(int prjNo);
	PrjOption showPrjOptionByOptNo(int optNo);
	
	//옵션추가 + 여러개추가
	int insertPrjOption(PrjOption prjOption);
	//프로젝트 옵션들 추가1
	int insertOptionByMap(Map<String, Object> map);
	//프로젝트 옵션들 추가2
	int insertPrjOptionsByMap(Map<String, Object> map);
	//프로젝트 옵션들 추가3
	int insertPrjOptionsOfFourByMap(Map<String, Object> map);
	
	
	
	//옵션만 리스트
	List<PrjOption> selectSimplePrjOptionByPrjNo(int prjNo);
		
	//옵션수정 
	int updatePrjOption(PrjOption prjoption);
	//프로젝트 추가옵션1 수정
	int updateOptionByMap(Map<String, Object> map);
	//프로젝트 추가옵션1,2  수정
	int updateAllAddOptionsByMap(Map<String, Object> map);
	
	
	//프로젝트옵션 삭제 (Map) 1번
	int removeOptNumOne(Map<String, Object> map);
	//프로젝트옵션 삭제 (Map) 2번
	int removeOptNumTwo(Map<String, Object> map);
	//프로젝트옵션 삭제 (Map) 3번
	int removeOptNumThree(Map<String, Object> map);
	
	List<PrjOption> showSimpleOptionByPrjNo(int prjNo);
	
	//프로젝트 추가옵션 수정
//	int updateAddOption(AddPrjOption addprjoption);
}
