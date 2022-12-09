USE publications;

-- CHALLENGE 1
SELECT authors.au_id, au_lname, au_fname, title, pub_name
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

-- CHALLENGE 2
SELECT authors.au_id, au_lname, au_fname, title,COUNT(titles.title_id) as title_count
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY publishers.pub_name, titles.title_id;

-- no sé como hacer la suma en title count sin guardar la tabla

-- CHALLENGE 3
SELECT authors.au_id, au_lname, au_fname, COUNT(sales.title_id) as total
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
ORDER BY total DESC LIMIT 3;

-- CHALLENGE 4
SELECT authors.au_id, au_lname, au_fname, COUNT(sales.title_id) as total,
	CASE WHEN COUNT(sales.title_id)=0 THEN 0
		ELSE COUNT(sales.title_id) END AS total
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY total DESC;