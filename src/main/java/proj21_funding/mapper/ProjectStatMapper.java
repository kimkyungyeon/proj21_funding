package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.project.ProjectStat;

@Component
public interface ProjectStatMapper {
	List<ProjectStat> selectSalesStat();

}
