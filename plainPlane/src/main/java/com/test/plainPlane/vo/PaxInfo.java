package com.test.plainPlane.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaxInfo {
//pax table
	private List<Pax> paxLi;
//rsv table
	private String rsv_no;
	private int rsv_cost;
//chkin table
	private List<Chkin> chkinLi;
	//bgg table (select by chkin_id)
		private List<Bgg> bggLi;
	//log table (common chkin_id)
		private List<Log> logLi;

}
