package com.test.plainPlane.vo;

import java.sql.Date;
import java.sql.Time;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Flt {
	private String flt_no;
	private Date flt_date;
	private String craft_id;
	private Boolean flt_bound;
	private String flt_stat;
	private Time flt_sta;
	private Time flt_std;
	private String flt_dpt;
	private String flt_arr;
	private String flt_airline;
}
