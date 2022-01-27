package com.test.plainPlane.chkin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/chkin")
public class ChkinController {
	@Autowired
	ChkinService chkinService;
	
	ResponseEntity<?> suc=new ResponseEntity(HttpStatus.OK);
	ResponseEntity<?> fail=new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
	
	//PAX LIST
	@GetMapping("")
	public String psgrList(Model model, @RequestParam String flt_no,@RequestParam String flt_date,@RequestParam(required = false) String search) {
		if(search==null) model.addAttribute("psgr",chkinService.psgrList(flt_no, flt_date));
		else {
			String[] searchArr=search.toLowerCase().split(" ");
			switch (searchArr[0]) {
			case "seat":
				model.addAttribute("psgr",chkinService.searchBySeat(flt_no, flt_date, searchArr[1]));
				break;
			case "status":
				model.addAttribute("psgr",chkinService.searchByStatus(flt_no, flt_date, searchArr[1]));
				break;
			case "ssr":
				model.addAttribute("psgr",chkinService.searchBySsr(flt_no, flt_date, searchArr[1]));
				break;
			case "rsv":
				model.addAttribute("psgr",chkinService.searchByRsv(flt_no, flt_date, searchArr[1]));
				break;
			case "name":
				model.addAttribute("psgr",chkinService.searchByName(flt_no, flt_date, searchArr[1]));
				break;
			case "age":
				model.addAttribute("psgr",chkinService.searchByAge(flt_no, flt_date, searchArr[1]));
				break;
			case "nation":
				model.addAttribute("psgr",chkinService.searchByNationality(flt_no, flt_date, searchArr[1]));
				break;
			default:
				model.addAttribute("psgr",chkinService.psgrList(flt_no, flt_date));
				break;

			}
		}
		return "Chkin";
	}
	
	
	/*
	@PostMapping("/name")
	public ResponseEntity<?> serchByName(Model model, String name) {
		System.out.println("name command");
		model.addAttribute("psgr",chkinService.searchByName(name));
		return suc;
	}
	*/
	

}
