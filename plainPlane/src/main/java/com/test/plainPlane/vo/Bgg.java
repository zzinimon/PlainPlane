package com.test.plainPlane.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bgg {
	private Long chkin_id;
	private int bgg_weight;
	private boolean bgg_trans;
	private boolean bgg_dmg;
	private boolean bgg_heavy;
	private boolean bgg_frag;
}
