package com.test.plainPlane.flight;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.test.plainPlane.vo.Flt;

@Repository
@Mapper
public interface FlightDAO {
	//SHOW ALL FLIGHT LIST
	public List<Flt> flightList();
	//SELECT BY
	public List<Flt> selectFLT(String flt_no, String flt_date);
	public List<Flt> selectFLTByNo(String flt_no);
	public List<Flt> selectFLTByDate(String date);
	public List<Flt> selectFLTByCraft(String craft);
	public List<Flt> selectFLTByBound(Boolean inter);
	public List<Flt> selectFLTByStat(int status);
	public List<Flt> selectFLTByDpt(String dep);
	public List<Flt> selectFLTByArr(String arr);
	public List<Flt> selectFLTByAirport(String airport);
	public List<Flt> selectFLTByAirline(String airline);
	
	//INSERT FLIGHT
	public int addFlight(Flt flight);
	//MODIFY FLIGHT
	public int modifyFlight(Flt flight);
	//DELETE FLIGHT
	public int deleteFlight(String flt_no, String flt_date);
	
}
