package proj21_funding.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.PrjOption;
import proj21_funding.mapper.PrjOptionMapper;
import proj21_funding.service.PrjOptionService;

@Service
public class PrjOptionServiceImpl implements PrjOptionService {
	
	@Autowired
	private PrjOptionMapper mapper;
	

	@Override
	public List<PrjOption> showPrjOptionListAll() {
		return mapper.selectPrjOptionByAll();
	}

	@Override
	public List<PrjOption> showPrjOptionByPrjNo(int prjNo) {
		return mapper.selectPrjOptionByPrjNo(prjNo);
	}

	@Override
	public int insertPrjOption(PrjOption prjOption) {
		return mapper.insertPrjOption(prjOption);
	}


	@Override
	public PrjOption showPrjOptionByOptNo(int optNo) {
		return mapper.selectPrjOptionByOptNo(optNo);
	}
	
	@Override
	public int updatePrjOption(PrjOption prjoption) {
		return mapper.updatePrjOption(prjoption);
	}

	@Override
	public List<PrjOption> showSimpleOptionByPrjNo(int prjNo) {
		return mapper.selectSimpleOptionByPrjNo(prjNo);
	}
	
	public List<PrjOption> selectSimplePrjOptionByPrjNo(int prjNo) {
		return mapper.selectSimplePrjOptionByPrjNo(prjNo);
	}

//	옵션추가 1개
	@Override
	public int insertOptionByMap(Map<String, Object> map) {		
	
		return mapper.insertOptionByMap(map);
	}
//	옵션추가 2개
	@Override
	public int insertPrjOptionsByMap(Map<String, Object> map) {
		return mapper.insertPrjOptionsByMap(map);
	}
//	옵션추가 3개
	@Override
	public int insertPrjOptionsOfFourByMap(Map<String, Object> map) {
		return mapper.insertPrjOptionsOfFourByMap(map);
	}


	@Override
	public int updateOptionByMap(Map<String, Object> map) {
		return mapper.updateOptionByMap(map);
	}

	@Override
	public int updateAllAddOptionsByMap(Map<String, Object> map) {
		return mapper.updateAllAddOptionsByMap(map);
	}



	@Override
	public int removeOptNumOne(Map<String, Object> map) {
		return mapper.removeOptNumOne(map);
	}

	@Override
	public int removeOptNumTwo(Map<String, Object> map) {
		return mapper.removeOptNumTwo(map);
	}

	@Override
	public int removeOptNumThree(Map<String, Object> map) {
		return mapper.removeOptNumThree(map);
	}


}
