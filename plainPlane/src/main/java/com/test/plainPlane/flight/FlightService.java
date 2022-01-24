package com.test.plainPlane.flight;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.plainPlane.vo.Flt;

@Service
public class FlightService {
	@Autowired
	FlightDAO flightDAO;
	
	
	//SHOW ALL FLIGHT LIST
	public List<Flt> flightList(){
		return flightDAO.flightList();
	}
	//SELECT BY
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
	
	//INSERT FLIGHT
	public int addFlight(Flt flight) {
		return flightDAO.addFlight(flight);
	}
	
	//MODIFY FLIGHT
	public int modifyFlight(Flt flight) {
		return flightDAO.modifyFlight(flight);
	}
	
	//DELETE FLIGHT
	public int deleteFlight(String flt_no, String flt_date) {
		return flightDAO.deleteFlight(flt_no,flt_date);
	}
}
