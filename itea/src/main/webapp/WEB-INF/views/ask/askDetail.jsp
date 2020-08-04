<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ask.css">

<style>

	th{text-align:center}
	#sBtn{height:85px;width:120px;}
	#sBtn1{height:85px;width:120px;}
	.show {display:block}
	.hide {display:none}
</style>

<script>
	$(function(){
		$("#lBtn").click(function(){
			location.href="../ask/askList.co?nowPage=${askDTO.nowPage}";
		});
		
		$("#mBtn").click(function(){
			 if(${askDTO.mnick ne userNick}){
				alert("작성자만이 게시글을 수정할 수 있습니다.");
				return false;
			};  
			location.href="../ask/askModifyFrm.co?ano=${askDTO.ano}&nowPage=${askDTO.nowPage}";
		});
		
		$("#dBtn").click(function(){
			if(${askDTO.mnick eq userNick || userNick == "관리자"}){
				confirm("정말로 삭제하시겠습니까?");
				location.href="../ask/askDelete.co?ano=${askDTO.ano}";
			}
		});	
			
		$("#sBtn").click(function(){
			if(${userNick==null}){
				alert("회원만이 댓글을 등록할 수 있습니다.");
				return false;
			}
			if($("#accontent").val().length==0){
				alert("내용을 입력해주세요.")
				return false;
			}
		});

		$("#sBtn1").click(function(){
			if(${userNick==null}){
				alert("회원만이 댓글을 등록할 수 있습니다.");
				return false;
			}
			if($("#accontent1").val().length==0){
				alert("내용을 입력해주세요.")
				return false;
			}
		});
		
 	 	$(".tog").click(function(){
			$(this).parents('tr').next().toggle();
		});	 	 
	});	

	function hide_function(){
		$(".hide").toggle();
	}
	
	
</script>
<div class="container" style="margin-bottom:150px;">
	<h2 class="ask-heading">질문/토론 게시판</h2>
	
	<table class="ask-board-heading">
	<tr>
		<td valign=top rowspan="2" class="ask-pno">#${askDTO.pno}</td>
		<td class="ask-title" colspan="2">${askDTO.atitle}</td>
	</tr>
	<tr><td class="ask-info"><span>작성자 ${askDTO.mnick} | 자격증 ${askDTO.lname} | 작성일자 <fmt:formatDate value="${askDTO.adate}" pattern="yy-MM-dd"/>  | 조회수 ${askDTO.ahit}</span></td>
	<td id="ask-modify">
	<c:if test="${userNick==askDTO.mnick || userNick=='관리자'}">
		<img src="${pageContext.request.contextPath}/resources/img/edit.png" width="20" id="mBtn" style="cursor:pointer;"/>
		<img src="${pageContext.request.contextPath}/resources/img/trash.png" width="20" id="dBtn" style="cursor:pointer;"/>
	</c:if>
	</td>
	</tr>
	</table>
	
	<br/>
	<u:pre value="${askDTO.acontent}"/>
	
	<div><input type="button" id="lBtn" value="목록" class="btn btn-secondary"/></div>
	
	<form action="askReplyInsert.co">
	<input type="hidden" name="ano" value="${askDTO.ano}"/>
	<input type="hidden" name="nowPage" value="${askDTO.nowPage}"/>
	
	<table class="table">
		<tr>
			<td colspan="2"><textarea name="accontent" id="accontent" cols="70" rows="3" class="form-control" placeholder="댓글 내용을 입력하세요"></textarea></td>
			<td><input type="submit" id="sBtn" value="등록" class="form-control"></td>
		</tr>
	</table>
	
	</form>
	<c:forEach var="reply" items="${list}">
	<c:if test="${reply.acdepth==0}">
	<form id="coReplyInsert" action="askcoReplyInsert.co">
	<table class="table" style="margin-top:0px;">
		<tr>
			<td>
				${reply.mnick}(<fmt:formatDate value="${reply.acdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
				<br>
				<u:pre value="${reply.accontent}"/>
				<br>
				<div class="tog"><span id="ask-reply">답글쓰기</span>
				<c:if test="${userNick eq reply.mnick || userNick=='관리자'}">
					<a href="askReplyDelete.co?acdepth=${reply.acdepth}&acno=${reply.acno}&nowPage=${askDTO.nowPage}&ano=${askDTO.ano}" id="ask-delete">삭제</a>
				</c:if>
				</div>
			</td>
		</tr>
		<tr class="hide">
			<td>
				<input type="hidden" name="ano" value="${askDTO.ano}"/>
				<input type="hidden" name="nowPage" value="${askDTO.nowPage}"/>
				<input type="hidden" name="acno" value="${reply.acno}"/>
				<textarea name="accontent" id="accontent1" cols="70" rows="3" class="form-control" placeholder="답글 내용을 입력하세요"></textarea>
			</td>
			<td>
				<input type="submit" id="sBtn1" value="등록" class="form-control">
			</td>
		</tr>
	</table>	
	</form>
	</c:if>
	<c:if test="${reply.acdepth==1}">
	<table style="margin:0px 0px 30px 50px;">
		<tr>
			<td>
				${reply.mnick}(<fmt:formatDate value="${reply.acdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
				<br>
				<u:pre value="${reply.accontent}"/>
				<br>
				<c:if test="${userNick eq reply.mnick || userNick=='관리자'}">
					<a href="askReplyDelete.co?acdepth=${reply.acdepth}&acno=${reply.acno}&nowPage=${askDTO.nowPage}&ano=${askDTO.ano}" id="reply-delete">삭제</a>
				</c:if>
			</td>
		</tr>
	</table>	
	</c:if>
	</c:forEach>
</div>




