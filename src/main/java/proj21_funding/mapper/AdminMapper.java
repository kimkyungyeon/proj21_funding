package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.Admin;


@Component
public interface AdminMapper {

	List<Admin> selectAdminAll();

	Admin selectAdminbyNo(int adminNo);

	Admin selectAdminbyId(String adminId);

	Admin selectAdminbyName(String adminName);

	Admin selectAdminbylogin(Admin admin);

	int insertAdmin(Admin admin);

	int updateAdmin(Admin admin);

	int deleteAdmin(int adminNo);

}
