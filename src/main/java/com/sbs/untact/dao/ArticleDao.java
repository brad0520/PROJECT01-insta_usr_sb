package com.sbs.untact.dao;

import com.sbs.untact.dto.Article;
import com.sbs.untact.dto.Board;
import com.sbs.untact.dto.Reply;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArticleDao {
    boolean modifyArticle(@Param("id") int id, @Param("title") String title, @Param("body") String body);

    void writeArticle(@Param("boardId") int boardId, @Param("memberId") int memberId, @Param("title") String title,
                      @Param("body") String body);

    Article getArticleById(@Param("id") int id);

    int getLastInsertId();

    void deleteArticleById(@Param("id") int id);

    Board getBoardById(@Param("id") int id);

    int getArticlesTotalCount(@Param("boardId") int boardId,
                              @Param("searchKeywordTypeCode") String searchKeywordTypeCode, @Param("searchKeyword") String searchKeyword);

    List<Article> getForPrintArticles(@Param("boardId") int boardId,
                                      @Param("searchKeywordTypeCode") String searchKeywordTypeCode, @Param("searchKeyword") String searchKeyword,
                                      @Param("limitFrom") int limitFrom, @Param("limitTake") int limitTake);

    Article getForPrintArticleById(@Param("id") int id);

	void reply(@Param("articleId") int articleId, @Param("memberId") int memberId, @Param("body") String body);

	List<Reply> getRepliesById(int id);
}
