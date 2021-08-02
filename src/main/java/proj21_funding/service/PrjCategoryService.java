package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.PrjCategory;

@Service
public interface PrjCategoryService {
		
	List<PrjCategory> showCategory();
	

}
