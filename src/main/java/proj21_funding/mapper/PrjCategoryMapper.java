package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.PrjCategory;
@Component
public interface PrjCategoryMapper {
	List<PrjCategory> showCategory();
}
