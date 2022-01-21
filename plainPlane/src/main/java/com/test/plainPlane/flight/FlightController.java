package com.test.plainPlane.flight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.plainPlane.vo.Flt;

@Controller
@RequestMapping("/flight")
public class FlightController {
	@Autowired
	FlightService flightService;
	
	ResponseEntity suc=new ResponseEntity(HttpStatus.OK);
	ResponseEntity fail=new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
	
	
	@GetMapping("")
	public String flightAll(Model model) {
		model.addAttribute("flt",flightService.flightList());
		return "admin/flight";
	}
	@PostMapping("/add")
	public String addFlight(Flt flight) {
		System.out.println("sta="+flight.getFlt_sta()+",std="+flight.getFlt_std());
		flightService.addFlight(flight);
		return "redirect:/admin/flight";
		
	}
		
	
	
	
	
}
