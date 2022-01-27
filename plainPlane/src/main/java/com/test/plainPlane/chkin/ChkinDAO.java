package com.test.plainPlane.chkin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.test.plainPlane.vo.Psgr;

@Repository
@Mapper
public interface ChkinDAO {
	//PAX IN THE FLT
	public List<Psgr> psgrList(String flt_no, String flt_date);
	
	//SEARCH
	public List<Psgr> searchBySeat(String flt_no, String flt_date, String seat);
	public List<Psgr> searchByStatus(String flt_no, String flt_date, String status);
	public List<Psgr> searchBySsr(String flt_no, String flt_date, String ssr);
	public List<Psgr> searchByRsv(String flt_no, String flt_date, String rsv_no);
	public List<Psgr> searchByName(String flt_no,String flt_date, String name);
	public List<Psgr> searchByAge(String flt_no, String flt_date, String age);
	public List<Psgr> searchByNationality(String flt_no, String flt_date, String country);
	
}
