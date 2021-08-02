package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.BoardCategory;

@Service
public interface CategoryService {
	
	List<BoardCategory> showBCAll();

	BoardCategory showBCByNo(int CategoryNo);
	
	BoardCategory showBCByName(String CategoryName);
	
	List<BoardCategory> showBCByClass(String bcClass);
	
	int uploadBC (BoardCategory bc);
	
	int modifyBC (BoardCategory bc);
	
	int removeBC (int CategoryNo);
}
