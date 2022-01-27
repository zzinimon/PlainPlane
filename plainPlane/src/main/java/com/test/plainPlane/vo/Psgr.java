package com.test.plainPlane.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Psgr {
	private Long chkin_id;
	private String chkin_seat;
	private String chkin_stat;
	private String chkin_ssr;
	private String flt_no;
	private String flt_date;

	private Long pax_uid;
	
	private String rsv_no;
	private String pax_pspt;
	private String pax_name;
	private Date pax_birth;
	private String pax_age;
	private String pax_nationality;
}
