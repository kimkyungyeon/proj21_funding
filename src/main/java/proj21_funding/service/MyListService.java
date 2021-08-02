package proj21_funding.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_funding.dto.Project;

@Service
public interface MyListService {
	//	고객번호로 마이리스트 검색
	List<Project> showAllMyList(int userNo);
	//map으로 프로젝트 전체 검색
	List<Project> showAllListByMap(Map<String, Object> map);
	// 프로젝트 번호로 디테일하게 검색
	List<Project> showDetailListByprjNo(int prjNo);
	// 프로젝트 and 옵션 조인 디테일리스트
	int joinUpdateProjectAndPrjOptionByPrjNoInMyLIst(Map<String, Object> map);
	
	//프로젝트 추가옵션1 수정
	int updateListOptionByMap(Map<String, Object> map);
	//프로젝트 추가옵션1,2  수정
	int updateListAllAddOptionsByMap(Map<String, Object> map);
	//프로젝트 추가옵션1,2,3  부속 수정
	int updateListSubOptByMap(Map<String, Object> map);
	//	캐스캐이드 맵으로 지우기
	int deleteCascadeProjectByMap(Map<String, Object> map);
	//회원별 프로젝트 통계
	int selectCountPrjByUserNo(Map<String, Object> map);
	
}
