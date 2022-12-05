/*
CHALLENGE 1 - Who have publissed what at where?
*/
select authors.au_id, au_lname, au_fname, title, pub_name
from publishers
natural join titles
inner join titleauthor
on titles.title_id = titleauthor.title_id
inner join authors
on titleauthor.au_id = authors.au_id;

/*
Challenge 2 - Who have published how many at where?
*/
select authors.au_id, au_lname, au_fname, pub_name, count(pub_id) as title_count
from publishers
natural join titles
inner join titleauthor
on titles.title_id = titleauthor.title_id
inner join authors
on titleauthor.au_id = authors.au_id
group by titleauthor.au_id, pub_id;
/*
Challenge 3 - Best Selling Authors
*/