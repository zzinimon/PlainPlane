package com.test.plainPlane.flight;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.plainPlane.vo.Flt;

@Service
public class FlightService {
	@Autowired
	FlightDAO flightDAO;
	
	
	//show all flight list
	public List<Flt> flightList(){
		return flightDAO.flightList();
	}
	//select by
	public List<Flt> selectFLT(String flt_no, String flt_date) {
		return flightDAO.selectFLT(flt_no,flt_date);
	}
	public List<Flt> selectFLTByNo(String flt_no){
		return flightDAO.selectFLTByNo(flt_no);
	}
	public List<Flt> selectFLTByDate(String date){
		return flightDAO.selectFLTByDate(date);
	}
	public List<Flt> selectFLTByCraft(String craft){
		return flightDAO.selectFLTByCraft(craft);
	}
	public List<Flt> selectFLTByBound(Boolean inter){
		return flightDAO.selectFLTByBound(inter);
	}
	public List<Flt> selectFLTByStat(int status){
		return flightDAO.selectFLTByStat(status);
	}
	public List<Flt> selectFLTByDpt(String dep){
		return flightDAO.selectFLTByDpt(dep);
	}
	public List<Flt> selectFLTByArr(String arr){
		return flightDAO.selectFLTByArr(arr);
	}
	public List<Flt> selectFLTByAirport(String airport){
		return flightDAO.selectFLTByAirport(airport);
	}
	public List<Flt> selectFLTByAirline(String Airline){
		return flightDAO.selectFLTByAirline(Airline);
	}
	//insert flight
	public int addFlight(Flt flight) {
		return flightDAO.addFlight(flight);
	}
	
}
