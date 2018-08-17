<?php
require 'bd/bd.php';

if ( isset($_POST['action'])){
	switch ( $_POST['action'] )
	{	    
	    case 'add':
	        action_add();
	        break;	     
	}
}

function action_add(){
	$errors=array();
	if(trim($_POST['params']['number'])==''){
			{
				$errors[]='Введите номер';
			}
		}
		if(trim($_POST['params']['name'])==''){
			{
				$errors[]='Введите имя';
			}
		}
		if(trim($_POST['params']['email'])==''){
			{
				$errors[]='Введите email';
			}
		}
		if($_POST['params']['text']==''){
			{
				$errors[]='Введите текст';
			}
		}

		if(!preg_match('/^((([0-9A-Za-z]{1}[-0-9A-z\.]{1,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{1,}
			[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$/u', trim($_POST['params']['email'])))
		{
			$errors[]='Некорректный email';
		}
		if(!preg_match('/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/i', trim($_POST['params']['number'])))
		{
			$errors[]='Некорректный телефон';
		}

		if(empty($errors))
		{
			$comment= R::dispense('recall');
			$comment->name = $_POST['params']['name'];
			$comment->email = $_POST['params']['email'];
			$comment->comment = $_POST['params']['text'];
			$comment->number = $_POST['params']['number'];

			R::store($comment);
			echo "Отзыв добавлен";
		}
		else{
			echo array_shift($errors);
		}
}


?>