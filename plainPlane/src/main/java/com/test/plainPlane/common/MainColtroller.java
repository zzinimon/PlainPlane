package com.test.plainPlane.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainColtroller {
	@GetMapping("/main")
	public String testPage() {
		return "Test";
	}
}
