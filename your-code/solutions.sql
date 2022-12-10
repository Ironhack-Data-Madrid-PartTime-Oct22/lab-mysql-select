

--challenge1 

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME , authors.au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

-- challenge 2 

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME , publishers.pub_name AS PUBLISHER , count(titles.title_id) AS TITTLE_COUNT 
FROM authors
INNER JOIN titleauthor ON authors.au_id= titleauthor.au_id
INNER JOIN titles ON  titleauthor.title_id= titles.title_id
INNER JOIN publishers ON  titles.pub_id= publishers.pub_id
GROUP BY  authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;

-- challenge 3 

SELECT authors.au_id AS AUTHOR_ID , au_lname AS LAST_NAME, au_fname AS FIRST_NAME, COUNT(sales.title_id) AS TOTAL
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
ORDER BY total DESC LIMIT 3;

