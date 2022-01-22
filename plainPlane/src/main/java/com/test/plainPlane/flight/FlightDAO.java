package com.test.plainPlane.flight;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.test.plainPlane.vo.Flt;

@Repository
@Mapper
public interface FlightDAO {
	//show all flight list
	public List<Flt> flightList();
	//select by
	public Flt selectFLT(String flt_no, Date flt_date);
	public List<Flt> selectFLTByNo(String flt_no);
	public List<Flt> selectFLTByDate(String date);
	public List<Flt> selectFLTByCraft(String craft);
	public List<Flt> selectFLTByBound(Boolean inter);
	public List<Flt> selectFLTByStat(int status);
	public List<Flt> selectFLTByDpt(String dep);
	public List<Flt> selectFLTByArr(String arr);
	public List<Flt> selectFLTByAirport(String airport);
	public List<Flt> selectFLTByAirline(String airline);
	
	//insert flight
	public int addFlight(Flt flight);
	
}
