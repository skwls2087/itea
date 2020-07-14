<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 방문자수 그래프를 위한 구글차트 사용 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
<!-- 구글 차트 호출을 위한 js 파일 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
//구글 차트 라이브러리 로딩
//google객체는 위쪽 google src안에 들어있음
google.load('visualization','1',{
    'packages' : ['corechart']
});
//로딩이 완료되면 drawChart 함수를 호출
    google.setOnLoadCallback(drawChart); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
    function drawChart() {
        var jsonData = $.ajax({ //비동기적 방식으로 호출한다는 의미이다.
            url : "${path}/chart/weekCnt.co",

            //json에 sampleData.json파일을 불러온다.
            //확장자가 json이면 url 맵핑을 꼭 해주어야 한다. 안해주면 자바파일인줄 알고 404에러가 발생한다.
            //그렇기 때문에 servlet-context파일에서 리소스를 맵핑해준다.
            dataType : "json",
            async : false
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data
        = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        var chart
         = new google.visualization.LineChart(
                document.getElementById('chart_div')); //선 그래프 
                
        //var chart
        //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                //cuveType : "function" => 곡선처리
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                chart.draw(data, {
                    week : "일주일",
                    curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                    width : 600,
                    height : 400
                });
    }
</script>

<div class="admin" id="admin">
	<!-- 기간별 회원 추이 그래프 -->
	<div class="member-graph">
		가입자 통계 그래프
		<form name="memberForm" action="<%=request.getContextPath()%>/admin/weekCnt.co" method="post"
			onChange="javascript:visitForm.submit();">
	  </form>
	  <!-- 기간별 방문자 차트  -->
	  <div id="chart_div"></div>
  </div>
	
	<!-- 기간별 방문자 추이 그래프 -->
	<div class="visitor-graph">
		방문자 통계 그래프
		<form name="visitForm" action="<%=request.getContextPath()%>/admin/memberList.co" method="post"
			onChange="javascript:visitForm.submit();">
	  </form>
	  <!-- 기간별 방문자 차트  -->
	  <div id="chart_div"></div>
  </div>
</div>

