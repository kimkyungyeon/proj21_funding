package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.BoardCategory;
import proj21_funding.mapper.BoardCategoryMapper;
import proj21_funding.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	BoardCategoryMapper mapper;

	@Override
	public List<BoardCategory> showBCAll() {
		List<BoardCategory> list = mapper.selectBCAll();
		return list;
	}

	@Override
	public BoardCategory showBCByNo(int CategoryNo) {
		return mapper.selectBCbyNo(CategoryNo);
	}

	@Override
	public BoardCategory showBCByName(String CategoryName) {
		return mapper.selectBCbyName(CategoryName);
	}

	@Override
	public List<BoardCategory> showBCByClass(String bcClass) {
		List<BoardCategory> list = mapper.selectBCbyClass(bcClass);
		return list;
	}

	@Override
	public int uploadBC(BoardCategory bc) {
		return mapper.insertBC(bc);
	}

	@Override
	public int modifyBC(BoardCategory bc) {
		return mapper.updateBC(bc);
	}

	@Override
	public int removeBC(int CategoryNo) {
		return mapper.deleteBC(CategoryNo);
	}

}
