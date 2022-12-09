USE publications;

                        --CHALLENGE 1

ALTER TABLE authors CHANGE COLUMN au_id AUTHOR_ID 
VARCHAR(11); --Aquí he cambiado el nombre de las columnas para que se parecieran más a la de la foto, y creo que la he liado un poco
--Tendría que haber usado el AS, pero ya no sé como dar marcha atrás...

ALTER TABLE authors CHANGE COLUMN au_lname LAST_NAME 
VARCHAR(40);

ALTER TABLE authors CHANGE COLUMN au_fname FIRST_NAME 
VARCHAR(20);

SELECT authors.AUTHOR_ID, LAST_NAME, FIRST_NAME, title, pub_name FROM authors
INNER JOIN titleauthor ON authors.AUTHOR_ID = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.AUTHOR_ID, titles.title DESC;

                        --CHALLENGE 2

SELECT authors.AUTHOR_ID, LAST_NAME, FIRST_NAME, title, pub_name, COUNT(publishers.pub_name) AS title_count FROM authors 
--Sigo arrastrando el problema de los nombres de las columnas, pero funciona igual
INNER JOIN titleauthor ON authors.AUTHOR_ID = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY publishers.pub_name, authors.LAST_NAME, authors.FIRST_NAME
ORDER BY authors.AUTHOR_ID DESC;

                        --CHALLENGE 3

SELECT authors.AUTHOR_ID, LAST_NAME, FIRST_NAME, sum(sales.qty) AS TOTAL FROM authors
INNER JOIN titleauthor ON authors.AUTHOR_ID = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
--Aquí hay que añadir una nueva conexión con la tabla de sales
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;

                        --CHALLENGE 4

SELECT authors.AUTHOR_ID, CONCAT(FIRST_NAME," ", LAST_NAME) AS nombre_completo, sum(sales.qty) AS TOTAL_CON_NULL,
--Aquí añado el CASE WHEN, y he dejado arriba en el Select el "sum(sales.qty) AS TOTAL_CON_NULL"
--para ver si se había cambiado el null por 0
CASE
	WHEN sum(sales.qty) IS NULL THEN 0
	ELSE sum(sales.qty)
    END AS TOTAL 
 FROM authors
LEFT JOIN titleauthor ON authors.AUTHOR_ID = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY NOMBRE_COMPLETO
ORDER BY TOTAL DESC;