package com.test.plainPlane.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/test")
	public String testPage() {
		return "test";
	}
}
