USE publications;

SELECT 
authors.au_id, au_lname, au_fname, title, pub_name
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id  = titles.title_id 
INNER JOIN publishers ON titles.pub_id  = publishers.pub_id 
;


SELECT 
authors.au_id, au_lname, au_fname, pub_name,
COUNT(title) AS count_title
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id  = titles.title_id 
INNER JOIN publishers ON titles.pub_id  = publishers.pub_id 
GROUP BY authors.au_id, pub_name
ORDER BY count_title DESC
;

SELECT 
authors.au_id, au_lname, au_fname,
SUM(qty) AS TOTAL
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id  = titles.title_id 
INNER JOIN sales ON titles.title_id  = sales.title_id 
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3
;

