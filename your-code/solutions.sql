USE publications;

/*
						CHALLENGE 1
*/

SELECT authors.au_id, au_lname, au_fname, title, pub_name
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id, titles.title DESC;

SELECT *
FROM titleauthor;

/*
						CHALLENGE 2
*/

SELECT authors.au_id, au_lname, au_fname, pub_name, COUNT(publishers.pub_name) AS title_count
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY publishers.pub_name, authors.au_lname, authors.au_fname
ORDER BY authors.au_id DESC;

CREATE TABLE correccion AS 
SELECT authors.au_id, au_lname, au_fname, pub_name, COUNT(publishers.pub_name) AS title_count
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY publishers.pub_name, authors.au_lname, authors.au_fname
ORDER BY authors.au_id DESC;

SELECT SUM(title_count) AS sum_titles
FROM correccion;

/*
						CHALLENGE 3
*/

SELECT authors.au_id, au_lname, au_fname, COUNT(titles.title) AS titles
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_lname, authors.au_fname
ORDER BY COUNT(titles.title) DESC
LIMIT 3;

/*
						CHALLENGE 4
*/

SELECT authors.au_id, au_lname, au_fname, COUNT(authors.au_id),
CASE
	WHEN titles.title IS NULL THEN 0
    ELSE COUNT(authors.au_id)
    END AS TOTAL
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY au_lname, au_fname
ORDER BY TOTAL DESC;