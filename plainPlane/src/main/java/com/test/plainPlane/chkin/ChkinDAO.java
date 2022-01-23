package com.test.plainPlane.chkin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.test.plainPlane.vo.Psgr;

@Repository
@Mapper
public interface ChkinDAO {
	//PAX IN THE FLT
	public List<Psgr> psgrList(String flt_no, String flt_date);

}
