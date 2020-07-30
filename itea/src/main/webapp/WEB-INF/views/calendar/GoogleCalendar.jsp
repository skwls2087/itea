<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캘린더 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/google.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.19.0/dist/sweetalert2.min.css"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.1/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/stringBuffer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/GoogleCalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/GoogleCalendarSchdule.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/GoogleCalendarList.js"></script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/CalendarDelete.co" method="post" id="frmCalendarDelete">
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
	<input type="button" class="btn btn-sm btn-warning" value="캘린더 생성하기" onclick="CalendarAddForm()">
	<input type="button" class="btn btn-sm btn-warning" value="캘린더 수정하기" onclick="CalendarModifyForm()">
	<input type="button" class="btn btn-sm btn-warning" value="캘린더 삭제하기" onclick="CalendarDelete()">
	
	<!-- Calendar 생성하기 modal -->
	<div class="modal fade" id="CalendarAddForm" role="dialog" >
		<div class="modal-dialog">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">X</button>
				<h4 class="modal-title">캘린더 생성하기</h4>
			</div>
			<div class="modal-body">
				<!-- Calendar 생성처리 Form -->
				<form action="${pageContext.request.contextPath}/CalendarAdd.co" method="post" id="frmCalendarAdd">
					<div class="form-group">
						<label>캘린더이름</label>
						<input class="form-control" type="text" name="summary" id="summary" />
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-sm btn-warning" value="확인하기" onclick="CalendarAdd()" />
						<input type="reset"  class="btn btn-sm btn-warning" value="초기화하기" />
						<input type="button" class="btn btn-sm btn-warning" value="취소하기" data-dismiss="modal"  />
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Calendar 수정하기 modal -->
	<div class="modal fade" id="CalendarModifyForm" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">X</button>
					<h4 class="modal-title">캘린더 수정하기</h4>
				</div>
				<div class="modal-body">
					<!-- Calendar 생성처리 Form -->
					<form action="${pageContext.request.contextPath}/CalendarModify.co" method="post" id="frmCalendarModify">
						<div class="form-group">
							<label>캘린더이름</label>
							<input type="text" class="form-control" name="summary" id="summaryModify" />
						</div>
						<input type="hidden" name="calendarId" id="calendarIdModify" />
						<div class="modal-footer">
							<input type="button" class="btn btn-sm btn-warning" value="확인하기" onclick="CalendarModify()" />
							<input type="reset"  class="btn btn-sm btn-warning" value="초기화하기" />
							<input type="button" class="btn btn-sm btn-warning" value="취소하기" data-dismiss="modal"  />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>