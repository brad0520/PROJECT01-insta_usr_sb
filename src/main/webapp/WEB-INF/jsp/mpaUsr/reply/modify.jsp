<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle"
	value="<span><i class='fas fa-user-plus'></i></span> <span>REPLY MODIFY</span>" />

<%@ include file="../common/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
let ReplyModify__submitFormDone = false;
function ReplyModify__submitForm(form) {
    if ( ReplyModify__submitFormDone ) {
        return;
    }

    form.body.value = form.body.value.trim();

    if ( form.body.value.length == 0 ) {
        alert('댓글을 입력해주세요.');
        form.body.focus();

        return;
    }

    form.submit();
    ReplyModify__submitFormDone = true;
}
</script>

<div class="section section-member-modify px-2">
	<div class="container mx-auto">
	    <form method="POST" action="doModify" onsubmit="ReplyModify__submitForm(this); return false;">
 	       	 <input type="hidden" name="board
 	       	 Id" value="${board.id}" />	
              <div>
                   <div class="py-5 px-4">
                       <div class="flex">
                           <!-- 아바타 이미지 -->
                           <div class="flex-shrink-0">
                               <img class="w-10 h-10 object-cover rounded-full shadow mr-2 cursor-pointer" alt="User avatar" src="https://images.unsplash.com/photo-1477118476589-bff2c5c4cfbb?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=200&amp;q=200">
                           </div>

                           <div class="flex-grow px-1">
                               <div class="flex text-gray-400 text-light text-sm">
                                   <span>${reply.extra__writerName}</span>
                                   <span class="mx-1">·</span>
                                   <span>${reply.updateDate}</span>
                               </div>
				           <div class="form-control">
				               <label class="label">
				                    댓글 내용
				               </label>
				               <textarea class="textarea textarea-bordered w-full h-24" placeholder="내용을 입력해주세요." name="body" maxlength="2000">${reply.body}</textarea>
				           </div>
                               <div class="mt-1">
                                   <span class="text-gray-400 cursor-pointer">
                                       <span><i class="fas fa-thumbs-up"></i></span>
                                       <span>5,600</span>
                                   </span>
                                   <span class="ml-1 text-gray-400 cursor-pointer">
                                       <span><i class="fas fa-thumbs-down"></i></span>
                                       <span>5,600</span>
                                   </span>
                               </div>
                           </div>
                       </div>
                       <div class="plain-link-wrap gap-3 mt-3">
                           <c:if test="${reply.memberId == rq.loginedMemberId}">
                               <a onclick="if ( !confirm('정말 삭제하시겠습니까?') ) return false;" href="../reply/doDelete?id=${reply.id}&redirectUri=${rq.encodedCurrentUri}" class="plain-link">
                                   <span><i class="fas fa-trash-alt"></i></span>
                                   <span>댓글 삭제</span>
                               </a>
                           	<button type="submit" class="plain-link">
                                   <span><i class="fas fa-trash-alt"></i></span>
                                   <span>댓글 수정</span>
                            </button>
                           </c:if>
                       </div>
                   </div>
              </div>	
	    </form>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>