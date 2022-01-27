package com.test.plainPlane.admin;

import java.util.Arrays;
import java.util.List;

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
	
	ResponseEntity<?> suc=new ResponseEntity(HttpStatus.OK);
	ResponseEntity<?> fail=new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
	List<String> auth=Arrays.asList(new String[]{"OJT","GS","GC","DS","SV","ADMIN"});
	
//all about STAFF	
	@GetMapping("/staff")
	public String staffAll(Model model, @RequestParam(required = false) String only) {
		//No parameter : get whole list, parameter : get the specified list
		if(only==null||only.equalsIgnoreCase("all")) model.addAttribute("gs", adminService.staffList());
		//SHOW ONLY SELECTED AUTH/AIR LINE	(/ONLY "AUTH", /ONLY "AIRLINE")
		else {
			//IF PARAMETER IS ONE OF AUTHORITIES, GET THE INDEX. AND SELECT BY IT. OTHERWISE, SELECT BY AIR LINE
			int idx=auth.indexOf(only.toUpperCase());
			model.addAttribute("gs",idx==-1?adminService.selectByAirline(only):adminService.selectByAuth(idx));
			System.out.println("AUTH INDEX="+idx+", ONLY="+only);
		}
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
	
	//command line TEST		(/TEST "STR", /TEST FAIL)
	@PostMapping("/staff/test")
	public ResponseEntity<?> test(@RequestParam String data) {
		System.out.println("cmd:"+data);
		if(data.equalsIgnoreCase("fail")) {
			System.err.println("failed");
			return fail;
		}
		else{return suc;}
	}
	
	//insert staff	(/ADD "ID" "PW" "AIRLINE")
	@PostMapping("/staff/add")
	public ResponseEntity<?> addStaff(@RequestParam String data) {
		System.out.println("staff info:"+data);
		String[] attributes=data.toUpperCase().split(" ");
		if(attributes.length!=3) {
			return fail;
		}
		else{
			adminService.addStaff(attributes);
			return suc;
		}
	}
	//delete staff	(/DEL "ID")
	@PostMapping("/staff/del")
	public ResponseEntity<?> deleteStaff(@RequestParam String data) {
		if(data.equalsIgnoreCase("admin")) return fail;	//Cannot delete ADMIN
		int rst=adminService.deleteStaff(data);	//rst=0 means couldn't find the staff
		return (rst==1? suc: fail);
	}
	//UP O DOWNGRADE A AUTHORITY	(/AUTH "ID" UP, /AUTH "ID" DOWN)
	@PostMapping("/staff/auth")
	public ResponseEntity<?> modifyAuth(@RequestParam String data) {
		String[] strArr=data.split(" ");
		if(strArr.length==2) {
			String staff_id=strArr[0];
			String upDown=strArr[1];
		return (adminService.modifyAuth(staff_id,upDown)==1?suc: fail);
		}else return fail;
	}

}
