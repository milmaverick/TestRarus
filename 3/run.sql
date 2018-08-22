SELECT name 
FROM authors a,(SELECT `authors_id`, COUNT(*) as `count` FROM `authornbooks` GROUP BY `authors_id` 
    ORDER BY `count` DESC LIMIT 1) b
where a.id = b.authors_id


SELECT b.name bookName , a.name aName
FROM books b INNER join authornbooks ab 
on b.id = ab.books_id inner join authors a 
ON a.id=ab.authors_id INNER join genresnbooks gb on b.id = gb.books_id
where gb.genres_id = 
(SELECT id from genres g where g.name = 'Fantasy')