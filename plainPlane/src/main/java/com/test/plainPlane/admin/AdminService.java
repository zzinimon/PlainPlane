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

}
