$(document).ready(function(){
	
	showCom();
});


function showCom(){
	
	$.ajax({
	    url : './mess.php' ,
	    method : 'POST' ,
	    data : {
	        action : 'index',
	        	    },
	    success : function(comments){
	       		$("#content").html(comments);
	       		}
	});
}


function show(){
	$.ajax({
	    url : './mess.php' ,
	    method : 'POST' ,
	    data : {
	        action : 'author',
	   	    },
	    success : function(comments){
	       		alert(comments);
	       		}
	});
}

function select () {
	var sel = $("#sel").val();
	
	$.ajax({
	    url : './mess.php' ,
	    method : 'POST' ,
	    data : {
	        action : 'select',
	        sel : sel,
	    },
	    success : function(comments){
	       		$("#list").html(comments);
	       		}
	});

}