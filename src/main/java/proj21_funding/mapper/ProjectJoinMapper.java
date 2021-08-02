package proj21_funding.mapper;

import java.util.List;
import java.util.Map;

import proj21_funding.dto.project.ProjectJoin;

public interface ProjectJoinMapper {
	List<ProjectJoin> selectProjectJoinAll();
	List<ProjectJoin> selectProjectSuccessImbak();
	List<ProjectJoin> selectProjectJoinByPrjName(String prjName);
	List<ProjectJoin> selectProjectJoinByPrjManager(String prjManager);
	List<ProjectJoin> selectProjectJoinByPcategoryno(int pcategoryno);
	
	ProjectJoin selectProjectJoinByPrjNo(int prjNo);
	
	List<ProjectJoin> selectSumCountGroupByUserNo();
	
	List<ProjectJoin> selectProjectGroupByUserNo();
	//제작자별 성공프로젝트리스트
	List<ProjectJoin> selectSuccessProjectGroupByUserNo();
	//프로젝트별 후원자 리스트
	List<ProjectJoin> selectSponsorListByPrjNo(int prjNo);
	
	List<ProjectJoin> selectProjectJoinByMap(Map<String,Object> listMap);
	//프로젝트 누적개수,누적금액
	ProjectJoin selectProjectSumCountAll();
	int selectProjectJoinByMapCount(Map<String,Object> listMap);
	
	List<ProjectJoin> selectProjectListByMap(Map<String,Object> listMap);
	int selectProjectListByMapCount(Map<String,Object> listMap);
	
//  adminMain매출랭킹
	List<ProjectJoin> selectSalesRankingByProject();
//	adminMain 회원별 후원수 랭킹
	List<ProjectJoin> selectSponsorRanking();
	
//	메인화면프로젝트 리스트
//	주목할만한 프로젝트
	List<ProjectJoin> selectMainJumok();
//	성공임박 프로젝트(성공률 기준 100%임박)
	List<ProjectJoin> selectMainSuccessImbak();
//	마감임박 프로젝트(기간기준)
	List<ProjectJoin> selectMainMagamImbak();
//	신규프로젝트
	List<ProjectJoin> selectMainNewProject();
}
