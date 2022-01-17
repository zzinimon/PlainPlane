package com.test.plainPlane.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.plainPlane.vo.Flt;
import com.test.plainPlane.vo.Gs;

@Service
public class AdminService {
	@Autowired
	AdminDAO adminDAO;

//show all staff list
	public List<Gs> staffList(){
		return adminDAO.staffList();
	}
	//add staff
	public int addStaff(String[] att) {
		Gs staff=new Gs(att[0],att[1],0,att[2]);
		return adminDAO.addStaff(staff);
	}

	
	
	
//show all flight list
	public List<Flt> flightList(){
		return adminDAO.flightList();
	}

}
