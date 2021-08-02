package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.PrjCategory;
import proj21_funding.mapper.PrjCategoryMapper;
import proj21_funding.service.PrjCategoryService;
@Service
public class PrjCategoryServiceImpl implements PrjCategoryService {
	
	@Autowired
	private PrjCategoryMapper mapper;	

	@Override
	public List<PrjCategory> showCategory() {
		return mapper.showCategory();
	}

}
