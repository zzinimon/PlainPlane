package com.test.plainPlane.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Log {
	private String gs_id;
	private Long ckin_id;
	private String log_history;
	private Timestamp log_time;
}
