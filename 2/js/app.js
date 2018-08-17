$(document).ready(function(){
	$("#form").submit(function(){
		 var email = $("#email").val();
		 var name = $("#name").val();
		 var text = $("#text").val();
		 var number = $("#number").val();
		 if(email != 0)
    	 {
		    if(isValidEmailAddress(email) && ValidPhone(number))
		    {
		    	var params = 
		    	{
		    	 'name' : name,
		    	 'email' : email, 
		    	 'text' : text ,
		    	 'number': number,
		    	}; 
		    	var str = $(this).serialize();
				$.ajax({
						url : './mess.php' ,
					    method : 'POST' ,
					    data : {
					        action : 'add',
					        params : params,
					    },
					    success : function(data){
					    
					        $('#form')[0].reset();
					        alert(data);	
					        		       
					    }
				});
			}
			else{
				alert('Пара email-телефон заполнены не корректно');
			}	
		 }
		 return false;
	});
});



function isValidEmailAddress(emailAddress) {
    var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
    return pattern.test(emailAddress);
}

function ValidPhone(myPhone) {
    var re = /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/i;
    return re.test(myPhone);
    
   
}  