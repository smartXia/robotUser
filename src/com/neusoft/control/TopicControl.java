package com.neusoft.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neusoft.po.CommitTopic;
import com.neusoft.po.Topic;
import com.neusoft.po.Users;
import com.neusoft.service.ICommitService;
import com.neusoft.service.ITopicService;

@Controller
public class TopicControl {
	@Autowired
	ITopicService iTopicServic;
	@Autowired
	ICommitService iCommitService;

	@RequestMapping("showAllTopicTest")
	public void showAllTopicTest(HttpServletResponse response)
			throws IOException {

		List<Topic> topicList = iTopicServic.showAllTopic();
		JSONArray ja = JSONArray.fromObject(topicList);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(ja.toString());
		response.getWriter().flush();
		response.getWriter().close();
	}

	@RequestMapping("showAllTopic")
	public String showAllTopic(Model model) {
		List<Topic> topicList = iTopicServic.showAllTopic();
		model.addAttribute("topicList", topicList);
		int count = iCommitService.tcount();
		model.addAttribute("count", count);

		System.out.println(count);
		return "topictest";

	}

	@RequestMapping("showeveryCommit")
	public void showeveryCommit(Topic topic, Model model,
			HttpServletResponse response) throws IOException {
		System.out.println("能获取的id为：" + topic.getTopicId());
		List<CommitTopic> showeveryCommit = iCommitService
				.showeveryCommit(topic);
		/*
		 * model.addAttribute("showeveryCommit", showeveryCommit); //
		 * 这句话的意思，是让浏览器用utf8来解析返回的数据 this.showAllTopic(model); return
		 * "topictest";
		 */
		JSONArray ja = JSONArray.fromObject(showeveryCommit);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(ja.toString());
		response.getWriter().flush();
		response.getWriter().close();
	}

	@RequestMapping("replytopic")
	public String replytopic(CommitTopic commit, Users users, Topic topic,
			Model model) {
		System.out.println("name:" + users.getUserName());
		System.out.println("回复的topic:" + topic.getTopicId());
		commit.setCommitUser(users.getUserName());
		commit.setCommitTopic(topic.getTopicId());
		System.out.println(commit.getCommitContext());
		System.out.println(commit.getCommitUser() + commit.getCommitTopic());

		iCommitService.insertcommit(commit);
		return this.showAllTopic(model);

	}
}
