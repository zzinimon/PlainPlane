package com.test.plainPlane.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.plainPlane.vo.Gs;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;
	
	@GetMapping("/login")
	public String loginPage() {
		return "Login";
	}
	@PostMapping("/login")
	public String loginPost(HttpSession session, String gs_id, String gs_pw) {
		Gs staff=loginService.selectStaff(gs_id, gs_pw);
		if(staff==null) return "redirect:/login";
		session.setAttribute("staff", staff);
		return "redirect:/flight";
	}

}
