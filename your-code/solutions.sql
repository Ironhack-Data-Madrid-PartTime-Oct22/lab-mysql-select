
USE au_id;


-- Desafío 1
SELECT au_id, CONCAT(au_fname, " ", au_lname) AS author, title, pub_name
FROM titleauthor 
NATURAL JOIN authors
NATURAL JOIN titles
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;
/** Comentario
	Utilizamos la relacion de 'titleauthor' ya que al ser N:M tien las FK de 'authors' y 'titles' y podemos juntarlas,
	despues al no poder juntar 'publishers' con un 'NATURL JOIN' por tener mas de un atributo igual*  utlizamos un 'INNER JOIN'
	*("city" y "state" en 'authors' y 'publishers') 
**/


-- Desafío 2
SELECT au_id, CONCAT(au_fname, " ", au_lname) AS author, pub_name, COUNT(title) 
FROM titleauthor 
NATURAL JOIN authors
NATURAL JOIN titles
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;
/** Comentario
	Utilizando la estructura del "Desafío 1", modifico el 'SELECT' para mostar el 'pub_name' antes que el 'title'; también quiero saber
    cuántos títulos ha publicado cada autor en cada editorial, así que he pusto un 'COUNT' en 'title' para poder contar la cantidad de libros de cada autor 
    y he hecho un 'GROUP BY' para poder sacar el 'title' en funcion del autor 'au_id', y la editorial de publicación 'pub_name' 
**/


-- Desafío 3
SELECT au_id, CONCAT(au_fname, " ", au_lname) AS author, SUM(sales.qty) AS libros_vendidos
FROM titleauthor 
NATURAL JOIN authors
NATURAL JOIN titles
NATURAL JOIN sales
GROUP BY authors.au_id
ORDER BY MAX(sales.qty) DESC
LIMIT 3;
/**Comentario
	Usando la estructura del "Desafío 1", quite el "title" y "pub_name" del "SELECT" y puse la un "SUM(sales.qt)" para poder suma la cantidad
    de libros vendidos y lo agrupe con un "GROUP BY" todos los escritores pra tener en cuenta en el mismo escritor todos los libros vendidos en distintas 
    y que asi el editoriales, finalmente lo ordene con un "ORDER BY" por el número maximo y utilice un "DESC" para aecerlo de forma descendente y puse 
    un "LIMIT" para que solo haparecieran los 3 que más ventas tenian.
**/


-- Desafío 4
SELECT authors.au_id, CONCAT(au_fname, " ", au_lname) AS author, CASE
	WHEN SUM(sales.qty) IS NULL THEN "0"
    ELSE SUM(sales.qty)
    END AS libros_vendido
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY MAX(sales.qty) DESC;
/**Comentario
	En este caso he tenido que utilizar un "CASE" para poder poner la condicion "WHEN" para evitar que se impimiesen valores nulos, ademas al tener una relacion 
    N:M entre "authors" y "titles" se genero la tabla "titleauthor" que al hacer un "NATURAL JOIN" no recoje todos los "au_id" en la tabla resultante ya que hay 
    esritores que no tienen "title_id" por lo cula no podia seleccionalos con el "CASE" ya que no aparecian entonces tube que concatenar "LEFT JOIN" para poder
    heredar loa PK de "authors" y así ser mostrados en la tabla. 
    Por ultimo agrupe con un "GROUP BY" los autores y un "ORDER BY" junto con un "MAX(sales.qty)" para ordenar por el número maximo y utilice un "DESC"
    para aecerlo de forma descendente.
**/

