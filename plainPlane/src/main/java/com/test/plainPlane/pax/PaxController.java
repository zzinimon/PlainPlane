package com.test.plainPlane.pax;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/pax")
public class PaxController {
	@Autowired
	PaxService paxService;
	
	@GetMapping("")
	public String paxDetail(Model model, @RequestParam String uid) {
		
		return "pax/Pax";
	}
	
}
