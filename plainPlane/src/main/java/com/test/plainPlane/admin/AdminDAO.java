package com.test.plainPlane.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.test.plainPlane.vo.Flt;
import com.test.plainPlane.vo.Gs;

@Repository
@Mapper
public interface AdminDAO {
//show all staff list
	public List<Gs> staffList();
	//selectby
	public List<Gs> selectByAirline(String al);
	public List<Gs> selectByAuth(String auth);
	public Gs selectById(String staff_id);
	//insert staff
	public int addStaff(Gs staff);
	//delete staff
	public int deleteStaff(String staff_id);
	//modify authority
	public int modifyAuth(Gs staff);
	
	
//show all flight list
	public List<Flt> flightList();
}
