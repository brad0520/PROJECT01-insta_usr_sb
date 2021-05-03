package com.sbs.untact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.untact.dao.ReplyDao;
import com.sbs.untact.dto.Reply;
import com.sbs.untact.dto.ResultData;
import com.sbs.untact.util.Util;

@Service
public class ReplyService {
	@Autowired
	private ReplyDao replyDao;

	public ResultData doDeleteReply(int replyId) {
		Reply reply = getReplyById(replyId);
		int articleId = reply.getArticleId();
		
		if (Util.isEmpty(reply)) {
			return new ResultData("F-1", "댓글이 존재하지 않습니다.", "replyId", replyId);
		}

		replyDao.deleteReplyById(replyId);

		return new ResultData("S-1", replyId + "번 게시물이 삭제되었습니다.", "replyId", replyId, "articleId", articleId);
	}
	
	private Reply getReplyById(int id) {
		return replyDao.getReplyById(id);
	}

	public ResultData doReply(int articleId, int memberId, String body) {
		replyDao.doReply(articleId, memberId, body);
		
		return new ResultData("S-1", "댓글이 작성되었습니다.");
	}

	public List<Reply> getRepliesById(int id) {
		return replyDao.getRepliesById(id);
	}

}
