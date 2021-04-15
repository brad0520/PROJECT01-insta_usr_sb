<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle"
	value="<span><i class='far fa-clipboard'></i></span> <span>${board.name} ARTICLE LIST</span>" />

<%@ include file="../common/head.jspf"%>

<div class="section section-article-list">
	<div class="container mx-auto">
		<div class="total-items">
			<span>TOTAL ITEMS : </span> <span>${totalItemsCount}</span>
		</div>

		<div class="total-pages">
			<span>TOTAL PAGES : </span> <span>${totalPage}</span>
		</div>

		<div class="page">
			<span>CURRENT PAGE : </span> <span>${page}</span>
		</div>

		<hr />
		<hr />

		<div class="search-form-box mt-2">
			<form action="" class="flex">
				<label class="label">
					<span class="label-text">게시판선택</span>
				</label>
				<select name="boardId" class="input input-bordered mr-2">
				    <option value="1">공지사항</option>
				    <option value="2">자유게시판</option>				  
				</select>
				<script>
					const param__boardId = '${param.boardId}';
					if ( param__boardId.length > 0 ) {
						$('.search-form-box form [name="boardId"]')
						.val('${param.boardId}');							
					}
				</script>

				<label class="label">
					<span class="label-text">키워드타입</span>
				</label>
				<select name="searchKeywordType" class="input input-bordered">
   				    <option value="titleAndBody">제목+내용</option>
				    <option value="title">제목</option>
				    <option value="body">내용</option>
				</select>
				<script>
					const param__searchKeywordType = '${param.searchKeywordType}';
					if ( param__searchKeywordType.length > 0 ) {
						$('.search-form-box form [name="searchKeywordType"]')
						.val('${param.searchKeywordType}');							
					}
				</script>
				<input value="${param.searchKeyword}" class="input input-bordered flex-grow ml-2 mr-2" name="searchKeyword" type="text" placeholder="검색어를 입력해주세요." maxlength="10" />
				<input type="submit" class="btn btn-info" value="검색" />
			</form>
		</div>

		<div class="articles mt-2">
			<c:forEach items="${articles}" var="article">
				<div>
					ID : ${article.id}<br> REG DATE : ${article.regDate}<br>
					UPDATE DATE : ${article.updateDate}<br> TITLE :
					${article.title}<br>
				</div>
				<hr />
			</c:forEach>
		</div>
		
		<div class="pages">
			<c:set var="pageRange" value="4" />
			<c:set var="startPage" value="${page-pageRange}" />
			<c:if test="${page-pageRange <= 0}">
    			<c:set var="startPage" value="1"/>
			</c:if>
			<c:set var="endPage" value="${page+pageRange}" />
			<c:if test="${page+pageRange >= totalPage}">
    			<c:set var="endPage" value="${totalPage}"/>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:set var="url" value="?boardId=${board.id}" />
				<c:set var="url" value="${url}&searchKeywordType=${param.searchKeywordType}" />
				<c:set var="url" value="${url}&searchKeyword=${param.searchKeyword}" />
				<c:set var="url" value="${url}&page=${i}" />
				<a class="text-lg ${page == i ? 'text-red-500' : ''}" href="${url}">${i}</a>
			</c:forEach>
		</div>
		
	</div>
</div>

<%@ include file="../common/foot.jspf"%>