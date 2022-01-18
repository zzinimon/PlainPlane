package com.test.plainPlane.admin;

//import javax.servlet.http.HttpServletResponse;

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
	ResponseEntity suc=new ResponseEntity(HttpStatus.OK);
	ResponseEntity fail=new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
	
//all about STAFF	
	@GetMapping("/staff")
	public String staffAll(Model model) {
		model.addAttribute("gs", adminService.staffList());
		return "admin/staff";
	}
	
	/*
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
	*/
	
	//command line test
	@PostMapping("/staff/test")
	public ResponseEntity test(@RequestParam String data) {
		System.out.println("cmd:"+data);
		if(data.equals("fail")) {
			System.err.println("failed");
			return fail;
		}
		else{return suc;}
	}
	
	//insert staff
	@PostMapping("/staff/add")
	public ResponseEntity addStaff(@RequestParam String data) {
		System.out.println("staff info:"+data);
		String[] attributes=data.split(" ");
		if(attributes.length!=3) {
			return fail;
		}
		else{
			adminService.addStaff(attributes);
			return suc;
		}
	}
	//delete staff
	@PostMapping("/staff/del")
	public ResponseEntity deleteStaff(@RequestParam String data) {
		if(data.equalsIgnoreCase("admin")) return fail;	//Cannot delete ADMIN
		int rst=adminService.deleteStaff(data);	//rst=0 means couldn't find the staff
		return (rst==1? suc: fail);
	}
	
	
	
	
	
	
	
	
	
//all about FLIGHT
	@GetMapping("/flight")
	public String flightAll(Model model) {
		model.addAttribute("flt",adminService.flightList());
		return "admin/flight";
	}
	
}
