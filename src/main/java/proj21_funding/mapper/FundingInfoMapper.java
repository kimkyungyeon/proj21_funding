package proj21_funding.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import proj21_funding.dto.FundingInfo;

@Component
public interface FundingInfoMapper {
//	프로젝트별 통계
	int selectCountByPrjNo(int PrjNo);
	int selectSumByPrjNo(int PrjNo);
//	회원별 통계
	int selectCountByUserNo(int userNo);
	int selectSumByUserNo(int userNo);
	
	int insertFundingInfo(FundingInfo fundingInfo);
	
	List<FundingInfo> selectFundingInfoByUserNo(int userNo);
	List<FundingInfo> selectFundingInfoByUserNoMap(Map<String,Object> listMap);
	// 프로젝트 번호로 펀딩정보 검색
	List<FundingInfo> selectFundingInfoByPrjNo(int prjNo);
	
	int updatePayYes();
	

}
