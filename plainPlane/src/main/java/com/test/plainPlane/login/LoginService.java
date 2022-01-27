package com.test.plainPlane.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.plainPlane.vo.Gs;

@Service
public class LoginService {
	@Autowired
	LoginDAO loginDAO;
	
	public Gs selectStaff(String id, String pw) {
		return loginDAO.selectStaff(id, pw);
	}
	
}
