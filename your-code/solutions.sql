/* challenge 01: Who Have Published What At Where?*/
/* para mejorar la legibilidad, no he usado el natural join y he cambiado los nombres de los campos para que sean como el ejemplo*/
select authors.au_id as author_ID, authors.au_lname as last_name,  authors.au_fname as first_name, titles.title, publishers.pub_name as publisher
from titleauthor
inner join authors
on titleauthor.au_id = authors.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
;