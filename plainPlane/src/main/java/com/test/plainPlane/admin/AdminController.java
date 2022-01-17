package com.test.plainPlane.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	public void cmdSubmit(String cmd, HttpServletResponse res) throws Exception {
		if(cmd.startsWith("/")) {
			String command=cmd.substring(1, cmd.indexOf(" "));
			String data=cmd.substring(cmd.indexOf(" ")+1);
			System.out.println(command);
			res.sendRedirect("http://localhost:8080/admin/staff/"+command+"?data="+data);
		}
	}
	//command line test
	@GetMapping("/staff/test")
	public ResponseEntity test(@RequestParam String data) {
		System.out.println("cmd:"+data);
		if(data.equals("fail")) {
			System.err.println("failed");
			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		else{
			return new ResponseEntity(HttpStatus.OK);}
	}
	
	//add staff
	@GetMapping("/staff/add")
	public ResponseEntity addStaff(@RequestParam String data) {
		System.out.println("staff info:"+data);
		String[] attributes=data.split(" ");
		if(attributes.length!=3) {
			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		else{
			adminService.addStaff(attributes);
			return new ResponseEntity(HttpStatus.OK);
		}
	}
	
	
	
	
	
//all about FLIGHT
	@GetMapping("/flight")
	public String flightAll(Model model) {
		model.addAttribute("flt",adminService.flightList());
		return "admin/flight";
	}
	
}
