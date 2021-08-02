package proj21_funding.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.mapper.ProjectJoinMapper;
import proj21_funding.service.ProjectJoinService;

@Service
public class ProjectJoinServiceImpl implements ProjectJoinService {

	@Autowired
	private ProjectJoinMapper mapper;
	
	@Override
	public List<ProjectJoin> showProjectJoinAll() {
		return mapper.selectProjectJoinAll();
	}

	@Override
	public List<ProjectJoin> showProjectSuccessImbak() {
		return mapper.selectProjectSuccessImbak();
	}

	@Override
	public List<ProjectJoin> showProjectJoinByPrjName(String prjName) {
		return mapper.selectProjectJoinByPrjName(prjName);
	}

	@Override
	public List<ProjectJoin> showProjectJoinByPrjManager(String prjManager) {
		return mapper.selectProjectJoinByPrjManager(prjManager);
	}

	@Override
	public ProjectJoin showProjectJoinByPrjNo(int prjNo) {
		return mapper.selectProjectJoinByPrjNo(prjNo);
	}


	@Override
	public List<ProjectJoin> showSumCountGroupByUserNo() {
		return mapper.selectSumCountGroupByUserNo();
	}

	@Override
	public List<ProjectJoin> showProjectGroupByUserNo() {
		return mapper.selectProjectGroupByUserNo();
	}

	@Override
	public List<ProjectJoin> showSucessProjectGroupByUserNo() {
		return mapper.selectSuccessProjectGroupByUserNo();
	}

	@Override
	public List<ProjectJoin> showSponsorListByPrjNo(int prjNo) {
		return mapper.selectSponsorListByPrjNo(prjNo);
	}
		
	@Override
	public List<ProjectJoin> showProjectJoinByPcategoryno(int pcategoryno) {
		return mapper.selectProjectJoinByPcategoryno(pcategoryno);
	}

	@Override
	public List<ProjectJoin> showProjectJoinByMap(Map<String, Object> listMap) {
		System.out.println(listMap);
		return mapper.selectProjectJoinByMap(listMap);
	}

	@Override
	public ProjectJoin showProjectSumCountAll() {
		return mapper.selectProjectSumCountAll();
	}

	@Override
	public int showProjectJoinByMapCount(Map<String, Object> listMap) {
		return mapper.selectProjectJoinByMapCount(listMap);
	}

	@Override
	public List<ProjectJoin> showProjectListByMap(Map<String, Object> listMap) {
		return mapper.selectProjectListByMap(listMap);
	}

	@Override
	public int showProjectListByMapCount(Map<String, Object> listMap) {
		return mapper.selectProjectListByMapCount(listMap);
	}

	@Override
	public List<ProjectJoin> selectMainJumok() {
		return mapper.selectMainJumok();
	}

	@Override
	public List<ProjectJoin> selectMainSuccessImbak() {
		return mapper.selectMainSuccessImbak();
	}

	@Override
	public List<ProjectJoin> selectMainMagamImbak() {
		return mapper.selectMainMagamImbak();
	}

	@Override
	public List<ProjectJoin> selectMainNewProject() {
		return mapper.selectMainNewProject();
	}

	@Override
	public List<ProjectJoin> selectSalesRankingByProject() {
		return mapper.selectSalesRankingByProject();
	}

	@Override
	public List<ProjectJoin> selectSponsorRanking() {
		return mapper.selectSponsorRanking();
	}

}
