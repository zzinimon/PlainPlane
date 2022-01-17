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
	//add staff
	public int addStaff(Gs staff);

	
//show all flight list
	public List<Flt> flightList();
}
