package com.test.plainPlane.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	
	
//all about FLIGHT
	@GetMapping("/flight")
	public String flightAll(Model model) {
		model.addAttribute("flt",adminService.flightList());
		return "admin/flight";
	}
	
}
