package com.test.plainPlane.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Chkin {
	private Long chkin_id;
	private Date flt_date;
	private String flt_no;
	private Long pax_uid;
	private String chkin_seat;
	private String chkin_memo;
	private String chkin_stat;
	private String chkin_ssr;
}
