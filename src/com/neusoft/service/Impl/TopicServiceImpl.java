package com.neusoft.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.TopicMapper;
import com.neusoft.po.Topic;
import com.neusoft.po.TopicExample;
import com.neusoft.service.ITopicService;

@Service
public class TopicServiceImpl implements ITopicService {
	@Autowired
	TopicMapper topicMapper;

	@Override
	public List<Topic> showAllTopic() {

		TopicExample example = new TopicExample();
		
		return topicMapper.selectByExample(example);
	}


}
