package com.test.plainPlane.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.plainPlane.vo.Gs;

@Service
public class AdminService {
	@Autowired
	AdminDAO adminDAO;

//show all staff list
	public List<Gs> staffList(){
		return adminDAO.staffList();
	}
	//select by
	public List<Gs> selectByAirline(String al) {
		return adminDAO.selectByAirline(al);
	}
	public List<Gs> selectByAuth(int auth){
		return adminDAO.selectByAuth(auth);
	}
	public Gs selectById(String staff_id) {
		return adminDAO.selectById(staff_id);
	}
	//insert staff
	public int addStaff(String[] att) {
		Gs staff=new Gs(att[0],att[0]+att[1],0,att[2]);
		return adminDAO.addStaff(staff);
	}
	//delete staff
	public int deleteStaff(String staff_id) {
		return adminDAO.deleteStaff(staff_id);
	}
	//modify authority of staff
	public int modifyAuth(String staff_id, String grade) {
		Gs staff=adminDAO.selectById(staff_id);
		if(staff!=null) {	//If the staff exists
			int origin=staff.getGs_auth();
			//auth 5(admin) should be only one
			if(grade.equalsIgnoreCase("up")&&origin<4) staff.setGs_auth(origin+1);
			//there is no lower auth than 0(OJT)
			else if(grade.equalsIgnoreCase("down")&&origin>0) staff.setGs_auth(origin-1);
		}
		return adminDAO.modifyAuth(staff);
	}
	
}
