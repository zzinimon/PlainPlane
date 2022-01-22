package com.test.plainPlane.flight;

import java.util.Arrays;
import java.util.List;

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

import com.test.plainPlane.vo.Flt;

@Controller
@RequestMapping("/flight")
public class FlightController {
	@Autowired
	FlightService flightService;
	
	ResponseEntity<?> suc=new ResponseEntity(HttpStatus.OK);
	ResponseEntity<?> fail=new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
	
	
	@GetMapping("")
	public String flightList(Model model, @RequestParam(required = false) String only,@RequestParam(required = false) String condition,
		@RequestParam(required = false) String no,@RequestParam(required = false) String date) {
		String[] liStat= {"scheduled","chkin","boarding","landed","arrived"};
		
		//No parameter : get whole list, parameter : get the specified list
		if(only==null&&date==null)model.addAttribute("flt",flightService.flightList());
		
		//SHOW COMMAND TRIGGER
		else if (date!=null) {
			boolean exist=FlightIsExist(no,date);
			if(exist) {
				List<Flt> selected=flightService.selectFLT(no, date);
				model.addAttribute("flt",selected);
			}else {
			//IF THERE IS NO SUCH FLT
				System.out.println("FLT SELECT FAILED");
			}
		}
		
		//ONLY COMMAND TRIGGER
		else {
			switch (only.toLowerCase()) {
				case "flt":model.addAttribute("flt",flightService.selectFLTByNo(condition));break;
				case "date":model.addAttribute("flt",flightService.selectFLTByDate(condition));break;
				case "craft":model.addAttribute("flt",flightService.selectFLTByCraft(condition));break;
				case "bound":
					if(condition.equalsIgnoreCase("int")) model.addAttribute("flt",flightService.selectFLTByBound(true));
					if(condition.equalsIgnoreCase("dom")) model.addAttribute("flt",flightService.selectFLTByBound(false));
					else model.addAttribute("flt",flightService.flightList());
					break;
				case "status":
					int iStat=Arrays.asList(liStat).indexOf(condition.toLowerCase());
					model.addAttribute("flt",flightService.selectFLTByStat(iStat));
					break;
				case "dpt":model.addAttribute("flt",flightService.selectFLTByDpt(condition));break;
				case "arr":model.addAttribute("flt",flightService.selectFLTByArr(condition));break;
				case "airport":model.addAttribute("flt",flightService.selectFLTByAirport(condition));break;
				case "airline":model.addAttribute("flt",flightService.selectFLTByAirline(condition));break;
				default:
					break;
			}
		}
		return "admin/flight";
	}
	// ADD FLIGHT	(/ADD FLT)
	@PostMapping("/add")
	public String addFlight(Flt flight) {
		flightService.addFlight(flight);
		return "redirect:/admin/flight";
	}
	@PostMapping("/chkflt")
	@ResponseBody
	public boolean FlightIsExist(String no, String date){
		List<Flt> exist=flightService.selectFLT(no, date);
		return exist.size()==0? false:true;
	}
		
	
	
	
	
}
