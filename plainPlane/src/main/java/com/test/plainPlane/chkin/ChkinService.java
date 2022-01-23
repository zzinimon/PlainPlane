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
	
	
}
