package com.test.plainPlane.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pax {
	private Long pax_uid;
	private String rsv_no;
	private String pax_pspt;
	private String pax_name;
	private Date pax_birth;
	private String pax_age;
}
