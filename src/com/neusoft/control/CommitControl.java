package com.neusoft.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neusoft.po.CommitTopic;
import com.neusoft.po.Topic;
import com.neusoft.service.ICommitService;

@Controller
public class CommitControl {
	@Autowired
	ICommitService iCommitService;

	@RequestMapping("showAllCommit")
	public void showAllCommit(HttpServletResponse response) throws IOException {
		List<CommitTopic> commitList = iCommitService.commitList();
		JSONArray ja = JSONArray.fromObject(commitList);
		response.getWriter().write(ja.toString());
		response.getWriter().flush();
		response.getWriter().close();
	}
/*
	@RequestMapping("showeveryCommit")
	public String showeveryCommit(Topic topic, Model model) {
		System.out.println("能获取的id为：" + topic.getTopicId());
		List<CommitTopic> showeveryCommit = iCommitService
				.showeveryCommit(topic);
		model.addAttribute("showeveryCommit", showeveryCommit);
		// 这句话的意思，是让浏览器用utf8来解析返回的数据

		return "topicAll";
	}

	@RequestMapping("replytopic")
	public String replytopic(CommitTopic commit) {
		System.out.println(commit.getCommitContext());
		System.out.println(commit.getCommitUser() + commit.getCommitTopic());
		return "topicAll";

	}*/
}
