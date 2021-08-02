package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.project.ProjectStat;
import proj21_funding.mapper.ProjectStatMapper;
import proj21_funding.service.ProjectStatService;

@Service
public class ProjectStatServiceImpl implements ProjectStatService {
	@Autowired
	ProjectStatMapper mapper;

	@Override
	public List<ProjectStat> selectSalesStat() {
		return mapper.selectSalesStat();
	}

}
