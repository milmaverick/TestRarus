<?php
	function test($str){
		$count=0;

		for($i=0 ; $i<strlen($str[1]); $i++){
			if($str[1][$i]=='('){
				$count++;
			}
			if($str[1][$i]==')'){
				$count--;
				if($count<0)
					return "FAIL";
			}

		}

		if($count!=0)return "FAIL";
		else return "OK";

	}

	echo test($argv);


?>