/* challenge 01: Who Have Published What At Where?*/
/* 
para mejorar la legibilidad, no he usado el natural join y 
he cambiado los nombres de los campos para que sean como el ejemplo
*/
SELECT authors.au_id AS author_ID, authors.au_lname AS last_name,  
authors.au_fname AS first_name, titles.title, publishers.pub_name AS publisher
FROM titleauthor
INNER JOIN authors
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
;

/* challenge 02: Who Have Published How Many At Where?*/
/* 
tomo la estructura del challenge anterior.
se le añade a la consulta el count de los autores y se agrupa por autor y editorial
*/

SELECT authors.au_id AS author_ID, authors.au_lname AS last_name,  
authors.au_fname AS first_name, publishers.pub_name AS publisher, 
count(titleauthor.au_id) AS title_count
FROM titleauthor
INNER JOIN authors
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, publishers.pub_id
ORDER BY title_count DESC
;

/* challenge 03 - Best Selling Authors*/
/* 
tomo la estructura del challenge anterior.
se le añade a la consulta el count de los autores y se agrupa por autor y editorial
*/
SELECT authors.au_id AS author_ID, authors.au_lname AS last_name,  
authors.au_fname AS first_name, 
sum(sales.qty) AS total 
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY total DESC
LIMIT 3
;

/* challenge 04 - Best Selling Authors*/
/* 
tomo la estructura del challenge anterior.
para que me salgan valores nulos, en vez de inner join tienen que ser left join -- tengo que tener resultados que no crucen para poder tener nulos y que me funcione el case
*/
SELECT authors.au_id AS author_ID, authors.au_lname AS last_name,  
authors.au_fname AS first_name, 
CASE
	WHEN sum(sales.qty) IS NULL THEN 0
	ELSE sum(sales.qty)
    END AS total
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY max(sales.qty) DESC
;