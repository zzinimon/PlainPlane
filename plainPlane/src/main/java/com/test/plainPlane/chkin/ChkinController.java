package com.test.plainPlane.chkin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/chkin")
public class ChkinController {
	@Autowired
	ChkinService chkinService;
	
	ResponseEntity<?> suc=new ResponseEntity(HttpStatus.OK);
	ResponseEntity<?> fail=new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
	
	@GetMapping("")
	public String psgrList(Model model, @RequestParam(required = true) String flt_no,@RequestParam(required = true) String flt_date) {
		model.addAttribute("psgr",chkinService.psgrList(flt_no, flt_date));
		return "Chkin";
	}

}
