package com.neusoft.service;

import java.util.List;

import com.neusoft.po.CommitTopic;
import com.neusoft.po.Topic;

public interface ICommitService {
	public List<CommitTopic> commitList();

	public int tcount();

	public List<CommitTopic> showeveryCommit(Topic topic);

	public int insertcommit(CommitTopic commitTopic);
}
