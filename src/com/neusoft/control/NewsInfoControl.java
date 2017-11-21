package com.neusoft.control;

/**
 * 
 */
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neusoft.po.NewsInfo;
import com.neusoft.po.Users;
import com.neusoft.service.INewsInfoService;

@Controller
@RequestMapping("/news")
public class NewsInfoControl {
	@Autowired
	INewsInfoService iNewsInfoService;
	@RequestMapping("showNewsListBytype")
	public String showNewsListBytype(Model model) {
		List<NewsInfo> showNewsListBytype20 = iNewsInfoService.newsInfoList20();
		List<NewsInfo> showNewsListBytype24 = iNewsInfoService.newsInfoList24();
		model.addAttribute("showNewsListBytype20", showNewsListBytype20);
		model.addAttribute("showNewsListBytype24", showNewsListBytype24);
		return "shouye";
	}
	// 登出
	@RequestMapping("loginout")
	public String loginout(Model model, Users users, HttpSession session) {
		session.invalidate();
		List<NewsInfo> showNewsListBytype01 = iNewsInfoService.newsInfoList01();
		model.addAttribute("showNewsListBytype01", showNewsListBytype01);
		List<NewsInfo> showNewsListBytype20 = iNewsInfoService.newsInfoList20();
		List<NewsInfo> showNewsListBytype24 = iNewsInfoService.newsInfoList24();
		model.addAttribute("showNewsListBytype20", showNewsListBytype20);
		model.addAttribute("showNewsListBytype24", showNewsListBytype24);
		return "shouye";
	}

	@RequestMapping("showNewsList01")
	// 输出所有的新闻信息
	public String showNewsList01(Model model) {
		List<NewsInfo> showNewsListBytype01 = iNewsInfoService.newsInfoList01();
		model.addAttribute("showNewsListBytype01", showNewsListBytype01);
		List<NewsInfo> showNewsListBytype24 = iNewsInfoService.newsInfoList24();
		model.addAttribute("showNewsListBytype24", showNewsListBytype24);
		return "zixun";
	}

	@RequestMapping("showNewsduixiang")
	// 输出所有的新闻信息
	public String showNewsduixiang(Model model, NewsInfo newsInfo,
			HttpServletRequest request, int newsId) {
		// 增加浏览量
		System.out.println(newsInfo.getNewsRead());
		newsInfo.setNewsRead(newsInfo.getNewsRead() + 1);
		iNewsInfoService.updateReadcount(newsInfo);
		List<NewsInfo> showNewsListBytype01 = iNewsInfoService.newsInfoList01();
		model.addAttribute("showNewsListBytype01", showNewsListBytype01);
		List<NewsInfo> showNewsListBytype24 = iNewsInfoService.newsInfoList24();
		model.addAttribute("showNewsListBytype24", showNewsListBytype24);
		newsInfo = iNewsInfoService.showNewsduixiang(newsId);
		model.addAttribute("newsInfo", newsInfo);
		System.out.println(newsInfo.toString());
		return "zixunDetail";
	}
	@RequestMapping("selectNews")
	public String showSelect(Model model, String anyword) {	
		try {
			anyword = new String(anyword.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		System.out.println(anyword);
		List<NewsInfo> selectList = iNewsInfoService.selectByall(anyword);
		model.addAttribute("selectList", selectList);
		model.addAttribute("anyword", anyword);
		return "selectNews";
	}
}
