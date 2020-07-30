<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/itLab.css">

<script>
$(function(){
   
   var date = new Date();
   var year=date.getFullYear();
   var month=date.getMonth()+1;
   moveyear=year;
   movemonth=month;
   
   str="${pageContext.request.contextPath}/resources/wordcloud/word"+year+month+".PNG"
   $('#wordcloud').attr('src',str);
   
   $("#wordYear").html(moveyear)
   $("#wordMonth").html(movemonth)
   
   $("#wordcloud").addClass()
   
   $("#pre").click(function(){
	   if(movemonth=='1'){
		   movemonth=1;
		   moveyear=moveyear-1
	   }
	   if(moveyear!='2019'){

	      $("#wordcloud").removeClass()
	      
	      movemonth= movemonth-1;
	      $("#wordcloud").addClass(movemonth)
	      
	      $("#wordYear").html(moveyear)
	 			$("#wordMonth").html(movemonth)
	   
	      str="${pageContext.request.contextPath}/resources/wordcloud/word"+moveyear+movemonth+".PNG"
	      
	      $('#wordcloud').attr('src',str);
	   }else{
		   moveyear=moveyear+1
		   alert("마지막 달입니다.")
	   }
   });
   
   $("#post").click(function(){
	   if(movemonth=='12'){
		   alert("12월")
		   moveyear=moveyear+1
		   movemonth=0;
	   }
	   if(movemonth!=month || moveyear!=year){
	   		$("#wordcloud").removeClass()
	   
	      movemonth= movemonth+1;
	      $("#wordcloud").addClass(movemonth)
	      
	      $("#wordYear").html(moveyear)
	 			$("#wordMonth").html(movemonth)
	   
	      str="${pageContext.request.contextPath}/resources/wordcloud/word"+moveyear+movemonth+".PNG"
	      
	      $('#wordcloud').attr('src',str);
	   }else{
		   alert("마지막 달입니다.")
	   }
   });
   
});
</script>


<div class="itLab">
	<div id="itLab-heading"><span>IT 연구소</span></div>
	<div id="itTest">
	  <div class="itTest-left">
			내가 개발자가 된다면<br/>직업 만족도는 얼마나 될까?
			<p id="itTest-left-sub">해당 자료는 <a href="https://stackoverflow.com/" target="_blank">Stack overflow</a> 의 2017년 SURVEY에서 사용되었던 문제입니다.<br/>
			5만명의 조사에 참여해주신 분들중 개발자로써 활동을 하고 있는 사람들이 자신들의 성향에 대한 응답을 했고,그와 함께 자신들의 직업 만족도를 표시한 것을 응용하였습니다.</p>
			<p id="library">[Python Library] tesnorflow numpy</p>
		</div>
		<div class="itTest-right">
			<a href="<%= request.getContextPath()%>/itLab/itTest.co"><br/>
			<input type="button" class="btn btn-outline-warning" value="TEST하기" id="it-test-button"></a>
		</div>
	</div>
	
	<div id="itKeyword">
		<div id="itKeyword-left">
			<p>IT뉴스<br/>워드클라우드</p>
			<p id="library">[Python Library] requests BeautifulSoup KoNlpy</p>
			<a href="http://www.itworld.co.kr/main/" target="_blank">ITWorld Korea</a><br/>
			<a href="http://www.ciokorea.com/main/" target="_blank">비즈니스, 테크놀로지, 리더십 - CIO Korea</a><br/>
			<a href="https://www.etnews.com/" target="_blank">전자신문 etnews </a><br/>
			<a href="https://kbench.com/" target="_blank">케이벤치 :: 국내최대 IT정보와 디지털 커뮤니티</a><br/>
			<a href="http://it.chosun.com/" target="_blank">IT 조선 - 기술로 세상을 바꾸는 사람들의 놀이터</a><br/>
			<a href="http://www.digitaltoday.co.kr/" target="_blank">디지털투데이 (DigitalToday)</a><br/>
			<a href="http://www.inews24.com/list/it" target="_blank">아이뉴스24</a><br/>
		</div>
		<div id="itKeyword-right">
			<p><span id="wordYear">2020</span>년 <span id="wordMonth">7</span>월</p>
			<img class="wordcloudArrow" id="pre" src="${pageContext.request.contextPath}/resources/img/pre.png" style="cursor:pointer">
      <img class="" id="wordcloud" src="">
      <img class="wordcloudArrow" id="post" src="${pageContext.request.contextPath}/resources/img/post.png" style="cursor:pointer">
		</div>
	</div>
</div>

	<div id="itInfo">
		<img src="${pageContext.request.contextPath}/resources/itinfo/itinfo.png">
	</div>
