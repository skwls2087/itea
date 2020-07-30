<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function sendMessage(form){
		form.writer.value = form.writer.value.trim();
		
		if(form.writer.value.length==0){
			alert('작성자를 입력하세요');
			form.writer.focus();
			return false;
		}
		
		form.body.value = form.body.value.trim();
		
		if(form.body.value.length==0){
			alert('내용을 입력해주세요.');
			form.body.focus();
			return false;
		}
		
		//서버로 전송
		$.post('./addMessage.co',{
			writer : form.writer.value,
			body : form.body.value
		},function(data){

		},'json');
		form.body.value='';
		form.body.focus();
	}
	
	var Chat__lastReceivedMessageId= -1;
	
	function Chat__loadNewMessages(){
		$.get('./getMessages.co', {
			from : Chat__lastReceivedMessageId+1
		},  function(data){
				/* data.id.sort(function(a,b){
					return b-a;
				}); */
				for(var i=0; i<data.length;i++){
					var message = data[i];
					
					Chat__lastReceivedMessageId=message.id;
					Chat__drawMessages(message);
				}
			
				setTimeout(Chat__loadNewMessages,3000);
			
		}, 'json');
	}
		
	function Chat__drawMessages(message){
		var html = '['+message.id+']('+message.writer+'):'+message.body;
		$('.chat-list').prepend('<div>'+html+'</div>')
	}
		

	$(function(){
		Chat__loadNewMessages();
	});
	
	
	
	
</script>
<h1>채팅</h1>
<div class="container">
	<form onsubmit="sendMessage(this); return false;">
		<input type="text" name="writer" placeholder="작성자">
		<input type="text" name="body" placeholder="내용을 입력해주세요"/>
		<input type="submit" value="입력"/>
	</form>
	
	<div class="chat-list"></div>
</div>