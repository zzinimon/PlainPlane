package com.test.plainPlane.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
//all about STAFF	
	@GetMapping("/staff")
	public String staffAll(Model model) {
		model.addAttribute("gs", adminService.staffList());
		return "admin/staff";
	}
	//execute command 
	@PostMapping("/staff/inputCmd")
	public String cmdSubmit(String cmd) {
		if(cmd.startsWith("/")) {
			String command=cmd.substring(1, cmd.indexOf(" "));
			String data=cmd.substring(cmd.indexOf(" ")+1);
			System.out.println(command);
			return "redirect:"+command+"?input="+data;
		}return null;
	}
	//command line test
	@GetMapping("/staff/test")
	public void test(@RequestParam String input) {
		System.out.println("cmd:"+input);
	}
	
	
	
	
	
//all about FLIGHT
	@GetMapping("/flight")
	public String flightAll(Model model) {
		model.addAttribute("flt",adminService.flightList());
		return "admin/flight";
	}
	
}
