package com.neusoft.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.neusoft.po.RobotCompany;
import com.neusoft.service.IRobotComService;

public class RobotComControl {
	@Autowired
	IRobotComService iRobotComService;

	public String showRobotCompany(Model model) {
		List<RobotCompany> robotComList = iRobotComService.companies();
		model.addAttribute("robotComList", robotComList);
		return "shopping";
	}
}
