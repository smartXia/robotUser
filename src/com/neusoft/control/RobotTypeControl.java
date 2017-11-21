package com.neusoft.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.neusoft.po.RobotType;
import com.neusoft.service.IRobotType;

@Service
public class RobotTypeControl {
	@Autowired
	IRobotType iRobotType;

	public String showRobotType(Model model) {
		List<RobotType> robotTypesList = iRobotType.robotTypesList();
		model.addAttribute("robotTypesList", robotTypesList);
		return "shopping";
	}
}
