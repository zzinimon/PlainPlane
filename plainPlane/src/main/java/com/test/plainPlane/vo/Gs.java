package com.test.plainPlane.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gs {
	private String gs_id;
	private String gs_pw;
	private int gs_auth;
	private String gs_airline;
}
