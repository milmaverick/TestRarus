<?php
require 'bd/bd.php';

if ( isset($_POST['action'])){
	switch ( $_POST['action'] )
	{
	    case 'index':
	        action_index();
	        break;
	
	    case 'select':
	        action_select();
	        break;

	    case 'author':
	        action_author();
	        break;
	       
	}
}

function action_select(){
	

	 $books = R::getAll('SELECT * FROM `genresnbooks` where `genres_id`= ' . $_POST['sel']);
	
	foreach ($books as $book) {
		findBook($book['books_id']);
	}
	
	
}

function action_author(){

	 $authors = R::getAll('SELECT `authors_id`, COUNT(*) as `count` FROM `authornbooks` GROUP BY `authors_id` 
	 	ORDER BY `count` DESC LIMIT 1');
		
	foreach ($authors as $author) {
		findAuthor($author['authors_id'] , $author['count']);
	}
}


function action_index(){
	
	$comments= R::getAll('SELECT * FROM `genres` ');
	echo "<div id='comment'> <select id='sel'> 
	 <option disabled>Выберите жанр</option>";
	foreach ($comments as $comment) {
		echo  "<option value=".$comment['id'].">".$comment['Name']."</option>";
	}
	echo "</select> </div> ";
}

function findAuthor ($id, $count){
	$author = R::load('authors', $id);

	 echo "Автор : ".$author['name']." Написал : ".$count." книги";
}


function findBook ($id){

	 $book = R::load( 'books', $id );
	 echo $book['name']."<br>";
}




?>
