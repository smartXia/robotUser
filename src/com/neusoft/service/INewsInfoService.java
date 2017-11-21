package com.neusoft.service;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.neusoft.po.NewsInfo;

public interface INewsInfoService {
	public List<NewsInfo> newsInfoList20();

	public List<NewsInfo> newsInfoList24();
	public int updateReadcount(NewsInfo newsInfo);
	public List<NewsInfo> newsInfoList01();
	public NewsInfo showNewsduixiang(int newsId);

	public List<NewsInfo> selectByall(String anyword);

}
