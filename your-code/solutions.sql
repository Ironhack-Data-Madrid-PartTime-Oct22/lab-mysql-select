USE publications;

##Challenge 1 - Who Have Published What At Where?

SELECT authors.au_id, au_fname, au_lname, title, pub_name
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

##Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id, au_fname, au_lname, pub_name, COUNT(title) AS n_libros_publicados
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, pub_name;

## Challenge 3 - Best Selling Authors

SELECT authors.au_id, au_fname, au_lname, ytd_sales
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
ORDER BY ytd_sales DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id, au_fname, au_lname, ytd_sales
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
ORDER BY ytd_sales DESC;





