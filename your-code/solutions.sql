/* challenge 01: Who Have Published What At Where?*/
/* 
para mejorar la legibilidad, no he usado el natural join y 
he cambiado los nombres de los campos para que sean como el ejemplo
*/
select authors.au_id as author_ID, authors.au_lname as last_name,  
authors.au_fname as first_name, titles.title, publishers.pub_name as publisher
from titleauthor
inner join authors
on titleauthor.au_id = authors.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
;

/* challenge 02: Who Have Published How Many At Where?*/
/* 
tomo la estructura del challenge anterior.
se le añade a la consulta el count de los autores y se agrupa por autor y editorial
*/

select authors.au_id as author_ID, authors.au_lname as last_name,  
authors.au_fname as first_name, publishers.pub_name as publisher, 
count(titleauthor.au_id) AS title_count
from titleauthor
inner join authors
on titleauthor.au_id = authors.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
group by titleauthor.au_id, publishers.pub_id
order by title_count desc
;

/* challenge 03 - Best Selling Authors*/
/* 
tomo la estructura del challenge anterior.
se le añade a la consulta el count de los autores y se agrupa por autor y editorial
*/
select authors.au_id as author_ID, authors.au_lname as last_name,  
authors.au_fname as first_name, 
sum(sales.qty) AS total 
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titles.title_id = titleauthor.title_id
inner join sales
on titles.title_id = sales.title_id
group by authors.au_id
order by total desc
limit 3
;

/* challenge 04 - Best Selling Authors*/
/* 
tomo la estructura del challenge anterior.
spara que me salgan valores nulos, en vez de inner join tienen que ser left join -- tengo que tener resultados que no crucen para poder tener nulos y que me funcione el case
*/
select authors.au_id as author_ID, authors.au_lname as last_name,  
authors.au_fname as first_name, 
case
	when sum(sales.qty) is null then "0"
	else sum(sales.qty)
    end as total
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id
order by max(sales.qty) desc
;