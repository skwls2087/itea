<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<form action="${pageContext.request.contextPath}/calendarRemove.co" method="post" id="frmCalendarRemove">
		<table class="table table-bordered">
			<tr>
				<th><input type="checkbox" onclick="checkAllDel(this.checked)" />전체보기</th>
				<th>캘린더이름</th>
				<th>캘린더코드</th>
			</tr>
			<c:forEach items="${items}" var="item">
				<tr>
					<td><input type="checkbox" name="chkVal" value="${item.id}" /></td>
					<td><input type="hidden" name="summarys" value="${item.summary}" />
						<a href=".schedule.co?calendarId=${item.id}&title=${item.summary}">${item.summary}</a>
					</td>
					<td>${item.id}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<input type="button" class="btn btn-sm btn-warning" value="캘린더 생성하기" onclick="calendarAddForm()">
	<input type="button" class="btn btn-sm btn-warning" value="캘린더 수정하기" onclick="calendarModifyForm()">
	<input type="button" class="btn btn-sm btn-warning" value="캘린더 삭제하기" onclick="calendarRomove()">
	
	<!-- Calendar 생성하기 modal -->
	<div class="modal fade" id="calendarAddForm" role="dialog" >
		<div class="modal-dialog">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">X</button>
				<h4 class="modal-title">캘린더 생성하기</h4>
			</div>
			<div class="modal-body">
				<!-- Calendar 생성처리 Form -->
				<form action="${pageContext.request.contextPath}/calendarAdd.co" method="post" id="frmcalendarAdd">
					<div class="form-group">
						<label>캘린더이름</label>
						<input class="form-control" type="text" name="summary" id="summary" />
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-sm btn-warning" value="확인하기" onclick="calendarAdd()" />
						<input type="reset"  class="btn btn-sm btn-warning" value="초기화하기" />
						<input type="button" class="btn btn-sm btn-warning" value="취소하기" data-dismiss="modal"  />
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Calendar 수정하기 modal -->
	<div class="modal fade" id="calendarModifyForm" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">X</button>
					<h4 class="modal-title">캘린더 수정하기</h4>
				</div>
				<div class="modal-body">
					<!-- Calendar 생성처리 Form -->
					<form action="${pageContext.request.contextPath}/calendarModify.co" method="post" id="frmCalendarModify">
						<div class="form-group">
							<label>캘린더이름</label>
							<input type="text" class="form-control" name="summary" id="summaryModify" />
						</div>
						<input type="hidden" name="calendarId" id="calendarIdModify" />
						<div class="modal-footer">
							<input type="button" class="btn btn-sm btn-warning" value="확인하기" onclick="calendarModify()" />
							<input type="reset"  class="btn btn-sm btn-warning" value="초기화하기" />
							<input type="button" class="btn btn-sm btn-warning" value="취소하기" data-dismiss="modal"  />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
