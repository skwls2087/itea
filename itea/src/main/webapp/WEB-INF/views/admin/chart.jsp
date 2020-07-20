<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 방문자수 그래프를 위한 구글차트 사용 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
$( document ).ready(function() {

	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawCurveTypes);

	function drawCurveTypes() {
    var data = new google.visualization.DataTable();
    
    data.addColumn('string', '날짜');
    data.addColumn('number', '방문자 수');

    <c:forEach items="${visitors}" var="visitor">
 			data.addRow(['${visitor.week}',${visitor.vscount}])
 		</c:forEach>
   
    var options = {
   		lineWidth: 2,
   	      series: {
   	    	  legend: { position: 'bottom' },
   	      	0: { color: '#CF2F11' },
   	    	  1: {curveType: 'function'}
   	      }
   	    };
    var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));
    chart.draw(data, options);
  	}
});
</script>

	<!-- 기간별 방문자 추이 그래프 -->
	<div class="visitor-graph">
	일주일간 방문자 수(누적)
	  <!-- 기간별 방문자 차트  -->
	  <div id="chart_div2" class="col-md-6"/>
  </div>