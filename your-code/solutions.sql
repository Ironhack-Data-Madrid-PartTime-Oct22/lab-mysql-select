USE publications;

select * from authors;
select * from titleauthor;
select * from titles;
select * from publishers;

##CHALLANGE 1## 
select au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", title AS "TITLE", pub_name AS "PUBLISHER"
from authors
natural join titleauthor 
natural join titles
inner join publishers on titles.pub_id = publishers.pub_id;

##CHALLANGE 2##

select au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", pub_name AS "PUBLISHER", count(title) AS "TITLE COUNT"
from authors
natural join titleauthor 
natural join titles
inner join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name;

##CHALLANGE 3##

select au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", sum(sales.qty) as "TOTAL"
from authors
natural join titleauthor 
natural join titles
natural join sales
group by authors.au_id
order by sales.qty desc;

###"""NO SE PORQUE ME SALEN DESORDENADAS, PERO PINCHANDO EN LA CELDA DE TOTAL SE ORDENAN, SOLUCION VALIDA? y PARA VER SOLO 3 LIMIT 3;  ###

###CHALLANGE 4###
 
select au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", sum(sales.qty) as "TOTAL"
WHEN  sum(sales.qty) is null THEN "0"
else sum(sales.qty)
END
from authors
natural join titleauthor 
natural join titles
natural join sales
group by authors.au_id
order by sales.qty desc

SELECT TYPE, CASE
WHEN  sales.qty = "NULL" THEN "0"
else qty
END
FROM sales;


