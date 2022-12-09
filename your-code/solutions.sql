SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(*) AS "TITLE COUNT"
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.title_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname, COUNT(*) AS "TOTAL"
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY titles.ytd_sales
ORDER BY TOTAL DESC
LIMIT 3;

/* He probado con case when y no me sale. Haciendo el cambio a left joins pensaba que saldrían los 0, pero no */
SELECT authors.au_id, authors.au_lname, authors.au_fname, COUNT(*) AS "TOTAL" 
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY titles.ytd_sales
ORDER BY TOTAL DESC;






