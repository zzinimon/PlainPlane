package com.test.plainPlane.login;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.test.plainPlane.vo.Gs;

@Repository
@Mapper
public interface LoginDAO {
	public Gs selectStaff(String id, String pw);
}
