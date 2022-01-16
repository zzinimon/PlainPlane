package com.test.plainPlane.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.test.plainPlane.vo.Gs;

@Repository
@Mapper
public interface AdminDAO {
	public List<Gs> gsList();
}
