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
select authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) as total
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join sales
on titles.title_id = sales.title_id
group by titleauthor.au_id, sales.qty
order by sum(sales.qty) desc
limit 3;
/*
Challenge 4 - Best Selling Authors Ranking
*/
select authors.au_id, authors.au_lname, authors.au_fname,
(case sum(sales.qty)
	when null 
		then 0
	else sum(sales.qty)
	end
) as total
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join sales
on titles.title_id = sales.title_id
group by titleauthor.au_id, sales.qty
order by sum(sales.qty) desc;