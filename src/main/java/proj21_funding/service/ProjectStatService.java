package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.project.ProjectStat;

@Service
public interface ProjectStatService {
	List<ProjectStat> selectSalesStat();

}
