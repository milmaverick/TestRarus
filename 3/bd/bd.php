<?php 
require "libs/rb-mysql.php";
R::setup('mysql:host=localhost; dbname=new_db','root','');
if(!R::testConnection())
	{
	exit('Нет подключения к бд');
}
?>