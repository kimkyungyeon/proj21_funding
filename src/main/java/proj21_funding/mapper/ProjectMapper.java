package proj21_funding.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import proj21_funding.dto.Project;

@Component
public interface ProjectMapper {
//	프로젝트 전체검색
	List<Project> selectProjectListAll();
//	프로젝트 번호로 검색
	Project selectProjectByNo(int prjNo);
//	프로젝트관리자로 검색
	List<Project> selectProjectByUser(int userNo);
	
//  성공임박 프로젝트 출력
	List<Project>selectProjectSuccessImbak();
//  프로젝트 + 카테고리 출력
	Project showJoinPrjAndCategory(int prjNo);
	

//	프로젝트 등록
	int insertProject(Project project);
// 프로젝트 수정
	int updateProject(Project project);
// 프로젝트and 옵션 조인 업데이트
	int joinUpdateProjectAndPrjoptionByPrjNo(Map<String, Object> map);
//	프로젝트 삭제
	int removeProject(int prjNo);
	
	int updateEndYn();
	
	
	
}
