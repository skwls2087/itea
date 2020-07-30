// 캘린더 생성폼 호출
function CalendarAddForm() {
    $('#CalendarAddForm').modal();
}

// 캘린더 생성 처리
function CalendarAdd() {
    var summary = $('#summary').val();
    if(summary.trim() == '' || summary.trim().length == 0) {
        swal('이름 :','입력해주세요');
        return false;
    }
    $('#frmCalendarAdd').submit();
}

//전체체크
function checkAllDel(bool) {
    var chkVal = document.getElementsByName("chkVal");
    for (var i = 0; i < chkVal.length; i++) {
        chkVal[i].checked = bool;
    }
}

//캘린더 삭제
function CalendarDelete() {
    var chkVal = document.getElementsByName("chkVal");
    var n = 0;
    for (var i = 0; i < chkVal.length; i++) {
        if(chkVal[i].checked == true){
            n++;
        }
    }
    if(n>0){
        $('#frmCalendarRemove').submit();
    } else {
        swal("캘린더를 삭제합니다.", '삭제할 항목을 선택해주세요!');
    }
}

// 캘린더 수정 호출
function CalendarModifyForm() {
    var chkVal = document.getElementsByName("chkVal");
    var summarys = document.getElementsByName("summarys");
    var n = 0;
    var calendarId = '';
    var summary = '';
    for (var i = 0; i < chkVal.length; i++) {
        if(chkVal[i].checked == true){
            n++;
            calendarId = chkVal[i].value;
            summary = summarys[i].value;
        }
    }
    if(n==1) {
        $('#frmCalendarModify').find('#summaryModify').val(summary);
        $('#frmCalendarModify').find('#calendarIdModify').val(calendarId);
    } else if(n>1) {
        swal("캘린더를 수정합니다.", '1개 항목만 선택해주세요!');
        return false;
    } else {
        swal("캘린더를 수정합니다", '수정할 항목을 선택해주세요!');
        return false;
    }
    $('#CalendarModifyForm').modal();
}

// 캘린더 수정 처리
function CalendarModify() {
    $('#frmCalendarModify').submit();
}



