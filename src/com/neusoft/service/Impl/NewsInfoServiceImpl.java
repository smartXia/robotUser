package com.neusoft.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.NewsInfoMapper;
import com.neusoft.po.NewsInfo;
import com.neusoft.po.NewsInfoExample;
import com.neusoft.service.INewsInfoService;

@Service
public class NewsInfoServiceImpl implements INewsInfoService {
	@Autowired
	NewsInfoMapper newsInfoMapper;

	@Override
	public List<NewsInfo> newsInfoList20() {
		NewsInfoExample example = new NewsInfoExample();
		example.or().andNewsTypeEqualTo(20);// 控制输出在新闻类型的为热点编号为20
		return newsInfoMapper.selectByExample(example);
	}

	@Override
	public List<NewsInfo> newsInfoList24() {
		NewsInfoExample example = new NewsInfoExample();
		example.or().andNewsTypeEqualTo(24);// 24小时热文输入
		return newsInfoMapper.selectByExample(example);
	}

	@Override
	public List<NewsInfo> newsInfoList01() {
		NewsInfoExample example = new NewsInfoExample();
		example.setOrderByClause("news_id desc");
		return newsInfoMapper.selectByExample(example);
	}

	@Override
	public NewsInfo showNewsduixiang(int newsId) {

		System.out.println("获取到新闻的ID" + newsId);
		NewsInfo newsInfo = newsInfoMapper.selectByPrimaryKey(newsId);
		return newsInfo;
	}

	@Override
	public int updateReadcount(NewsInfo newsInfo) {
		System.out.println(newsInfo.toString());
		return newsInfoMapper.updateByPrimaryKeySelective(newsInfo);
	}
	@Override
	public List<NewsInfo> selectByall(String anyword) {
		NewsInfoExample example = new NewsInfoExample();
		example.or().andNewsTitleLike("%" +anyword +"%");
		example.or().andNewsContextLike("%" +anyword +"%");
		return newsInfoMapper.selectByExample(example);
	}

}
