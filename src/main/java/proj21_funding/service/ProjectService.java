package proj21_funding.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.Project;
@Service
public interface ProjectService {
//	프로젝트 전체검색
	List<Project> showProjectListAll();
//	프로젝트 번호로 검색
	Project showProjectByNo(int prjNo);
//	프로젝트 등록
	int insertProject(Project project);
// 프로젝트 수정
	int updateProject(Project project, MultipartFile uploadfile);
//	프로젝트and 옵션 조인 업데이트by Map
	int joinUpdateProjectAndPrjoptionByNo(Map<String, Object> map);
//  프로젝트 + 카테고리 출력
	Project showJoinPrjAndCategory(int prjNo);
//	날짜지나면 endyn수정
	int modifyEndYn();
	

}
