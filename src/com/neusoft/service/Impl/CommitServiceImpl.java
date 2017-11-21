package com.neusoft.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Commit;

import com.neusoft.mapper.CommitTopicMapper;
import com.neusoft.po.CommitTopic;
import com.neusoft.po.CommitTopicExample;
import com.neusoft.po.Topic;
import com.neusoft.service.ICommitService;

@Service
public class CommitServiceImpl implements ICommitService {
	@Autowired
	CommitTopicMapper commitMapper;

	@Override
	public List<CommitTopic> commitList() {
		CommitTopicExample example = new CommitTopicExample();
		example.or().andCommitTopicEqualTo(2);
		// TODO Auto-generated method stub
		return commitMapper.selectByExample(example);
	}

	/*
	 * 针对话题的评论(non-Javadoc)
	 * 
	 * @see com.neusoft.service.ICommitService#tcount()
	 */
	@Override
	public int tcount() {
		CommitTopicExample example = new CommitTopicExample();
		example.or().andCommitTopicEqualTo(1);
		return commitMapper.countByExample(example);
	}

	@Override
	public List<CommitTopic> showeveryCommit(Topic topic) {
		System.out.println("参与话题id为" + topic.getTopicId());
		int tid = topic.getTopicId();
		CommitTopicExample example = new CommitTopicExample();
		example.or().andCommitTopicEqualTo(tid);

		return commitMapper.selectByExample(example);
	}

	@Override
	public int insertcommit(CommitTopic commitTopic) {
		// TODO Auto-generated method stub
		return commitMapper.insertSelective(commitTopic);
	}

}
