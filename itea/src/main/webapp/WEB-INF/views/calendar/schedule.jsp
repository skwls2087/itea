<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정관리</title>
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
</head>
<body>
	<input type="hidden" id="chk" value="0" />
	<input type="hidden" id="calendarId" value="${calendarId}" />
	<table class="table table-bordered">
		<thead id="thead">
			<tr>
				<td colspan="7">
					<button type="button" class="btn btn-sm btn-warning" id="moveFastPre" onclick="moveFastMonthPre()">«</button>
					<button type="button" class="btn btn-sm btn-warning" id="movePre" onclick="moveMonthPre()">‹</button> <span id="yearMonth"></span>
					<button type="button" class="btn btn-sm btn-warning" id="moveNext" onclick="moveMonthNext()">›</button>
					<button type="button" class="btn btn-sm btn-warning" id="moveFastNext" onclick="moveFastMonthNext()">»</button>
					 <div style="text-align:right;">
					 	<span>${title}</span>
					 	<input type="button" class="btn btn-sm btn-warning" value="주" onclick="tabWeek()" />
					 	<input type="button" class="btn btn-sm btn-warning" value="월" onclick="tabMonth()" />
					 	<input type="button" class="btn btn-sm btn-warning" value="목록" onclick='location.href="./GoogleCalendar.co"' />
					 </div>
				</td>
			</tr>
			<tr>
				<td>일<span class='week'></span></td>
                <td>월<span class='week'></span></td>
                <td>화<span class='week'></span></td>
                <td>수<span class='week'></span></td>
                <td>목<span class='week'></span></td>
                <td>금<span class='week'></span></td>
                <td>토<span class='week'></span></td>
			</tr>
		</thead> 
		<tbody id="tbody"></tbody>
	</table>
	
	<!-- 일정 생성 modal -->
	<div class="modal fade" id="schduleForm" role="dialog">
		<div class="modal-dialog">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">X</button>
				<h4 class="modal-title">일정등록하기</h4>
			</div>
			<div class="modal-body">
				<form action="#" method="post" class="form-margin40" role="form" id="frmSchedule">
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" id="summary" name="summary" />
					</div>
					<div class="form-group">
						<label>시작시간</label>
						<input class="form-control" type="time" id="startTime" name="startTime"> 
					</div>
					<div class="form-group">
						<label>시작날짜</label>
						<input class="form-control" type="date" id="startDate" name="startDate">
					</div>
					<div class="form-group">
						<label>종료시간</label>
						<input class="form-control" type="time" id="endTime" name="endTime">
					</div>
					<div class="form-group">
						<label>종료날짜</label>
						<input class="form-control" type="date" id="endDate" name="endDate">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="7" class="form-control" id="description" name="description"></textarea>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-sm btn-warning" value="확인하기" onclick="calendarSchduleAdd()" />
						<input type="reset"  class="btn btn-sm btn-warning" value="초기화하기" />
						<input type="button" class="btn btn-sm btn-warning" value="취소하기" data-dismiss="modal"  />
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 일정 수정 modal -->
	<div class="modal fade" id="scheduleFormModify" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">X</button>
					<h4 class="modal-title">일정 수정하기</h4>
				</div>
				<div class="modal-body">
					<form action="#" method="post" class="form-margin40" role="form" id="frmScheduleModify">
						<div class="form-group">
							<label>제목</label>
							<input type="text" class="form-control" id="modifySummary" name="summary">
						</div> 
						<div class="form-group">
							<label>내용</label>
							<textarea rows="7" class='form-control' id="modifyDescription" name='description'></textarea>
						</div>
						<input type="hidden" id="modifyEventId" name="eventId" />
						<input type="hidden" name="calendarId" value="${calendarId}" />
						<div class="modal-footer">
							<input type="button" class="btn btn-sm btn-warning" value="확인하기" onclick="modifyEvent()" />
							<input type="reset"  class="btn btn-sm btn-warning" value="초기화하기" />
							<input type="button" class="btn btn-sm btn-warning" value="취소하기" data-dismiss="modal"  />
						</div>
					4</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>





