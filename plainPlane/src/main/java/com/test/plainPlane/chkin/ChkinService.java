package com.test.plainPlane.chkin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.plainPlane.vo.Psgr;

@Service
public class ChkinService {
	@Autowired
	ChkinDAO chkinDAO;
	
	//PAX IN THE FLIGHT
	public List<Psgr> psgrList(String flt_no, String flt_date){
		return chkinDAO.psgrList(flt_no,flt_date);
	}
	
	//SEARCH
	public List<Psgr> searchBySeat(String flt_no, String flt_date,String seat){
		return chkinDAO.searchBySeat(flt_no, flt_date, seat);
	}
	public List<Psgr> searchByStatus(String flt_no, String flt_date,String status){
		return chkinDAO.searchByStatus(flt_no, flt_date, status);
	}
	public List<Psgr> searchBySsr(String flt_no, String flt_date,String ssr){
		return chkinDAO.searchBySsr(flt_no, flt_date, ssr);
	}
	public List<Psgr> searchByRsv(String flt_no, String flt_date,String rsv_no){
		return chkinDAO.searchByRsv(flt_no, flt_date, rsv_no);
	}
	public List<Psgr> searchByName(String flt_no, String flt_date,String name){
		return chkinDAO.searchByName(flt_no, flt_date, name);
	}
	public List<Psgr> searchByAge(String flt_no, String flt_date,String age){
		return chkinDAO.searchByAge(flt_no, flt_date, age);
	}
	public List<Psgr> searchByNationality(String flt_no, String flt_date,String country){
		return chkinDAO.searchByNationality(flt_no, flt_date, country);
	}
}
